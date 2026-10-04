----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 16:30:54
-- Design Name: 
-- Module Name: parallel_adder - Behavioral
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

entity parallel_adder is
 Port (Ain: in std_logic_vector(3 downto 0);
       Bin: in std_logic_vector(3 downto 0);
       Cin: in std_logic;
       Coutt:out std_logic;
       sum: out std_logic_vector(3 downto 0));
end parallel_adder;



architecture structural of parallel_adder is
signal cout_int: std_logic_vector(2 downto 0);
component full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
end component;

begin
FA1: full_adder port map(A => Ain(0), B => Bin(0), Cin => Cin, sum => sum(0), Cout => cout_int(0));
FA2: full_adder port map(A => Ain(1), B => Bin(1), Cin => cout_int(0), sum => sum(1), Cout => cout_int(1));
FA3: full_adder port map(A => Ain(2), B => Bin(2), Cin => cout_int(1), sum => sum(2), Cout => cout_int(2));
FA4: Full_adder port map(A => Ain(3), B => Bin(3), Cin => cout_int(2), sum => sum(3),cout=>coutt);

end structural;
