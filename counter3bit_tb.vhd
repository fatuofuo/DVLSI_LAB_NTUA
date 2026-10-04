----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 01:13:21
-- Design Name: 
-- Module Name: counter3bit_tb - Behavioral
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

entity counter3bit_tb is
--  Port ( );
end counter3bit_tb;

architecture Behavioral of counter3bit_tb is
component counter3bit is
 Port (clk:in std_logic;
      mode:in std_logic;
      resetn:in std_logic;
      count_en : in std_logic;
      sum : out std_logic_vector(2 downto 0);
      cout : out std_logic);
end component;
signal clk_tb: std_logic:='0';
signal mode_tb: std_logic:='1';
signal resetn_tb: std_logic:='0';
signal count_en_tb: std_logic:='0';
signal sum_tb:std_logic_vector(2 downto 0);
signal cout_tb: std_logic;

begin
DUT: counter3bit port map (clk_tb,mode_tb,resetn_tb,count_en_tb,sum_tb,cout_tb);

 stimulus:process
    begin 
       resetn_tb<='1';
       count_en_tb<='1';
       clk_tb<='1';
       mode_tb<='1';
       for i in 0 to 4 loop
       clk_tb<=not clk_tb;
       wait for 10ns;
       end loop; 
       
       count_en_tb<='0';
       for i in 0 to 9 loop
       clk_tb<=not clk_tb;
       wait for 10ns;
       end loop;
       
       mode_tb<='1';
       count_en_tb<='1';
       for i in 0 to 17 loop
       clk_tb <= not clk_tb;
       wait for 10ns;
       end loop;
       
       count_en_tb<='0';
       for i in 0 to 9 loop
       clk_tb <= not clk_tb;
       wait for 10ns;
       end loop;
       
       count_en_tb<='1';
       mode_tb<='0';
       for i in 0 to 17 loop
       clk_tb<=not clk_tb;
       wait for 10ns;
       end loop;
       
       resetn_tb<='0';
       for i in 0 to 17 loop
       clk_tb<=not clk_tb;
       wait for 10ns;
       end loop;
       wait; 
       end process;
       
        

end Behavioral;
