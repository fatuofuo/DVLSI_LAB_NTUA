----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 22:32:24
-- Design Name: 
-- Module Name: bcd_final_tb - Behavioral
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

entity bcd_final_tb is
--  Port ( );
end bcd_final_tb;

architecture Behavioral of bcd_final_tb is
    component bcd4dig is
        Port ( Ain: in std_logic_vector(15 downto 0);
               Bin: in std_logic_vector(15 downto 0);
               cin: in std_logic;
               cout: out std_logic;
               sum: out std_logic_vector(15 downto 0));
    end component;

    signal Ain_tb:  std_logic_vector(15 downto 0);
    signal Bin_tb:  std_logic_vector(15 downto 0);
    signal cin_tb:  std_logic;
    signal cout_tb: std_logic;
    signal sum_tb: std_logic_vector(15 downto 0);

begin
    DUT: bcd4dig port map (
        Ain => Ain_tb, 
        Bin => Bin_tb, 
        cin => cin_tb, 
        cout => cout_tb, 
        sum => sum_tb
    );
  stimulus:process
  begin
  Ain_tb <= "0000000000001010";  
        Bin_tb <= "0000000000000101"; 
        cin_tb <= '0';

        
        wait for 10 ns;
        Ain_tb <= "0101010101010101";  
        Bin_tb <= "0011001100110011";  
        cin_tb <= '0';

       
        wait for 10 ns;

        
        wait;
    end process;
end Behavioral;
