----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 13:00:44
-- Design Name: 
-- Module Name: HA_dataflow - dataflow
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

entity HA_dataflow is
 Port ( A: in std_logic;
        B: in std_logic; 
        S: out std_logic;
        C: out std_logic  
      );
end HA_dataflow;
architecture dataflow of HA_dataflow is

begin
S<= A xor B;
C<= A and B;


end dataflow;
