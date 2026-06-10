library verilog;
use verilog.vl_types.all;
entity vending_machine_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        moeda_1_real    : in     vl_logic;
        moeda_25_centavos: in     vl_logic;
        moeda_50_centavos: in     vl_logic;
        preco_produto   : in     vl_logic_vector(7 downto 0);
        reset           : in     vl_logic;
        seletor_produto : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end vending_machine_vlg_sample_tst;
