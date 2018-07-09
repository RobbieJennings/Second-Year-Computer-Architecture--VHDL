library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity functional_unit is
	 port (
             A      : in std_logic_vector(15 downto 0);
             B      : in std_logic_vector(15 downto 0);
             Fsel   : in std_logic_vector(4 downto 0);
             Fout   : out std_logic_vector(15 downto 0);
             Vout   : out std_logic;
             Cout   : out std_logic;
             Nout   : out std_logic;
             Zout   : out std_logic);
end functional_unit;

architecture Behavioral of functional_unit is
-- components
	
	-- algorithmic logic unit
	COMPONENT alu
	   PORT(
	       A      : in std_logic_vector(15 downto 0);
           B      : in std_logic_vector(15 downto 0);
           Gsel   : in std_logic_vector(3 downto 0);
           G      : out std_logic_vector(15 downto 0);
           V      : out std_logic;
           C      : out std_logic);
   END COMPONENT;
   
   	-- shifter
   COMPONENT shifter
      PORT(
          B      : in std_logic_vector(15 downto 0);
          Hsel   : in std_logic_vector(4 downto 3);
          Ir     : in std_logic;
          Il     : in std_logic;
          H      : out std_logic_vector(15 downto 0));
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
    signal G : std_logic_vector(15 downto 0);
    signal H : std_logic_vector(15 downto 0);
    signal F : std_logic_vector(15 downto 0);
        	
	begin
	-- port maps
        
    -- algorithmic logic unit
    algorirhmic_logic_unit : alu PORT MAP(
        A => A,
        B => B,
        Gsel => Fsel(3 downto 0),
        G => G,
        V => Vout,
        C => Cout);
        
    -- shifter
    shifter_unit : shifter PORT MAP(
        B => B,
        Hsel => Fsel(3 downto 2),
        Ir => '0',
        Il => '0',
        H => H);
        
	-- 16 bit 2 to 1 line multiplexer
    mux: mux2_16bit PORT MAP(
        In0 => G,
        In1 => H,
        S => Fsel(4),
        Z => F);
        
    -- set output
    Fout <= F;
    
    -- set negative
    Nout <= F(15);
    
    -- set overflow
    Zout <= not (F(0) or F(1) or F(2) or F(3) or F(4) or F(5) or F(6) or F(7) or F(8) or F(9) or F(10) or F(11) or F(12) or F(13) or F(14) or F(15)) after 1 ns;
                        
end Behavioral;