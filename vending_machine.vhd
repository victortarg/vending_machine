library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vending_machine is
    Port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        a1       : in  std_logic; -- Moeda R$ 0,25
        a2       : in  std_logic; -- Moeda R$ 0,50
        a3       : in  std_logic; -- Moeda R$ 1,00
        t        : in  std_logic_vector(2 downto 0); -- Selecao do produto
        s        : in  std_logic_vector(7 downto 0); -- Valor do produto
        disp     : out std_logic_vector(7 downto 0); -- Saida do Dispenser
        troco    : out std_logic; -- Saida da moeda de troco
        
        -- Sinais expostos APENAS para o professor ver na simulação:
        estado_atual    : out integer; 
        total_acumulado : out integer
    );
end vending_machine;

architecture RTL of vending_machine is
    type state_type is (INICIO, ESPERAR, SOMAR_25, SOMAR_50, SOMAR_100, FORNECER, VERIFICAR_TROCO, DAR_TROCO);
    signal state, next_state : state_type;
    signal tot, next_tot : integer range 0 to 255;
begin

    -- Expõe os sinais internos para a Waveform
    estado_atual <= state_type'pos(state); -- Mostra o estado como um número (0 a 7)
    total_acumulado <= tot;                -- Mostra o valor no acumulador

    SYNC_PROC: process (clk, rst)
    begin
        if rst = '1' then
            state <= INICIO;
            tot <= 0;
        elsif rising_edge(clk) then
            state <= next_state;
            tot <= next_tot;
        end if;
    end process;

    COMB_PROC: process (state, tot, a1, a2, a3, t, s)
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
                elsif a1 = '1' then
                    next_state <= SOMAR_25;
                elsif a2 = '1' then
                    next_state <= SOMAR_50;
                elsif a3 = '1' then
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