library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dffone is
    Port (
        clk   : in  std_logic;  -- Ñïëüé
        reset : in  std_logic;  -- Áóýã÷ñïíï Reset
       D     : in  std_logic;  -- Åßóïäïò Data
        Q     : out std_logic 
    );
end dffone;

architecture Behavioral of dffone is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Q <= '0';  -- Áí ôï reset åßíáé åíåñãü, Q = 0
        elsif rising_edge(clk) then
            Q <= D;  -- ÁðïèÞêåõóç ôçò ôéìÞò ôïõ D óôçí áêìÞ áíüäïõ ôïõ ñïëïãéïý
        end if;
    end process;
end Behavioral;


