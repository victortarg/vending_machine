library verilog;
use verilog.vl_types.all;
entity vending_machine is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        moeda_25_centavos: in     vl_logic;
        moeda_50_centavos: in     vl_logic;
        moeda_1_real    : in     vl_logic;
        seletor_produto : in     vl_logic_vector(2 downto 0);
        preco_produto   : in     vl_logic_vector(7 downto 0);
        libera_produto  : out    vl_logic_vector(7 downto 0);
        libera_moeda_troco: out    vl_logic;
        monitor_estado  : out    vl_logic_vector(31 downto 0);
        monitor_total   : out    vl_logic_vector(31 downto 0)
    );
end vending_machine;
