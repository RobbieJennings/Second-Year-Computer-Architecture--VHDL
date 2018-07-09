library ieee;
use ieee.std_logic_1164.all;

entity tb_memory is
end tb_memory;

architecture tb of tb_memory is

    component memory
        port (address    : in std_logic_vector (15 downto 0);
              write_data : in std_logic_vector (15 downto 0);
              MemWrite   : in std_logic;
              MemRead    : in std_logic;
              read_data  : out std_logic_vector (15 downto 0));
    end component;

    signal address    : std_logic_vector (15 downto 0);
    signal write_data : std_logic_vector (15 downto 0);
    signal MemWrite   : std_logic;
    signal MemRead    : std_logic;
    signal read_data  : std_logic_vector (15 downto 0);

begin

    dut : memory
    port map (address    => address,
              write_data => write_data,
              MemWrite   => MemWrite,
              MemRead    => MemRead,
              read_data  => read_data);

    stimuli : process
    begin
        address <= x"0000";
        write_data <= x"DEAD";
        MemWrite <= '0';
        MemRead <= '1';
        wait for 100 ns;
        
        address <= x"0000";
        write_data <= x"DEAD";
        MemWrite <= '1';
        MemRead <= '0';
        wait for 100 ns;

        address <= x"0000";
        write_data <= x"BEEF";
        MemWrite <= '0';
        MemRead <= '1';
        wait for 100 ns;
        
        address <= x"0000";
        write_data <= x"BEEF";
        MemWrite <= '1';
        MemRead <= '0';        
        
        wait;
    end process;

end tb;