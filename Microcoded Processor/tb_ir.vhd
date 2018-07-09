library ieee;
use ieee.std_logic_1164.all;

entity tb_ir is
end tb_ir;

architecture tb of tb_ir is

    component ir
        port (D      : in std_logic_vector (15 downto 0);
              IL     : in std_logic;
              Clk    : in std_logic;
              SB     : out std_logic_vector (2 downto 0);
              SA     : out std_logic_vector (2 downto 0);
              DR     : out std_logic_vector (2 downto 0);
              Opcode : out std_logic_vector (6 downto 0));
    end component;

    signal D      : std_logic_vector (15 downto 0);
    signal IL     : std_logic;
    signal Clk    : std_logic;
    signal SB     : std_logic_vector (2 downto 0);
    signal SA     : std_logic_vector (2 downto 0);
    signal DR     : std_logic_vector (2 downto 0);
    signal Opcode : std_logic_vector (6 downto 0);

    constant TbPeriod : time := 50 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : ir
    port map (D      => D,
              IL     => IL,
              Clk    => Clk,
              SB     => SB,
              SA     => SA,
              DR     => DR,
              Opcode => Opcode);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    Clk <= TbClock;

    stimuli : process
    begin
        D <= x"aaaa";
        IL <= '0';
        wait for 100 ns;
        
        
        D <= x"bbbb";
        IL <= '1';
        wait for 100 ns;
        
        
        D <= x"cccc";
        IL <= '0';
        wait for 100 ns;
        
        wait for 100 * TbPeriod;
        
        TbSimEnded <= '1';
        wait;
    end process;

end tb;
