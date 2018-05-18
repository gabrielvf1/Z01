-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/16/2018 17:58:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MemoryIO
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MemoryIO_vhd_vec_tst IS
END MemoryIO_vhd_vec_tst;
ARCHITECTURE MemoryIO_arch OF MemoryIO_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ADDRESS : STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL CLK_FAST : STD_LOGIC;
SIGNAL CLK_SLOW : STD_LOGIC;
SIGNAL INPUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL LCD_CS_N : STD_LOGIC;
SIGNAL LCD_D : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL LCD_INIT_OK : STD_LOGIC;
SIGNAL LCD_ON : STD_LOGIC;
SIGNAL LCD_RD_N : STD_LOGIC;
SIGNAL LCD_RESET_N : STD_LOGIC;
SIGNAL LCD_RS : STD_LOGIC;
SIGNAL LCD_WR_N : STD_LOGIC;
SIGNAL LED : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL LOAD : STD_LOGIC;
SIGNAL OUTPUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RST : STD_LOGIC;
SIGNAL selOut1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL selOut2 : STD_LOGIC;
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT MemoryIO
	PORT (
	ADDRESS : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
	CLK_FAST : IN STD_LOGIC;
	CLK_SLOW : IN STD_LOGIC;
	INPUT : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	LCD_CS_N : OUT STD_LOGIC;
	LCD_D : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	LCD_INIT_OK : OUT STD_LOGIC;
	LCD_ON : OUT STD_LOGIC;
	LCD_RD_N : OUT STD_LOGIC;
	LCD_RESET_N : OUT STD_LOGIC;
	LCD_RS : OUT STD_LOGIC;
	LCD_WR_N : OUT STD_LOGIC;
	LED : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	LOAD : IN STD_LOGIC;
	OUTPUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	RST : IN STD_LOGIC;
	selOut1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	selOut2 : OUT STD_LOGIC;
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : MemoryIO
	PORT MAP (
-- list connections between master ports and signals
	ADDRESS => ADDRESS,
	CLK_FAST => CLK_FAST,
	CLK_SLOW => CLK_SLOW,
	INPUT => INPUT,
	LCD_CS_N => LCD_CS_N,
	LCD_D => LCD_D,
	LCD_INIT_OK => LCD_INIT_OK,
	LCD_ON => LCD_ON,
	LCD_RD_N => LCD_RD_N,
	LCD_RESET_N => LCD_RESET_N,
	LCD_RS => LCD_RS,
	LCD_WR_N => LCD_WR_N,
	LED => LED,
	LOAD => LOAD,
	OUTPUT => OUTPUT,
	RST => RST,
	selOut1 => selOut1,
	selOut2 => selOut2,
	SW => SW
	);
-- ADDRESS[14]
t_prcs_ADDRESS_14: PROCESS
BEGIN
	ADDRESS(14) <= '1';
	WAIT FOR 450000 ps;
	ADDRESS(14) <= '0';
WAIT;
END PROCESS t_prcs_ADDRESS_14;
-- ADDRESS[13]
t_prcs_ADDRESS_13: PROCESS
BEGIN
	ADDRESS(13) <= '0';
	WAIT FOR 450000 ps;
	ADDRESS(13) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_13;
-- ADDRESS[12]
t_prcs_ADDRESS_12: PROCESS
BEGIN
	ADDRESS(12) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_12;
-- ADDRESS[11]
t_prcs_ADDRESS_11: PROCESS
BEGIN
	ADDRESS(11) <= '0';
	WAIT FOR 450000 ps;
	ADDRESS(11) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_11;
-- ADDRESS[10]
t_prcs_ADDRESS_10: PROCESS
BEGIN
	ADDRESS(10) <= '0';
	WAIT FOR 450000 ps;
	ADDRESS(10) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_10;
-- ADDRESS[9]
t_prcs_ADDRESS_9: PROCESS
BEGIN
	ADDRESS(9) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_9;
-- ADDRESS[8]
t_prcs_ADDRESS_8: PROCESS
BEGIN
	ADDRESS(8) <= '0';
	WAIT FOR 450000 ps;
	ADDRESS(8) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_8;
-- ADDRESS[7]
t_prcs_ADDRESS_7: PROCESS
BEGIN
	ADDRESS(7) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_7;
-- ADDRESS[6]
t_prcs_ADDRESS_6: PROCESS
BEGIN
	ADDRESS(6) <= '0';
	WAIT FOR 450000 ps;
	ADDRESS(6) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_6;
-- ADDRESS[5]
t_prcs_ADDRESS_5: PROCESS
BEGIN
	ADDRESS(5) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_5;
-- ADDRESS[4]
t_prcs_ADDRESS_4: PROCESS
BEGIN
	ADDRESS(4) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_4;
-- ADDRESS[3]
t_prcs_ADDRESS_3: PROCESS
BEGIN
	ADDRESS(3) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_3;
-- ADDRESS[2]
t_prcs_ADDRESS_2: PROCESS
BEGIN
	ADDRESS(2) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_2;
-- ADDRESS[1]
t_prcs_ADDRESS_1: PROCESS
BEGIN
	ADDRESS(1) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_1;
-- ADDRESS[0]
t_prcs_ADDRESS_0: PROCESS
BEGIN
	ADDRESS(0) <= '1';
WAIT;
END PROCESS t_prcs_ADDRESS_0;

-- LOAD
t_prcs_LOAD: PROCESS
BEGIN
	LOAD <= '1';
WAIT;
END PROCESS t_prcs_LOAD;
END MemoryIO_arch;
