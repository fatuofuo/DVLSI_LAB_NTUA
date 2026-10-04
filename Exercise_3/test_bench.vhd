----------------------------------------------------------------------------------
-- Testbench for pipelined_multiplier
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pipelined_multiplier_tb is
end pipelined_multiplier_tb;

architecture behavior of pipelined_multiplier_tb is

   
    signal Ain      : std_logic_vector(3 downto 0);
    signal Bin      : std_logic_vector(3 downto 0);
    signal Mul      : std_logic_vector(7 downto 0);
    signal Cout     : std_logic;
    signal clk      : std_logic;

begin

  
    uut: entity work.pipelined_multiplier
        port map (
            Ain  => Ain,
            Bin  => Bin,
            Mul  => Mul,
            Cout => Cout,
            clk  => clk
        );

   
    clk_process: process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

   
    stimulus_process: process
    begin
       
        Ain <= "0000";  
        Bin <= "0000";  
        wait for 20 ns;  
        
        Ain <= "0010";  
        Bin <= "0011"; 
        wait for 40 ns;  

        
        Ain <= "0101"; 
        Bin <= "0111";  
        wait for 40 ns;  

       
        Ain <= "1111"; 
        Bin <= "1111";  
        wait for 40 ns;  

        
        Ain <= "0100";  
        Bin <= "0100";  
        wait for 40 ns;  -- Wait for 2 clock cycles

        Ain <= "0111";  
        Bin <= "0111";  
        wait for 40 ns;  -- Wait for 2 clock cycles
        
        Ain <= "1111";  
        Bin <= "0111";  
        wait for 40 ns; 
         -- Wait for 2 clock cycles
         Ain <= "0101";  
        Bin <= "0100";  
        wait for 40 ns;
        Ain <= "0110";  
        Bin <= "0010"; 
        wait for 40 ns;
        Ain <= "1110";  
        Bin <= "0010"; 
        wait for 40 ns;
        Ain <= "1000";  
        Bin <= "0010"; 
        wait for 40 ns;
        Ain <= "1000";  
        Bin <= "1000"; 
         
      
        wait for 40ns;
        wait;
    end process;

end behavior;
