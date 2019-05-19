library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Compuertas
entity sum_completo_8 is
    Port ( A : in  STD_LOGIC_VECTOR(8 downto 1);
           B : in  STD_LOGIC_VECTOR(8 downto 1);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(8 downto 1);
           Cout : out  STD_LOGIC
	    );

end sum_completo_8;

--Implementacion del comportamiento de sumador de 8 bits
architecture arq_sum_completo of sum_completo_8 is

begin
	Sumar: process(A,B,Cin)
		variable Sumador: STD_LOGIC_VECTOR(8 downto 1);   
		variable Acarreo : STD_LOGIC;
	begin
		Acarreo :=Cin;
		for i in 1 to 8 loop
			Sumador(i) := A(i) xor B(i) xor Acarreo;
			Acarreo := (A(i) and B(i)) or (Acarreo and (A(i) xor B(i)));
		end loop;
	
		S <= Sumador;
		Cout <= Acarreo;

	end process Sumar;	


end arq_sum_completo;
