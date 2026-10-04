----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 16:18:35
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is
component full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
 end component;
 
  signal A_tb :  STD_LOGIC;
  signal B_tb : STD_LOGIC;
  signal Cin_tb :  STD_LOGIC;
  signal Cout_tb :STD_LOGIC;
  signal Sum_tb :  STD_LOGIC;
begin
DUT :full_adder port map(A_tb,B_tb,Cin_tb,Cout_tb,sum_tb);
stimulus:process
begin
A_tb<='0';
B_tb<='0';
Cin_tb<='0';
wait for 10ns;

A_tb<='0';
B_tb<='0';
Cin_tb<='1';
wait for 10ns;

A_tb<='0';
B_tb<='1';
Cin_tb<='0';
wait for 10ns;

A_tb<='0';
B_tb<='1';
Cin_tb<='1';
wait for 10ns;

A_tb<='1';
B_tb<='0';
Cin_tb<='0';
wait for 10ns;

A_tb<='1';
B_tb<='0';
Cin_tb<='1';
wait for 10ns;

A_tb<='1';
B_tb<='1';
Cin_tb<='0';
wait for 10ns;

A_tb<='1';
B_tb<='1';
Cin_tb<='1';
wait for 10ns;


end process;
end Behavioral;
