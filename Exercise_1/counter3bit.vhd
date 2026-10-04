----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 00:50:54
-- Design Name: 
-- Module Name: counter3bit - Behavioral
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
use IEEE.std_logic_unsigned.all;



entity counter3bit is
 Port (clk:in std_logic;
      mode:in std_logic;
      resetn:in std_logic;
      count_en : in std_logic;
      sum : out std_logic_vector(2 downto 0);
      cout : out std_logic);
end counter3bit;

architecture Behavioral of counter3bit is
signal count : std_logic_vector(2 downto 0);
begin
process(clk, resetn)
begin
    if resetn='0' then --áóõã÷ñïíïò ìçäåíéóìïò
        count <= (others=>'0');
    elsif clk'event and clk='1' then
        if count_en = '1' then -- ÌÝôñçóç ìüíï áí count_en='1'
            case mode is
                when '0' =>  count<=count-1;
                when '1' =>
                    if (count /= 7) then 
                    count <= count + 1;
                     end if;
                when others =>count<=(others=>'0');
            end case;
         end if;
    end if;
end process;
sum<= count;
cout <= '1' when count=7 and count_en='1' else '0';




end Behavioral;
