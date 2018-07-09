library ieee;
use ieee.std_logic_1164.all;

entity tb_alu is
end tb_alu;

architecture tb of tb_alu is

    component alu
        port (A    : in std_logic_vector (15 downto 0);
              B    : in std_logic_vector (15 downto 0);
              Gsel : in std_logic_vector (3 downto 0);
              G    : out std_logic_vector (15 downto 0);
              V    : out std_logic;
              C    : out std_logic);
    end component;

    signal A    : std_logic_vector (15 downto 0);
    signal B    : std_logic_vector (15 downto 0);
    signal Gsel : std_logic_vector (3 downto 0);
    signal G    : std_logic_vector (15 downto 0);
    signal V    : std_logic;
    signal C    : std_logic;

begin

    dut : alu
    port map (A    => A,
              B    => B,
              Gsel => Gsel,
              G    => G,
              V    => V,
              C    => C);

    stimuli : process
    begin
        -- G = A
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0000";
        wait for 50 ns;
        
        -- G = A + 1
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0001";
        wait for 50 ns;
        
        -- G = A + B
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0010";
        wait for 50 ns;
        
        -- G = A + B + 1
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0011";
        wait for 50 ns;
        
        -- G = A + !B
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0100";
        wait for 50 ns;
        
        -- G = A + !B + 1
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0101";
        wait for 50 ns;
        
        -- G = A - 1
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0110";
        wait for 50 ns;
        
        -- G = A
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "0111";
        wait for 50 ns;
        
        -- G = A AND B
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "1000";
        wait for 50 ns;
        
        -- G = A OR B
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "1010";
        wait for 50 ns;
        
        -- G = A XOR B
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "1100";
        wait for 50 ns;
        
        -- G = NOT A
        A <= x"AAAA";
        B <= x"BBBB";
        Gsel <= "1110";
        wait for 50 ns;
                
        wait;
    end process;

end tb;