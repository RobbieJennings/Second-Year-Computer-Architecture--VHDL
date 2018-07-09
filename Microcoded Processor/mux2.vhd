library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2 is
	port (In0, In1 : in std_logic;
		s : in std_logic;
		Z : out std_logic);
end mux2;

architecture Behavioral of mux2 is
begin
	Z <= In0 after 1 ns when S='0' else
		In1 after 1 ns when S='1'else
		'0' after 1 ns;
end Behavioral;