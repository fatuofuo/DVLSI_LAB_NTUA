----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 17:54:45
-- Design Name: 
-- Module Name: BCD_4bit - Behavioral
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


entity BCD_4bit is
    Port ( Ainbcd : in STD_LOGIC_VECTOR (3 downto 0);
           Binbcd : in STD_LOGIC_VECTOR (3 downto 0);
           Cinbcd : in STD_LOGIC;
           Coutbcd : out std_logic;
           sumbcd : out STD_LOGIC_VECTOR (3 downto 0));
end BCD_4bit;

architecture structural of BCD_4bit is

component parallel_adder is
 Port (Ain: in std_logic_vector(3 downto 0);
       Bin: in std_logic_vector(3 downto 0);
       Cin: in std_logic;
       Coutt:out std_logic;
       sum: out std_logic_vector(3 downto 0));
  end component;
  
    signal s1, s2: std_logic_vector(3 downto 0);
    signal c1, c2, c3, check, finalcheck, Cin1: std_logic;
    signal digits: std_logic_vector(3 downto 0);  

begin
    PA: parallel_adder port map (Ain => Ainbcd, Bin => Binbcd, Cin => Cinbcd, sum => s1, coutt => c3);

    check <= '1' when s1 > "1001" else '0';

    
    digits <= "0110" when finalcheck = '1' else "0000";

    
    Cin1 <= '0';

    PA1: parallel_adder port map (Ain => s1, Bin => digits, Cin => Cin1, sum => s2, coutt => Coutbcd);

    sumbcd <= s2;
end structural;
