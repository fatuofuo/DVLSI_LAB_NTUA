----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2025 23:37:38
-- Design Name: 
-- Module Name: shift_reg_tb - Behavioral
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

entity shift_reg_tb is
--  Port ( );
end shift_reg_tb;

architecture Behavioral of shift_reg_tb is
component shift_register Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           si : in STD_LOGIC;
           en : in std_logic;
           pl : in STD_LOGIC;
           choose : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (3 downto 0);
           so : out STD_LOGIC);
end component;
signal clk_tb: std_logic;
signal rst_tb: std_logic;
signal si_tb: std_logic;
signal en_tb: std_logic;
signal pl_tb: std_logic;
signal choose_tb: std_logic;
signal din_tb: std_logic_vector(3 downto 0);
signal so_tb: std_logic;

begin
DUT: shift_register port map (clk_tb,rst_tb,si_tb,en_tb,pl_tb,choose_tb,din_tb,so_tb);
stimulus:process
begin
rst_tb <= '1';
en_tb <= '0';
si_tb <= '0';
pl_tb <= '1';
choose_tb <= '0';
din_tb <= "0101";
wait for 10ns;

pl_tb <= '0';
choose_tb <= '0';
si_tb <= '1';
en_tb <= '1';
wait for 10ns;

si_tb <= '0';
wait for 40ns;

pl_tb <= '0';
choose_tb <= '1'; 
si_tb <= '1';
en_tb <= '1';
wait for 40ns;

rst_tb <= '0';
choose_tb <= '0'; 
si_tb <= '0';
wait for 10ns;

rst_tb <= '1';
en_tb <= '0';
si_tb <= '0';
pl_tb <= '1';
choose_tb <= '0';
din_tb <= "0001";
wait for 10ns;
pl_tb <= '0';
wait for 20ns;
en_tb <='1';
wait for 20ns;

end process;
 generate_clock:process
 begin
    clk_tb<='0';
    wait for 5ns;
    clk_tb<='1';
    wait for 5ns;
  end process;

end Behavioral;
