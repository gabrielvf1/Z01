-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017

-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(15 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre instrução e ALU para reg. A
		muxAM_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S e reg. D
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A, reg. D,
                                                                     -- Mem. RAM e Program Counter
    );
end entity;

signal porta_in : STD_LOGIC;

architecture arch of ControlUnit is
begin

zx <= instruction(15) and instruction(12); 
nx <= instruction(15) and instruction(11);
zy <= instruction(15) and instruction(10);
ny <= instruction(15) and instruction(9);
f  <= instruction(15) and instruction(8);
no <= instruction(15) and instruction(7);

muxALUI_A <= not instruction(15);
muxAM_ALUz	<= instruction(13);
muxSD_ALUx	<= instruction(14);

LoadA <= instruction(15) or instruction(6);
loadD <= not instruction(14);
loadS <= instruction(13);
loadM <= instruction(3);

loadPC <= (instruction(2) and ng) or (instruction(1) and zr) or (instruction(0) and not(ng) and not(zr)) or (instruction(0) and instruction(1) and instruction(2));


--loadPC <= (instruction(2) and ng);
--loadPC <= instruction(1) and zr;
--loadPC <= instruction(0) and not(ng) and not(zr);
--loadPC <= instruction(0) and instruction(1) and instruction(2);

end architecture;
