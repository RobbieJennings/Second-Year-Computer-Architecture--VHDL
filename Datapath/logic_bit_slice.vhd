library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_bit_slice is
	 port (
             A      : in std_logic;
             B      : in std_logic;
             S0     : in std_logic;
             S1     : in std_logic;
             G      : out std_logic);
end logic_bit_slice;

architecture Behavioral of logic_bit_slice is
-- components

	-- 4 to 1 line multiplexer
	COMPONENT mux4
		PORT(
			In0 : IN std_logic;
			In1 : IN std_logic;
			In2 : IN std_logic;
            In3 : IN std_logic;
			S0: IN std_logic;
            S1: IN std_logic;
			Z   : OUT std_logic);
	END COMPONENT;
	
    -- signals
    signal and_signal : std_logic;
    signal or_signal  : std_logic;
    signal xor_signal : std_logic;
    signal not_signal : std_logic;    
        	
	begin
	-- port maps
	
	and_signal <= A and B after 1 ns;
	or_signal <= A or B after 1 ns;
	xor_signal <= A xor B after 1 ns;
	not_signal <= not A after 1 ns;
		
	-- 4 to 1 line multiplexer
    mux: mux4 PORT MAP(
        In0 => and_signal,
        In1 => or_signal,
        In2 => xor_signal,
        In3 => not_signal,
        S0 => S0,
        S1 => S1,
        Z => G);

end Behavioral;