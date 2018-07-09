library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end tb_full_adder;

architecture tb of tb_full_adder is

    component full_adder
        port (A    : in std_logic;
              B    : in std_logic;
              Cin  : in std_logic;
              Z    : out std_logic;
              Cout : out std_logic);
    end component;

    signal A    : std_logic;
    signal B    : std_logic;
    signal Cin  : std_logic;
    signal Z    : std_logic;
    signal Cout : std_logic;

begin

    dut : full_adder
    port map (A    => A,
              B    => B,
              Cin  => Cin,
              Z    => Z,
              Cout => Cout);

    stimuli : process
    begin
        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for 100 ns;
        
        A <= '0';
        B <= '1';
        Cin <= '0';
        wait for 100 ns;
        
        A <= '1';
        B <= '0';
        Cin <= '0';
        wait for 100 ns;
        
        A <= '1';
        B <= '1';
        Cin <= '0';
        wait for 100 ns;
        
        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for 100 ns;
        
        A <= '0';
        B <= '1';
        Cin <= '1';
        wait for 100 ns;
        
        A <= '1';
        B <= '0';
        Cin <= '1';
        wait for 100 ns;
        
        A <= '1';
        B <= '1';
        Cin <= '1';

        wait;
    end process;

end tb;