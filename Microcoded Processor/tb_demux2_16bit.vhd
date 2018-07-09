library ieee;
use ieee.std_logic_1164.all;

entity tb_demux2_16bit is
end tb_demux2_16bit;

architecture tb of tb_demux2_16bit is

    component demux2_16bit
        port (D  : in std_logic_vector (15 downto 0);
              S  : in std_logic;
              Z0 : out std_logic_vector (15 downto 0);
              Z1 : out std_logic_vector (15 downto 0));
    end component;

    signal D  : std_logic_vector (15 downto 0);
    signal S  : std_logic;
    signal Z0 : std_logic_vector (15 downto 0);
    signal Z1 : std_logic_vector (15 downto 0);

begin

    dut : demux2_16bit
    port map (D  => D,
              S  => S,
              Z0 => Z0,
              Z1 => Z1);

    stimuli : process
    begin
        wait for 100 ns;
        
        D <= x"DEAD";
        S <= '0';
        wait for 100 ns;
        
        D <= x"BEEF";
        S <= '1';
        wait for 100 ns;
        
        D <= x"AAAA";
        S <= '0';
        wait for 100 ns;

        wait;
    end process;

end tb;
