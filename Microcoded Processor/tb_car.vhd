library ieee;
use ieee.std_logic_1164.all;

entity tb_car is
end tb_car;

architecture tb of tb_car is

    component car
        port (CARsel : in std_logic;
              reset  : in std_logic;
              CLK    : in std_logic;
              CARin  : in std_logic_vector (7 downto 0);
              Cout   : out std_logic;
              CARout : out std_logic_vector (7 downto 0));
    end component;

    signal CARsel : std_logic;
    signal reset  : std_logic;
    signal CLK    : std_logic;
    signal CARin  : std_logic_vector (7 downto 0);
    signal Cout   : std_logic;
    signal CARout : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 50 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : car
    port map (CARsel => CARsel,
              reset  => reset,
              CLK    => CLK,
              CARin  => CARin,
              Cout   => Cout,
              CARout => CARout);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    CLK <= TbClock;

    stimuli : process
    begin
        CARsel <= '0';
        reset <= '1';
        CARin <= x"00";
        wait for 100 ns;
        
        CARsel <= '0';
        reset <= '0';
        CARin <= x"00";
        wait for 100 ns;

        CARsel <= '1';
        reset <= '0';
        CARin <= x"AA";
        wait for 100 ns;        

        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;
