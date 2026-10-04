----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2025 20:00:52
-- Design Name: 
-- Module Name: MAU - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MAC is
    Port (
        enable    : in std_logic;
        clk       : in  std_logic;
        mac_init  : in  std_logic;
        rom_out   : in  std_logic_vector(7 downto 0):= (others => '0');
        ram_out   : in  std_logic_vector(7 downto 0):= (others => '0');
        mac_out   : out std_logic_vector(19 downto 0)
    );
end MAC;

architecture Behavioral of MAC is
    signal acc : std_logic_vector(19 downto 0) := (others => '0');
begin
    process(clk,enable)
    begin
    if enable='1' then 
        if rising_edge(clk) then
            if mac_init = '1' then
                acc <= (others => '0');
            else
                acc <= acc + (rom_out * ram_out);
            end if;
        end if;
     else 
            acc <=acc;
     end if;
end process;

    mac_out <= acc;
end Behavioral;

