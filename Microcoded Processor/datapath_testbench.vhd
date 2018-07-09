library ieee;
use ieee.std_logic_1164.all;

entity tb_datapath is
end tb_datapath;

architecture tb of tb_datapath is

    component datapath
        port (CLK       : in std_logic;
              Con_wor   : in std_logic_vector (20 downto 0);
              Con_in    : in std_logic_vector (15 downto 0);
              Dat_in    : in std_logic_vector (15 downto 0);
              prog_count: in std_logic_vector(15 downto 0);
              Add_out   : out std_logic_vector (15 downto 0);
              Dat_out   : out std_logic_vector (15 downto 0);
              Vout      : out std_logic;
              Cout      : out std_logic;
              Nout      : out std_logic;
              Zout      : out std_logic);
    end component;

    signal CLK     : std_logic;
    signal Con_wor : std_logic_vector (20 downto 0);
    signal Con_in  : std_logic_vector (15 downto 0);
    signal Dat_in  : std_logic_vector (15 downto 0);
    signal prog_count : std_logic_vector (15 downto 0);
    signal Add_out : std_logic_vector (15 downto 0);
    signal Dat_out : std_logic_vector (15 downto 0);
    signal Vout    : std_logic;
    signal Cout    : std_logic;
    signal Nout    : std_logic;
    signal Zout    : std_logic;

    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : datapath
    port map (CLK     => CLK,
              Con_wor => Con_wor,
              Con_in  => Con_in,
              Dat_in  => Dat_in,
              prog_count => prog_count,
              Add_out => Add_out,
              Dat_out => Dat_out,
              Vout    => Vout,
              Cout    => Cout,
              Nout    => Nout,
              Zout    => Zout);
              
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    
    CLK <= TbClock;

    stimuli : process
    begin        
        -- load reg0
        Con_wor <= ("000000000000000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"0000");
        wait for 100 ns;
        
        -- load reg1
        Con_wor <= ("000100010001000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"1111");
        wait for 100 ns;
        
        -- load reg2
        Con_wor <= ("001000100010000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"2222");
        wait for 100 ns;
        
        -- load reg3
        Con_wor <= ("001100110011000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"3333");
        wait for 100 ns;
        
        -- load reg4
        Con_wor <= ("010001000100000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"4444");
        wait for 100 ns;
        
        -- load reg5
        Con_wor <= ("010101010101000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"5555");
        wait for 100 ns;
        
        -- load reg6
        Con_wor <= ("011001100110000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"6666");
        wait for 100 ns;
        
        -- load reg7
        Con_wor <= ("011101110111000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"7777");
        wait for 100 ns;
        
        -- load A in reg 0
        Con_wor <= ("001001110000100000010");
        Con_in <= (x"AAAA");
        Dat_in <= (x"AAAA");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
        
        -- load A + 1 in reg 0
        Con_wor <= ("001001110000100001010");
        Con_in <= (x"AAAA");
        Dat_in <= (x"AAAA");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                
        -- load A + B in reg 0
        Con_wor <= ("001001110000100010010");
        Con_in <= (x"0002");
        Dat_in <= (x"AAAA");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
        
        -- load A + B + 1 in reg 0
        Con_wor <= ("001001110000100011010");
        Con_in <= (x"0002");
        Dat_in <= (x"1111");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
        
        -- load A + !B in reg 0
        Con_wor <= ("001001110000100100010");
        Con_in <= (x"fffd");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
        
        -- load A + !B + 1 in reg 0  
        Con_wor <= ("001001110000100101010");
        Con_in <= (x"fffd");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                
        -- load A - 1 in reg 0
        Con_wor <= ("001001110000100110010");
        Con_in <= (x"0000");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;           
                
        -- load A in reg 0
        Con_wor <= ("001001110000100111010");
        Con_in <= (x"AAAA");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                        
        ----------------------------------     
         
        -- load reg0
        Con_wor <= ("011100000000000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"5555");
        wait for 100 ns;
        con_wor <= ("000000000111000000000");
        wait for 100 ns;
                               
        -- load A AND B in reg 0
        Con_wor <= ("001001110000101000010");
        Con_in <= (x"1111");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                
        -- load A OR B in reg 0
        Con_wor <= ("001001110000101010010");
        Con_in <= (x"1111");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                
        -- load A XOR B in reg 0
        Con_wor <= ("001001110000101100010");
        Con_in <= (x"1111");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                
        -- load NOT A in reg 0
        Con_wor <= ("001001110000101110010");
        Con_in <= (x"AAAA");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
        
        ----------------------------------
                
        -- load B in reg 0
        Con_wor <= ("001000000000011000001");
        Con_in <= (x"BBBB");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                
        -- load srB in reg 0
        Con_wor <= ("001000000000011010001");
        Con_in <= (x"0002");
        Dat_in <= (x"0000");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
                
        -- F = slB
        Con_wor <= ("001000000000111000010");
        Con_in <= (x"0002");
        Dat_in <= (x"0000");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;
        
        -----------------------------------
                
        -- load reg0
        Con_wor <= ("000000000000000000110");
        Con_in <= (x"0000");
        Dat_in <= (x"7fff");
        wait for 100 ns;
        con_wor <= ("000000000000000000000");
        wait for 100 ns;                
                
        -- check overflow
        Con_wor <= ("001000000000010001001");
        Con_in <= (x"0002");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;

        -- check carry
        Con_wor <= ("000000100000100010010");
        Con_in <= (x"8001");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000000000000000");
        wait for 100 ns;

        -- check negative
        Con_wor <= ("001000000000100010010");
        Con_in <= (x"f000");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000010000000000");
        wait for 100 ns;

        -- check zero
        Con_wor <= ("000000100000100010010");
        Con_in <= (x"0ffe");
        Dat_in <= (x"BBBB");
        wait for 100 ns;
        con_wor <= ("000000000000000000000");
        wait for 100 ns;
        
        TbSimEnded <= '1';
        wait;
    end process;

end tb;