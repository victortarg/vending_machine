library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vending_machine is
    Port (
        clock               : in  std_logic;
        reset               : in  std_logic;
        
        -- Entradas de Pagamento (Moedas)
        moeda_25_centavos   : in  std_logic; 
        moeda_50_centavos   : in  std_logic; 
        moeda_1_real        : in  std_logic; 
        
        -- Entradas de Configuração do Produto
        seletor_produto     : in  std_logic_vector(2 downto 0); -- Escolhe qual dos 8 produtos
        preco_produto       : in  std_logic_vector(7 downto 0); -- Preço configurado para os produtos
        
        -- Saídas Físicas da Máquina
        libera_produto      : out std_logic_vector(7 downto 0); -- Aciona o dispenser do produto escolhido
        libera_moeda_troco  : out std_logic;                    -- Libera uma moeda de R$ 0,25 de troco
        
        -- Sinais de Monitoramento (Apenas para facilitar a visualização na Simulação VWF)
        monitor_estado      : out integer; 
        monitor_total       : out integer
    );
end vending_machine;

architecture RTL of vending_machine is
    
    -- Definição dos Estados da Máquina (Bloco de Controle)
    type state_type is (INICIO, ESPERAR, SOMAR_25, SOMAR_50, SOMAR_100, FORNECER, VERIFICAR_TROCO, DAR_TROCO);
    signal estado_atual_fsm, proximo_estado_fsm : state_type;
    
    -- Registrador Acumulador (Bloco Operacional)
    signal total_inserido, proximo_total : integer range 0 to 255;
    
begin

    -- Conecta os sinais internos às saídas de monitoramento para o gráfico do Quartus
    monitor_estado <= state_type'pos(estado_atual_fsm); -- Converte o nome do estado para número (0 a 7)
    monitor_total  <= total_inserido;                   -- Mostra o dinheiro acumulado

    -- PROCESSO 1: Atualização Síncrona (Registradores)
    SYNC_PROC: process (clock, reset)
    begin
        if reset = '1' then
            estado_atual_fsm <= INICIO;
            total_inserido <= 0;
        elsif rising_edge(clock) then
            estado_atual_fsm <= proximo_estado_fsm;
            total_inserido <= proximo_total;
        end if;
    end process;

    -- PROCESSO 2: Lógica Combinacional (Transições de Estado e Matemática)
    COMB_PROC: process (estado_atual_fsm, total_inserido, moeda_25_centavos, moeda_50_centavos, moeda_1_real, seletor_produto, preco_produto)
        variable preco_inteiro : integer range 0 to 255;
    begin
        -- Valores padrão para evitar a criação de memórias indesejadas (latches)
        proximo_estado_fsm <= estado_atual_fsm;
        proximo_total <= total_inserido;
        libera_produto <= (others => '0');
        libera_moeda_troco <= '0';
        
        -- Converte o vetor de bits do preço para um número inteiro para facilitar a matemática
        preco_inteiro := to_integer(unsigned(preco_produto));

        case estado_atual_fsm is
            
            when INICIO =>
                proximo_total <= 0;
                proximo_estado_fsm <= ESPERAR;

            when ESPERAR =>
                -- Verifica se já tem dinheiro suficiente para comprar
                if total_inserido >= preco_inteiro and preco_inteiro > 0 then
                    proximo_estado_fsm <= FORNECER;
                
                -- Se não tem dinheiro suficiente, aguarda a inserção de moedas
                elsif moeda_25_centavos = '1' then
                    proximo_estado_fsm <= SOMAR_25;
                elsif moeda_50_centavos = '1' then
                    proximo_estado_fsm <= SOMAR_50;
                elsif moeda_1_real = '1' then
                    proximo_estado_fsm <= SOMAR_100;
                end if;

            when SOMAR_25 =>
                proximo_total <= total_inserido + 25;
                proximo_estado_fsm <= ESPERAR;

            when SOMAR_50 =>
                proximo_total <= total_inserido + 50;
                proximo_estado_fsm <= ESPERAR;

            when SOMAR_100 =>
                proximo_total <= total_inserido + 100;
                proximo_estado_fsm <= ESPERAR;

            when FORNECER =>
                -- Ativa apenas o bit correspondente ao produto selecionado
                libera_produto(to_integer(unsigned(seletor_produto))) <= '1';
                
                -- Deduz o preço do produto do valor total inserido
                proximo_total <= total_inserido - preco_inteiro;
                proximo_estado_fsm <= VERIFICAR_TROCO;

            when VERIFICAR_TROCO =>
                -- Se ainda sobrou dinheiro, vai para o estado de devolver troco
                if total_inserido >= 25 then
                    proximo_estado_fsm <= DAR_TROCO;
                else
                    proximo_estado_fsm <= INICIO;
                end if;

            when DAR_TROCO =>
                libera_moeda_troco <= '1';
                proximo_total <= total_inserido - 25; -- Deduz a moeda devolvida
                proximo_estado_fsm <= VERIFICAR_TROCO;
                
        end case;
    end process;
end RTL;