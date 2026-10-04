----------------------------------------------------------------------------------

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity pipelined_full_adder_tb is
--  Port ( );
end pipelined_full_adder_tb;

architecture Behavioral of pipelined_full_adder_tb is
component pipelined_full_adder is
 Port (A:in std_logic_vector(3 downto 0);
       B:in std_logic_vector(3 downto 0);
       Cin:in std_logic;
       Cout:out std_logic;
       clk:in std_logic;
       sum:out std_logic_vector(3 downto 0));
end component;

signal A_tb:std_logic_vector(3 downto 0);
signal B_tb:std_logic_vector(3 downto 0);
signal Cin_tb:std_logic;
signal Cout_tb:std_logic;
signal clk_tb:std_logic;
signal sum_tb:std_logic_vector(3 downto 0);

begin
DUT: pipelined_full_adder port map (
    A_tb,     -- A (4-bit input)
    B_tb,     -- B (4-bit input)
    Cin_tb,   -- Cin (1-bit input)
    clk_tb,   -- clk (1-bit input, ëÜèïò ôïðïèÝôçóç ðñéí)
    Cout_tb,  -- Cout (1-bit output)
    Sum_tb    -- sum (4-bit output)
);


 stimulus:process
    begin
    clk_tb<='1';
    A_tb<="0000";
    B_tb<="0010";
    Cin_tb<='0';
    
    
    wait for 10ns;
    clk_tb<='0';
    A_tb<="0000";
    B_tb<="0010";
    Cin_tb<='0';
  wait for 10ns;
end process;

end Behavioral;
