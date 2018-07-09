library ieee;
use ieee.std_logic_1164.all;

entity tb_adder_16bit is
end tb_adder_16bit;

architecture tb of tb_adder_16bit is

    component adder_16bit
        port (A    : in std_logic_vector (15 downto 0);
              B    : in std_logic_vector (15 downto 0);
              Z    : out std_logic_vector (15 downto 0);
              Cout : out std_logic);
    end component;

    signal A    : std_logic_vector (15 downto 0);
    signal B    : std_logic_vector (15 downto 0);
    signal Z    : std_logic_vector (15 downto 0);
    signal Cout : std_logic;

begin

    dut : adder_16bit
    port map (A    => A,
              B    => B,
              Z    => Z,
              Cout => Cout);

    stimuli : process
    begin
        A <= x"0000";
        B <= x"0001";
        wait for 100 ns;
        
        A <= x"0001";
        B <= x"0002";
        wait for 100 ns;
                
        wait;
    end process;

end tb;