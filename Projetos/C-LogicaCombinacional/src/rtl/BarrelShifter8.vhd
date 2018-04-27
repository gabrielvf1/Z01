library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter8 is
<<<<<<< HEAD
  port ( 
      a:    in  STD_LOGIC_VECTOR(7 downto 0);   -- input vector
      dir:  in  std_logic;                       -- 0=>left 1=>right
      size: in  STD_LOGIC_VECTOR(2 downto 0);    -- shift amount
      q:    out STD_LOGIC_VECTOR(7 downto 0));  -- output vector (shifted)
=======
	port ( 
			a:    in  STD_LOGIC_VECTOR(7 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  STD_LOGIC_VECTOR(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(7 downto 0));  -- output vector (shifted)
>>>>>>> upstream/master
end entity;