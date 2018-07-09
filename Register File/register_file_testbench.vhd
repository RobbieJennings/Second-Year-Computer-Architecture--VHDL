library ieee;
use ieee.std_logic_1164.all;

entity tb_register_file is
end tb_register_file;

architecture tb of tb_register_file is

    component register_file
        port (src_s0   : in std_logic;
              src_s1   : in std_logic;
              src_s2   : in std_logic;
              des_A0   : in std_logic;
              des_A1   : in std_logic;
              des_A2   : in std_logic;
              Clk      : in std_logic;
              data_src : in std_logic;
              data     : in std_logic_vector (15 downto 0);
              reg0     : out std_logic_vector (15 downto 0);
              reg1     : out std_logic_vector (15 downto 0);
              reg2     : out std_logic_vector (15 downto 0);
              reg3     : out std_logic_vector (15 downto 0);
              reg4     : out std_logic_vector (15 downto 0);
              reg5     : out std_logic_vector (15 downto 0);
              reg6     : out std_logic_vector (15 downto 0);
              reg7     : out std_logic_vector (15 downto 0));
    end component;

    signal src_s0   : std_logic;
    signal src_s1   : std_logic;
    signal src_s2   : std_logic;
    signal des_A0   : std_logic;
    signal des_A1   : std_logic;
    signal des_A2   : std_logic;
    signal Clk      : std_logic;
    signal data_src : std_logic;
    signal data     : std_logic_vector (15 downto 0);
    signal reg0     : std_logic_vector (15 downto 0);
    signal reg1     : std_logic_vector (15 downto 0);
    signal reg2     : std_logic_vector (15 downto 0);
    signal reg3     : std_logic_vector (15 downto 0);
    signal reg4     : std_logic_vector (15 downto 0);
    signal reg5     : std_logic_vector (15 downto 0);
    signal reg6     : std_logic_vector (15 downto 0);
    signal reg7     : std_logic_vector (15 downto 0);

    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : register_file
    port map (src_s0   => src_s0,
              src_s1   => src_s1,
              src_s2   => src_s2,
              des_A0   => des_A0,
              des_A1   => des_A1,
              des_A2   => des_A2,
              Clk      => Clk,
              data_src => data_src,
              data     => data,
              reg0     => reg0,
              reg1     => reg1,
              reg2     => reg2,
              reg3     => reg3,
              reg4     => reg4,
              reg5     => reg5,
              reg6     => reg6,
              reg7     => reg7);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    
    Clk <= TbClock;

    stimuli : process
    begin
        src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '0';
        data_src <= '0';
        data <= x"0000";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '0';
        data_src <= '0';
        data <= x"1111";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '0';
        data_src <= '0';
        data <= x"2222";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '0';
        data_src <= '0';
        data <= x"3333";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '1';
        data_src <= '0';
        data <= x"4444";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '1';
        data_src <= '0';
        data <= x"5555";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '0';
        des_A1 <= '1';
        des_A2 <= '1';
        data_src <= '0';
        data <= x"6666";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '1';
        des_A1 <= '1';
        des_A2 <= '1';
        data_src <= '0';
        data <= x"7777";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '0';
        des_A1 <= '0';
        des_A2 <= '0';
        data_src <= '0';
        data <= x"AAAA";
		wait for 100 ns;
		
		src_s0 <= '0';
        src_s1 <= '0';
        src_s2 <= '0';
        des_A0 <= '1';
        des_A1 <= '0';
        des_A2 <= '0';
        data_src <= '1';
        data <= x"0000";

        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;