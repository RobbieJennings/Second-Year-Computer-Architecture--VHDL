library ieee;
use ieee.std_logic_1164.all;

entity tb_alu_bit_slice is
end tb_alu_bit_slice;

architecture tb of tb_alu_bit_slice is

    component alu_bit_slice
        port (A    : in std_logic;
              B    : in std_logic;
              Cin  : in std_logic;
              S0   : in std_logic;
              S1   : in std_logic;
              S2   : in std_logic;
              G    : out std_logic;
              Cout : out std_logic);
    end component;

    signal A    : std_logic;
    signal B    : std_logic;
    signal Cin  : std_logic;
    signal S0   : std_logic;
    signal S1   : std_logic;
    signal S2   : std_logic;
    signal G    : std_logic;
    signal Cout : std_logic;

begin

    dut : alu_bit_slice
    port map (A    => A,
              B    => B,
              Cin  => Cin,
              S0   => S0,
              S1   => S1,
              S2   => S2,
              G    => G,
              Cout => Cout);

    stimuli : process
    begin
        -- G = A
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A + 1
        A <= '1';
        B <= '0';
        Cin <= '1';
        S0 <= '0';
        S1 <= '0';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A + B
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '1';
        S1 <= '0';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A + B + 1
        A <= '1';
        B <= '0';
        Cin <= '1';
        S0 <= '1';
        S1 <= '0';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A + !B
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '0';
        S1 <= '1';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A + !B + 1
        A <= '1';
        B <= '0';
        Cin <= '1';
        S0 <= '0';
        S1 <= '1';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A - 1
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '1';
        S1 <= '1';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A
        A <= '1';
        B <= '0';
        Cin <= '1';
        S0 <= '1';
        S1 <= '1';
        S2 <= '0';
        wait for 50 ns;
        
        -- G = A AND B
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '0';
        S1 <= '0';
        S2 <= '1';
        wait for 50 ns;
        
        -- G = A OR B
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '1';
        S1 <= '0';
        S2 <= '1';
        wait for 50 ns;
        
        -- G = A XOR B
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '0';
        S1 <= '1';
        S2 <= '1';
        wait for 50 ns;
        
        -- G = NOT A
        A <= '1';
        B <= '0';
        Cin <= '0';
        S0 <= '1';
        S1 <= '1';
        S2 <= '1';                                

        wait;
    end process;

end tb;