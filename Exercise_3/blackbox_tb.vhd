library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blackbox_tb is
end blackbox_tb;

architecture tb of blackbox_tb is

    -- Component Declaration
    component blackbox
        Port ( Abb: in std_logic_vector(3 downto 0);
               Bbb: in std_logic;
               Cinbb: in std_logic_vector(3 downto 0);
               inFA: in std_logic_vector(3 downto 0);
               Coutbb: out std_logic_vector(3 downto 0);
               factor: out std_logic_vector(3 downto 0));
    end component;

    -- Test Signals
    signal Abb_tb: std_logic_vector(3 downto 0);
    signal Bbb_tb: std_logic;
    signal Cinbb_tb: std_logic_vector(3 downto 0);
    signal inFA_tb: std_logic_vector(3 downto 0);
    signal Coutbb_tb: std_logic_vector(3 downto 0);
    signal factor_tb: std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: blackbox port map (
        Abb => Abb_tb,
        Bbb => Bbb_tb,
        Cinbb => Cinbb_tb,
        inFA => inFA_tb,
        Coutbb => Coutbb_tb,
        factor => factor_tb
    );

    -- Stimulus Process
    process
    begin
        -- Test Case 1
        Abb_tb  <= "0001";
        Bbb_tb  <= '1';
        Cinbb_tb <= "0000";
        inFA_tb  <= "0001";
        wait for 10 ns;
        
        -- Test Case 2
        Abb_tb  <= "0011";
        Bbb_tb  <= '0';
        Cinbb_tb <= "0010";
        inFA_tb  <= "0000";
        wait for 10 ns;
        
        -- Test Case 3
        Abb_tb  <= "1111";
        Bbb_tb  <= '1';
        Cinbb_tb <= "0101";
        inFA_tb  <= "1010";
        wait for 10 ns;
        
        -- Test Case 4
        Abb_tb  <= "0110";
        Bbb_tb  <= '0';
        Cinbb_tb <= "0001";
        inFA_tb  <= "0100";
        wait for 10 ns;
        
        -- Stop simulation
        wait;
    end process;

end tb;
