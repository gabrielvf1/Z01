library IEEE;
use IEEE.Slibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Not16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end Not16;

architecture rtl of not16_z01 is
begin
   q <=  not (a);
end rtl;
