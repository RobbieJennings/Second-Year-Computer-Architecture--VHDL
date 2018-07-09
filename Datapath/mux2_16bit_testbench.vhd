library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2_16bit is
end tb_mux2_16bit;

architecture tb of tb_mux2_16bit is

    component mux2_16bit
        port (In0 : in std_logic_vector (15 downto 0);
              In1 : in std_logic_vector (15 downto 0);
              s   : in std_logic;
              Z   : out std_logic_vector (15 downto 0));
    end component;

    signal In0 : std_logic_vector (15 downto 0);
    signal In1 : std_logic_vector (15 downto 0);
    signal s   : std_logic;
    signal Z   : std_logic_vector (15 downto 0);

begin

    dut : mux2_16bit
    port map (In0 => In0,
              In1 => In1,
              s   => s,
              Z   => Z);

    stimuli : process
    begin
        In0 <= x"0000";
        In1 <= x"1111";
        s <= '0';
        wait for 100 ns;
        
        s <= '1';

        wait;
    end process;

end tb;