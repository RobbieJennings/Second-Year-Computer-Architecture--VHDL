library ieee;
use ieee.std_logic_1164.all;

entity tb_logic_bit_slice is
end tb_logic_bit_slice;

architecture tb of tb_logic_bit_slice is

    component logic_bit_slice
        port (A  : in std_logic;
              B  : in std_logic;
              S0 : in std_logic;
              S1 : in std_logic;
              G  : out std_logic);
    end component;

    signal A  : std_logic;
    signal B  : std_logic;
    signal S0 : std_logic;
    signal S1 : std_logic;
    signal G  : std_logic;

begin

    dut : logic_bit_slice
    port map (A  => A,
              B  => B,
              S0 => S0,
              S1 => S1,
              G  => G);

    stimuli : process
    begin
        -- G = A AND B
        A <= '0';
        B <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 50 ns;
                
        A <= '0';
        B <= '1';
        S0 <= '0';
        S1 <= '0';
        wait for 50 ns;
        
        A <= '1';
        B <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 50 ns;
                
        A <= '1';
        B <= '1';
        S0 <= '0';
        S1 <= '0';
        wait for 50 ns;
        
        -- G = A OR B
        A <= '0';
        B <= '0';
        S0 <= '1';
        S1 <= '0';
        wait for 50 ns;
        
        A <= '0';
        B <= '1';
        S0 <= '1';
        S1 <= '0';
        wait for 50 ns;
        
        A <= '1';
        B <= '0';
        S0 <= '1';
        S1 <= '0';
        wait for 50 ns;
        
        A <= '1';
        B <= '1';
        S0 <= '1';
        S1 <= '0';
        wait for 50 ns;
        
        -- G = A XOR B
        A <= '0';
        B <= '0';
        S0 <= '0';
        S1 <= '1';
        wait for 50 ns;
       
        A <= '0';
        B <= '1';
        S0 <= '0';
        S1 <= '1';
        wait for 50 ns;
        
        A <= '1';
        B <= '0';
        S0 <= '0';
        S1 <= '1';
        wait for 50 ns;
        
        A <= '1';
        B <= '1';
        S0 <= '0';
        S1 <= '1';
        wait for 50 ns;
        
        -- G = NOT A        
        A <= '0';
        B <= '0';
        S0 <= '1';
        S1 <= '1';
        wait for 50 ns;
        
        A <= '0';
        B <= '1';
        S0 <= '1';
        S1 <= '1';
        wait for 50 ns;
                
        A <= '1';
        B <= '0';
        S0 <= '1';
        S1 <= '1';
        wait for 50 ns;
        
        A <= '1';
        B <= '1';
        S0 <= '1';
        S1 <= '1';
        wait for 50 ns;
        
        wait;
    end process;

end tb;