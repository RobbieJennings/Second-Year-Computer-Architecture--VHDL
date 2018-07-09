library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
	 port (
	         CLK        : in std_logic;
	         Con_wor    : in std_logic_vector(16 downto 0);
             Con_in     : in std_logic_vector(15 downto 0);
             Dat_in     : in std_logic_vector(15 downto 0);
             Add_out    : out std_logic_vector(15 downto 0);
             Dat_out    : out std_logic_vector(15 downto 0);
             Vout       : out std_logic;
             Cout       : out std_logic;
             Nout       : out std_logic;
             Zout       : out std_logic);
end datapath;

architecture Behavioral of datapath is
-- components
	
	-- functional unit
	COMPONENT functional_unit
	   PORT(
	       A      : in std_logic_vector(15 downto 0);
           B      : in std_logic_vector(15 downto 0);
           Fsel   : in std_logic_vector(4 downto 0);
           Fout   : out std_logic_vector(15 downto 0);
           Vout   : out std_logic;
           Cout   : out std_logic;
           Nout   : out std_logic;
           Zout   : out std_logic);
   END COMPONENT;
   
   -- register file
   COMPONENT register_file
      PORT(
          selA     : in std_logic_vector (2 downto 0);
          selB     : in std_logic_vector (2 downto 0);
          sel_des  : in std_logic_vector (2 downto 0);
          Clk      : in std_logic;
          load_en  : in std_logic;
          Ddata    : in std_logic_vector (15 downto 0);
          Adata    : out std_logic_vector (15 downto 0);
          Bdata    : out std_logic_vector (15 downto 0));
    END COMPONENT;

  -- 16 bit 2 to 1 line multiplexer
  COMPONENT mux2_16bit
      PORT(
          In0 : IN std_logic_vector(15 downto 0);
          In1 : IN std_logic_vector(15 downto 0);
          S   : IN std_logic;
          Z   : OUT std_logic_vector(15 downto 0));
  END COMPONENT;
  
    -- signals
    signal A : std_logic_vector(15 downto 0);
    signal B : std_logic_vector(15 downto 0);
    signal B_dat : std_logic_vector(15 downto 0);
    signal F : std_logic_vector(15 downto 0);
    signal D : std_logic_vector(15 downto 0);
        	
	begin
	-- port maps
        
    -- funcional unit
    func_unit : functional_unit PORT MAP(
        A => A,
        B => B,
        Fsel => Con_wor(6 downto 2),
        Fout => F,
        Vout => Vout,
        Cout => Cout,
        Nout => Nout,
        Zout => Zout);
        
    -- register file
    reg_file : register_file PORT MAP(
        selA => con_wor(13 downto 11),
        selB => con_wor(10 downto 8),
        sel_des => con_wor(16 downto 14),
        Clk => CLK,
        load_en => con_wor(0),
        Ddata => D,
        Adata => A,
        Bdata => B_dat);
        
	-- mux B 16 bit 2 to 1 line multiplexer
    muxB: mux2_16bit PORT MAP(
        In0 => B_dat,
        In1 => Con_in,
        S => Con_wor(7),
        Z => B);
        
    -- mux D 16 bit 2 to 1 line multiplexer
    muxD: mux2_16bit PORT MAP(
        In0 => F,
        In1 => Dat_in,
        S => Con_wor(1),
        Z => D);
        
    -- set Address out
    Add_out <= A;
    
    -- set Address out
    dat_out <= B;
                        
end Behavioral;