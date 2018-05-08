library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryIO is

   PORT(
        -- Sistema
        CLK_SLOW : IN  STD_LOGIC;
        CLK_FAST : IN  STD_LOGIC;
        RST      : IN  STD_LOGIC;

        -- RAM 16K
        ADDRESS		: IN  STD_LOGIC_VECTOR (14 DOWNTO 0);
        INPUT		: IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
        LOAD		: IN  STD_LOGIC ;
        OUTPUT		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

        -- LCD EXTERNAL I/OSP
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC;
        LCD_ON       : OUT   STD_LOGIC := '1';	-- liga e desliga o LCD
        LCD_INIT_OK  : OUT   STD_LOGIC;

        -- Switchs
        SW  : in std_logic_vector(9 downto 0);
        LED : OUT std_logic_vector(9 downto 0)

		);
end entity;



ARCHITECTURE logic OF MemoryIO IS

  component Screen is
      PORT(
          INPUT        : IN STD_LOGIC_VECTOR(15 downto 0);
          LOAD         : IN  STD_LOGIC;
          ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0);

          -- Sistema
          CLK_FAST : IN  STD_LOGIC;
          CLK_SLOW : IN  STD_LOGIC;
          RST 	   : IN  STD_LOGIC;

          -- LCD EXTERNAL I/OS
          LCD_INIT_OK  : OUT STD_LOGIC;
          LCD_CS_N     : OUT   STD_LOGIC;
          LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
          LCD_RD_N     : OUT   STD_LOGIC;
          LCD_RESET_N  : OUT   STD_LOGIC;
          LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
          LCD_WR_N     : OUT   STD_LOGIC
          );
  end component;

  component RAM16K IS
      PORT
      (
          address	: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
          clock		: IN STD_LOGIC  := '1';
          data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
          wren		: IN STD_LOGIC ;
          q		   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
      );
  end component;

  component Register16 IS
      PORT
      (
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(15 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component DMux4Way IS
      PORT
      (
              a:   in  STD_LOGIC;
              sel: in  STD_LOGIC_VECTOR(1 downto 0);
              q0:  out STD_LOGIC;
              q1:  out STD_LOGIC;
              q2:  out STD_LOGIC;
              q3:  out STD_LOGIC
      );
  end component;

  component Mux16 IS
      PORT
      (
              a:   in  STD_LOGIC_VECTOR(15 downto 0);
              b:   in  STD_LOGIC_VECTOR(15 downto 0);
              sel: in  STD_LOGIC;
              q: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;


signal sel2, loadRegister, loadScreen, loadRAM, load0 : STD_LOGIC;
signal s_LCD_CS_N, s_LCD_RD_N , s_LCD_RESET_N , s_LCD_RS , s_LCD_WR_N , s_LCD_INIT_OK : STD_LOGIC; 

signal sel1: STD_LOGIC_VECTOR(1 downto 0);

signal outputRAM, outLed, inputScreen, s_LCD_D, saidaMux, sw15: STD_LOGIC_VECTOR(15 downto 0);


--signal adressScreen : STD_LOGIC_VECTOR(13 downto 0);


BEGIN

sel1 <= "00" when(ADDRESS = "011111111111111") 
        else "01" when (ADDRESS = "101001010111111")
        else "10" when (ADDRESS = "101001011000000")
        else "11";
sel2 <= '1' when(ADDRESS = "011111111111111")
        else '0';

DMux: DMux4Way PORT MAP (LOAD, sel1, loadRAM, loadRegister, loadScreen, load0);

RAM: RAM16K PORT MAP (ADDRESS(13 downto 0),CLK_FAST,INPUT(15 downto 0),loadRAM, outputRAM);

sw15 <= "000000" & SW;

Mux: Mux16 PORT MAP (sw15, outputRAM , sel2, saidaMux);

R16: Register16 PORT MAP (CLK_SLOW,INPUT(15 downto 0), loadRegister, outLed);
--adressScreen <= ADDRESS(13 downto 0);
--inputScreen <= INPUT(15 downto 0);
S: Screen PORT MAP (INPUT(15 downto 0),loadScreen,ADDRESS(13 downto 0), CLK_FAST, CLK_SLOW, RST, 
  s_LCD_INIT_OK, 
  s_LCD_CS_N , 
  s_LCD_D, 
  s_LCD_RD_N , 
  s_LCD_RESET_N , 
  s_LCD_RS , 
  s_LCD_WR_N);



LCD_CS_N    <= s_LCD_CS_N;
LCD_D       <= s_LCD_D;
LCD_RD_N    <= s_LCD_RD_N;
LCD_RESET_N <= s_LCD_RESET_N;
LCD_RS      <= s_LCD_RS;
LCD_WR_N    <= s_LCD_WR_N;
LCD_INIT_OK <= s_LCD_INIT_OK;
LCD_ON <= '1';


LED <= outLed(9 downto 0);
OUTPUT <= saidaMux;


END logic;
