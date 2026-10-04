----------------------------------------------------------------------------------

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity pipelined_full_adder is
 Port (A:in std_logic_vector(3 downto 0);
       B:in std_logic_vector(3 downto 0);
       Cin:in std_logic;
       Cout:out std_logic;
       clk:in std_logic;
       sum:out std_logic_vector(3 downto 0));
       
end pipelined_full_adder;

architecture Behavioral of pipelined_full_adder is

component D_flip_flop is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RSTn : in STD_LOGIC;
           Q : out STD_LOGIC);
 end component;
 
 component full_adder1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sum : out STD_LOGIC);
end component;

signal a0:std_logic;
signal b0:std_logic;
signal a1:std_logic_vector(1 downto 0);
signal b1:std_logic_vector(1 downto 0);
signal a2:std_logic_vector(2 downto 0);
signal b2:std_logic_vector(2 downto 0);
signal a3:std_logic_vector(3 downto 0);
signal b3:std_logic_vector(3 downto 0);
signal cinn:std_logic;
signal sum_int0:std_logic_vector(4 downto 0);
signal sum_int1:std_logic_vector(3 downto 0);
signal sum_int2:std_logic_vector(2 downto 0);
signal sum_int3:std_logic;
signal cout0:std_logic_vector(2 downto 0);
signal cout1:std_logic_vector(2 downto 0);
signal cout2:std_logic_vector(2 downto 0);


begin
--delay of A0
dffa0: d_flip_flop port map (A(0),clk,'0',a0); --done
--delay of b0
dff1b0: d_flip_flop port map (B(0),clk,'0',b0);--done
dff1b9: d_flip_flop port map (cin,clk,'0',cinn);--done
--delay of cin

FA1: full_adder1 port map (a0,b0, cinn,cout0(0),sum_int0(0));--done
--delay of sum0
dff1: d_flip_flop port map (sum_int0(0),clk,'0',sum_int0(1));--done
--1cc
dff2: d_flip_flop port map (sum_int0(1),clk,'0',sum_int0(2));--done
--2cc
dff3: d_flip_flop port map (sum_int0(2),clk,'0',sum_int0(3));--done
--3cc
dff44: d_flip_flop port map (sum_int0(3),clk,'0',sum_int0(4));--done
sum(0)<=sum_int0(4);

--delay of A1
dffa10: d_flip_flop port map (A(1),clk,'0',a1(0));--done
--1cc
dffa11: d_flip_flop port map (a1(0),clk,'0',a1(1));--done
--2cc
--delay of B1
dffb10: d_flip_flop port map(B(1),clk,'0',b1(0));--done
--1cc
dffb11: d_flip_flop port map (b1(0),clk,'0',b1(1));--done
--2cc
--delay of cout0
dff6: d_flip_flop port map (cout0(0),clk,'0', cout0(1));--done

--dff66: d_flip_flop port map (cout0(1),'0',clk, cout0(2));--done

FA2: full_adder1 port map (a1(1),b1(1),cout0(1),cout1(0),sum_int1(0));--done
--delay of sum1
dff7: d_flip_flop port map (sum_int1(0),clk,'0',sum_int1(1));--done
--1cc
dff9: d_flip_flop port map (sum_int1(1),clk,'0',sum_int1(2));--done
--2cc
dff99: d_flip_flop port map (sum_int1(2),clk,'0',sum_int1(3));--done
sum(1)<=sum_int1(3);

--delay of A2
dffaa20: d_flip_flop port map (A(2),clk,'0',a2(0));--done
--1cc
dff1a21: d_flip_flop port map (a2(0),clk,'0',a2(1));--done

--2cc
dffa22: d_flip_flop port map (a2(1),clk,'0',a2(2)); --done
--delay of B2
dff11: d_flip_flop port map (B(2),clk,'0',b2(0));--done
--1cc
dff13: d_flip_flop port map (b2(0),clk,'0',b2(1));--done
--2cc
dff12: d_flip_flop port map (b2(1),clk,'0',b2(2));--done
--delay of cout1
dff14: d_flip_flop port map (cout1(0),clk,'0', cout1(1));--done

--dff144: d_flip_flop port map (cout1(1),'0',clk, cout1(2));--done
--1cc
FA3: full_adder1 port map (a2(2),b2(2),cout1(1),cout2(0),sum_int2(0));--done
--delay of sum2
dff15: d_flip_flop port map (sum_int2(0),clk,'0', sum_int2(1));--done
--1cc
dff155: d_flip_flop port map (sum_int2(1),clk,'0', sum_int2(2));--done
sum(2)<=sum_int2(2);
--lets go to the final stage
--delay of A3
dffa30: d_flip_flop port map (A(3),clk,'0', a3(0));--done
--1cc
dffa31: d_flip_flop port map (a3(0),clk,'0', a3(1));--done
--2cc
dffa32: d_flip_flop port map (a3(1),clk,'0', a3(2));--done
--3cc
dffa33: d_flip_flop port map (a3(2),clk,'0', a3(3));--done

--delay of B3
dffb30: d_flip_flop port map (B(3),clk,'0', b3(0));--done
--1cc
dffb31: d_flip_flop port map (b3(0),clk,'0', b3(1));--done
--2cc
dffb32: d_flip_flop port map (b3(1),clk,'0', b3(2));--done
--3cc
dffb33: d_flip_flop port map (b3(2),clk,'0', b3(3));--done
--delay of cout1
dff22: d_flip_flop port map (cout2(0),clk,'0', cout2(1));--done
--1cc
--dff222: d_flip_flop port map (cout2(1),'0',clk, cout2(2));--done

FA4: full_adder1 port map (b3(3),a3(3),cout2(1),cout,sum_int3);--done

dffb304: d_flip_flop port map (sum_int3,clk,'0', sum(3));--done




end Behavioral;
