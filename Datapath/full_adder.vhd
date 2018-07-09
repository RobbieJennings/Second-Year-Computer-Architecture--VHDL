library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is
	Port (
        A   : in std_logic;
		B   : in std_logic;
		Cin : in std_logic;
		Z   : out std_logic;
		Cout: out std_logic);
end full_adder;

architecture Behavioral of full_adder is

    signal xor1, and1, and2 : std_logic;
    
	begin
        xor1 <= A xor B after 1 ns;
        and1 <= A and B after 1 ns;
        and2 <= xor1 and Cin after 1 ns;
	
		Z <= xor1 xor Cin after 1 ns;
		Cout <= and1 or and2 after 1 ns;
end Behavioral;