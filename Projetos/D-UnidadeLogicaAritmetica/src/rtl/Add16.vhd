-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is

component FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end component;

begin
	add0: FullAdder PORT MAP ( a(0)  , b(0), q(0));
    add1: FullAdder PORT MAP ( a(1)  , b(1), q(1));
    add2: FullAdder PORT MAP ( a(2)  , b(2), q(2));
    add3: FullAdder PORT MAP ( a(3)  , b(3), q(3));
    add4: FullAdder PORT MAP ( a(4)  , b(4), q(4));
    add5: FullAdder PORT MAP ( a(5) , b(5), q(5));
    add6: FullAdder PORT MAP ( a(6) , b(6), q(6));
    add7: FullAdder PORT MAP ( a(7) , b(7), q(7));
    add8: FullAdder PORT MAP ( a(8)  , b(8)  , q(8));
    add9: FullAdder PORT MAP ( a(9)  , b(9)  , q(9));
    add10: FullAdder PORT MAP ( a(10)  , b(10)  , q(10));
    add11: FullAdder PORT MAP ( a(11)  , b(11)  , q(11));
    add12: FullAdder PORT MAP ( a(12) , b(12), q(12));
    add13: FullAdder PORT MAP ( a(13) , b(13), q(13));
    add14: FullAdder PORT MAP ( a(14) , b(14), q(14));
    add15: FullAdder PORT MAP ( a(15), b(15), q(15));
 
end architecture;
