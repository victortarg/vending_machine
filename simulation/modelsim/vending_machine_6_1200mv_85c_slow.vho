-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/08/2026 18:14:36"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	vending_machine IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	moeda_25_centavos : IN std_logic;
	moeda_50_centavos : IN std_logic;
	moeda_1_real : IN std_logic;
	seletor_produto : IN std_logic_vector(2 DOWNTO 0);
	preco_produto : IN std_logic_vector(7 DOWNTO 0);
	libera_produto : OUT std_logic_vector(7 DOWNTO 0);
	libera_moeda_troco : OUT std_logic;
	monitor_estado : OUT STD.STANDARD.integer;
	monitor_total : OUT STD.STANDARD.integer
	);
END vending_machine;

-- Design Ports Information
-- libera_produto[0]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_produto[1]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_produto[2]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_produto[3]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_produto[4]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_produto[5]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_produto[6]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_produto[7]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- libera_moeda_troco	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[0]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[1]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[3]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[4]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[5]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[6]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[7]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[8]	=>  Location: PIN_P21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[9]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[10]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[11]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[12]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[13]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[14]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[15]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[16]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[17]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[18]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[19]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[20]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[21]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[22]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[23]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[24]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[25]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[26]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[27]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[28]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[29]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[30]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_estado[31]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[0]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[1]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[2]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[3]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[4]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[5]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[6]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[7]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[8]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[9]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[10]	=>  Location: PIN_M19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[11]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[12]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[13]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[14]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[15]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[16]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[17]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[18]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[19]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[20]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[21]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[22]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[23]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[24]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[25]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[26]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[27]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[28]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[29]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[30]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monitor_total[31]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seletor_produto[0]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seletor_produto[1]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seletor_produto[2]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[3]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[2]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[1]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[0]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[7]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[5]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preco_produto[4]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- moeda_25_centavos	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- moeda_50_centavos	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- moeda_1_real	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF vending_machine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_moeda_25_centavos : std_logic;
SIGNAL ww_moeda_50_centavos : std_logic;
SIGNAL ww_moeda_1_real : std_logic;
SIGNAL ww_seletor_produto : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_preco_produto : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_libera_produto : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_libera_moeda_troco : std_logic;
SIGNAL ww_monitor_estado : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_monitor_total : std_logic_vector(31 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \libera_produto[0]~output_o\ : std_logic;
SIGNAL \libera_produto[1]~output_o\ : std_logic;
SIGNAL \libera_produto[2]~output_o\ : std_logic;
SIGNAL \libera_produto[3]~output_o\ : std_logic;
SIGNAL \libera_produto[4]~output_o\ : std_logic;
SIGNAL \libera_produto[5]~output_o\ : std_logic;
SIGNAL \libera_produto[6]~output_o\ : std_logic;
SIGNAL \libera_produto[7]~output_o\ : std_logic;
SIGNAL \libera_moeda_troco~output_o\ : std_logic;
SIGNAL \monitor_estado[0]~output_o\ : std_logic;
SIGNAL \monitor_estado[1]~output_o\ : std_logic;
SIGNAL \monitor_estado[2]~output_o\ : std_logic;
SIGNAL \monitor_estado[3]~output_o\ : std_logic;
SIGNAL \monitor_estado[4]~output_o\ : std_logic;
SIGNAL \monitor_estado[5]~output_o\ : std_logic;
SIGNAL \monitor_estado[6]~output_o\ : std_logic;
SIGNAL \monitor_estado[7]~output_o\ : std_logic;
SIGNAL \monitor_estado[8]~output_o\ : std_logic;
SIGNAL \monitor_estado[9]~output_o\ : std_logic;
SIGNAL \monitor_estado[10]~output_o\ : std_logic;
SIGNAL \monitor_estado[11]~output_o\ : std_logic;
SIGNAL \monitor_estado[12]~output_o\ : std_logic;
SIGNAL \monitor_estado[13]~output_o\ : std_logic;
SIGNAL \monitor_estado[14]~output_o\ : std_logic;
SIGNAL \monitor_estado[15]~output_o\ : std_logic;
SIGNAL \monitor_estado[16]~output_o\ : std_logic;
SIGNAL \monitor_estado[17]~output_o\ : std_logic;
SIGNAL \monitor_estado[18]~output_o\ : std_logic;
SIGNAL \monitor_estado[19]~output_o\ : std_logic;
SIGNAL \monitor_estado[20]~output_o\ : std_logic;
SIGNAL \monitor_estado[21]~output_o\ : std_logic;
SIGNAL \monitor_estado[22]~output_o\ : std_logic;
SIGNAL \monitor_estado[23]~output_o\ : std_logic;
SIGNAL \monitor_estado[24]~output_o\ : std_logic;
SIGNAL \monitor_estado[25]~output_o\ : std_logic;
SIGNAL \monitor_estado[26]~output_o\ : std_logic;
SIGNAL \monitor_estado[27]~output_o\ : std_logic;
SIGNAL \monitor_estado[28]~output_o\ : std_logic;
SIGNAL \monitor_estado[29]~output_o\ : std_logic;
SIGNAL \monitor_estado[30]~output_o\ : std_logic;
SIGNAL \monitor_estado[31]~output_o\ : std_logic;
SIGNAL \monitor_total[0]~output_o\ : std_logic;
SIGNAL \monitor_total[1]~output_o\ : std_logic;
SIGNAL \monitor_total[2]~output_o\ : std_logic;
SIGNAL \monitor_total[3]~output_o\ : std_logic;
SIGNAL \monitor_total[4]~output_o\ : std_logic;
SIGNAL \monitor_total[5]~output_o\ : std_logic;
SIGNAL \monitor_total[6]~output_o\ : std_logic;
SIGNAL \monitor_total[7]~output_o\ : std_logic;
SIGNAL \monitor_total[8]~output_o\ : std_logic;
SIGNAL \monitor_total[9]~output_o\ : std_logic;
SIGNAL \monitor_total[10]~output_o\ : std_logic;
SIGNAL \monitor_total[11]~output_o\ : std_logic;
SIGNAL \monitor_total[12]~output_o\ : std_logic;
SIGNAL \monitor_total[13]~output_o\ : std_logic;
SIGNAL \monitor_total[14]~output_o\ : std_logic;
SIGNAL \monitor_total[15]~output_o\ : std_logic;
SIGNAL \monitor_total[16]~output_o\ : std_logic;
SIGNAL \monitor_total[17]~output_o\ : std_logic;
SIGNAL \monitor_total[18]~output_o\ : std_logic;
SIGNAL \monitor_total[19]~output_o\ : std_logic;
SIGNAL \monitor_total[20]~output_o\ : std_logic;
SIGNAL \monitor_total[21]~output_o\ : std_logic;
SIGNAL \monitor_total[22]~output_o\ : std_logic;
SIGNAL \monitor_total[23]~output_o\ : std_logic;
SIGNAL \monitor_total[24]~output_o\ : std_logic;
SIGNAL \monitor_total[25]~output_o\ : std_logic;
SIGNAL \monitor_total[26]~output_o\ : std_logic;
SIGNAL \monitor_total[27]~output_o\ : std_logic;
SIGNAL \monitor_total[28]~output_o\ : std_logic;
SIGNAL \monitor_total[29]~output_o\ : std_logic;
SIGNAL \monitor_total[30]~output_o\ : std_logic;
SIGNAL \monitor_total[31]~output_o\ : std_logic;
SIGNAL \seletor_produto[1]~input_o\ : std_logic;
SIGNAL \seletor_produto[2]~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \preco_produto[7]~input_o\ : std_logic;
SIGNAL \preco_produto[5]~input_o\ : std_logic;
SIGNAL \preco_produto[6]~input_o\ : std_logic;
SIGNAL \preco_produto[4]~input_o\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \preco_produto[0]~input_o\ : std_logic;
SIGNAL \preco_produto[3]~input_o\ : std_logic;
SIGNAL \preco_produto[2]~input_o\ : std_logic;
SIGNAL \preco_produto[1]~input_o\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \WideOr0~1_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \estado_atual_fsm.VERIFICAR_TROCO~q\ : std_logic;
SIGNAL \moeda_25_centavos~input_o\ : std_logic;
SIGNAL \moeda_50_centavos~input_o\ : std_logic;
SIGNAL \Selector9~3_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \moeda_1_real~input_o\ : std_logic;
SIGNAL \Selector9~6_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \proximo_estado_fsm.SOMAR_50~0_combout\ : std_logic;
SIGNAL \Selector9~5_combout\ : std_logic;
SIGNAL \COMB_PROC~0_combout\ : std_logic;
SIGNAL \proximo_estado_fsm.SOMAR_50~1_combout\ : std_logic;
SIGNAL \estado_atual_fsm.SOMAR_50~q\ : std_logic;
SIGNAL \proximo_estado_fsm.SOMAR_25~0_combout\ : std_logic;
SIGNAL \estado_atual_fsm.SOMAR_25~q\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \proximo_total~0_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \Selector7~2_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Selector6~2_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Add4~1\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \Selector6~3_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Add4~3\ : std_logic;
SIGNAL \Add4~5\ : std_logic;
SIGNAL \Add4~7\ : std_logic;
SIGNAL \Add4~8_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \Add4~9\ : std_logic;
SIGNAL \Add4~10_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Add4~11\ : std_logic;
SIGNAL \Add4~12_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \estado_atual_fsm.INICIO~q\ : std_logic;
SIGNAL \Selector9~2_combout\ : std_logic;
SIGNAL \Selector9~4_combout\ : std_logic;
SIGNAL \estado_atual_fsm.ESPERAR~q\ : std_logic;
SIGNAL \proximo_estado_fsm.SOMAR_100~0_combout\ : std_logic;
SIGNAL \estado_atual_fsm.SOMAR_100~q\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Add4~4_combout\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Add4~6_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \Selector4~2_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \estado_atual_fsm.DAR_TROCO~q\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Add3~13\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \Add4~13\ : std_logic;
SIGNAL \Add4~14_combout\ : std_logic;
SIGNAL \Selector0~2_combout\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~13_cout\ : std_logic;
SIGNAL \LessThan0~14_combout\ : std_logic;
SIGNAL \proximo_estado_fsm.FORNECER~2_combout\ : std_logic;
SIGNAL \estado_atual_fsm.FORNECER~q\ : std_logic;
SIGNAL \seletor_produto[0]~input_o\ : std_logic;
SIGNAL \libera_produto~0_combout\ : std_logic;
SIGNAL \libera_produto~1_combout\ : std_logic;
SIGNAL \libera_produto~2_combout\ : std_logic;
SIGNAL \libera_produto~3_combout\ : std_logic;
SIGNAL \libera_produto~4_combout\ : std_logic;
SIGNAL \libera_produto~5_combout\ : std_logic;
SIGNAL \libera_produto~6_combout\ : std_logic;
SIGNAL \libera_produto~7_combout\ : std_logic;
SIGNAL \WideOr2~0_combout\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL total_inserido : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_moeda_25_centavos <= moeda_25_centavos;
ww_moeda_50_centavos <= moeda_50_centavos;
ww_moeda_1_real <= moeda_1_real;
ww_seletor_produto <= seletor_produto;
ww_preco_produto <= preco_produto;
libera_produto <= ww_libera_produto;
libera_moeda_troco <= ww_libera_moeda_troco;
monitor_estado <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_monitor_estado));
monitor_total <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_monitor_total));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;

-- Location: IOOBUF_X41_Y2_N2
\libera_produto[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~0_combout\,
	devoe => ww_devoe,
	o => \libera_produto[0]~output_o\);

-- Location: IOOBUF_X41_Y2_N9
\libera_produto[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~1_combout\,
	devoe => ww_devoe,
	o => \libera_produto[1]~output_o\);

-- Location: IOOBUF_X41_Y5_N16
\libera_produto[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~2_combout\,
	devoe => ww_devoe,
	o => \libera_produto[2]~output_o\);

-- Location: IOOBUF_X41_Y4_N9
\libera_produto[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~3_combout\,
	devoe => ww_devoe,
	o => \libera_produto[3]~output_o\);

-- Location: IOOBUF_X41_Y3_N9
\libera_produto[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~4_combout\,
	devoe => ww_devoe,
	o => \libera_produto[4]~output_o\);

-- Location: IOOBUF_X41_Y3_N2
\libera_produto[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~5_combout\,
	devoe => ww_devoe,
	o => \libera_produto[5]~output_o\);

-- Location: IOOBUF_X41_Y4_N2
\libera_produto[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~6_combout\,
	devoe => ww_devoe,
	o => \libera_produto[6]~output_o\);

-- Location: IOOBUF_X41_Y3_N23
\libera_produto[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \libera_produto~7_combout\,
	devoe => ww_devoe,
	o => \libera_produto[7]~output_o\);

-- Location: IOOBUF_X26_Y0_N23
\libera_moeda_troco~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \estado_atual_fsm.DAR_TROCO~q\,
	devoe => ww_devoe,
	o => \libera_moeda_troco~output_o\);

-- Location: IOOBUF_X30_Y0_N16
\monitor_estado[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr2~0_combout\,
	devoe => ww_devoe,
	o => \monitor_estado[0]~output_o\);

-- Location: IOOBUF_X28_Y0_N30
\monitor_estado[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr1~0_combout\,
	devoe => ww_devoe,
	o => \monitor_estado[1]~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\monitor_estado[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr0~0_combout\,
	devoe => ww_devoe,
	o => \monitor_estado[2]~output_o\);

-- Location: IOOBUF_X5_Y29_N9
\monitor_estado[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[3]~output_o\);

-- Location: IOOBUF_X16_Y29_N9
\monitor_estado[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[4]~output_o\);

-- Location: IOOBUF_X32_Y0_N2
\monitor_estado[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[5]~output_o\);

-- Location: IOOBUF_X32_Y0_N30
\monitor_estado[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[6]~output_o\);

-- Location: IOOBUF_X1_Y29_N16
\monitor_estado[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[7]~output_o\);

-- Location: IOOBUF_X41_Y12_N23
\monitor_estado[8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[8]~output_o\);

-- Location: IOOBUF_X35_Y29_N2
\monitor_estado[9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[9]~output_o\);

-- Location: IOOBUF_X0_Y13_N23
\monitor_estado[10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[10]~output_o\);

-- Location: IOOBUF_X39_Y29_N30
\monitor_estado[11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[11]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\monitor_estado[12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[12]~output_o\);

-- Location: IOOBUF_X41_Y18_N23
\monitor_estado[13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[13]~output_o\);

-- Location: IOOBUF_X35_Y29_N30
\monitor_estado[14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[14]~output_o\);

-- Location: IOOBUF_X0_Y11_N2
\monitor_estado[15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[15]~output_o\);

-- Location: IOOBUF_X35_Y0_N30
\monitor_estado[16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[16]~output_o\);

-- Location: IOOBUF_X14_Y29_N23
\monitor_estado[17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[17]~output_o\);

-- Location: IOOBUF_X23_Y29_N9
\monitor_estado[18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[18]~output_o\);

-- Location: IOOBUF_X1_Y29_N9
\monitor_estado[19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[19]~output_o\);

-- Location: IOOBUF_X39_Y29_N9
\monitor_estado[20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[20]~output_o\);

-- Location: IOOBUF_X7_Y29_N23
\monitor_estado[21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[21]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\monitor_estado[22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[22]~output_o\);

-- Location: IOOBUF_X9_Y29_N16
\monitor_estado[23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[23]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\monitor_estado[24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[24]~output_o\);

-- Location: IOOBUF_X14_Y29_N16
\monitor_estado[25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[25]~output_o\);

-- Location: IOOBUF_X32_Y0_N23
\monitor_estado[26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[26]~output_o\);

-- Location: IOOBUF_X0_Y25_N2
\monitor_estado[27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[27]~output_o\);

-- Location: IOOBUF_X0_Y27_N2
\monitor_estado[28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[28]~output_o\);

-- Location: IOOBUF_X14_Y29_N30
\monitor_estado[29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[29]~output_o\);

-- Location: IOOBUF_X0_Y22_N2
\monitor_estado[30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[30]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\monitor_estado[31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_estado[31]~output_o\);

-- Location: IOOBUF_X23_Y0_N23
\monitor_total[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(0),
	devoe => ww_devoe,
	o => \monitor_total[0]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\monitor_total[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(1),
	devoe => ww_devoe,
	o => \monitor_total[1]~output_o\);

-- Location: IOOBUF_X21_Y0_N30
\monitor_total[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(2),
	devoe => ww_devoe,
	o => \monitor_total[2]~output_o\);

-- Location: IOOBUF_X19_Y0_N16
\monitor_total[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(3),
	devoe => ww_devoe,
	o => \monitor_total[3]~output_o\);

-- Location: IOOBUF_X19_Y0_N9
\monitor_total[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(4),
	devoe => ww_devoe,
	o => \monitor_total[4]~output_o\);

-- Location: IOOBUF_X19_Y0_N2
\monitor_total[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(5),
	devoe => ww_devoe,
	o => \monitor_total[5]~output_o\);

-- Location: IOOBUF_X19_Y0_N30
\monitor_total[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(6),
	devoe => ww_devoe,
	o => \monitor_total[6]~output_o\);

-- Location: IOOBUF_X19_Y0_N23
\monitor_total[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_inserido(7),
	devoe => ww_devoe,
	o => \monitor_total[7]~output_o\);

-- Location: IOOBUF_X32_Y29_N30
\monitor_total[8]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[8]~output_o\);

-- Location: IOOBUF_X23_Y29_N2
\monitor_total[9]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[9]~output_o\);

-- Location: IOOBUF_X41_Y14_N9
\monitor_total[10]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[10]~output_o\);

-- Location: IOOBUF_X28_Y29_N9
\monitor_total[11]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[11]~output_o\);

-- Location: IOOBUF_X35_Y0_N16
\monitor_total[12]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[12]~output_o\);

-- Location: IOOBUF_X37_Y0_N23
\monitor_total[13]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[13]~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\monitor_total[14]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[14]~output_o\);

-- Location: IOOBUF_X5_Y29_N23
\monitor_total[15]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[15]~output_o\);

-- Location: IOOBUF_X11_Y29_N23
\monitor_total[16]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[16]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\monitor_total[17]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[17]~output_o\);

-- Location: IOOBUF_X35_Y0_N2
\monitor_total[18]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[18]~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\monitor_total[19]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[19]~output_o\);

-- Location: IOOBUF_X26_Y29_N2
\monitor_total[20]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[20]~output_o\);

-- Location: IOOBUF_X3_Y0_N9
\monitor_total[21]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[21]~output_o\);

-- Location: IOOBUF_X0_Y4_N9
\monitor_total[22]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[22]~output_o\);

-- Location: IOOBUF_X5_Y29_N2
\monitor_total[23]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[23]~output_o\);

-- Location: IOOBUF_X3_Y29_N23
\monitor_total[24]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[24]~output_o\);

-- Location: IOOBUF_X1_Y0_N30
\monitor_total[25]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[25]~output_o\);

-- Location: IOOBUF_X39_Y0_N16
\monitor_total[26]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[26]~output_o\);

-- Location: IOOBUF_X0_Y12_N9
\monitor_total[27]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[27]~output_o\);

-- Location: IOOBUF_X21_Y29_N30
\monitor_total[28]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[28]~output_o\);

-- Location: IOOBUF_X11_Y29_N9
\monitor_total[29]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[29]~output_o\);

-- Location: IOOBUF_X11_Y29_N16
\monitor_total[30]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[30]~output_o\);

-- Location: IOOBUF_X16_Y29_N30
\monitor_total[31]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \monitor_total[31]~output_o\);

-- Location: IOIBUF_X41_Y2_N22
\seletor_produto[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_seletor_produto(1),
	o => \seletor_produto[1]~input_o\);

-- Location: IOIBUF_X41_Y2_N15
\seletor_produto[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_seletor_produto(2),
	o => \seletor_produto[2]~input_o\);

-- Location: IOIBUF_X0_Y14_N1
\clock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G4
\clock~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X23_Y0_N29
\preco_produto[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(7),
	o => \preco_produto[7]~input_o\);

-- Location: IOIBUF_X23_Y0_N1
\preco_produto[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(5),
	o => \preco_produto[5]~input_o\);

-- Location: IOIBUF_X23_Y0_N15
\preco_produto[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(6),
	o => \preco_produto[6]~input_o\);

-- Location: IOIBUF_X26_Y0_N29
\preco_produto[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(4),
	o => \preco_produto[4]~input_o\);

-- Location: LCCOMB_X23_Y2_N30
\LessThan1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (\preco_produto[7]~input_o\) # ((\preco_produto[5]~input_o\) # ((\preco_produto[6]~input_o\) # (\preco_produto[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[7]~input_o\,
	datab => \preco_produto[5]~input_o\,
	datac => \preco_produto[6]~input_o\,
	datad => \preco_produto[4]~input_o\,
	combout => \LessThan1~1_combout\);

-- Location: IOIBUF_X26_Y0_N8
\preco_produto[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(0),
	o => \preco_produto[0]~input_o\);

-- Location: IOIBUF_X26_Y0_N15
\preco_produto[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(3),
	o => \preco_produto[3]~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\preco_produto[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(2),
	o => \preco_produto[2]~input_o\);

-- Location: IOIBUF_X28_Y0_N8
\preco_produto[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preco_produto(1),
	o => \preco_produto[1]~input_o\);

-- Location: LCCOMB_X23_Y2_N12
\LessThan1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\preco_produto[0]~input_o\) # ((\preco_produto[3]~input_o\) # ((\preco_produto[2]~input_o\) # (\preco_produto[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[0]~input_o\,
	datab => \preco_produto[3]~input_o\,
	datac => \preco_produto[2]~input_o\,
	datad => \preco_produto[1]~input_o\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X27_Y2_N0
\WideOr0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr0~1_combout\ = (\estado_atual_fsm.DAR_TROCO~q\) # (\estado_atual_fsm.FORNECER~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado_atual_fsm.DAR_TROCO~q\,
	datad => \estado_atual_fsm.FORNECER~q\,
	combout => \WideOr0~1_combout\);

-- Location: IOIBUF_X0_Y14_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G2
\reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X27_Y2_N1
\estado_atual_fsm.VERIFICAR_TROCO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \WideOr0~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.VERIFICAR_TROCO~q\);

-- Location: IOIBUF_X28_Y0_N1
\moeda_25_centavos~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_moeda_25_centavos,
	o => \moeda_25_centavos~input_o\);

-- Location: IOIBUF_X28_Y0_N15
\moeda_50_centavos~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_moeda_50_centavos,
	o => \moeda_50_centavos~input_o\);

-- Location: LCCOMB_X27_Y2_N4
\Selector9~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector9~3_combout\ = (!\moeda_25_centavos~input_o\ & !\moeda_50_centavos~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moeda_25_centavos~input_o\,
	datad => \moeda_50_centavos~input_o\,
	combout => \Selector9~3_combout\);

-- Location: LCCOMB_X27_Y2_N18
\LessThan1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (\LessThan1~0_combout\) # (\LessThan1~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan1~0_combout\,
	datac => \LessThan1~1_combout\,
	combout => \LessThan1~2_combout\);

-- Location: IOIBUF_X30_Y0_N22
\moeda_1_real~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_moeda_1_real,
	o => \moeda_1_real~input_o\);

-- Location: LCCOMB_X27_Y2_N20
\Selector9~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector9~6_combout\ = (!\moeda_25_centavos~input_o\ & (\estado_atual_fsm.ESPERAR~q\ & (!\moeda_1_real~input_o\ & !\moeda_50_centavos~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moeda_25_centavos~input_o\,
	datab => \estado_atual_fsm.ESPERAR~q\,
	datac => \moeda_1_real~input_o\,
	datad => \moeda_50_centavos~input_o\,
	combout => \Selector9~6_combout\);

-- Location: LCCOMB_X21_Y2_N18
\Add2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (total_inserido(3) & (!\Add2~1\)) # (!total_inserido(3) & ((\Add2~1\) # (GND)))
-- \Add2~3\ = CARRY((!\Add2~1\) # (!total_inserido(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(3),
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X21_Y2_N20
\Add2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (total_inserido(4) & (\Add2~3\ $ (GND))) # (!total_inserido(4) & (!\Add2~3\ & VCC))
-- \Add2~5\ = CARRY((total_inserido(4) & !\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(4),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: LCCOMB_X27_Y2_N30
\proximo_estado_fsm.SOMAR_50~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \proximo_estado_fsm.SOMAR_50~0_combout\ = (!\moeda_25_centavos~input_o\ & \moeda_50_centavos~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moeda_25_centavos~input_o\,
	datad => \moeda_50_centavos~input_o\,
	combout => \proximo_estado_fsm.SOMAR_50~0_combout\);

-- Location: LCCOMB_X26_Y2_N30
\Selector9~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector9~5_combout\ = (!\moeda_1_real~input_o\ & (\Selector9~3_combout\ & ((\LessThan0~14_combout\) # (!\LessThan1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moeda_1_real~input_o\,
	datab => \LessThan1~2_combout\,
	datac => \LessThan0~14_combout\,
	datad => \Selector9~3_combout\,
	combout => \Selector9~5_combout\);

-- Location: LCCOMB_X26_Y2_N0
\COMB_PROC~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \COMB_PROC~0_combout\ = (!\LessThan0~14_combout\ & ((\LessThan1~0_combout\) # (\LessThan1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan1~0_combout\,
	datac => \LessThan0~14_combout\,
	datad => \LessThan1~1_combout\,
	combout => \COMB_PROC~0_combout\);

-- Location: LCCOMB_X26_Y2_N28
\proximo_estado_fsm.SOMAR_50~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \proximo_estado_fsm.SOMAR_50~1_combout\ = (\proximo_estado_fsm.SOMAR_50~0_combout\ & (\estado_atual_fsm.ESPERAR~q\ & (!\Selector9~5_combout\ & !\COMB_PROC~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \proximo_estado_fsm.SOMAR_50~0_combout\,
	datab => \estado_atual_fsm.ESPERAR~q\,
	datac => \Selector9~5_combout\,
	datad => \COMB_PROC~0_combout\,
	combout => \proximo_estado_fsm.SOMAR_50~1_combout\);

-- Location: FF_X26_Y2_N29
\estado_atual_fsm.SOMAR_50\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \proximo_estado_fsm.SOMAR_50~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.SOMAR_50~q\);

-- Location: LCCOMB_X26_Y2_N6
\proximo_estado_fsm.SOMAR_25~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \proximo_estado_fsm.SOMAR_25~0_combout\ = (\moeda_25_centavos~input_o\ & (\estado_atual_fsm.ESPERAR~q\ & (!\Selector9~5_combout\ & !\COMB_PROC~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \moeda_25_centavos~input_o\,
	datab => \estado_atual_fsm.ESPERAR~q\,
	datac => \Selector9~5_combout\,
	datad => \COMB_PROC~0_combout\,
	combout => \proximo_estado_fsm.SOMAR_25~0_combout\);

-- Location: FF_X26_Y2_N7
\estado_atual_fsm.SOMAR_25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \proximo_estado_fsm.SOMAR_25~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.SOMAR_25~q\);

-- Location: LCCOMB_X21_Y2_N0
\Add1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = total_inserido(1) $ (VCC)
-- \Add1~1\ = CARRY(total_inserido(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(1),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X22_Y2_N8
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = total_inserido(0) $ (VCC)
-- \Add0~1\ = CARRY(total_inserido(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X27_Y2_N8
\proximo_total~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \proximo_total~0_combout\ = (!\estado_atual_fsm.VERIFICAR_TROCO~q\ & !\estado_atual_fsm.ESPERAR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_atual_fsm.VERIFICAR_TROCO~q\,
	datad => \estado_atual_fsm.ESPERAR~q\,
	combout => \proximo_total~0_combout\);

-- Location: LCCOMB_X23_Y2_N0
\Selector7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (total_inserido(0) & ((\estado_atual_fsm.SOMAR_100~q\) # ((\estado_atual_fsm.SOMAR_50~q\) # (!\proximo_total~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => total_inserido(0),
	datac => \estado_atual_fsm.SOMAR_50~q\,
	datad => \proximo_total~0_combout\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X23_Y2_N14
\Add3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = (\preco_produto[0]~input_o\ & (total_inserido(0) $ (VCC))) # (!\preco_produto[0]~input_o\ & ((total_inserido(0)) # (GND)))
-- \Add3~1\ = CARRY((total_inserido(0)) # (!\preco_produto[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[0]~input_o\,
	datab => total_inserido(0),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X24_Y2_N10
\Add4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = total_inserido(0) $ (VCC)
-- \Add4~1\ = CARRY(total_inserido(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(0),
	datad => VCC,
	combout => \Add4~0_combout\,
	cout => \Add4~1\);

-- Location: LCCOMB_X23_Y2_N2
\Selector7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\estado_atual_fsm.FORNECER~q\ & ((\Add3~0_combout\) # ((\Add4~0_combout\ & \estado_atual_fsm.DAR_TROCO~q\)))) # (!\estado_atual_fsm.FORNECER~q\ & (((\Add4~0_combout\ & \estado_atual_fsm.DAR_TROCO~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.FORNECER~q\,
	datab => \Add3~0_combout\,
	datac => \Add4~0_combout\,
	datad => \estado_atual_fsm.DAR_TROCO~q\,
	combout => \Selector7~1_combout\);

-- Location: LCCOMB_X23_Y2_N8
\Selector7~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector7~2_combout\ = (\Selector7~0_combout\) # ((\Selector7~1_combout\) # ((\Add0~0_combout\ & \estado_atual_fsm.SOMAR_25~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Selector7~0_combout\,
	datac => \estado_atual_fsm.SOMAR_25~q\,
	datad => \Selector7~1_combout\,
	combout => \Selector7~2_combout\);

-- Location: FF_X23_Y2_N9
\total_inserido[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector7~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(0));

-- Location: LCCOMB_X22_Y2_N10
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (total_inserido(1) & (!\Add0~1\)) # (!total_inserido(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!total_inserido(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X22_Y2_N0
\Selector6~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector6~2_combout\ = (\estado_atual_fsm.SOMAR_50~q\ & ((\Add1~0_combout\) # ((\estado_atual_fsm.SOMAR_25~q\ & \Add0~2_combout\)))) # (!\estado_atual_fsm.SOMAR_50~q\ & (\estado_atual_fsm.SOMAR_25~q\ & ((\Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_50~q\,
	datab => \estado_atual_fsm.SOMAR_25~q\,
	datac => \Add1~0_combout\,
	datad => \Add0~2_combout\,
	combout => \Selector6~2_combout\);

-- Location: LCCOMB_X27_Y2_N22
\Selector6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (total_inserido(1) & ((\estado_atual_fsm.SOMAR_100~q\) # ((\estado_atual_fsm.VERIFICAR_TROCO~q\) # (\estado_atual_fsm.ESPERAR~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \estado_atual_fsm.VERIFICAR_TROCO~q\,
	datac => total_inserido(1),
	datad => \estado_atual_fsm.ESPERAR~q\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X24_Y2_N12
\Add4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = (total_inserido(1) & (\Add4~1\ & VCC)) # (!total_inserido(1) & (!\Add4~1\))
-- \Add4~3\ = CARRY((!total_inserido(1) & !\Add4~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(1),
	datad => VCC,
	cin => \Add4~1\,
	combout => \Add4~2_combout\,
	cout => \Add4~3\);

-- Location: LCCOMB_X23_Y2_N16
\Add3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (\preco_produto[1]~input_o\ & ((total_inserido(1) & (!\Add3~1\)) # (!total_inserido(1) & ((\Add3~1\) # (GND))))) # (!\preco_produto[1]~input_o\ & ((total_inserido(1) & (\Add3~1\ & VCC)) # (!total_inserido(1) & (!\Add3~1\))))
-- \Add3~3\ = CARRY((\preco_produto[1]~input_o\ & ((!\Add3~1\) # (!total_inserido(1)))) # (!\preco_produto[1]~input_o\ & (!total_inserido(1) & !\Add3~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[1]~input_o\,
	datab => total_inserido(1),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X23_Y2_N4
\Selector6~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\estado_atual_fsm.FORNECER~q\ & ((\Add3~2_combout\) # ((\estado_atual_fsm.DAR_TROCO~q\ & \Add4~2_combout\)))) # (!\estado_atual_fsm.FORNECER~q\ & (\estado_atual_fsm.DAR_TROCO~q\ & (\Add4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.FORNECER~q\,
	datab => \estado_atual_fsm.DAR_TROCO~q\,
	datac => \Add4~2_combout\,
	datad => \Add3~2_combout\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X22_Y2_N4
\Selector6~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector6~3_combout\ = (\Selector6~2_combout\) # ((\Selector6~0_combout\) # (\Selector6~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector6~2_combout\,
	datac => \Selector6~0_combout\,
	datad => \Selector6~1_combout\,
	combout => \Selector6~3_combout\);

-- Location: FF_X22_Y2_N5
\total_inserido[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector6~3_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(1));

-- Location: LCCOMB_X21_Y2_N2
\Add1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (total_inserido(2) & (!\Add1~1\)) # (!total_inserido(2) & ((\Add1~1\) # (GND)))
-- \Add1~3\ = CARRY((!\Add1~1\) # (!total_inserido(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(2),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X21_Y2_N4
\Add1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (total_inserido(3) & (\Add1~3\ $ (GND))) # (!total_inserido(3) & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((total_inserido(3) & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(3),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X21_Y2_N6
\Add1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (total_inserido(4) & (\Add1~5\ & VCC)) # (!total_inserido(4) & (!\Add1~5\))
-- \Add1~7\ = CARRY((!total_inserido(4) & !\Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(4),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X22_Y2_N12
\Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (total_inserido(2) & (\Add0~3\ $ (GND))) # (!total_inserido(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((total_inserido(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X22_Y2_N14
\Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (total_inserido(3) & (\Add0~5\ & VCC)) # (!total_inserido(3) & (!\Add0~5\))
-- \Add0~7\ = CARRY((!total_inserido(3) & !\Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X22_Y2_N16
\Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (total_inserido(4) & ((GND) # (!\Add0~7\))) # (!total_inserido(4) & (\Add0~7\ $ (GND)))
-- \Add0~9\ = CARRY((total_inserido(4)) # (!\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X22_Y2_N24
\Selector3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\estado_atual_fsm.SOMAR_50~q\ & ((\Add1~6_combout\) # ((\estado_atual_fsm.SOMAR_25~q\ & \Add0~8_combout\)))) # (!\estado_atual_fsm.SOMAR_50~q\ & (\estado_atual_fsm.SOMAR_25~q\ & ((\Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_50~q\,
	datab => \estado_atual_fsm.SOMAR_25~q\,
	datac => \Add1~6_combout\,
	datad => \Add0~8_combout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X24_Y2_N14
\Add4~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~4_combout\ = (total_inserido(2) & ((GND) # (!\Add4~3\))) # (!total_inserido(2) & (\Add4~3\ $ (GND)))
-- \Add4~5\ = CARRY((total_inserido(2)) # (!\Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(2),
	datad => VCC,
	cin => \Add4~3\,
	combout => \Add4~4_combout\,
	cout => \Add4~5\);

-- Location: LCCOMB_X24_Y2_N16
\Add4~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~6_combout\ = (total_inserido(3) & (!\Add4~5\)) # (!total_inserido(3) & ((\Add4~5\) # (GND)))
-- \Add4~7\ = CARRY((!\Add4~5\) # (!total_inserido(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(3),
	datad => VCC,
	cin => \Add4~5\,
	combout => \Add4~6_combout\,
	cout => \Add4~7\);

-- Location: LCCOMB_X24_Y2_N18
\Add4~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~8_combout\ = (total_inserido(4) & (\Add4~7\ $ (GND))) # (!total_inserido(4) & (!\Add4~7\ & VCC))
-- \Add4~9\ = CARRY((total_inserido(4) & !\Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(4),
	datad => VCC,
	cin => \Add4~7\,
	combout => \Add4~8_combout\,
	cout => \Add4~9\);

-- Location: LCCOMB_X23_Y2_N18
\Add3~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = ((total_inserido(2) $ (\preco_produto[2]~input_o\ $ (\Add3~3\)))) # (GND)
-- \Add3~5\ = CARRY((total_inserido(2) & ((!\Add3~3\) # (!\preco_produto[2]~input_o\))) # (!total_inserido(2) & (!\preco_produto[2]~input_o\ & !\Add3~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(2),
	datab => \preco_produto[2]~input_o\,
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X23_Y2_N20
\Add3~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (\preco_produto[3]~input_o\ & ((total_inserido(3) & (!\Add3~5\)) # (!total_inserido(3) & ((\Add3~5\) # (GND))))) # (!\preco_produto[3]~input_o\ & ((total_inserido(3) & (\Add3~5\ & VCC)) # (!total_inserido(3) & (!\Add3~5\))))
-- \Add3~7\ = CARRY((\preco_produto[3]~input_o\ & ((!\Add3~5\) # (!total_inserido(3)))) # (!\preco_produto[3]~input_o\ & (!total_inserido(3) & !\Add3~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[3]~input_o\,
	datab => total_inserido(3),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X23_Y2_N22
\Add3~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = ((total_inserido(4) $ (\preco_produto[4]~input_o\ $ (\Add3~7\)))) # (GND)
-- \Add3~9\ = CARRY((total_inserido(4) & ((!\Add3~7\) # (!\preco_produto[4]~input_o\))) # (!total_inserido(4) & (!\preco_produto[4]~input_o\ & !\Add3~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(4),
	datab => \preco_produto[4]~input_o\,
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X24_Y2_N2
\Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\estado_atual_fsm.FORNECER~q\ & ((\Add3~8_combout\) # ((\Add4~8_combout\ & \estado_atual_fsm.DAR_TROCO~q\)))) # (!\estado_atual_fsm.FORNECER~q\ & (\Add4~8_combout\ & (\estado_atual_fsm.DAR_TROCO~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.FORNECER~q\,
	datab => \Add4~8_combout\,
	datac => \estado_atual_fsm.DAR_TROCO~q\,
	datad => \Add3~8_combout\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X24_Y2_N30
\Selector3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\Selector3~1_combout\) # ((\Selector3~0_combout\) # ((\estado_atual_fsm.SOMAR_100~q\ & \Add2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \Add2~4_combout\,
	datac => \Selector3~1_combout\,
	datad => \Selector3~0_combout\,
	combout => \Selector3~2_combout\);

-- Location: FF_X24_Y2_N31
\total_inserido[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector3~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \proximo_total~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(4));

-- Location: LCCOMB_X21_Y2_N22
\Add2~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (total_inserido(5) & (\Add2~5\ & VCC)) # (!total_inserido(5) & (!\Add2~5\))
-- \Add2~7\ = CARRY((!total_inserido(5) & !\Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(5),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X22_Y2_N18
\Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (total_inserido(5) & (!\Add0~9\)) # (!total_inserido(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!total_inserido(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X21_Y2_N8
\Add1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (total_inserido(5) & ((GND) # (!\Add1~7\))) # (!total_inserido(5) & (\Add1~7\ $ (GND)))
-- \Add1~9\ = CARRY((total_inserido(5)) # (!\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(5),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X22_Y2_N6
\Selector2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\estado_atual_fsm.SOMAR_50~q\ & ((\Add1~8_combout\) # ((\Add0~10_combout\ & \estado_atual_fsm.SOMAR_25~q\)))) # (!\estado_atual_fsm.SOMAR_50~q\ & (\Add0~10_combout\ & (\estado_atual_fsm.SOMAR_25~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_50~q\,
	datab => \Add0~10_combout\,
	datac => \estado_atual_fsm.SOMAR_25~q\,
	datad => \Add1~8_combout\,
	combout => \Selector2~1_combout\);

-- Location: LCCOMB_X24_Y2_N20
\Add4~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~10_combout\ = (total_inserido(5) & (\Add4~9\ & VCC)) # (!total_inserido(5) & (!\Add4~9\))
-- \Add4~11\ = CARRY((!total_inserido(5) & !\Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(5),
	datad => VCC,
	cin => \Add4~9\,
	combout => \Add4~10_combout\,
	cout => \Add4~11\);

-- Location: LCCOMB_X23_Y2_N24
\Add3~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (total_inserido(5) & ((\preco_produto[5]~input_o\ & (!\Add3~9\)) # (!\preco_produto[5]~input_o\ & (\Add3~9\ & VCC)))) # (!total_inserido(5) & ((\preco_produto[5]~input_o\ & ((\Add3~9\) # (GND))) # (!\preco_produto[5]~input_o\ & 
-- (!\Add3~9\))))
-- \Add3~11\ = CARRY((total_inserido(5) & (\preco_produto[5]~input_o\ & !\Add3~9\)) # (!total_inserido(5) & ((\preco_produto[5]~input_o\) # (!\Add3~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(5),
	datab => \preco_produto[5]~input_o\,
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X23_Y2_N10
\Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\estado_atual_fsm.FORNECER~q\ & ((\Add3~10_combout\) # ((\estado_atual_fsm.DAR_TROCO~q\ & \Add4~10_combout\)))) # (!\estado_atual_fsm.FORNECER~q\ & (\estado_atual_fsm.DAR_TROCO~q\ & (\Add4~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.FORNECER~q\,
	datab => \estado_atual_fsm.DAR_TROCO~q\,
	datac => \Add4~10_combout\,
	datad => \Add3~10_combout\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X23_Y2_N6
\Selector2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\Selector2~1_combout\) # ((\Selector2~0_combout\) # ((\estado_atual_fsm.SOMAR_100~q\ & \Add2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \Add2~6_combout\,
	datac => \Selector2~1_combout\,
	datad => \Selector2~0_combout\,
	combout => \Selector2~2_combout\);

-- Location: FF_X23_Y2_N7
\total_inserido[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector2~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \proximo_total~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(5));

-- Location: LCCOMB_X21_Y2_N24
\Add2~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (total_inserido(6) & ((GND) # (!\Add2~7\))) # (!total_inserido(6) & (\Add2~7\ $ (GND)))
-- \Add2~9\ = CARRY((total_inserido(6)) # (!\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(6),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X21_Y2_N10
\Add1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (total_inserido(6) & (!\Add1~9\)) # (!total_inserido(6) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!total_inserido(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(6),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X22_Y2_N20
\Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (total_inserido(6) & (\Add0~11\ $ (GND))) # (!total_inserido(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((total_inserido(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X22_Y2_N30
\Selector1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\Add1~10_combout\ & ((\estado_atual_fsm.SOMAR_50~q\) # ((\estado_atual_fsm.SOMAR_25~q\ & \Add0~12_combout\)))) # (!\Add1~10_combout\ & (((\estado_atual_fsm.SOMAR_25~q\ & \Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~10_combout\,
	datab => \estado_atual_fsm.SOMAR_50~q\,
	datac => \estado_atual_fsm.SOMAR_25~q\,
	datad => \Add0~12_combout\,
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X23_Y2_N26
\Add3~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = ((total_inserido(6) $ (\preco_produto[6]~input_o\ $ (\Add3~11\)))) # (GND)
-- \Add3~13\ = CARRY((total_inserido(6) & ((!\Add3~11\) # (!\preco_produto[6]~input_o\))) # (!total_inserido(6) & (!\preco_produto[6]~input_o\ & !\Add3~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(6),
	datab => \preco_produto[6]~input_o\,
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~12_combout\,
	cout => \Add3~13\);

-- Location: LCCOMB_X24_Y2_N22
\Add4~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~12_combout\ = (total_inserido(6) & ((GND) # (!\Add4~11\))) # (!total_inserido(6) & (\Add4~11\ $ (GND)))
-- \Add4~13\ = CARRY((total_inserido(6)) # (!\Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(6),
	datad => VCC,
	cin => \Add4~11\,
	combout => \Add4~12_combout\,
	cout => \Add4~13\);

-- Location: LCCOMB_X22_Y2_N28
\Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\estado_atual_fsm.DAR_TROCO~q\ & ((\Add4~12_combout\) # ((\Add3~12_combout\ & \estado_atual_fsm.FORNECER~q\)))) # (!\estado_atual_fsm.DAR_TROCO~q\ & (\Add3~12_combout\ & (\estado_atual_fsm.FORNECER~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.DAR_TROCO~q\,
	datab => \Add3~12_combout\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \Add4~12_combout\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X22_Y2_N26
\Selector1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\Selector1~1_combout\) # ((\Selector1~0_combout\) # ((\estado_atual_fsm.SOMAR_100~q\ & \Add2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \Add2~8_combout\,
	datac => \Selector1~1_combout\,
	datad => \Selector1~0_combout\,
	combout => \Selector1~2_combout\);

-- Location: FF_X22_Y2_N27
\total_inserido[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector1~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \proximo_total~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(6));

-- Location: LCCOMB_X24_Y2_N8
\LessThan2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (total_inserido(4)) # ((total_inserido(5)) # ((total_inserido(7)) # (total_inserido(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(4),
	datab => total_inserido(5),
	datac => total_inserido(7),
	datad => total_inserido(6),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X27_Y2_N24
\Selector8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ((\LessThan2~1_combout\) # (\LessThan2~0_combout\)) # (!\estado_atual_fsm.VERIFICAR_TROCO~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_atual_fsm.VERIFICAR_TROCO~q\,
	datac => \LessThan2~1_combout\,
	datad => \LessThan2~0_combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X27_Y2_N25
\estado_atual_fsm.INICIO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector8~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.INICIO~q\);

-- Location: LCCOMB_X27_Y2_N6
\Selector9~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector9~2_combout\ = (\estado_atual_fsm.SOMAR_100~q\) # (((\estado_atual_fsm.SOMAR_25~q\) # (\estado_atual_fsm.SOMAR_50~q\)) # (!\estado_atual_fsm.INICIO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \estado_atual_fsm.INICIO~q\,
	datac => \estado_atual_fsm.SOMAR_25~q\,
	datad => \estado_atual_fsm.SOMAR_50~q\,
	combout => \Selector9~2_combout\);

-- Location: LCCOMB_X27_Y2_N16
\Selector9~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector9~4_combout\ = (\Selector9~2_combout\) # ((\Selector9~6_combout\ & ((\LessThan0~14_combout\) # (!\LessThan1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~2_combout\,
	datab => \Selector9~6_combout\,
	datac => \LessThan0~14_combout\,
	datad => \Selector9~2_combout\,
	combout => \Selector9~4_combout\);

-- Location: FF_X27_Y2_N17
\estado_atual_fsm.ESPERAR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector9~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.ESPERAR~q\);

-- Location: LCCOMB_X26_Y2_N8
\proximo_estado_fsm.SOMAR_100~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \proximo_estado_fsm.SOMAR_100~0_combout\ = (\Selector9~3_combout\ & (\estado_atual_fsm.ESPERAR~q\ & (\moeda_1_real~input_o\ & !\COMB_PROC~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector9~3_combout\,
	datab => \estado_atual_fsm.ESPERAR~q\,
	datac => \moeda_1_real~input_o\,
	datad => \COMB_PROC~0_combout\,
	combout => \proximo_estado_fsm.SOMAR_100~0_combout\);

-- Location: FF_X26_Y2_N9
\estado_atual_fsm.SOMAR_100\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \proximo_estado_fsm.SOMAR_100~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.SOMAR_100~q\);

-- Location: LCCOMB_X21_Y2_N16
\Add2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = total_inserido(2) $ (VCC)
-- \Add2~1\ = CARRY(total_inserido(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(2),
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: LCCOMB_X22_Y2_N2
\Selector5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (\Add0~4_combout\ & ((\estado_atual_fsm.SOMAR_25~q\) # ((\estado_atual_fsm.SOMAR_50~q\ & \Add1~2_combout\)))) # (!\Add0~4_combout\ & (((\estado_atual_fsm.SOMAR_50~q\ & \Add1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~4_combout\,
	datab => \estado_atual_fsm.SOMAR_25~q\,
	datac => \estado_atual_fsm.SOMAR_50~q\,
	datad => \Add1~2_combout\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X24_Y2_N0
\Selector5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\estado_atual_fsm.DAR_TROCO~q\ & ((\Add4~4_combout\) # ((\estado_atual_fsm.FORNECER~q\ & \Add3~4_combout\)))) # (!\estado_atual_fsm.DAR_TROCO~q\ & (\estado_atual_fsm.FORNECER~q\ & ((\Add3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.DAR_TROCO~q\,
	datab => \estado_atual_fsm.FORNECER~q\,
	datac => \Add4~4_combout\,
	datad => \Add3~4_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X24_Y2_N4
\Selector5~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = (\Selector5~1_combout\) # ((\Selector5~0_combout\) # ((\estado_atual_fsm.SOMAR_100~q\ & \Add2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \Add2~0_combout\,
	datac => \Selector5~1_combout\,
	datad => \Selector5~0_combout\,
	combout => \Selector5~2_combout\);

-- Location: FF_X24_Y2_N5
\total_inserido[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector5~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \proximo_total~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(2));

-- Location: LCCOMB_X26_Y2_N4
\Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\estado_atual_fsm.FORNECER~q\ & ((\Add3~6_combout\) # ((\estado_atual_fsm.DAR_TROCO~q\ & \Add4~6_combout\)))) # (!\estado_atual_fsm.FORNECER~q\ & (\estado_atual_fsm.DAR_TROCO~q\ & ((\Add4~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.FORNECER~q\,
	datab => \estado_atual_fsm.DAR_TROCO~q\,
	datac => \Add3~6_combout\,
	datad => \Add4~6_combout\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X26_Y2_N2
\Selector4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\estado_atual_fsm.SOMAR_25~q\ & ((\Add0~6_combout\) # ((\estado_atual_fsm.SOMAR_50~q\ & \Add1~4_combout\)))) # (!\estado_atual_fsm.SOMAR_25~q\ & (\estado_atual_fsm.SOMAR_50~q\ & ((\Add1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_25~q\,
	datab => \estado_atual_fsm.SOMAR_50~q\,
	datac => \Add0~6_combout\,
	datad => \Add1~4_combout\,
	combout => \Selector4~1_combout\);

-- Location: LCCOMB_X26_Y2_N10
\Selector4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector4~2_combout\ = (\Selector4~0_combout\) # ((\Selector4~1_combout\) # ((\Add2~2_combout\ & \estado_atual_fsm.SOMAR_100~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~2_combout\,
	datab => \estado_atual_fsm.SOMAR_100~q\,
	datac => \Selector4~0_combout\,
	datad => \Selector4~1_combout\,
	combout => \Selector4~2_combout\);

-- Location: FF_X26_Y2_N11
\total_inserido[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector4~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \proximo_total~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(3));

-- Location: LCCOMB_X24_Y2_N26
\LessThan2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (total_inserido(3)) # ((total_inserido(2)) # ((total_inserido(1)) # (total_inserido(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(3),
	datab => total_inserido(2),
	datac => total_inserido(1),
	datad => total_inserido(0),
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X27_Y2_N26
\Selector11~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\estado_atual_fsm.VERIFICAR_TROCO~q\ & ((\LessThan2~1_combout\) # (\LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado_atual_fsm.VERIFICAR_TROCO~q\,
	datac => \LessThan2~1_combout\,
	datad => \LessThan2~0_combout\,
	combout => \Selector11~0_combout\);

-- Location: FF_X27_Y2_N27
\estado_atual_fsm.DAR_TROCO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector11~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.DAR_TROCO~q\);

-- Location: LCCOMB_X21_Y2_N26
\Add2~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = total_inserido(7) $ (\Add2~9\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(7),
	cin => \Add2~9\,
	combout => \Add2~10_combout\);

-- Location: LCCOMB_X21_Y2_N12
\Add1~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = total_inserido(7) $ (!\Add1~11\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => total_inserido(7),
	cin => \Add1~11\,
	combout => \Add1~12_combout\);

-- Location: LCCOMB_X21_Y2_N28
\Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\estado_atual_fsm.SOMAR_100~q\ & ((\Add2~10_combout\) # ((\estado_atual_fsm.SOMAR_50~q\ & \Add1~12_combout\)))) # (!\estado_atual_fsm.SOMAR_100~q\ & (\estado_atual_fsm.SOMAR_50~q\ & ((\Add1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \estado_atual_fsm.SOMAR_50~q\,
	datac => \Add2~10_combout\,
	datad => \Add1~12_combout\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X23_Y2_N28
\Add3~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = \preco_produto[7]~input_o\ $ (\Add3~13\ $ (!total_inserido(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[7]~input_o\,
	datad => total_inserido(7),
	cin => \Add3~13\,
	combout => \Add3~14_combout\);

-- Location: LCCOMB_X22_Y2_N22
\Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = \Add0~13\ $ (total_inserido(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => total_inserido(7),
	cin => \Add0~13\,
	combout => \Add0~14_combout\);

-- Location: LCCOMB_X21_Y2_N30
\Selector0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\estado_atual_fsm.FORNECER~q\ & ((\Add3~14_combout\) # ((\estado_atual_fsm.SOMAR_25~q\ & \Add0~14_combout\)))) # (!\estado_atual_fsm.FORNECER~q\ & (\estado_atual_fsm.SOMAR_25~q\ & ((\Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.FORNECER~q\,
	datab => \estado_atual_fsm.SOMAR_25~q\,
	datac => \Add3~14_combout\,
	datad => \Add0~14_combout\,
	combout => \Selector0~1_combout\);

-- Location: LCCOMB_X24_Y2_N24
\Add4~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add4~14_combout\ = total_inserido(7) $ (!\Add4~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(7),
	cin => \Add4~13\,
	combout => \Add4~14_combout\);

-- Location: LCCOMB_X21_Y2_N14
\Selector0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~2_combout\ = (\Selector0~0_combout\) # ((\Selector0~1_combout\) # ((\estado_atual_fsm.DAR_TROCO~q\ & \Add4~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.DAR_TROCO~q\,
	datab => \Selector0~0_combout\,
	datac => \Selector0~1_combout\,
	datad => \Add4~14_combout\,
	combout => \Selector0~2_combout\);

-- Location: FF_X21_Y2_N15
\total_inserido[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector0~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \proximo_total~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_inserido(7));

-- Location: LCCOMB_X26_Y2_N12
\LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((\preco_produto[0]~input_o\ & !total_inserido(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[0]~input_o\,
	datab => total_inserido(0),
	datad => VCC,
	cout => \LessThan0~1_cout\);

-- Location: LCCOMB_X26_Y2_N14
\LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((\preco_produto[1]~input_o\ & (total_inserido(1) & !\LessThan0~1_cout\)) # (!\preco_produto[1]~input_o\ & ((total_inserido(1)) # (!\LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[1]~input_o\,
	datab => total_inserido(1),
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

-- Location: LCCOMB_X26_Y2_N16
\LessThan0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((\preco_produto[2]~input_o\ & ((!\LessThan0~3_cout\) # (!total_inserido(2)))) # (!\preco_produto[2]~input_o\ & (!total_inserido(2) & !\LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[2]~input_o\,
	datab => total_inserido(2),
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

-- Location: LCCOMB_X26_Y2_N18
\LessThan0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((total_inserido(3) & ((!\LessThan0~5_cout\) # (!\preco_produto[3]~input_o\))) # (!total_inserido(3) & (!\preco_produto[3]~input_o\ & !\LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(3),
	datab => \preco_produto[3]~input_o\,
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

-- Location: LCCOMB_X26_Y2_N20
\LessThan0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((total_inserido(4) & (\preco_produto[4]~input_o\ & !\LessThan0~7_cout\)) # (!total_inserido(4) & ((\preco_produto[4]~input_o\) # (!\LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(4),
	datab => \preco_produto[4]~input_o\,
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

-- Location: LCCOMB_X26_Y2_N22
\LessThan0~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((\preco_produto[5]~input_o\ & (total_inserido(5) & !\LessThan0~9_cout\)) # (!\preco_produto[5]~input_o\ & ((total_inserido(5)) # (!\LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \preco_produto[5]~input_o\,
	datab => total_inserido(5),
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

-- Location: LCCOMB_X26_Y2_N24
\LessThan0~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~13_cout\ = CARRY((total_inserido(6) & (\preco_produto[6]~input_o\ & !\LessThan0~11_cout\)) # (!total_inserido(6) & ((\preco_produto[6]~input_o\) # (!\LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(6),
	datab => \preco_produto[6]~input_o\,
	datad => VCC,
	cin => \LessThan0~11_cout\,
	cout => \LessThan0~13_cout\);

-- Location: LCCOMB_X26_Y2_N26
\LessThan0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \LessThan0~14_combout\ = (total_inserido(7) & (\preco_produto[7]~input_o\ & \LessThan0~13_cout\)) # (!total_inserido(7) & ((\preco_produto[7]~input_o\) # (\LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_inserido(7),
	datab => \preco_produto[7]~input_o\,
	cin => \LessThan0~13_cout\,
	combout => \LessThan0~14_combout\);

-- Location: LCCOMB_X27_Y2_N12
\proximo_estado_fsm.FORNECER~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \proximo_estado_fsm.FORNECER~2_combout\ = (!\LessThan0~14_combout\ & (\estado_atual_fsm.ESPERAR~q\ & ((\LessThan1~1_combout\) # (\LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datab => \LessThan1~0_combout\,
	datac => \LessThan0~14_combout\,
	datad => \estado_atual_fsm.ESPERAR~q\,
	combout => \proximo_estado_fsm.FORNECER~2_combout\);

-- Location: FF_X27_Y2_N13
\estado_atual_fsm.FORNECER\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \proximo_estado_fsm.FORNECER~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual_fsm.FORNECER~q\);

-- Location: IOIBUF_X41_Y3_N15
\seletor_produto[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_seletor_produto(0),
	o => \seletor_produto[0]~input_o\);

-- Location: LCCOMB_X40_Y3_N28
\libera_produto~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~0_combout\ = (!\seletor_produto[1]~input_o\ & (!\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & !\seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~0_combout\);

-- Location: LCCOMB_X40_Y3_N30
\libera_produto~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~1_combout\ = (!\seletor_produto[1]~input_o\ & (!\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & \seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~1_combout\);

-- Location: LCCOMB_X40_Y3_N16
\libera_produto~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~2_combout\ = (\seletor_produto[1]~input_o\ & (!\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & !\seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~2_combout\);

-- Location: LCCOMB_X40_Y3_N10
\libera_produto~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~3_combout\ = (\seletor_produto[1]~input_o\ & (!\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & \seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~3_combout\);

-- Location: LCCOMB_X40_Y3_N12
\libera_produto~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~4_combout\ = (!\seletor_produto[1]~input_o\ & (\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & !\seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~4_combout\);

-- Location: LCCOMB_X40_Y3_N6
\libera_produto~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~5_combout\ = (!\seletor_produto[1]~input_o\ & (\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & \seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~5_combout\);

-- Location: LCCOMB_X40_Y3_N0
\libera_produto~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~6_combout\ = (\seletor_produto[1]~input_o\ & (\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & !\seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~6_combout\);

-- Location: LCCOMB_X40_Y3_N22
\libera_produto~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \libera_produto~7_combout\ = (\seletor_produto[1]~input_o\ & (\seletor_produto[2]~input_o\ & (\estado_atual_fsm.FORNECER~q\ & \seletor_produto[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \seletor_produto[1]~input_o\,
	datab => \seletor_produto[2]~input_o\,
	datac => \estado_atual_fsm.FORNECER~q\,
	datad => \seletor_produto[0]~input_o\,
	combout => \libera_produto~7_combout\);

-- Location: LCCOMB_X27_Y2_N10
\WideOr2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr2~0_combout\ = (\estado_atual_fsm.DAR_TROCO~q\) # ((\estado_atual_fsm.ESPERAR~q\) # ((\estado_atual_fsm.SOMAR_50~q\) # (\estado_atual_fsm.FORNECER~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.DAR_TROCO~q\,
	datab => \estado_atual_fsm.ESPERAR~q\,
	datac => \estado_atual_fsm.SOMAR_50~q\,
	datad => \estado_atual_fsm.FORNECER~q\,
	combout => \WideOr2~0_combout\);

-- Location: LCCOMB_X27_Y2_N14
\WideOr1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = (\estado_atual_fsm.DAR_TROCO~q\) # ((\estado_atual_fsm.SOMAR_25~q\) # ((\estado_atual_fsm.SOMAR_50~q\) # (\estado_atual_fsm.VERIFICAR_TROCO~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.DAR_TROCO~q\,
	datab => \estado_atual_fsm.SOMAR_25~q\,
	datac => \estado_atual_fsm.SOMAR_50~q\,
	datad => \estado_atual_fsm.VERIFICAR_TROCO~q\,
	combout => \WideOr1~0_combout\);

-- Location: LCCOMB_X27_Y2_N28
\WideOr0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = (\estado_atual_fsm.SOMAR_100~q\) # ((\estado_atual_fsm.VERIFICAR_TROCO~q\) # ((\estado_atual_fsm.DAR_TROCO~q\) # (\estado_atual_fsm.FORNECER~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_atual_fsm.SOMAR_100~q\,
	datab => \estado_atual_fsm.VERIFICAR_TROCO~q\,
	datac => \estado_atual_fsm.DAR_TROCO~q\,
	datad => \estado_atual_fsm.FORNECER~q\,
	combout => \WideOr0~0_combout\);

ww_libera_produto(0) <= \libera_produto[0]~output_o\;

ww_libera_produto(1) <= \libera_produto[1]~output_o\;

ww_libera_produto(2) <= \libera_produto[2]~output_o\;

ww_libera_produto(3) <= \libera_produto[3]~output_o\;

ww_libera_produto(4) <= \libera_produto[4]~output_o\;

ww_libera_produto(5) <= \libera_produto[5]~output_o\;

ww_libera_produto(6) <= \libera_produto[6]~output_o\;

ww_libera_produto(7) <= \libera_produto[7]~output_o\;

ww_libera_moeda_troco <= \libera_moeda_troco~output_o\;

ww_monitor_estado(0) <= \monitor_estado[0]~output_o\;

ww_monitor_estado(1) <= \monitor_estado[1]~output_o\;

ww_monitor_estado(2) <= \monitor_estado[2]~output_o\;

ww_monitor_estado(3) <= \monitor_estado[3]~output_o\;

ww_monitor_estado(4) <= \monitor_estado[4]~output_o\;

ww_monitor_estado(5) <= \monitor_estado[5]~output_o\;

ww_monitor_estado(6) <= \monitor_estado[6]~output_o\;

ww_monitor_estado(7) <= \monitor_estado[7]~output_o\;

ww_monitor_estado(8) <= \monitor_estado[8]~output_o\;

ww_monitor_estado(9) <= \monitor_estado[9]~output_o\;

ww_monitor_estado(10) <= \monitor_estado[10]~output_o\;

ww_monitor_estado(11) <= \monitor_estado[11]~output_o\;

ww_monitor_estado(12) <= \monitor_estado[12]~output_o\;

ww_monitor_estado(13) <= \monitor_estado[13]~output_o\;

ww_monitor_estado(14) <= \monitor_estado[14]~output_o\;

ww_monitor_estado(15) <= \monitor_estado[15]~output_o\;

ww_monitor_estado(16) <= \monitor_estado[16]~output_o\;

ww_monitor_estado(17) <= \monitor_estado[17]~output_o\;

ww_monitor_estado(18) <= \monitor_estado[18]~output_o\;

ww_monitor_estado(19) <= \monitor_estado[19]~output_o\;

ww_monitor_estado(20) <= \monitor_estado[20]~output_o\;

ww_monitor_estado(21) <= \monitor_estado[21]~output_o\;

ww_monitor_estado(22) <= \monitor_estado[22]~output_o\;

ww_monitor_estado(23) <= \monitor_estado[23]~output_o\;

ww_monitor_estado(24) <= \monitor_estado[24]~output_o\;

ww_monitor_estado(25) <= \monitor_estado[25]~output_o\;

ww_monitor_estado(26) <= \monitor_estado[26]~output_o\;

ww_monitor_estado(27) <= \monitor_estado[27]~output_o\;

ww_monitor_estado(28) <= \monitor_estado[28]~output_o\;

ww_monitor_estado(29) <= \monitor_estado[29]~output_o\;

ww_monitor_estado(30) <= \monitor_estado[30]~output_o\;

ww_monitor_estado(31) <= \monitor_estado[31]~output_o\;

ww_monitor_total(0) <= \monitor_total[0]~output_o\;

ww_monitor_total(1) <= \monitor_total[1]~output_o\;

ww_monitor_total(2) <= \monitor_total[2]~output_o\;

ww_monitor_total(3) <= \monitor_total[3]~output_o\;

ww_monitor_total(4) <= \monitor_total[4]~output_o\;

ww_monitor_total(5) <= \monitor_total[5]~output_o\;

ww_monitor_total(6) <= \monitor_total[6]~output_o\;

ww_monitor_total(7) <= \monitor_total[7]~output_o\;

ww_monitor_total(8) <= \monitor_total[8]~output_o\;

ww_monitor_total(9) <= \monitor_total[9]~output_o\;

ww_monitor_total(10) <= \monitor_total[10]~output_o\;

ww_monitor_total(11) <= \monitor_total[11]~output_o\;

ww_monitor_total(12) <= \monitor_total[12]~output_o\;

ww_monitor_total(13) <= \monitor_total[13]~output_o\;

ww_monitor_total(14) <= \monitor_total[14]~output_o\;

ww_monitor_total(15) <= \monitor_total[15]~output_o\;

ww_monitor_total(16) <= \monitor_total[16]~output_o\;

ww_monitor_total(17) <= \monitor_total[17]~output_o\;

ww_monitor_total(18) <= \monitor_total[18]~output_o\;

ww_monitor_total(19) <= \monitor_total[19]~output_o\;

ww_monitor_total(20) <= \monitor_total[20]~output_o\;

ww_monitor_total(21) <= \monitor_total[21]~output_o\;

ww_monitor_total(22) <= \monitor_total[22]~output_o\;

ww_monitor_total(23) <= \monitor_total[23]~output_o\;

ww_monitor_total(24) <= \monitor_total[24]~output_o\;

ww_monitor_total(25) <= \monitor_total[25]~output_o\;

ww_monitor_total(26) <= \monitor_total[26]~output_o\;

ww_monitor_total(27) <= \monitor_total[27]~output_o\;

ww_monitor_total(28) <= \monitor_total[28]~output_o\;

ww_monitor_total(29) <= \monitor_total[29]~output_o\;

ww_monitor_total(30) <= \monitor_total[30]~output_o\;

ww_monitor_total(31) <= \monitor_total[31]~output_o\;
END structure;


