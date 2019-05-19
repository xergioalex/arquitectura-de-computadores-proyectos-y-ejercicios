----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:44 11/27/2011 
-- Design Name: 
-- Module Name:    Sumador_CuatroBits - Behavioral 
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

entity Sumador_CuatroBits is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Coutc : out  STD_LOGIC ;
           Sc : out  STD_LOGIC_VECTOR (3 downto 0));
end Sumador_CuatroBits;

architecture Behavioral of Sumador_CuatroBits is

component Sumador_Medio is
	port(
			  Cin : in STD_LOGIC;
			  A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC
		  );
end component;

signal in_Cin_Cout0 : STD_LOGIC ;
signal in_Cin_Cout1 : STD_LOGIC ;
signal in_Cin_Cout2 : STD_LOGIC ;
signal in_Cin_Cout3 : STD_LOGIC ;
signal in_Cin_Cout4 : STD_LOGIC ;
signal Out_Sm_Sumador0 : STD_LOGIC ;
signal Out_Sm_Sumador1 : STD_LOGIC ;
signal Out_Sm_Sumador2 : STD_LOGIC ;
signal Out_Sm_Sumador3 : STD_LOGIC ;
signal in_Cin<='0';

begin

	mod_Sumador_Completo0: Sumador_Medio port map (in_Cin, A[0], B[0], in_Cin_Cout0, Out_Sm_Sumador0);
	mod_Sumador_Completo0: Sumador_Medio port map (in_Cin_Cout0, A[1], B[1], in_Cin_Cout1, Out_Sm_Sumador1);
	mod_Sumador_Completo0: Sumador_Medio port map (in_Cin_Cout1, A[2], B[2], in_Cin_Cout2, Out_Sm_Sumador2);
	mod_Sumador_Completo0: Sumador_Medio port map (in_Cin_Cout2, A[3], B[3], in_Cin_Cout3, Out_Sm_Sumador3);

  Coutc <= in_Cin_Cout3;
  Sc[0] <= Out_Sm_Sumador0;


end Behavioral;

