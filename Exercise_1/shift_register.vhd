----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2025 23:24:44
-- Design Name: 
-- Module Name: shift_register - Behavioral
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


entity shift_register is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           si : in STD_LOGIC;
           en : in std_logic;
           pl : in STD_LOGIC;
           choose : in STD_LOGIC;
           din : in STD_LOGIC_VECTOR (3 downto 0);
           so : out STD_LOGIC);
end shift_register;

architecture Behavioral of shift_register is
signal dff: std_logic_vector(3 downto 0);
begin
edge: process (clk, rst)
begin
    if rst = '0' then
        dff <= (others => '0');
    elsif clk'event and clk = '1' then
        if pl = '1' then
            dff <= din;
        elsif en = '1' then
            case choose is
                when '0' => 
                    dff <= si & dff(3 downto 1);
                when others => 
                    dff <= dff(2 downto 0) & si;
            end case;
        end if;
    end if;
end process;
with choose select
    so <= dff(0) when '0',   
          dff(3) when others;






end Behavioral;
