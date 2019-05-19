library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_ARITH.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity tb_Sumador_Completo_8Bits is
end entity;

architecture Behavorial of tb_Sumador_Completo_8Bits is

component sum_completo_8

port(A:in STD_LOGIC_VECTOR(8 downto 1);
	 B:in STD_LOGIC_VECTOR(8 downto 1);
	 Cin:in STD_LOGIC;
	 S:out STD_LOGIC_VECTOR(8 downto 1);
	 Cout:out std_logic);
End component;

--Inputs
signal A : STD_LOGIC_VECTOR(8 downto 1) := (others => '0');
signal B : STD_LOGIC_VECTOR(8 downto 1) := (others => '0');
signal Cin : STD_LOGIC := '0';
--Outputs
signal Acarreo : std_logic :='0';
signal Salida : std_logic_vector(8 downto 1) := (others => '0');

Begin

uut:sum_completo_8
port map(A => A,
		   B => B,
			Cin => Cin,
			S => Salida,
			Cout => Acarreo);
		 
placentero : process
Begin
	while(not(A = "11111111") and (not(B = "11111111"))) loop		
		while(not(B = "11111111")) loop
			wait for 20 ns;
			B <= B + "00000001";			
		end loop;
		wait for 20 ns;
		A <= A + "00000001";
		B <= "00000000";		
		end loop;
		
end process;
end Architecture;