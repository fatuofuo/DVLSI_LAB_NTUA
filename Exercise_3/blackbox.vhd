----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2025 17:29:29
-- Design Name: 
-- Module Name: blackbox - Behavioral
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


entity blackbox is
  Port ( Abb:in std_logic_vector(3 downto 0);
         Bbb:in std_logic;
         Cinbb:in std_logic_vector(3 downto 0);
         inFA: in std_logic_vector(3 downto 0);
         Coutbb:out std_logic_vector(3 downto 0);
         factor:out std_logic_vector(3 downto 0));
end blackbox;

architecture Behavioral of blackbox is

component full_adder1
  Port ( A: in std_logic;
         B: in std_logic;
         Cin: in std_logic;
         Sum: out std_logic;
         Cout: out std_logic);
end component;

signal andd:std_logic_vector(3 downto 0);

begin
andd(0)<= Abb(0) and Bbb;
andd(1)<= Abb(1) and Bbb;
andd(2)<= Abb(2) and Bbb;
andd(3)<= Abb(3) and Bbb;
FA1: full_adder1 port map(andd(0),inFA(0),Cinbb(0),factor(0),coutbb(0));
FA2: full_adder1 port map(andd(1),inFA(1),Cinbb(1),factor(1),coutbb(1));
FA3: full_adder1 port map(andd(2),inFA(2),Cinbb(2),factor(2),coutbb(2));
FA4: full_adder1 port map(andd(3),inFA(3),Cinbb(3),factor(3),coutbb(3));

end Behavioral;
