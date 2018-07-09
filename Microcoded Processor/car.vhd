library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car is
	Port(
        CARsel  : in std_logic;
        reset   : in std_logic;
        CLK     : in std_logic;
        CARin   : in std_logic_vector(7 downto 0);
        Cout    : out std_logic;
        CARout  : out std_logic_vector(7 downto 0));
end car;

architecture Behavioral of car is

    COMPONENT reg8
        PORT(
            D : IN std_logic_vector(7 downto 0);
            load : IN std_logic;
            Clk : IN std_logic;
            Q : OUT std_logic_vector(7 downto 0));
    END COMPONENT;
   
    COMPONENT adder_8bit
        PORT(
            A     : IN std_logic_vector(7 downto 0);
            B     : IN std_logic_vector(7 downto 0);
            Z     : OUT std_logic_vector(7 downto 0);
            Cout  : OUT std_logic );
    END COMPONENT;
    
    signal reg_in, reg_out, adder_out: std_logic_vector(7 downto 0);
    
    begin
        
    Reg: Reg8
        PORT MAP(
            D => reg_in,
            load => '1',
            Clk => Clk,
            Q => Reg_Out);
            
    Adder: Adder_8bit
        PORT MAP(
            A => Reg_Out,
            B => x"01",
            Z => Adder_Out,
            Cout => Cout);
            
    reg_in <= x"00" when Reset = '1' else
        CARin when CARsel = '1' else
        adder_out;
                       
    CARout <= reg_out;
   
end Behavioral;