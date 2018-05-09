-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: CPU.vhd
-- date: 4/4/2017

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CPU is
  port(
    clock:       in  STD_LOGIC;                        -- sinal de clock para CPU
    reset:       in  STD_LOGIC;                        -- reinicia toda a CPU (inclusive o Program Counter)
    inM:         in  STD_LOGIC_VECTOR(15 downto 0);    -- dados lidos da memória RAM
    instruction: in  STD_LOGIC_VECTOR(15 downto 0);    -- instrução (dados) vindos da memória ROM
    outM:        out STD_LOGIC_VECTOR(15 downto 0);    -- dados para gravar na memória RAM
    writeM:      out STD_LOGIC;                        -- faz a memória RAM gravar dados da entrada
    addressM:    out STD_LOGIC_VECTOR(14 downto 0);    -- envia endereço para a memória RAM
    pcout:       out STD_LOGIC_VECTOR(14 downto 0)     -- endereço para ser enviado a memória ROM
    );
end entity;

architecture arch of CPU is

  component Mux16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      b:   in  STD_LOGIC_VECTOR(15 downto 0);
      sel: in  STD_LOGIC;
      q:   out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ALU is
    port (
      x,y:   in STD_LOGIC_VECTOR(15 downto 0);
      zx:    in STD_LOGIC;
      nx:    in STD_LOGIC;
      zy:    in STD_LOGIC;
      ny:    in STD_LOGIC;
      f:     in STD_LOGIC;
      no:    in STD_LOGIC;
      zr:    out STD_LOGIC;
      ng:    out STD_LOGIC;
      saida: out STD_LOGIC_VECTOR(15 downto 0)
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

  component pc is
    port(
      clock     : in  STD_LOGIC;
      increment : in  STD_LOGIC;
      load      : in  STD_LOGIC;
      reset     : in  STD_LOGIC;
      input     : in  STD_LOGIC_VECTOR(15 downto 0);
      output    : out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ControlUnit is
    port(
      instruction                 : in STD_LOGIC_VECTOR(15 downto 0);
      zr,ng                       : in STD_LOGIC;
      muxALUI_A                   : out STD_LOGIC;
      muxAM_ALU                   : out STD_LOGIC;
      muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S
      zx, nx, zy, ny, f, no       : out STD_LOGIC;
      loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC
      );
  end component;

  signal s_muxALUI_A: STD_LOGIC;
  signal s_muxAM_ALU: STD_LOGIC;
  signal s_muxSD_ALU: STD_LOGIC;
  signal s_zx: STD_LOGIC;
  signal s_nx: STD_LOGIC;
  signal s_zy: STD_LOGIC;
  signal s_ny: STD_LOGIC;
  signal s_f: STD_LOGIC;
  signal s_no: STD_LOGIC;
  signal s_loadA: STD_LOGIC;
  signal s_loadD: STD_LOGIC;
  signal s_loadS: STD_LOGIC;
  signal s_loadPC: STD_LOGIC;
  signal s_loadM: STD_LOGIC;
  signal s_zr: std_logic := '0';
  signal s_ng: std_logic := '0';
  signal s_muxALUI_Aout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxAM_ALUout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxSDout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regAout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regDout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regSout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_ALUout: STD_LOGIC_VECTOR(15 downto 0);

  signal s_pcout: STD_LOGIC_VECTOR(15 downto 0);

begin

con_unit : ControlUnit port map (instruction,s_zr,s_ng,s_muxALUI_A,s_muxAM_ALU,s_muxSD_ALU,s_zx,s_nx,s_zy,s_ny,s_f,s_no,s_loadA,s_loadD,s_loadS,s_loadM,s_loadPC);

muxAlui : Mux16 port map(s_ALUout,instruction,s_muxALUI_A,s_muxALUI_Aout);

reg_a : Register16 port map(clock,s_muxALUI_Aout,s_loadA,s_regAout);

mux_am : Mux16 port map(s_regAout,inM,s_muxAM_ALU,s_muxAM_ALUout);


reg_s : Register16 port map(clock,s_ALUout,s_loadS,s_regSout);
reg_d : Register16 port map(clock,s_ALUout,s_loadD,s_regDout);
mux_sd : Mux16 port map(s_regSout,s_regDout,s_muxSD_ALU,s_muxSDout);


alu_port : ALU port map(s_muxAM_ALUout,s_muxSDout,s_zx,s_nx,s_zy,s_ny,s_f,s_no,s_zr,s_ng,s_ALUout);

pc_port : pc port map (clock,'1',s_loadPC,reset,s_regAout,s_pcout);

outM  <= s_ALUout;
pcout <= s_pcout(14 downto 0);
writeM <= s_loadM;
addressM <= s_regAout(14 downto 0);




end architecture;
