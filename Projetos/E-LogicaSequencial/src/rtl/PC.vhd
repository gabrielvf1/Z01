-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

component Inc16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

component Register16 is
    port(
      clock:   in std_logic;
      input:   in STD_LOGIC_VECTOR(15 downto 0);
      load:    in std_logic;
      output: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

signal inc: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal outp : STD_LOGIC_VECTOR(15 downto 0)  := (others => '0');
signal inputR: STD_LOGIC_VECTOR(15 downto 0)  := (others => '0');
signal loadR: STD_LOGIC := '0';

begin
bitincrementer: Inc16 Port Map(outp,inc);
registrador: Register16 Port Map(clock,inputR,loadR,outp);

	process(reset,increment,load, input, inc, inputR)
	begin
		if(reset = '1') then
			loadR <= '1';
			inputR <= "0000000000000000";
		else 
			if (load = '1') then 
				loadR <= '1';
				inputR <= input;

			elsif (increment = '1') then
				loadR <= '1';
				inputR <= inc;
			else
				loadR <= '0';
				inputR <= inputR;
			end if;
		end if; 
	output <= outp;
	end process;
end architecture;