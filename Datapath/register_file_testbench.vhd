library ieee;
use ieee.std_logic_1164.all;

entity tb_register_file is
end tb_register_file;

architecture tb of tb_register_file is

    component register_file
        port (selA    : in std_logic_vector (2 downto 0);
              selB    : in std_logic_vector (2 downto 0);
              sel_des : in std_logic_vector (2 downto 0);
              Clk     : in std_logic;
              load_en : in std_logic;
              Ddata   : in std_logic_vector (15 downto 0);
              Adata   : out std_logic_vector (15 downto 0);
              Bdata   : out std_logic_vector (15 downto 0));
    end component;

    signal selA    : std_logic_vector (2 downto 0);
    signal selB    : std_logic_vector (2 downto 0);
    signal sel_des : std_logic_vector (2 downto 0);
    signal Clk     : std_logic;
    signal load_en : std_logic;
    signal Ddata   : std_logic_vector (15 downto 0);
    signal Adata   : std_logic_vector (15 downto 0);
    signal Bdata   : std_logic_vector (15 downto 0);

    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : register_file
    port map (selA    => selA,
              selB    => selB,
              sel_des => sel_des,
              Clk     => Clk,
              load_en => load_en,
              Ddata   => Ddata,
              Adata   => Adata,
              Bdata   => Bdata);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    
    Clk <= TbClock;

    stimuli : process
    begin
    
        selA <= "000";
        selB <= "111";
        sel_des <= "000";
        load_en <= '1';
        Ddata <= x"0000";
        wait for 100 ns;

        selA <= "000";
        selB <= "111";
        sel_des <= "001";
        load_en <= '1';
        Ddata <= x"1111";
        wait for 100 ns;

        selA <= "000";
        selB <= "111";
        sel_des <= "010";
        load_en <= '1';
        Ddata <= x"2222";
        wait for 100 ns;

        selA <= "000";
        selB <= "111";
        sel_des <= "011";
        load_en <= '1';
        Ddata <= x"3333";
        wait for 100 ns;

        selA <= "000";
        selB <= "111";
        sel_des <= "100";
        load_en <= '1';
        Ddata <= x"4444";
        wait for 100 ns;

        selA <= "000";
        selB <= "111";
        sel_des <= "101";
        load_en <= '1';
        Ddata <= x"5555";
        wait for 100 ns;

        selA <= "000";
        selB <= "111";
        sel_des <= "110";
        load_en <= '1';
        Ddata <= x"6666";
        wait for 100 ns;

        selA <= "000";
        selB <= "111";
        sel_des <= "111";
        load_en <= '1';
        Ddata <= x"7777";
        wait for 100 ns;
        
        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;