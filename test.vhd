library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is

end test;

architecture Behavioral of test is

 
  component pipelined_full_adder is
    Port ( A   : in std_logic_vector(3 downto 0);
           B   : in std_logic_vector(3 downto 0);
           Cin : in std_logic;
           Cout: out std_logic;
           clk : in std_logic;
           sum : out std_logic_vector(3 downto 0));
  end component;

  
  signal A_tb    : std_logic_vector(3 downto 0);
  signal B_tb    : std_logic_vector(3 downto 0);
  signal Cin_tb  : std_logic;
  signal Cout_tb : std_logic;
  signal clk_tb  : std_logic;
  signal sum_tb  : std_logic_vector(3 downto 0);

begin
  
  DUT: pipelined_full_adder port map (
    A   => A_tb,
    B   => B_tb,
    Cin => Cin_tb,
    Cout => Cout_tb,
    clk => clk_tb,
    sum => sum_tb
  );


  clk_process : process
  begin
    clk_tb <= '0';  
    wait for 5 ns;  
    clk_tb <= '1';
    wait for 5 ns;  
  end process;

  
  stimulus: process
  begin
    wait for 10ns;
    
    A_tb <= "0000";  
    B_tb <= "0000";  
    Cin_tb <= '0';   
    wait for 20 ns;  

    
    A_tb <= "0101";  
    B_tb <= "1010";  
    Cin_tb <= '0';   
    wait for 20 ns;  

    
    A_tb <= "1111";  
    B_tb <= "0000";  
    Cin_tb <= '0';   
    wait for 20 ns;  

   
    A_tb <= "1110";  
    B_tb <= "1110";  
    Cin_tb <= '0';   
    wait for 20 ns;  
    A_tb <= "1000";  
    B_tb <= "1110";  
    Cin_tb <= '0';   
    wait for 20 ns;  
    A_tb <= "1100";  
    B_tb <= "0010";  
    Cin_tb <= '0';   
    wait for 20 ns;  

   
    wait;
  end process;

end Behavioral;
