library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_bit_slice is
	 port (
             A      : in std_logic;
             B      : in std_logic;
             S0     : in std_logic;
             S1     : in std_logic;
             Cin    : in std_logic;
             G      : out std_logic;
             Cout   : out std_logic);
end arithmetic_bit_slice;

architecture Behavioral of arithmetic_bit_slice is
-- components

    -- full adder
	COMPONENT full_adder
		PORT(
			A    : IN std_logic;
			B    : IN std_logic;
			Cin  : IN std_logic;
			Z    : OUT std_logic;
			Cout : OUT std_logic);
	END COMPONENT;

	-- 2 to 1 line multiplexer
	COMPONENT mux2
		PORT(
			In0 : IN std_logic;
			In1 : IN std_logic;
			S   : IN std_logic;
			Z   : OUT std_logic);
	END COMPONENT;
	
    -- signals
    signal Y : std_logic;
	
	begin
	-- port maps
    
	-- full adder
	adder: full_adder PORT MAP(
		A => A,
		B => Y,
		Cin => Cin,
		Z => G,
		Cout => Cout);
		
	-- 2 to 1 line multiplexer
    mux: mux2 PORT MAP(
        In0 => S0,
        In1 => S1,
        S => B,
        Z => Y);

end Behavioral;