library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity demux2_16bit is
	port (
	    D  : in std_logic_vector(15 downto 0);
		S  : in std_logic;
		Z0 : out std_logic_vector(15 downto 0);
		Z1 : out std_logic_vector(15 downto 0));
end demux2_16bit;

architecture Behavioral of demux2_16bit is
begin
	Z0 <= D after 1 ns when S='0';
	Z1 <= D after 1 ns when S='1';
end Behavioral;