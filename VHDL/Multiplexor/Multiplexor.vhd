library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           control : in  STD_LOGIC;
           salida : out  STD_LOGIC);
end Multiplexor;

architecture multiplex of Multiplexor is

begin
	

	multi: process(A,B,control)
	begin
		   case control is
				when '1' => salida <= A;
				when '0' => salida <= B;				
				when others =>  salida <= '0';
			end case;
	
--			if control = '1' then 
--				salida <= A;
--			end if;
--			if control = '0' then 
--				salida <= B;
--			end if;
			
	end process multi;

	
end multiplex;

