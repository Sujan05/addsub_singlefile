----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2018 01:38:52 PM
-- Design Name: 
-- Module Name: addition - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addition is
  Port (a, b: in STD_LOGIC_VECTOR(3 downto 0);
        --b: in STD_LOGIC_VECTOR(3 downto 0);
        --sel: in STD_LOGIC;
        output: out STD_LOGIC_VECTOR(3 downto 0) );
end addition;

architecture Behavioral of addition is
    --signal fourbitin: STD_LOGIC_VECTOR(3 downto 0);
begin
    --fourbitin <= a;
    --p1: process(a, b)
    --begin
    --if a > "1100" then
      --  output <= "0000";
    --else
        output <= a + b;
    --end if;
    --end process;
    --output <= fourbitout;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity subtraction is
  Port (a, b: in STD_LOGIC_VECTOR(3 downto 0);
        output: out STD_LOGIC_VECTOR(3 downto 0) );
end subtraction;

architecture Behavioral of subtraction is
begin
    output <= a - b;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity addsub is
  Port (a, b: in STD_LOGIC_VECTOR(3 downto 0);
        sel: in STD_LOGIC;
        output: out STD_LOGIC_VECTOR(3 downto 0) );
end addsub;

architecture Behavioral of addsub is
    signal add_result, sub_result: STD_LOGIC_VECTOR(3 downto 0);
    component addition 
        port(a, b: in STD_LOGIC_VECTOR(3 downto 0);
             output: out STD_LOGIC_VECTOR(3 downto 0) );
    end component;
    component subtraction 
            port(a, b: in STD_LOGIC_VECTOR(3 downto 0);
                 output: out STD_LOGIC_VECTOR(3 downto 0) );
    end component;
begin
    add: addition port map(a, b, add_result);
    sub: subtraction port map(a, b, sub_result);
    p1: process(sel)
        begin
            if sel = '1' then
              output <= add_result;
            else
              output <= sub_result;
            end if;
        end process;
end Behavioral;
