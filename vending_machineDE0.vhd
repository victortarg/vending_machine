library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vending_machine is
    Port (
        CLOCK_50 : in  std_logic;                      
        KEY      : in  std_logic_vector(2 downto 0);   
        SW       : in  std_logic_vector(9 downto 0);   
        LEDG     : out std_logic_vector(9 downto 0);
        -- Novas portas para os Displays de 7 Segmentos 
        HEX0     : out std_logic_vector(7 downto 0); -- Unidades
        HEX1     : out std_logic_vector(7 downto 0); -- Dezenas
        HEX2     : out std_logic_vector(7 downto 0); -- Centenas
        HEX3     : out std_logic_vector(7 downto 0)  -- Apagado
    );
end vending_machine;

architecture RTL of vending_machine is
    constant CLK_DIV_MAX : integer := 10000000;
    signal clk_div_cnt : integer range 0 to CLK_DIV_MAX := 0;
    signal clk_lento   : std_logic := '0';

    signal t : std_logic_vector(2 downto 0);
    signal s : std_logic_vector(7 downto 0);
    signal a1_inv, a2_inv, a3_inv : std_logic;
    signal a1_reg, a2_reg, a3_reg : std_logic := '0';
    signal a1_pulse, a2_pulse, a3_pulse : std_logic := '0';

    signal disp  : std_logic_vector(7 downto 0);
    signal troco : std_logic;

    type state_type is (INICIO, ESPERAR, SOMAR_25, SOMAR_50, SOMAR_100, FORNECER, VERIFICAR_TROCO, DAR_TROCO);
    signal state, next_state : state_type;
    
    signal tot, next_tot : integer range 0 to 255;
    
    -- Sinais para os digitos do display
    signal dig0, dig1, dig2 : integer range 0 to 9;

    -- Funcao para converter numero de 0 a 9 em Display de 7 Segmentos (Active-Low)
    function dec_to_7seg(digit : integer) return std_logic_vector is
    begin
        -- A ordem dos bits eh: DP, G, F, E, D, C, B, A (0 = Acende, 1 = Apaga)
        case digit is
            when 0 => return "11000000"; 
            when 1 => return "11111001";
            when 2 => return "10100100";
            when 3 => return "10110000";
            when 4 => return "10011001";
            when 5 => return "10010010";
            when 6 => return "10000010";
            when 7 => return "11111000";
            when 8 => return "10000000";
            when 9 => return "10010000";
            when others => return "11111111"; -- Apaga tudo se der erro
        end case;
    end function;

begin

    -- MAPEAMENTO FÍSICO
    t <= SW(2 downto 0);           
    s <= '0' & SW(9 downto 3);     
    
    a1_inv <= not KEY(0);          
    a2_inv <= not KEY(1);          
    a3_inv <= not KEY(2);          

    LEDG(7 downto 0) <= disp;      
    LEDG(8) <= '0';                
    LEDG(9) <= troco;              

    -- MATEMÁTICA PARA SEPARAR OS DÍGITOS DO TOTAL (tot)
    dig2 <= tot / 100;                -- Centenas
    dig1 <= (tot / 10) mod 10;        -- Dezenas
    dig0 <= tot mod 10;               -- Unidades

    -- ATUALIZAÇÃO DOS DISPLAYS
    HEX0 <= dec_to_7seg(dig0);
    HEX1 <= dec_to_7seg(dig1);
    HEX2 <= dec_to_7seg(dig2);
    HEX3 <= "11111111"; -- Mantém o 4º display apagado

    -- DIVISOR DE CLOCK
    DIVISOR_PROC: process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if clk_div_cnt = CLK_DIV_MAX then
                clk_div_cnt <= 0;
                clk_lento <= '1';
            else
                clk_div_cnt <= clk_div_cnt + 1;
                clk_lento <= '0';
            end if;
        end if;
    end process;

    -- DETECTOR DE BORDA
    EDGE_DETECTOR_PROC: process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if clk_lento = '1' then
                a1_reg <= a1_inv;
                a2_reg <= a2_inv;
                a3_reg <= a3_inv;
                
                a1_pulse <= a1_inv and not a1_reg;
                a2_pulse <= a2_inv and not a2_reg;
                a3_pulse <= a3_inv and not a3_reg;
            end if;
        end if;
    end process;

    -- REGISTRADORES FSM
    SYNC_PROC: process (CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if clk_lento = '1' then
                state <= next_state;
                tot <= next_tot;
            end if;
        end if;
    end process;

    -- LOGICA COMBINACIONAL DA MAQUINA DE ESTADOS
    COMB_PROC: process (state, tot, a1_pulse, a2_pulse, a3_pulse, t, s)
        variable s_int : integer range 0 to 255;
    begin
        next_state <= state;
        next_tot <= tot;
        disp <= (others => '0');
        troco <= '0';
        
        s_int := to_integer(unsigned(s));

        case state is
            when INICIO =>
                next_tot <= 0;
                next_state <= ESPERAR;

            when ESPERAR =>
                if tot >= s_int and s_int > 0 then
                    next_state <= FORNECER;
                elsif a1_pulse = '1' then
                    next_state <= SOMAR_25;
                elsif a2_pulse = '1' then
                    next_state <= SOMAR_50;
                elsif a3_pulse = '1' then
                    next_state <= SOMAR_100;
                end if;

            when SOMAR_25 =>
                next_tot <= tot + 25;
                next_state <= ESPERAR;

            when SOMAR_50 =>
                next_tot <= tot + 50;
                next_state <= ESPERAR;

            when SOMAR_100 =>
                next_tot <= tot + 100;
                next_state <= ESPERAR;

            when FORNECER =>
                disp(to_integer(unsigned(t))) <= '1';
                next_tot <= tot - s_int;
                next_state <= VERIFICAR_TROCO;

            when VERIFICAR_TROCO =>
                if tot > 0 then
                    next_state <= DAR_TROCO;
                else
                    next_state <= INICIO;
                end if;

            when DAR_TROCO =>
                troco <= '1';
                next_tot <= tot - 25;
                next_state <= VERIFICAR_TROCO;
                
        end case;
    end process;

end RTL;