library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_bit_slice is
	 port (
             A      : in std_logic;
             B      : in std_logic;
             Cin    : in std_logic;
             S0     : in std_logic;
             S1     : in std_logic;
             S2     : in std_logic;
             G      : out std_logic;
             Cout   : out std_logic);
end alu_bit_slice;

architecture Behavioral of alu_bit_slice is
-- components

	-- 2 to 1 line multiplexer
	COMPONENT mux2
		PORT(
			In0 : IN std_logic;
			In1 : IN std_logic;
            S   : IN std_logic;
			Z   : OUT std_logic);
	END COMPONENT;
	
	-- arithmetic bit slice
	COMPONENT arithmetic_bit_slice
	   PORT(
	       A      : in std_logic;
           B      : in std_logic;
           S0     : in std_logic;
           S1     : in std_logic;
           Cin    : in std_logic;
           G      : out std_logic;
           Cout   : out std_logic);
   END COMPONENT;
       
    -- logic bit slice    
    COMPONENT logic_bit_slice
        PORT(
            A      : in std_logic;
            B      : in std_logic;
            S0     : in std_logic;
            S1     : in std_logic;
            G      : out std_logic);
    END COMPONENT;
      
    -- signals
    signal arithmetic_signal : std_logic;
    signal logic_signal  : std_logic; 
        	
	begin
	-- port maps
		
	-- 2 to 1 line multiplexer
    mux: mux2 PORT MAP(
        In0 => arithmetic_signal,
        In1 => logic_signal,
        S => S2,
        Z => G);
        
    -- arithmetic bit slice
    arithmetic_slice: arithmetic_bit_slice PORT MAP(
        A => A,
        B => B,
        S0 => S1,
        S1 => S0,
        Cin => Cin,
        G => arithmetic_signal,
        Cout => Cout);
      
     -- logic bit slice   
     logic_slice: logic_bit_slice PORT MAP(
        A => A,
        B => B,
        S0 => S0,
        S1 => S1,
        G => logic_signal);

end Behavioral;