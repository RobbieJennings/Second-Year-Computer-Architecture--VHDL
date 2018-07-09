library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder_8bit is
  Port(
      A     : IN std_logic_vector(7 downto 0);
      B     : IN std_logic_vector(7 downto 0);
      Z     : OUT std_logic_vector(7 downto 0);
      Cout  : OUT std_logic );
end adder_8bit;

architecture Behavioral of adder_8bit is

COMPONENT full_adder
    PORT(
        A    : IN std_logic;
        B    : IN std_logic;
        Cin  : IN std_logic;
        Z    : OUT std_logic;
        Cout : OUT std_logic);
END COMPONENT; 

signal C0, C1, C2, C3, C4, C5, C6 : std_logic;

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
            Cout => Cout);

end Behavioral;