library ieee;
use ieee.std_logic_1164.all;

entity tb_mux8 is
end tb_mux8;

architecture tb of tb_mux8 is

    component mux8
        port (In0 : in std_logic;
              In1 : in std_logic;
              In2 : in std_logic;
              In3 : in std_logic;
              In4 : in std_logic;
              In5 : in std_logic;
              In6 : in std_logic;
              In7 : in std_logic;
              S0  : in std_logic;
              S1  : in std_logic;
              S2  : in std_logic;
              Z   : out std_logic);
    end component;

    signal In0 : std_logic;
    signal In1 : std_logic;
    signal In2 : std_logic;
    signal In3 : std_logic;
    signal In4 : std_logic;
    signal In5 : std_logic;
    signal In6 : std_logic;
    signal In7 : std_logic;
    signal S0  : std_logic;
    signal S1  : std_logic;
    signal S2  : std_logic;
    signal Z   : std_logic;

begin

    dut : mux8
    port map (In0 => In0,
              In1 => In1,
              In2 => In2,
              In3 => In3,
              In4 => In4,
              In5 => In5,
              In6 => In6,
              In7 => In7,
              S0  => S0,
              S1  => S1,
              S2  => S2,
              Z   => Z);

    stimuli : process
    begin
        In0 <= '0';
        In1 <= '1';
        In2 <= '0';
        In3 <= '1';
        In4 <= '0';
        In5 <= '1';
        In6 <= '0';
        In7 <= '1';
        
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        wait for 100 ns;

        S0 <= '1';
        S1 <= '0';
        S2 <= '0';
        wait for 100 ns;
        
        S0 <= '0';
        S1 <= '1';
        S2 <= '0';
        wait for 100 ns;
        
        S0 <= '1';
        S1 <= '1';
        S2 <= '0';
        wait for 100 ns;
        
        S0 <= '0';
        S1 <= '0';
        S2 <= '1';
        wait for 100 ns;
        
        S0 <= '1';
        S1 <= '0';
        S2 <= '1';
        wait for 100 ns;
        
        S0 <= '0';
        S1 <= '1';
        S2 <= '1';
        wait for 100 ns;
                
        S0 <= '1';
        S1 <= '1';
        S2 <= '1';
        
        wait;
    end process;

end tb;