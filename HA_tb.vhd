----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 13:20:50
-- Design Name: 
-- Module Name: HA_tb - Behavioral
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

entity HA_tb is
--  Port ( );
end HA_tb;

architecture Behavioral of HA_tb is
component HA_dataflow is
    port ( A: in std_logic;
           B: in std_logic;
           S: out std_logic;
           C: out std_logic
    );
end component;
signal A_tb: std_logic;
signal B_tb: std_logic;
signal S_tb: std_logic;
signal C_tb: std_logic;
begin
 DUT: HA_dataflow port map (A_tb, B_tb, S_tb, C_tb);
process
begin
A_tb<='0';
B_tb<='0';
wait for 10ns;

A_tb<='0';
B_tb<='1';
wait for 10ns;

A_tb<='1';
B_tb<='0';
wait for 10ns;

A_tb<='1';
B_tb<='1';
wait for 10ns;


end process;
end Behavioral;
