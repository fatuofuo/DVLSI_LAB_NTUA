----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 19:14:20
-- Design Name: 
-- Module Name: bcd_tb - Behavioral
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

entity bcd_tb is
--  Port ( );
end bcd_tb;

architecture Behavioral of bcd_tb is
component BCD_4bit is
    Port ( Ainbcd : in STD_LOGIC_VECTOR (3 downto 0);
           Binbcd : in STD_LOGIC_VECTOR (3 downto 0);
           Cinbcd : in STD_LOGIC;
           Coutbcd : out std_logic;
           sumbcd : out STD_LOGIC_VECTOR (3 downto 0));
 end component;

signal Ainbcd_tb: std_logic_vector(3 downto 0);
signal Binbcd_tb :STD_LOGIC_VECTOR (3 downto 0);
signal Cinbcd_tb :STD_LOGIC;
signal coutbcd_tb:std_logic;
signal sumbcd_tb:std_logic_vector(3 downto 0);


begin
DUT: BCD_4bit port map(Ainbcd_tb,Binbcd_tb,Cinbcd_tb,coutbcd_tb,sumbcd_tb);
stimulus:process
begin
Ainbcd_tb <= "1001";
Binbcd_tb <= "0110";
cinbcd_tb <= '0';
wait for 10ns;

Ainbcd_tb <= "1001";
Binbcd_tb <= "0100";
cinbcd_tb <= '0';
wait for 10ns;

Ainbcd_tb <= "1001";
Binbcd_tb <= "1000";
cinbcd_tb <= '0';
wait for 10ns;



end process;
end Behavioral;
