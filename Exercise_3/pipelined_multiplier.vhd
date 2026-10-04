----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2025 18:51:22
-- Design Name: 
-- Module Name: pipelined_multiplier - Behavioral
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



entity pipelined_multiplier is
 Port (Ain: in std_logic_vector(3 downto 0);
       Bin: in std_logic_vector(3 downto 0);
       Mul: out std_logic_vector(7 downto 0);
       Cout:out std_logic;
       clk: in std_logic
 );
end pipelined_multiplier;

architecture Behavioral of pipelined_multiplier is
component d_flip_flop is
 Port (d : in std_logic;
    clk : in std_logic;
    RSTn : in std_logic;
    q : out std_logic); 
end component;

component blackbox is
  Port ( Abb:in std_logic_vector(3 downto 0);
         Bbb:in std_logic;
         Cinbb:in std_logic_vector(3 downto 0);
         inFA: in std_logic_vector(3 downto 0);
         Coutbb:out std_logic_vector(3 downto 0);
         factor:out std_logic_vector(3 downto 0));
 end component;
 
component full_adder1 is
  Port ( A, B, Cin : in  STD_LOGIC;
         Sum, Cout : out STD_LOGIC);
end component;

signal a:std_logic_vector(3 downto 0);
signal b_0:std_logic;
signal b_1:std_logic_vector(1 downto 0);
signal b_2:std_logic_vector(2 downto 0);
signal b_3:std_logic_vector(3 downto 0);
signal cout0: std_logic_vector(3 downto 0);
signal cout1:std_logic_vector(3 downto 0);
signal cout2:std_logic_vector(3 downto 0);
signal cout3:std_logic_vector(3 downto 0);
signal cout4:std_logic_vector(3 downto 0);
signal cout00:std_logic_vector(3 downto 0);
signal cout11:std_logic_vector(3 downto 0);
signal cout22:std_logic_vector(3 downto 0);
signal cout33:std_logic_vector(3 downto 0);
signal factor0:std_logic_vector(3 downto 0);
signal factor1:std_logic_vector(3 downto 0);
signal factor2:std_logic_vector(3 downto 0);
signal factor3:std_logic_vector(3 downto 0);
signal factor4:std_logic_vector(3 downto 0);
signal factor0_copy:std_logic_vector(3 downto 0);
signal factor1_copy:std_logic_vector(3 downto 0);
signal factor2_copy:std_logic_vector(3 downto 0);
signal factor3_copy:std_logic_vector(3 downto 0);
signal factor0_copy_shifted:std_logic_vector(3 downto 0);
signal factor1_copy_shifted:std_logic_vector(3 downto 0);
signal factor2_copy_shifted:std_logic_vector(3 downto 0);
signal factor3_copy_shifted:std_logic_vector(3 downto 0);
signal a1:std_logic_vector(3 downto 0);
signal a11:std_logic_vector(3 downto 0);
signal a2:std_logic_vector(3 downto 0);
signal a22:std_logic_vector(3 downto 0);
signal a23:std_logic_vector(3 downto 0);
signal a3:std_logic_vector(3 downto 0);
signal a32:std_logic_vector(3 downto 0);
signal a33:std_logic_vector(3 downto 0);
signal a34:std_logic_vector(3 downto 0);
signal mul_0:std_logic_vector(4 downto 0);
signal mul_1:std_logic_vector(3 downto 0);
signal mul_2:std_logic_vector(2 downto 0);
signal mul_3:std_logic_vector(1 downto 0);
signal c1:std_logic_vector(3 downto 0);
signal c2:std_logic_vector(3 downto 0);
signal c3:std_logic_vector(3 downto 0);
signal c4:std_logic;
signal c5:std_logic_vector(4 downto 0);
signal c6:std_logic;
signal c7:std_logic;
signal c8:std_logic;
signal c9:std_logic_vector(1 downto 0);



begin
-- 1cc delay of A0(0)
DFF_a_0: d_flip_flop port map (Ain(0),clk,'0',a(0));
-- 1cc delay of A1(0)
DFF_a_1: d_flip_flop port map (Ain(1),clk,'0',a(1));
-- 1cc delay of A2(0)
DFF_a_2: d_flip_flop port map (Ain(2),clk,'0',a(2));
-- 1cc delay of A3(0)
DFF_a_3: d_flip_flop port map (Ain(3),clk,'0',a(3));
-- 1cc delay of B0(0)
DFF_b_0: d_flip_flop port map (Bin(0),clk,'0',b_0);
c1<="0000";
DFF_b_000: d_flip_flop port map (c1(0),clk,'0',c2(0));
DFF_b_001: d_flip_flop port map (c1(1),clk,'0',c2(1));
DFF_b_010: d_flip_flop port map (c1(2),clk,'0',c2(2));
DFF_b_100: d_flip_flop port map (c1(3),clk,'0',c2(3));



--now the first black box
black_box_1: blackbox port map(a,b_0,c2,c2,cout0,factor0);--factor0(0)

-- 2cc delay of A0
DFF_a1_0: d_flip_flop port map (Ain(0),clk,'0',a1(0));
DFF_a11_0: d_flip_flop port map (a1(0),clk,'0',a11(0));
-- 2cc delay of A1
DFF_a1_1: d_flip_flop port map (Ain(1),clk,'0',a1(1));
DFF_a11_1: d_flip_flop port map (a1(1),clk,'0',a11(1));
-- 2cc delay of A2
DFF_a1_2: d_flip_flop port map (Ain(2),clk,'0',a1(2));
DFF_a11_2: d_flip_flop port map (a1(2),clk,'0',a11(2));
-- 2cc delay of A3
DFF_a1_3: d_flip_flop port map (Ain(3),clk,'0',a1(3));
DFF_a11_3: d_flip_flop port map (a1(3),clk,'0',a11(3));
--2cc delay of b_1
DFF_b_1: d_flip_flop port map(Bin(1),clk,'0',b_1(0));
DFF_b_12: d_flip_flop port map(b_1(0),clk,'0',b_1(1));
--delay of cin0(0)
DFF_cout0: d_flip_flop port map(Cout0(0),clk,'0',cout00(0));
--delay of cin0(1)
DFF_cout01: d_flip_flop port map(Cout0(1),clk,'0',cout00(1));
--delay of cin0(2)
DFF_cout02: d_flip_flop port map(Cout0(2),clk,'0',cout00(2));
--delay of cin0(3)
DFF_cout03: d_flip_flop port map(Cout0(3),clk,'0',cout00(3));
--delay of factor0_0
DFF_factor0_0: d_flip_flop port map(factor0(0),clk,'0',factor0_copy(0));--this for the exit
--delay of factor0_1
DFF_factor0_1: d_flip_flop port map(factor0(1),clk,'0',factor0_copy(1));
--delay of factor0_2
DFF_factor0_2: d_flip_flop port map(factor0(2),clk,'0',factor0_copy(2));
--delay of factor0_3
DFF_factor0_3: d_flip_flop port map(factor0(3),clk,'0',factor0_copy(3));
--second black box
factor0_copy_shifted <= "0" & factor0_copy(3 downto 1);
black_box_2: blackbox port map(a11,b_1(1),cout00,factor0_copy_shifted,cout1,factor1);

--lets go to the third stage
--3cc delay of A0
DFF_a2_0: d_flip_flop port map (Ain(0),clk,'0',a2(0));
DFF_a22_0: d_flip_flop port map (a2(0),clk,'0',a22(0));
DFF_a23_0: d_flip_flop port map (a22(0),clk,'0',a23(0));
--3cc delay of A1
DFF_a2_1: d_flip_flop port map (Ain(1),clk,'0',a2(1));
DFF_a22_1: d_flip_flop port map (a2(1),clk,'0',a22(1));
DFF_a23_1: d_flip_flop port map (a22(1),clk,'0',a23(1));
--3cc delay of A2
DFF_a2_2: d_flip_flop port map (Ain(2),clk,'0',a2(2));
DFF_a22_2: d_flip_flop port map (a2(2),clk,'0',a22(2));
DFF_a23_2: d_flip_flop port map (a22(2),clk,'0',a23(2));
--3cc delay of A3
DFF_a2_3: d_flip_flop port map (Ain(3),clk,'0',a2(3));
DFF_a22_3: d_flip_flop port map (a2(3),clk,'0',a22(3));
DFF_a23_3: d_flip_flop port map (a22(3),clk,'0',a23(3));
--3cc delay of b2
DFF_b_2: d_flip_flop port map(Bin(2),clk,'0',b_2(0));
DFF_b_22: d_flip_flop port map(b_2(0),clk,'0',b_2(1));
DFF_b_23: d_flip_flop port map(b_2(1),clk,'0',b_2(2));
--delay of cin1(0)
DFF_cout10: d_flip_flop port map(Cout1(0),clk,'0',cout11(0));
--delay of cin1(1)
DFF_cout11: d_flip_flop port map(Cout1(1),clk,'0',cout11(1));
--delay of cin1(2)
DFF_cout12: d_flip_flop port map(Cout1(2),clk,'0',cout11(2));
--delay of cin1(3)
DFF_cout13: d_flip_flop port map(Cout1(3),clk,'0',cout11(3));
--delay of factor1_0
DFF_factor1_0: d_flip_flop port map(factor1(0),clk,'0',factor1_copy(0));--this for the exit
--delay of factor0_1
DFF_factor1_1: d_flip_flop port map(factor1(1),clk,'0',factor1_copy(1));
--delay of factor0_2
DFF_factor1_2: d_flip_flop port map(factor1(2),clk,'0',factor1_copy(2));
--delay of factor0_3
DFF_factor1_3: d_flip_flop port map(factor1(3),clk,'0',factor1_copy(3));
--lets go to the third black box
factor1_copy_shifted<= "0" & factor1_copy(3 downto 1);
black_box_3: blackbox port map(a23,b_2(2),cout11,factor1_copy_shifted,cout2,factor2);



--now the fourth stage
--4cc delay of A0
DFF_a3_0: d_flip_flop port map (Ain(0),clk,'0',a3(0));
DFF_a32_0: d_flip_flop port map (a3(0),clk,'0',a32(0));
DFF_a33_0: d_flip_flop port map (a32(0),clk,'0',a33(0));
DFF_a34_0: d_flip_flop port map (a33(0),clk,'0',a34(0));
--4cc delay of A1
DFF_a3_1: d_flip_flop port map (Ain(1),clk,'0',a3(1));
DFF_a32_1: d_flip_flop port map (a3(1),clk,'0',a32(1));
DFF_a33_1: d_flip_flop port map (a32(1),clk,'0',a33(1));
DFF_a34_1: d_flip_flop port map (a33(1),clk,'0',a34(1));
--4cc delay of A2
DFF_a3_2: d_flip_flop port map (Ain(2),clk,'0',a3(2));
DFF_a32_2: d_flip_flop port map (a3(2),clk,'0',a32(2));
DFF_a33_2: d_flip_flop port map (a32(2),clk,'0',a33(2));
DFF_a34_2: d_flip_flop port map (a33(2),clk,'0',a34(2));
--4cc delay of A3
DFF_a3_3: d_flip_flop port map (Ain(3),clk,'0',a3(3));
DFF_a32_3: d_flip_flop port map (a3(3),clk,'0',a32(3));
DFF_a33_3: d_flip_flop port map (a32(3),clk,'0',a33(3));
DFF_a34_3: d_flip_flop port map (a33(3),clk,'0',a34(3));
--4cc delay of B3
DFF_b_3: d_flip_flop port map(Bin(3),clk,'0',b_3(0));
DFF_b_32: d_flip_flop port map(b_3(0),clk,'0',b_3(1));
DFF_b_33: d_flip_flop port map(b_3(1),clk,'0',b_3(2));
DFF_b_34: d_flip_flop port map(b_3(2),clk,'0',b_3(3));
--delay of cin2(0)
DFF_cout20: d_flip_flop port map(Cout2(0),clk,'0',cout22(0));
--delay of cin2(1)
DFF_cout21: d_flip_flop port map(Cout2(1),clk,'0',cout22(1));
--delay of cin2(2)
DFF_cout22: d_flip_flop port map(Cout2(2),clk,'0',cout22(2));
--delay of cin1(3)
DFF_cout23: d_flip_flop port map(Cout2(3),clk,'0',cout22(3));
--delay of factor2_0
DFF_factor2_0: d_flip_flop port map(factor2(0),clk,'0',factor2_copy(0));--this for the exit
--delay of factor0_1
DFF_factor2_1: d_flip_flop port map(factor2(1),clk,'0',factor2_copy(1));
--delay of factor0_2
DFF_factor2_2: d_flip_flop port map(factor2(2),clk,'0',factor2_copy(2));
--delay of factor0_3
DFF_factor2_3: d_flip_flop port map(factor2(3),clk,'0',factor2_copy(3));
factor2_copy_shifted <= "0" & factor2_copy(3 downto 1);
--lets go to the fourth black box
black_box_4: blackbox port map(a34,b_3(3),cout22,factor2_copy_shifted,cout3,factor3);

--delay of cin3(0)
DFF_cout30: d_flip_flop port map(Cout3(0),clk,'0',cout33(0));
--delay of cin3(1)
DFF_cout31: d_flip_flop port map(Cout3(1),clk,'0',cout33(1));
--delay of cin3(2)
DFF_cout32: d_flip_flop port map(Cout3(2),clk,'0',cout33(2));
--delay of cin3(3)
DFF_cout33: d_flip_flop port map(Cout3(3),clk,'0',cout33(3));

DFF_factor3_0: d_flip_flop port map(factor3(0),clk,'0',factor3_copy(0));--this for the exit
--delay of factor3_1
DFF_factor3_1: d_flip_flop port map(factor3(1),clk,'0',factor3_copy(1));
--delay of factor3_2
DFF_factor3_2: d_flip_flop port map(factor3(2),clk,'0',factor3_copy(2));
--delay of factor3_3
DFF_factor3_3: d_flip_flop port map(factor3(3),clk,'0',factor3_copy(3));
factor3_copy_shifted <= "0" & factor3_copy(3 downto 1);
DFF22: d_flip_flop port map('0',clk,'0',c5(0));
DFF222: d_flip_flop port map(c5(0),clk,'0',c5(1));
DFF2222: d_flip_flop port map(c5(1),clk,'0',c5(2));
DFF223: d_flip_flop port map(c5(2),clk,'0',c5(3));
DFF225: d_flip_flop port map(c5(3),clk,'0',c5(4));

FA:full_adder1 port map(cout33(0),factor3_copy(1),c5(4),factor4(0),cout4(0));
--FA5:full_adder1 port map('0','0',c5(4),factor4(0),cout4(0));
FA1:full_adder1 port map(cout33(1),factor3_copy_shifted(1),cout4(0),factor4(1),cout4(1));
FA2:full_adder1 port map(cout33(2),factor3_copy_shifted(2),cout4(1),factor4(2),cout4(2));
FA3:full_adder1 port map(cout33(3),factor3_copy_shifted(3),cout4(2),factor4(3),cout4(3));

dffmul0: d_flip_flop port map(factor0(0),clk,'0',mul_0(0));
dffmul01: d_flip_flop port map(mul_0(0),clk,'0',mul_0(1));
dffmul011: d_flip_flop port map(mul_0(1),clk,'0',mul_0(2));
dffmul0111: d_flip_flop port map(mul_0(2),clk,'0',mul_0(3));
dffmul01111: d_flip_flop port map(mul_0(3),clk,'0',mul_0(4));
mul(0)<=mul_0(4);
dffmul1: d_flip_flop port map(factor1(0),clk,'0',mul_1(0));
dffmul11: d_flip_flop port map(mul_1(0),clk,'0',mul_1(1));
dffmul001111: d_flip_flop port map(mul_1(1),clk,'0',mul_1(2));
dffmul0011311: d_flip_flop port map(mul_1(2),clk,'0',mul_1(3));

mul(1)<=mul_1(3);
dffmul02: d_flip_flop port map(factor2(0),clk,'0',mul_2(0));
dffmul2201: d_flip_flop port map(mul_2(0),clk,'0',mul_2(1));
dffmul223301: d_flip_flop port map(mul_2(1),clk,'0',mul_2(2));

mul(2)<=mul_2(2);
dffmul40: d_flip_flop port map(factor3(0),clk,'0',mul_3(0));
dffmul22501: d_flip_flop port map(mul_3(0),clk,'0',mul_3(1));
mul(3)<=mul_3(1);
dffmul22601: d_flip_flop port map(factor4(0),clk,'0',c4);
mul(4)<=c4;
dffmull1: d_flip_flop port map(factor4(1),clk,'0',c6);
mul(5)<=c6;
dffmua: d_flip_flop port map(factor4(2),clk,'0',c7);
mul(6)<=c7;
dffmulb: d_flip_flop port map(factor4(3),clk,'0',c8);
mul(7)<=c8;
DFF224: d_flip_flop port map(cout33(0),clk,'0',c9(0));
cout<=c9(0);
























end Behavioral;
