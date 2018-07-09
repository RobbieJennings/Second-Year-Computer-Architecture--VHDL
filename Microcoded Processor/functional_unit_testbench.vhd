library ieee;
use ieee.std_logic_1164.all;

entity tb_functional_unit is
end tb_functional_unit;

architecture tb of tb_functional_unit is

    component functional_unit
        port (A    : in std_logic_vector (15 downto 0);
              B    : in std_logic_vector (15 downto 0);
              Fsel : in std_logic_vector (4 downto 0);
              Fout : out std_logic_vector (15 downto 0);
              Vout : out std_logic;
              Cout : out std_logic;
              Nout : out std_logic;
              Zout : out std_logic);
    end component;

    signal A    : std_logic_vector (15 downto 0);
    signal B    : std_logic_vector (15 downto 0);
    signal Fsel : std_logic_vector (4 downto 0);
    signal Fout : std_logic_vector (15 downto 0);
    signal Vout : std_logic;
    signal Cout : std_logic;
    signal Nout : std_logic;
    signal Zout : std_logic;

begin

    dut : functional_unit
    port map (A    => A,
              B    => B,
              Fsel => Fsel,
              Fout => Fout,
              Vout => Vout,
              Cout => Cout,
              Nout => Nout,
              Zout => Zout);

    stimuli : process
    begin
        -- arithmetic functions
        -- F = A
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00000";
        wait for 50 ns;
        
        -- F = A + 1
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00001";
        wait for 50 ns;
        
        -- F = A + B       
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00010";
        wait for 50 ns;
        
        -- F = A + B + 1
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00011";
        wait for 50 ns;
        
        -- F = A + ¬B
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00100";
        wait for 50 ns;
        
        -- F = A + ¬B + 1        
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00101";
        wait for 50 ns;
        
        -- F = A - 1
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00110";
        wait for 50 ns;

        -- F = A
        A <= x"1111";
        B <= x"2222";
        Fsel <= "00111";
        wait for 50 ns;
        
        -- logic functions
        -- F = A ^ B
        A <= x"1111";
        B <= x"2222";
        Fsel <= "01000";
        wait for 50 ns;
        
        -- F = A V B
        A <= x"1111";
        B <= x"2222";
        Fsel <= "01010";
        wait for 50 ns;
        
        -- F = A XOR B
        A <= x"1111";
        B <= x"2222";
        Fsel <= "01100";
        wait for 50 ns;
        
        -- F = ¬A
        A <= x"1111";
        B <= x"2222";
        Fsel <= "01110";
        wait for 50 ns;
        
        -- shift functions
        -- F = B
        A <= x"1111";
        B <= x"2222";
        Fsel <= "10000";
        wait for 50 ns;
        
        -- F = srB
        A <= x"1111";
        B <= x"2222";
        Fsel <= "10100";
        wait for 50 ns;
        
        -- F = slB
        A <= x"1111";
        B <= x"2222";
        Fsel <= "11000";
        wait for 50 ns;
        
        -- check overflow
        A <= x"5555";
        B <= x"5555";
        Fsel <= "00010";
        wait for 50 ns;
        
        -- check carry
        A <= x"ffff";
        B <= x"ffff";
        Fsel <= "00010";
        wait for 50 ns;
        
        -- check negative
        A <= x"aaaa";
        B <= x"1111";
        Fsel <= "00010";
        wait for 50 ns;
                
        -- check zero
        A <= x"0000";
        B <= x"0000";
        Fsel <= "00010";
        
        wait;
    end process;

end tb;