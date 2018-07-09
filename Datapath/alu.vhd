library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
	 port (
             A      : in std_logic_vector(15 downto 0);
             B      : in std_logic_vector(15 downto 0);
             Gsel   : in std_logic_vector(3 downto 0);
             G      : out std_logic_vector(15 downto 0);
             V      : out std_logic;
             C      : out std_logic);
end alu;

architecture Behavioral of alu is
-- components
	
	-- alu bit slice
	COMPONENT alu_bit_slice
	   PORT(
	       A      : in std_logic;
           B      : in std_logic;
           S0     : in std_logic;
           S1     : in std_logic;
           S2     : in std_logic;
           Cin    : in std_logic;
           G      : out std_logic;
           Cout   : out std_logic);
   END COMPONENT;
      
    -- signals
    signal C0 : std_logic;
    signal C1 : std_logic;
    signal C2 : std_logic;
    signal C3 : std_logic;
    signal C4 : std_logic;
    signal C5 : std_logic;
    signal C6 : std_logic;
    signal C7 : std_logic;
    signal C8 : std_logic;
    signal C9 : std_logic;
    signal C10 : std_logic;
    signal C11 : std_logic;
    signal C12 : std_logic;
    signal C13 : std_logic;
    signal C14 : std_logic;
    signal C15 : std_logic;
        	
	begin
	-- port maps
        
    -- alu bit slice 0
    alu_slice0: alu_bit_slice PORT MAP(
        A => A(0),
        B => B(0),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => Gsel(0),
        G => G(0),
        Cout => C0);
        
    -- alu bit slice 1
    alu_slice1: alu_bit_slice PORT MAP(
        A => A(1),
        B => B(1),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C0,
        G => G(1),
        Cout => C1);    

    -- alu bit slice 2
    alu_slice2: alu_bit_slice PORT MAP(
        A => A(2),
        B => B(2),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C1,
        G => G(2),
        Cout => C2);   

    -- alu bit slice 3
    alu_slice3: alu_bit_slice PORT MAP(
        A => A(3),
        B => B(3),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C2,
        G => G(3),
        Cout => C3); 

    -- alu bit slice 4
    alu_slice4: alu_bit_slice PORT MAP(
        A => A(4),
        B => B(4),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C3,
        G => G(4),
        Cout => C4); 
        
    -- alu bit slice 5
    alu_slice5: alu_bit_slice PORT MAP(
        A => A(5),
        B => B(5),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C4,
        G => G(5),
        Cout => C5); 

    -- alu bit slice 6
    alu_slice6: alu_bit_slice PORT MAP(
        A => A(6),
        B => B(6),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C5,
        G => G(6),
        Cout => C6); 
                
    -- alu bit slice 7
    alu_slice7: alu_bit_slice PORT MAP(
        A => A(7),
        B => B(7),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C6,
        G => G(7),
        Cout => C7);    
                    
    -- alu bit slice 8
    alu_slice8: alu_bit_slice PORT MAP(
        A => A(8),
        B => B(8),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C7,
        G => G(8),
        Cout => C8);
            
    -- alu bit slice 9
    alu_slice9: alu_bit_slice PORT MAP(
        A => A(9),
        B => B(9),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C8,
        G => G(9),
        Cout => C9);    
    
    -- alu bit slice 10
    alu_slice10: alu_bit_slice PORT MAP(
        A => A(10),
        B => B(10),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C9,
        G => G(10),
        Cout => C10);   

    -- alu bit slice 11
    alu_slice11: alu_bit_slice PORT MAP(
        A => A(11),
        B => B(11),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C10,
        G => G(11),
        Cout => C11); 

    -- alu bit slice 12
    alu_slice12: alu_bit_slice PORT MAP(
        A => A(12),
        B => B(12),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C11,
        G => G(12),
        Cout => C12); 
        
        
    -- alu bit slice 13
    alu_slice13: alu_bit_slice PORT MAP(
        A => A(13),
        B => B(13),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C12,
        G => G(13),
        Cout => C13); 

    -- alu bit slice 14
    alu_slice14: alu_bit_slice PORT MAP(
        A => A(14),
        B => B(14),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C13,
        G => G(14),
        Cout => C14); 
                
    -- alu bit slice 15
    alu_slice15: alu_bit_slice PORT MAP(
        A => A(15),
        B => B(15),
        S0 => Gsel(1),
        S1 => Gsel(2),
        S2 => Gsel(3),
        Cin => C14,
        G => G(15),
        Cout => C15);    
        
    -- set carry
    C <= C15;
    
    -- set overflow
    V <= C14 xor C15 after 1 ns;
                        
end Behavioral;