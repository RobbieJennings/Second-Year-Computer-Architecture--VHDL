library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ir is
    port(
        D       : in std_logic_vector(15 downto 0);
        IL      : in std_logic;
        Clk     : in std_logic;
        SB      : OUT std_logic_vector(2 downto 0);
        SA      : OUT std_logic_vector(2 downto 0);
        DR      : OUT std_logic_vector(2 downto 0);
        Opcode  : OUT std_logic_vector(6 downto 0));
end IR;

architecture Behavioral of ir is

signal output: std_logic_vector(15 downto 0);

begin
    process(Clk)
    begin
        if (rising_edge(Clk)) then
            if IL='1' then
                output<=D after 5 ns;
            end if;
        end if;
    end process;
    
    SB <= output(2 downto 0);
    SA <= output(5 downto 3);
    DR <= output(8 downto 6);
    Opcode <= output(15 downto 9);
end Behavioral;