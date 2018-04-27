library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

<<<<<<< HEAD
entity and16 is
=======
entity And16 is
>>>>>>> upstream/master
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
<<<<<<< HEAD
end and16;

architecture rtl of and16 is
begin 
	q <= (a and b);
end rtl;
=======
end entity;
>>>>>>> upstream/master
