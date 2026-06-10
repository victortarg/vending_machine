library verilog;
use verilog.vl_types.all;
entity vending_machine_vlg_check_tst is
    port(
        libera_moeda_troco: in     vl_logic;
        libera_produto  : in     vl_logic_vector(7 downto 0);
        monitor_estado  : in     vl_logic_vector(31 downto 0);
        monitor_total   : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end vending_machine_vlg_check_tst;
