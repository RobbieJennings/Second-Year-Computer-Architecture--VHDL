library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter is
	 port (
             B      : in std_logic_vector(15 downto 0);
             Hsel   : in std_logic_vector(1 downto 0);
             Ir     : in std_logic;
             Il     : in std_logic;
             H      : out std_logic_vector(15 downto 0));
end shifter;

architecture Behavioral of shifter is
-- components
	
	-- 4 input multiplexer
	COMPONENT mux4
	   PORT(
	       In0    : in std_logic;
           In1    : in std_logic;
           In2    : in std_logic;
           In3    : in std_logic;
           S0     : in std_logic;
           S1     : in std_logic;
           Z      : out std_logic);
   END COMPONENT;
        	
	begin
	-- port maps
        
    -- 4 input mux 0
    mux_0: mux4 PORT MAP(
        In0 => B(0),
        In1 => B(1),
        In2 => Il,
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(0));

    -- 4 input mux 1
    mux_1: mux4 PORT MAP(
        In0 => B(1),
        In1 => B(2),
        In2 => B(0),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(1));

    -- 4 input mux 2
    mux_2: mux4 PORT MAP(
        In0 => B(2),
        In1 => B(3),
        In2 => B(1),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(2));

    -- 4 input mux 3
    mux_3: mux4 PORT MAP(
        In0 => B(3),
        In1 => B(4),
        In2 => B(2),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(3));

    -- 4 input mux 4
    mux_4: mux4 PORT MAP(
        In0 => B(4),
        In1 => B(5),
        In2 => B(2),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(4));
        
    -- 4 input mux 5
    mux_5: mux4 PORT MAP(
        In0 => B(5),
        In1 => B(6),
        In2 => B(4),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(5));        

    -- 4 input mux 6
    mux_6: mux4 PORT MAP(
        In0 => B(6),
        In1 => B(7),
        In2 => B(5),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(6));   
        
    -- 4 input mux 7
    mux_7: mux4 PORT MAP(
        In0 => B(7),
        In1 => B(8),
        In2 => B(6),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(7));           
                    
    -- 4 input mux 8
    mux_8: mux4 PORT MAP(
        In0 => B(8),
        In1 => B(9),
        In2 => B(7),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(8));           
                                        
    -- 4 input mux 9
    mux_9: mux4 PORT MAP(
        In0 => B(9),
        In1 => B(10),
        In2 => B(8),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(9));
        
    -- 4 input mux 10
    mux_10: mux4 PORT MAP(
        In0 => B(10),
        In1 => B(11),
        In2 => B(9),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(10));    
        
    -- 4 input mux 11
    mux_11: mux4 PORT MAP(
        In0 => B(11),
        In1 => B(12),
        In2 => B(10),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(11));   
        
    -- 4 input mux 12
    mux_12: mux4 PORT MAP(
        In0 => B(12),
        In1 => B(13),
        In2 => B(11),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(12));   

    -- 4 input mux 13
    mux_13: mux4 PORT MAP(
        In0 => B(13),
        In1 => B(12),
        In2 => B(14),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(13));

    -- 4 input mux 14
    mux_14: mux4 PORT MAP(
        In0 => B(14),
        In1 => B(15),
        In2 => B(13),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(14));
        
    -- 4 input mux 15
    mux_15: mux4 PORT MAP(
        In0 => B(15),
        In1 => Ir,
        In2 => B(14),
        In3 => '0',
        S0 => Hsel(0),
        S1 => Hsel(1),
        Z => H(15));
               
end Behavioral;