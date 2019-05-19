----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:31:50 11/26/2011 
-- Design Name: 
-- Module Name:    Registe_File - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Registe_File is
    Port ( Rs : in  STD_LOGIC_VECTOR (1 downto 0);
           Rt : in  STD_LOGIC_VECTOR (1 downto 0);
           Clk_RF : in  STD_LOGIC;
           Dw : in  STD_LOGIC_VECTOR (3 downto 0);
           Rw : in  STD_LOGIC_VECTOR (1 downto 0);
           Rf : in  STD_LOGIC;
			  Crs : out STD_LOGIC_VECTOR (3 downto 0);
			  Crt : out STD_LOGIC_VECTOR (3 downto 0));
end Registe_File;

architecture Behavioral of Registe_File is

component Decodificador is
	port(
			  Rw_Dec : in  STD_LOGIC_VECTOR (1 downto 0);
           Rf_Dec : in  STD_LOGIC;
           Dec_out_R0 : out  STD_LOGIC;
			  Dec_out_R1 : out  STD_LOGIC;
			  Dec_out_R2 : out  STD_LOGIC;
			  Dec_out_R3 : out  STD_LOGIC
		  );
end component;

component Registers is
	port(
			  Dw_Reg : in  STD_LOGIC_VECTOR (3 downto 0);
           Out_Dec_R : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0)
		  );
end component;

component Multiplexor is
	port(
			  Q0 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q3 : in  STD_LOGIC_VECTOR (3 downto 0);
           R_Mux : in  STD_LOGIC_VECTOR (1 downto 0);
           Cr : out  STD_LOGIC_VECTOR (3 downto 0)
		  );
end component;

signal in_Reg_Dec0 : STD_LOGIC;
signal in_Reg_Dec1 : STD_LOGIC;
signal in_Reg_Dec2 : STD_LOGIC;
signal in_Reg_Dec3 : STD_LOGIC;
signal in_Mux_Q0 : STD_LOGIC_VECTOR (3 downto 0);
signal in_Mux_Q1 : STD_LOGIC_VECTOR (3 downto 0);
signal in_Mux_Q2 : STD_LOGIC_VECTOR (3 downto 0);
signal in_Mux_Q3 : STD_LOGIC_VECTOR (3 downto 0);
signal Out_Mux_Crs: STD_LOGIC_VECTOR (3 downto 0);
signal Out_Mux_Crt: STD_LOGIC_VECTOR (3 downto 0);

begin

	mod_Decodificador: Decodificador port map (Rw, Rf, in_Reg_Dec0, in_Reg_Dec1, in_Reg_Dec2, in_Reg_Dec3);
	mod_Register0: Registers port map (Dw, in_Reg_Dec0, Clk_RF, in_Mux_Q0);
	mod_Register1: Registers port map (Dw, in_Reg_Dec1, Clk_RF, in_Mux_Q1);
	mod_Register2: Registers port map (Dw, in_Reg_Dec2, Clk_RF, in_Mux_Q2);
	mod_Register3: Registers port map (Dw, in_Reg_Dec3, Clk_RF, in_Mux_Q3);
	mod_Mux0 : Multiplexor port map (in_Mux_Q0, in_Mux_Q1, in_Mux_Q2, in_Mux_Q3, Rs, Out_Mux_Crs);
	mod_Mux1 : Multiplexor port map (in_Mux_Q0, in_Mux_Q1, in_Mux_Q2, in_Mux_Q3, Rt, Out_Mux_Crt);
	Crs <= Out_Mux_Crs;
	Crt <= Out_Mux_Crt;
	
end Behavioral;

