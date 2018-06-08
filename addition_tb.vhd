library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity tb_addsub is
end tb_addsub;

architecture test of tb_addsub is
--component declaration
  component addsub
    port(
      a: in STD_LOGIC_VECTOR(3 downto 0);
      b: in STD_LOGIC_VECTOR(3 downto 0);
      sel: in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(3 downto 0)
  );
  end component;

--inputs
  signal a: STD_LOGIC_VECTOR(3 downto 0);
  signal b: STD_LOGIC_VECTOR(3 downto 0);
  signal sel: STD_LOGIC;

--outputs
  signal output: STD_LOGIC_VECTOR(3 downto 0);

--clock definition
  constant clk_period: time:= 10 us;

begin
--instantiate Unit Under Test(UUT)
    uut: addsub
    port map(
      a => a,
      b => b,
      sel => sel,
      output => output
    );
--stimulus process definition
   stim_process: process
   begin
     a <= "XXXX";
     b <= "XXXX";
     sel <= 'X';
     wait for 50 us;
     a <= "0000";
     b <= "0000";
     sel <= '0';
     wait for 50 us;
     a <= "0010";
     b <= "0101";
     sel <= '1';
     wait for clk_period;
     a <= "0111";
     b <= "0101";
     sel <= '1';
     wait for clk_period;
     a <= "0100";
     b <= "0110";
     sel <= '0';
     wait for clk_period;
     a <= "1011";
     b <= "0101";
     sel <= '0';
     wait for clk_period;
     assert false report "Reached End of test";
     wait;
   end process;
end architecture test;
