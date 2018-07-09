library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
	Port(
        PL   : in std_logic;
        PI   : in std_logic;
        reset: in std_logic;
        CLK  : in std_logic;
        PCin : in std_logic_vector(15 downto 0);
        PCout: out std_logic_vector(15 downto 0));
end pc;

architecture Behavioral of pc is

    COMPONENT reg16
        PORT(
            D : IN std_logic_vector(15 downto 0);
            load : IN std_logic;
            Clk : IN std_logic;
            Q : OUT std_logic_vector(15 downto 0));
    END COMPONENT;
   
    COMPONENT adder_16bit
        PORT(
            A     : IN std_logic_vector(15 downto 0);
            B     : IN std_logic_vector(15 downto 0);
            Z     : OUT std_logic_vector(15 downto 0);
            Cout  : OUT std_logic );
    END COMPONENT;
    
    signal reg_out, adder0_out, adder1_out, pc: std_logic_vector(15 downto 0);
    signal adder0_c, adder1_c, load: std_logic;
    
    begin
    
    reg: reg16 PORT MAP(
        D => pc,
        load => load,
        Clk => Clk,
        Q => reg_out);
    
    adder0: adder_16bit PORT MAP(
        A => reg_out,
        B => x"0001",
        Z => adder0_out,
        Cout => adder0_c);
        
    adder1: Adder_16bit PORT MAP(
        A => reg_out,
        B => PCin,
        Z => adder1_out,
        Cout => adder1_c);
        
    pc <= x"0000" when Reset = '1' else
        adder1_out when PL = '1' else
        adder0_out when PI = '1' else
        reg_out;
                
    PCout <= reg_out;
    load <= (PL or PI or Reset);
   
end Behavioral;