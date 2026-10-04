----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2025 21:48:08
-- Design Name: 
-- Module Name: bcd4dig - structural
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



entity bcd4dig is
   Port (Ain: in std_logic_vector(15 downto 0);
         Bin: in std_logic_vector(15 downto 0);
         cin: in std_logic;
         cout:out std_logic;
         sum:out std_logic_vector(15 downto 0));
end bcd4dig;

architecture structural of bcd4dig is
    component BCD_4bit is
        Port ( Ainbcd : in STD_LOGIC_VECTOR (3 downto 0);
               Binbcd : in STD_LOGIC_VECTOR (3 downto 0);
               Cinbcd : in STD_LOGIC;
               Coutbcd : out std_logic;
               sumbcd : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    
    signal coutp_int: std_logic_vector(2 downto 0);
    
    
    
    signal cin1: std_logic;
begin
    
   
    
   
    cin1 <= '0';

 
    BCD1: BCD_4bit port map (Ainbcd => Ain(3 downto 0), Binbcd => Bin(3 downto 0), Cinbcd => cin, Coutbcd => coutp_int(0), sumbcd => sum(3 downto 0));
    BCD2: BCD_4bit port map (Ainbcd => Ain(7 downto 4), Binbcd => Bin(7 downto 4), Cinbcd => coutp_int(0), Coutbcd => coutp_int(1), sumbcd => sum(7 downto 4));
    BCD3: BCD_4bit port map (Ainbcd => Ain(11 downto 8), Binbcd => Bin(11 downto 8), Cinbcd => coutp_int(1), Coutbcd => coutp_int(2), sumbcd => sum(11 downto 8));
    BCD4: BCD_4bit port map (Ainbcd => Ain(15 downto 12), Binbcd => Bin(15 downto 12), Cinbcd => coutp_int(2), Coutbcd => cout, sumbcd => sum(15 downto 12));

  
   

end structural;




