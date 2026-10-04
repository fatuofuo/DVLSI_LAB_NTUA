----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2025 13:03:20
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



entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is

component full_adder 
        port( A,B,Cin: in std_logic;
             Cout,sum: out std_logic);
end component;
signal A_tb: std_logic;
signal B_tb: std_logic;
signal Cin_tb:std_logic;
signal Cout_tb:std_logic;
signal sum_tb:std_logic;

begin
DUT: full_adder port map(A_tb, B_tb, Cin_tb, Cout_tb, Sum_tb);
stimulus:process
begin
    A_tb<='0';
    B_tb<='0';
    Cin_tb<='0';
    wait for 20ns;
    
    A_tb<='0';
    B_tb<='0';
    Cin_tb<='1';
    wait for 20ns;
    
    A_tb<='0';
    B_tb<='1';
    Cin_tb<='0';
    wait for 20ns;
    
    A_tb<='0';
    B_tb<='1';
    Cin_tb<='1';
    wait for 20ns;
    
    A_tb<='1';
    B_tb<='0';
    Cin_tb<='0';
    wait for 20ns;
    
    A_tb<='1';
    B_tb<='0';
    Cin_tb<='1';
    wait for 20ns;
    
    A_tb<='1';
    B_tb<='1';
    Cin_tb<='0';
    wait for 20ns;
    
    A_tb<='1';
    B_tb<='1';
    Cin_tb<='1';
    wait for 20ns;
    

 end process;
end Behavioral;
