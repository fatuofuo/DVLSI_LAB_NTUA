----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 16:48:28
-- Design Name: 
-- Module Name: parallel_adder_tb - Behavioral
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

entity parallel_adder_tb is
--  Port ( );
end parallel_adder_tb;

architecture Behavioral of parallel_adder_tb is
component parallel_adder is
 Port (Ain: in std_logic_vector(3 downto 0);
       Bin: in std_logic_vector(3 downto 0);
       Cin: in std_logic;
       Coutt:out std_logic;
       sum: out std_logic_vector(3 downto 0));
 end component;
 signal Ain_tb:std_logic_vector(3 downto 0);
 signal Bin_tb:std_logic_vector(3 downto 0);
 signal Cin_tb: std_logic;
 signal Coutt_tb:std_logic;
 signal sum_tb:std_logic_vector(3 downto 0);
begin
DUT: parallel_adder port map(Ain_tb, Bin_tb,Cin_tb,Coutt_tb,sum_tb);
stimulus:process
begin 
Ain_tb<="0101";
Bin_tb<="1010";
Cin_tb<='0';
wait for 10ns;

Ain_tb<="1101";
Bin_tb<="1010";
Cin_tb<='0';
wait for 10ns;



end process;
end Behavioral;
