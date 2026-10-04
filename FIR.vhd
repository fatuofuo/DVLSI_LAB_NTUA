
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity FIR is
  Port (clk : in std_logic;
        rst : in std_logic;
        valid_in : in std_logic;
        x : in std_logic_vector(7 downto 0);
        valid_out : out std_logic;
        y : out std_logic_vector(19 downto 0)
        );
end FIR;

architecture Structural of FIR is

 component Control_Unit
    Port ( clk : in std_logic;
    reset : in std_logic;
    valid_in : in std_logic;
    rom_addr : out std_logic_vector(2 downto 0);
    ram_addr : out std_logic_vector(2 downto 0);
    mac_init : out std_logic;
    enable, valid_out : out std_logic);
    end component;
    
 component MAC
 Port (
        enable    : in std_logic;
        clk       : in  std_logic;  
        --reset     : in  std_logic;  
        mac_init  : in  std_logic;  
        rom_out   : in  std_logic_vector(7 downto 0);  
        ram_out   : in  std_logic_vector(7 downto 0);  
        mac_out   : out std_logic_vector(19 downto 0)   
    );
    end component;
    
 component RAM1
        generic (
            data_width : integer := 8
        );
        port (
            clk  : in std_logic;
            we   : in std_logic;
            en   : in std_logic;
            addr : in std_logic_vector(2 downto 0);
            di   : in std_logic_vector(data_width-1 downto 0);
            do   : out std_logic_vector(data_width-1 downto 0)
        );
    end component;
    
component ROM1
generic (
		coeff_width : integer :=8  				--- width of coefficients (bits)
	 );
    Port ( clk : in  STD_LOGIC;
			  en : in  STD_LOGIC;				--- operation enable
           addr : in  STD_LOGIC_VECTOR (2 downto 0);			-- memory address
           rom_out : out  STD_LOGIC_VECTOR (coeff_width-1 downto 0));	-- output data
end component; 


        
component dffone
port (clk   : in  std_logic;  
        reset : in  std_logic;  
        D     : in  std_logic;  
        Q     : out std_logic  
        );
        end component;

 signal rom_addrs : std_logic_vector(2 downto 0);
 signal ram_addrs : std_logic_vector(2 downto 0);
 signal macinit : std_logic;
 --signal we : std_logic;
 signal enable : std_logic;
 signal  ram_out   :std_logic_vector(7 downto 0);  
 signal  rom_out   :std_logic_vector(7 downto 0);
 --signal ramin :std_logic_vector(7 downto 0); 
 signal valid_out1 :std_logic; 
 --signal enable1 : std_logic;
begin

CU : Control_Unit port map(clk,rst,valid_in,rom_addrs,ram_addrs,macinit,enable,valid_out1); --chng
dff2 :dffone port map(clk,rst,valid_out1,valid_out);
--dff3 : dffone port map(clk,rst,enable1,enable);
--think mporw na antikatasthsw to shma tou macinit me to valid_in 
ramunit : RAM1 port map(clk,valid_in,'1',ram_addrs,x,ram_out);
romunit : ROM1 port map(clk,'1',rom_addrs,rom_out);
macunit : MAC port map(enable,clk,macinit,rom_out,ram_out,y);
end Structural;
