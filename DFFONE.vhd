library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dffone is
    Port (
        clk   : in  std_logic;  -- Ρολόι
        reset : in  std_logic;  -- Ασύγχρονο Reset
       D     : in  std_logic;  -- Είσοδος Data
        Q     : out std_logic 
    );
end dffone;

architecture Behavioral of dffone is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Q <= '0';  -- Αν το reset είναι ενεργό, Q = 0
        elsif rising_edge(clk) then
            Q <= D;  -- Αποθήκευση της τιμής του D στην ακμή ανόδου του ρολογιού
        end if;
    end process;
end Behavioral;


