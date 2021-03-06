library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
end Mux2Way;

architecture rtl of Mux2Way is
begin 
	q <= a when sel='0'
         else b;
end rtl;
