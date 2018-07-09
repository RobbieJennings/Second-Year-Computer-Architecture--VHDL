library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is
	 port (
             selA     : in std_logic_vector (3 downto 0);
             selB     : in std_logic_vector (3 downto 0);
             sel_des  : in std_logic_vector (3 downto 0);
             Clk      : in std_logic;
             load_en  : in std_logic;
             Ddata    : in std_logic_vector (15 downto 0);
             Adata    : out std_logic_vector (15 downto 0);
             Bdata    : out std_logic_vector (15 downto 0));
end register_file;

architecture Behavioral of register_file is
-- components

	-- 16 bit Register for register file
	COMPONENT reg16
		PORT(
			D : IN std_logic_vector(15 downto 0);
			load : IN std_logic;
			Clk : IN std_logic;
			Q : OUT std_logic_vector(15 downto 0));
	END COMPONENT;
	
	-- 3 to 8 Decoder
	COMPONENT decoder_3to8
		PORT(
			A0 : IN std_logic;
			A1 : IN std_logic;
			A2 : IN std_logic;
			Q0 : OUT std_logic;
			Q1 : OUT std_logic;
			Q2 : OUT std_logic;
			Q3 : OUT std_logic;
			Q4 : OUT std_logic;
			Q5 : OUT std_logic;
			Q6 : OUT std_logic;
			Q7 : OUT std_logic);
	END COMPONENT;
	
	-- 8 to 1 line multiplexer
	COMPONENT mux8_16bit
		PORT(
			In0 : IN std_logic_vector(15 downto 0);
			In1 : IN std_logic_vector(15 downto 0);
			In2 : IN std_logic_vector(15 downto 0);
			In3 : IN std_logic_vector(15 downto 0);
			In4 : IN std_logic_vector(15 downto 0);
			In5 : IN std_logic_vector(15 downto 0);
			In6 : IN std_logic_vector(15 downto 0);
			In7 : IN std_logic_vector(15 downto 0);
			S0 : IN std_logic;
			S1 : IN std_logic;
			S2 : IN std_logic;
			Z : OUT std_logic_vector(15 downto 0));
	END COMPONENT;
	
	-- 2 to 1 line multiplexer
	COMPONENT mux2_16bit
	   Port(
	       In0 : IN std_logic_vector(15 downto 0);
	       In1 : IN std_logic_vector(15 downto 0);
	       S   : In std_logic;
	       Z   : OUT std_logic_vector(15 downto 0));
	 END COMPONENT;
          
      -- 2 to 1 line demultiplexer
      COMPONENT demux2_16bit
         Port(
             D   : IN std_logic_vector(15 downto 0);
             S   : In std_logic;
             Z0  : OUT std_logic_vector(15 downto 0);
             Z1  : OUT std_logic_vector(15 downto 0));
       END COMPONENT;

	-- signals
	signal load0, load1, load2, load3, load4, load5, load6, load7,
	   load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : std_logic;
	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, regA_q, regB_q, Ddata_q, TDdata_q: std_logic_vector(15 downto 0);
		
	begin
	-- port maps

    load0 <= load_en and load_reg0 after 1 ns;
    load1 <= load_en and load_reg1 after 1 ns;
    load2 <= load_en and load_reg2 after 1 ns;
    load3 <= load_en and load_reg3 after 1 ns;
    load4 <= load_en and load_reg4 after 1 ns;
    load5 <= load_en and load_reg5 after 1 ns;
    load6 <= load_en and load_reg6 after 1 ns;
    load7 <= load_en and load_reg7 after 1 ns;    
    
	-- register 0
	reg00: reg16 PORT MAP(
		D => Ddata_q,
		load => load0,
		Clk => Clk,
		Q => reg0_q);
	
	-- register 1
	reg01: reg16 PORT MAP(
		D => Ddata_q,
		load => load1,
		Clk => Clk,
		Q => reg1_q);
	
	-- register 2
	reg02: reg16 PORT MAP(
		D => Ddata_q,
		load => load2,
		Clk => Clk,
		Q => reg2_q);
	
	-- register 3
	reg03: reg16 PORT MAP(
		D => Ddata_q,
		load => load3,
		Clk => Clk,
		Q => reg3_q);
	
	-- register 4
	reg04: reg16 PORT MAP(
		D => Ddata_q,
		load => load4,
		Clk => Clk,
		Q => reg4_q);
	
	-- register 5
	reg05: reg16 PORT MAP(
		D => Ddata_q,
		load => load5,
		Clk => Clk,
		Q => reg5_q);
	
	-- register 6
	reg06: reg16 PORT MAP(
		D => Ddata_q,
		load => load6,
		Clk => Clk,
		Q => reg6_q);
	
	-- register 7
	reg07: reg16 PORT MAP(
		D => Ddata_q,
		load => load7,
		Clk => Clk,
		Q => reg7_q);
            
    -- register 8
    reg08: reg16 PORT MAP(
        D => TDdata_q,
        load => load_en,
        Clk => Clk,
        Q => reg8_q);
	
	-- Destination register decoder
	des_decoder_3to8: decoder_3to8 PORT MAP(
		A0 => sel_des(3),
		A1 => sel_des(2),
		A2 => sel_des(1),
		Q0 => load_reg0,
		Q1 => load_reg1,
		Q2 => load_reg2,
		Q3 => load_reg3,
		Q4 => load_reg4,
		Q5 => load_reg5,
		Q6 => load_reg6,
		Q7 => load_reg7);
	
	-- 8 to 1 A register multiplexer
	Inst_A_mux8_16bit: mux8_16bit PORT MAP(
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		S0 => selA(3),
		S1 => selA(2),
		S2 => selA(1),
		Z => regA_q);
		
	-- 8 to 1 B register multiplexer
    Inst_B_mux8_16bit: mux8_16bit PORT MAP(
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        S0 => selB(3),
        S1 => selB(2),
        S2 => selB(1),
        Z => regB_q);
        
    -- 2 to 1 TA multiplexer
    Inst_TA_mux2_16bit: mux2_16bit PORT MAP(
        In0 => regA_q,
        In1 => reg8_q,
        S => selA(0),
        Z => Adata);
        
    -- 2 to 1 TB multiplexer
    Inst_TB_mux2_16bit: mux2_16bit PORT MAP(
        In0 => regB_q,
        In1 => reg8_q,
        S => selB(0),
        Z => Bdata);
        
    -- 2 to 1 TD demultiplexer
    Inst_TD_demux2_16bit: demux2_16bit PORT MAP(
        D => Ddata,
        S => sel_des(0),
        Z0 => Ddata_q,
        Z1 => TDdata_q);

end Behavioral;