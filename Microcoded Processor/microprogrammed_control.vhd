library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity microprogrammed_control is
    PORT(
        flags: In std_logic_vector(3 downto 0);
        reset: IN std_logic;
        Clk: IN std_logic;
        D: IN std_logic_vector(15 downto 0);
        PCout: OUT std_logic_vector(15 downto 0));
end microprogrammed_control;

architecture Behavioral of microprogrammed_control is

COMPONENT pc
    PORT(
        PL: IN std_logic;
        PI: IN std_logic;
        Reset: IN std_logic;
        Clk: IN std_logic;
        PCin: IN std_logic_vector(15 downto 0);
        PCout: OUT std_logic_vector(15 downto 0));
END COMPONENT;

COMPONENT ir
    PORT(
        D : IN std_logic_vector(15 downto 0);
        IL : IN std_logic;
        Clk : IN std_logic;
        SB : OUT std_logic_vector(2 downto 0);
        SA : OUT std_logic_vector(2 downto 0);
        DR : OUT std_logic_vector(2 downto 0);
        Opcode: OUT std_logic_vector(6 downto 0));
END COMPONENT;

COMPONENT car
    PORT(
        CARsel: IN std_logic;
        reset: IN std_logic;
        Clk: IN std_logic;
        CARin: IN std_logic_vector(7 downto 0);
        Cout : OUT std_logic;
        CARout: OUT std_logic_vector(7 downto 0));    
END COMPONENT;

COMPONENT mux2_8bit
    PORT(
        In0 : in std_logic_vector(7 downto 0);
        In1 : in std_logic_vector(7 downto 0);
        S : in std_logic;
        Z : out std_logic_vector(7 downto 0));
END COMPONENT;

COMPONENT mux8		   
    PORT(
        In0: IN std_logic; 
        In1: IN std_logic;
        In2: IN std_logic; 
        In3: IN std_logic;
        In4: IN std_logic; 
        In5: IN std_logic;
        In6: IN std_logic; 
        In7: IN std_logic;
        S0: IN std_logic;
        S1: IN std_logic;
        S2: IN std_logic;
        Z: OUT std_logic);
END COMPONENT;

COMPONENT Control_Memory
    PORT(
        MW : out std_logic;
        MM : out std_logic;
        RW : out std_logic;
        MD : out std_logic;
        FS : out std_logic_vector(4 downto 0);
        MB : out std_logic;
        TB : out std_logic;
        TA : out std_logic;
        TD : out std_logic;
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(7 downto 0);
        IN_CAR : in std_logic_vector(7 downto 0));
END COMPONENT;
		       
signal SB_out, SA_out, DR_out: std_logic_vector(2 downto 0);
signal Opcode_Sig: std_logic_vector(6 downto 0);
signal Mux_C_In, Mux_C_Out: std_logic_vector(7 downto 0);
signal Not_flags, C_and_Z: std_logic_vector(1 downto 0);
signal Mux_S_Out: std_logic;
signal Car_Out_Sig: std_logic_vector(7 downto 0);
signal MW_Sig, MM_Sig, RW_Sig, MD_Sig, MB_Sig, TB_Sig, TA_Sig, TD_Sig, PL_Sig, PI_Sig, IL_Sig, MC_Sig: std_logic;
signal FS_Sig: std_logic_vector(4 downto 0); 
signal MS_Sig: std_logic_vector(2 downto 0);
signal NA_Sig: std_logic_vector(7 downto 0);
signal PC_In_Sig: std_logic_vector(15 downto 0);
signal flags_In_Sig: std_logic_vector(5 downto 0);

begin

    PC_In_Sig(15 downto 6) <= "0000000000";
    PC_In_Sig(5 downto 3) <= DR_out;
    PC_In_Sig(2 downto 0) <= SB_out;
    
    PCC: pc PORT MAP(
        PL => PL_Sig,
        PI => PI_Sig,
        reset => reset,
        Clk => Clk,
        PCin => PC_In_Sig,
        PCout => PCout);
        
    IRR: ir PORT MAP(
        D => D,
        IL => IL_Sig,
        Clk => Clk,
        SB => SB_out,
        SA => SA_out,
        DR => DR_out,
        Opcode => Opcode_sig);
        
    Mux_C_In(0) <= '0';
    Mux_C_In (7 downto 1) <= Opcode_sig;
       
    muxC: mux2_8bit PORT MAP(
        In0 => NA_Sig,
        In1 => Mux_C_In,
        S => MC_Sig,
        Z => Mux_C_Out);
    
    C_and_Z <= flags(3 downto 2);
    Not_flags <= NOT(C_and_Z);
    flags_In_Sig(5 downto 4) <= Not_flags;
    flags_In_Sig(3 downto 0) <= flags;
    
    muxS: mux8 PORT MAP(
        In0 => '0',
        In1 => '1',
        In2 => flags_In_Sig(0),
        In3 => flags_In_Sig(1),
        In4 => flags_In_Sig(2),
        In5 => flags_In_Sig(3), 
        In6 => flags_In_Sig(4),
        In7 => flags_In_Sig(5),         
        S0 => MS_Sig(0),
        S1 => MS_Sig(1),
        S2 => MS_Sig(2),
        Z => Mux_S_Out);  
        
    Ca: car PORT MAP(
        CARsel => Mux_S_Out,
        reset => reset,
        Clk => Clk,
        CARin => Mux_C_Out,
        CARout => Car_Out_Sig);
        
    CM: Control_Memory PORT MAP(
        MW => MW_Sig,
        MM => MM_Sig,
        RW => RW_Sig,
        MD => MD_Sig,
        FS => FS_Sig,
        MB => MB_Sig,
        TB => TB_Sig,
        TA => TA_Sig,
        TD => TD_Sig,
        PL => PL_Sig,
        PI => PI_Sig,
        IL => IL_Sig,
        MC => MC_Sig,
        MS => MS_Sig,
        NA => NA_Sig,
        IN_CAR => Car_Out_Sig);

end Behavioral;