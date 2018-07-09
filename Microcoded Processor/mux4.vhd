library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux4 is
	port (
	   In0 : in std_logic; 
	   In1 : in std_logic;
	   In2 : in std_logic; 
       In3 : in std_logic;
	   S0  : in std_logic;
	   S1  : in std_logic;
	   Z : out std_logic);
end mux4;

architecture Behavioral of mux4 is
begin
	Z <= In0 after 5 ns when S0='0' and S1='0' else
	In1 after 1 ns when S0='1' and S1='0' else
	In2 after 1 ns when S0='0' and S1='1' else
	In3 after 1 ns when S0='1' and S1='1' else
	'0' after 1 ns;
end Behavioral;