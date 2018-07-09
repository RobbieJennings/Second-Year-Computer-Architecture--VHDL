library ieee;
use ieee.std_logic_1164.all;

entity tb_shifter is
end tb_shifter;

architecture tb of tb_shifter is

    component shifter
        port (B    : in std_logic_vector (15 downto 0);
              Hsel : in std_logic_vector (1 downto 0);
              Ir   : in std_logic;
              Il   : in std_logic;
              H    : out std_logic_vector (15 downto 0));
    end component;

    signal B    : std_logic_vector (15 downto 0);
    signal Hsel : std_logic_vector (1 downto 0);
    signal Ir   : std_logic;
    signal Il   : std_logic;
    signal H    : std_logic_vector (15 downto 0);

begin

    dut : shifter
    port map (B    => B,
              Hsel => Hsel,
              Ir   => Ir,
              Il   => Il,
              H    => H);

    stimuli : process
    begin
        B <= x"0002";
        Hsel <= "00";
        Ir <= '0';
        Il <= '0';
        wait for 100 ns;
        
        B <= x"0002";
        Hsel <= "01";
        Ir <= '0';
        Il <= '0';
        wait for 100 ns;
        
        B <= x"0002";
        Hsel <= "10";
        Ir <= '0';
        Il <= '0';

        wait;
    end process;

end tb;