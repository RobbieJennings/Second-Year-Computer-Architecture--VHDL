library ieee;
use ieee.std_logic_1164.all;

entity tb_pc is
end tb_pc;

architecture tb of tb_pc is

    component pc
        port (PL    : in std_logic;
              PI    : in std_logic;
              reset : in std_logic;
              CLK   : in std_logic;
              PCin  : in std_logic_vector (15 downto 0);
              PCout : out std_logic_vector (15 downto 0));
    end component;

    signal PL    : std_logic;
    signal PI    : std_logic;
    signal reset : std_logic;
    signal CLK   : std_logic;
    signal PCin  : std_logic_vector (15 downto 0);
    signal PCout : std_logic_vector (15 downto 0);

    constant TbPeriod : time := 50 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : pc
    port map (PL    => PL,
              PI    => PI,
              reset => reset,
              CLK   => CLK,
              PCin  => PCin,
              PCout => PCout);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    CLK <= TbClock;

    stimuli : process
    begin
            
        PL <= '0';
        PI <= '0';
        reset <= '1';
        PCin <= x"aaaa";
        wait for 100 ns;
            
        PL <= '0';
        PI <= '0';
        reset <= '0';
        PCin <= x"aaaa";
        wait for 100 ns;
        
        PL <= '1';
        PI <= '0';
        reset <= '0';
        PCin <= x"0003";
        wait for 100 ns;
        
        PL <= '0';
        PI <= '1';
        reset <= '0';
        PCin <= x"0003";
        wait for 100 ns;
        
        PL <= '0';
        PI <= '0';
        reset <= '1';
        PCin <= x"aaaa";

        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;