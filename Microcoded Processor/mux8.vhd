library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux8 is
	port(
	   In0 : in std_logic; 
	   In1 : in std_logic;
	   In2 : in std_logic; 
       In3 : in std_logic;
       In4 : in std_logic; 
       In5 : in std_logic;
       In6 : in std_logic; 
       In7 : in std_logic;
	   S0  : in std_logic;
	   S1  : in std_logic;
	   S2  : in std_logic;
	   Z : out std_logic);
end mux8;

architecture Behavioral of mux8 is
begin
	Z <= In0 after 5 ns when S0='0' and S1='0' and S2='0' else
	In1 after 1 ns when S0='1' and S1='0' and S2 = '0' else
	In2 after 1 ns when S0='0' and S1='1' and S2 = '0' else
	In3 after 1 ns when S0='1' and S1='1' and S2 = '0' else
	In4 after 1 ns when S0='0' and S1='0' and S2 = '1' else
	In5 after 1 ns when S0='1' and S1='0' and S2 = '1' else
	In6 after 1 ns when S0='0' and S1='1' and S2 = '1' else
	In7 after 1 ns when S0='1' and S1='1' and S2 = '1' else
	'0' after 1 ns;
end Behavioral;