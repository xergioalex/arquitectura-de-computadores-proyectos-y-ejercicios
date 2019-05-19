--Librerias
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all; 

--Entidad
entity Multiplexor_2 is
    Port ( r0 : in  STD_LOGIC_VECTOR (3 downto 0);
           r1 : in  STD_LOGIC_VECTOR (3 downto 0);
			  r2 : in  STD_LOGIC_VECTOR (3 downto 0);			  
			  r3 : in  STD_LOGIC_VECTOR (3 downto 0);
           control : in  STD_LOGIC_VECTOR(1 downto 0);
           salida : out  STD_LOGIC_VECTOR (3 downto 0));
end Multiplexor_2;

--Arquitectura
architecture Behavioral of Multiplexor_2 is

	
begin
	Elegir: process(r0,r1,r2,r3,control)
	begin
		case control is
			when "00" => salida <= r0;
			when "01" => salida <= r1;
			when "10" => salida <= r2;
			when "11" => salida <= r3;
			when others => salida <=(others => '0');			
		end case;
	end process Elegir;
	
end Behavioral;

