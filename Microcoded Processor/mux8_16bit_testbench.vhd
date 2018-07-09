library ieee;
use ieee.std_logic_1164.all;

entity tb_mux8_16bit is
end tb_mux8_16bit;

architecture tb of tb_mux8_16bit is

    component mux8_16bit
        port (In0 : in std_logic_vector (15 downto 0);
              In1 : in std_logic_vector (15 downto 0);
              In2 : in std_logic_vector (15 downto 0);
              In3 : in std_logic_vector (15 downto 0);
              In4 : in std_logic_vector (15 downto 0);
              In5 : in std_logic_vector (15 downto 0);
              In6 : in std_logic_vector (15 downto 0);
              In7 : in std_logic_vector (15 downto 0);
              S0  : in std_logic;
              S1  : in std_logic;
              S2  : in std_logic;
              Z   : out std_logic_vector (15 downto 0));
    end component;

    signal In0 : std_logic_vector (15 downto 0);
    signal In1 : std_logic_vector (15 downto 0);
    signal In2 : std_logic_vector (15 downto 0);
    signal In3 : std_logic_vector (15 downto 0);
    signal In4 : std_logic_vector (15 downto 0);
    signal In5 : std_logic_vector (15 downto 0);
    signal In6 : std_logic_vector (15 downto 0);
    signal In7 : std_logic_vector (15 downto 0);
    signal S0  : std_logic;
    signal S1  : std_logic;
    signal S2  : std_logic;
    signal Z   : std_logic_vector (15 downto 0);

begin

    dut : mux8_16bit
    port map (In0 => In0,
              In1 => In1,
              In2 => In2,
              In3 => In3,
              In4 => In4,
              In5 => In5,
              In6 => In6,
              In7 => In7,
              S0  => S0,
              S1  => S1,
              S2  => S2,
              Z   => Z);

    stimuli : process
    begin
        In0 <= x"0000";
        In1 <= x"1111";
        In2 <= x"2222";
        In3 <= x"3333";
        In4 <= x"4444";
        In5 <= x"5555";
        In6 <= x"6666";
        In7 <= x"7777";
        
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        wait for 100 ns;

        S0 <= '1';
        S1 <= '0';
        S2 <= '0';
        wait for 100 ns;
        
        S0 <= '0';
        S1 <= '1';
        S2 <= '0';
        wait for 100 ns;
        
        S0 <= '1';
        S1 <= '1';
        S2 <= '0';
        wait for 100 ns;
        
        S0 <= '0';
        S1 <= '0';
        S2 <= '1';
        wait for 100 ns;
        
        S0 <= '1';
        S1 <= '0';
        S2 <= '1';
        wait for 100 ns;
        
        S0 <= '0';
        S1 <= '1';
        S2 <= '1';
        wait for 100 ns;
                
        S0 <= '1';
        S1 <= '1';
        S2 <= '1';
        
        wait;
    end process;

end tb;