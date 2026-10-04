library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder1 is
  Port ( A, B, Cin : in  STD_LOGIC;
         Sum, Cout : out STD_LOGIC);
end full_adder1;

architecture Behavioral of full_adder1 is
begin
    process(A, B, Cin)
    begin
        if (A ='0' and B ='0' and Cin ='0') then
            Sum  <='0';
            Cout <='0';
        elsif (A ='0' and B ='0' and Cin ='1') then
            Sum  <='1';
            Cout <='0';
        elsif (A ='0' and B ='1' and Cin ='0') then
            Sum  <='1';
            Cout <='0';
        elsif (A ='0' and B ='1' and Cin ='1') then
            Sum  <='0';
            Cout <='1';
        elsif (A ='1' and B ='0' and Cin ='0') then
            Sum  <='1';
            Cout <='0';
        elsif (A ='1' and B ='0' and Cin ='1') then
            Sum  <='0';
            Cout <='1';
        elsif (A ='1' and B ='1' and Cin ='0') then
            Sum  <='0';
            Cout <='1';
         elsif (A ='1' and B ='1' and Cin ='1') then
            Sum  <='1';
            Cout <='1';
         else Sum<='U';
             Cout<='U';
        end if;
    end process;
end Behavioral;
