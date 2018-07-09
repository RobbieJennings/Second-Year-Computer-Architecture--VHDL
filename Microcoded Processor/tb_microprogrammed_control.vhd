library ieee;
use ieee.std_logic_1164.all;

entity tb_microprogrammed_control is
end tb_microprogrammed_control;

architecture tb of tb_microprogrammed_control is

    component microprogrammed_control
        port (flags : in std_logic_vector (3 downto 0);
              reset : in std_logic;
              Clk   : in std_logic;
              D     : in std_logic_vector (15 downto 0);
              PCout : out std_logic_vector (15 downto 0));
    end component;

    signal flags : std_logic_vector (3 downto 0);
    signal reset : std_logic;
    signal Clk   : std_logic;
    signal D     : std_logic_vector (15 downto 0);
    signal PCout : std_logic_vector (15 downto 0);

    constant TbPeriod : time := 1000 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : microprogrammed_control
    port map (flags => flags,
              reset => reset,
              Clk   => Clk,
              D     => D,
              PCout => PCout);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    Clk <= TbClock;

    stimuli : process
    begin
        flags <= "0000";
        reset <= '0';
        D <= x"0000";

        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;