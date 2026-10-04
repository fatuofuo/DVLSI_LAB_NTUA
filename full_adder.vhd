----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 16:05:08
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
component HA_dataflow is
Port ( A: in std_logic;
        B: in std_logic; 
        S: out std_logic;
        C: out std_logic  
      );
 end component;
signal s1: std_logic;
signal c1: std_logic;
signal c2: std_logic;
begin
HA1: HA_dataflow port map(A => A, B => B, S=>s1, c=>c1); 
HA2: HA_dataflow port map(A => s1, B => cin, S=>sum, c=>c2); 
cout<=c1 or c2;


end Behavioral;
