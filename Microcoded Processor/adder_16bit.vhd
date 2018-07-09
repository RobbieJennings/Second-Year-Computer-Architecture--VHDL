library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_16bit is
  Port(
      A     : IN std_logic_vector(15 downto 0);
      B     : IN std_logic_vector(15 downto 0);
      Z     : OUT std_logic_vector(15 downto 0);
      Cout  : OUT std_logic );
end adder_16bit;

architecture Behavioral of adder_16bit is

COMPONENT full_adder
    PORT(
        A    : IN std_logic;
        B    : IN std_logic;
        Cin  : IN std_logic;
        Z    : OUT std_logic;
        Cout : OUT std_logic);
END COMPONENT; 

signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15: std_logic;

begin

    A0: full_adder
        PORT MAP(
            A => A(0),
            B => B(0),
            Cin => '0',
            Z => Z(0),
            Cout => C0);
        
    A1: full_adder
        PORT MAP(
            A => A(1),
            B => B(1),
            Cin => C0,
            Z => Z(1),
            Cout => C1);
        
    A2: full_adder
        PORT MAP(
            A => A(2),
            B => B(2),
            Cin => C1,
            Z => Z(2),
            Cout => C2);
        
    A3: full_adder
        PORT MAP(
            A => A(3),
            B => B(3),
            Cin => C2,
            Z => Z(3),
            Cout => C3);
        
    A4: full_adder
        PORT MAP(
            A => A(4),
            B => B(4),
            Cin => C3,
            Z => Z(4),
            Cout => C4);
        
    A5: full_adder
        PORT MAP(
            A => A(5),
            B => B(5),
            Cin => C4,
            Z => Z(5),
            Cout => C5);
        
    A6: full_adder
        PORT MAP(
            A => A(6),
            B => B(6),
            Cin => C5,
            Z => Z(6),
            Cout => C6);
        
    A7: full_adder
        PORT MAP(
            A => A(7),
            B => B(7),
            Cin => C6,
            Z => Z(7),
            Cout => C7);
        
    A8: full_adder
        PORT MAP(
            A => A(8),
            B => B(8),
            Cin => C7,
            Z => Z(8),
            Cout => C8);
            
    A9: full_adder
        PORT MAP(
            A => A(9),
            B => B(9),
            Cin => C8,    
            Z => Z(9),
            Cout => C9);
           
    A10: full_adder
        PORT MAP(
            A => A(10),
            B => B(10),
            Cin => C9,
            Z => Z(10),
            Cout => C10);
                    
    A11: full_adder
        PORT MAP(
            A => A(11),
            B => B(11),
            Cin => C10,
            Z => Z(11),
            Cout => C11);
                        
    A12: full_adder
        PORT MAP(
            A => A(12),
            B => B(12),
            Cin => C11,
            Z => Z(12),
            Cout => C12);
                            
    A13: full_adder
        PORT MAP(
            A => A(13),
            B => B(13),
            Cin => C12,
            Z => Z(13),
            Cout => C13);
                                
    A14: full_adder
        PORT MAP(
            A => A(14),
            B => B(14),
            Cin => C13,
            Z => Z(14),
            Cout => C14);
                                    
    A15: full_adder
        PORT MAP(
            A => A(15),
            B => B(15),
            Cin => C14,
            Z => Z(15),
            Cout => Cout);

end Behavioral;