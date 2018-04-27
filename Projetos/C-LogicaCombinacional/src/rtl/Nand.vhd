Library ieee;
use ieee.std_logic_1164.all;

<<<<<<< HEAD
entity nand_vhdl is
=======
entity nand_z01 is
>>>>>>> upstream/master
   port(
          a : in  std_logic;
	      b : in  std_logic;
	      q : out std_logic
   );
end entity;

<<<<<<< HEAD
architecture rtl of nand_vhdl is
=======
architecture rtl of nand_z01 is
>>>>>>> upstream/master
begin
   q <=  not (a and b);
end rtl;
