library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2 is
end tb_mux2;

architecture tb of tb_mux2 is

    component mux2
        port (In0 : in std_logic;
              In1 : in std_logic;
              s   : in std_logic;
              Z   : out std_logic);
    end component;

    signal In0 : std_logic;
    signal In1 : std_logic;
    signal s   : std_logic;
    signal Z   : std_logic;

begin

    dut : mux2
    port map (In0 => In0,
              In1 => In1,
              s   => s,
              Z   => Z);

    stimuli : process
    begin
        In0 <= '0';
        In1 <= '1';
        s <= '0';
        wait for 100 ns;
        
        In0 <= '0';
        In1 <= '1';
        s <= '1';

        wait;
    end process;

end tb;