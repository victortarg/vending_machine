onerror {exit -code 1}
vlib work
vlog -work work vending_machine.vo
vlog -work work Waveform_75c_1real.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.vending_machine_vlg_vec_tst -voptargs="+acc"
vcd file -direction vending_machine.msim.vcd
vcd add -internal vending_machine_vlg_vec_tst/*
vcd add -internal vending_machine_vlg_vec_tst/i1/*
run -all
quit -f
