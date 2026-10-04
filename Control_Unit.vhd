
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Control_Unit is
  Port (
    clk : in std_logic;
    reset : in std_logic;
    valid_in : in std_logic;
    rom_addr : out std_logic_vector(2 downto 0);
    ram_addr : out std_logic_vector(2 downto 0);
    mac_init : out std_logic;
    enable, valid_out : out std_logic
  );
end Control_Unit;

architecture Behavioral of Control_Unit is

signal counter : std_logic_vector(2 downto 0) := "000";
signal counting : std_logic := '0';
signal previous_valid : std_logic := '0';

begin

process(clk, reset)
begin
    if reset = '1' then
        counter <= (others => '0');
        counting <= '0';
        mac_init <= '1';
        enable <= '0';
        valid_out <= '0';
        previous_valid <= '0';

    elsif rising_edge(clk) then

        -- Detect rising edge of valid_in
        if valid_in = '1' and previous_valid = '0' then
            counting <= '1';            -- ksekinaw metrhma 
            counter <= (others => '0'); 
            mac_init <= '1';
            enable <= '1';
            valid_out <= '0';
        elsif counting = '1' then
            mac_init <='0';
            if counter = "111" then
                valid_out <= '1';
                --enable <= '0';
                counting <= '0';  -- stop metrhma
                counter<="000";
            else
                counter <= counter + 1;
                enable <= '1';
                valid_out <= '0';
            end if;
        else
            enable <= '0';
            valid_out <= '1';

        end if;

        -- Store previous value
        previous_valid <= valid_in;

    end if;
end process;

rom_addr <= counter;
ram_addr <= counter;

end Behavioral;

