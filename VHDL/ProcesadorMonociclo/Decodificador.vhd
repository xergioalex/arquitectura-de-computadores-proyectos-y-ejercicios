library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all; 

entity Decodificador is
    Port ( rw : in  STD_LOGIC_VECTOR (1 downto 0);
           rwe : in  STD_LOGIC;
           er0 : out  STD_LOGIC;
           er1 : out  STD_LOGIC;
           er2 : out  STD_LOGIC;
           er3 : out  STD_LOGIC
			 );
end Decodificador;

architecture Behavioral of Decodificador is

begin
	decodificar: process(rw,rwe)
	begin
		case rwe is			
			when '1' =>
				case rw is
					when "00" => er0 <= '1';
									 er1 <= '0';
									 er2 <= '0';
									 er3 <= '0';
					when "01" => er0 <= '0';
									 er1 <= '1';
									 er2 <= '0';
									 er3 <= '0';
					when "10" => er0 <= '0';
									 er1 <= '0';
									 er2 <= '1';
									 er3 <= '0';
					when "11" => er0 <= '0';
									 er1 <= '0';
									 er2 <= '0';
									 er3 <= '1';
					when others=>er0 <= '0';
									 er1 <= '0';
									 er2 <= '0';
									 er3 <= '0';
				end case;
			 when others => er0 <= '0';
								 er1 <= '0';
								 er2 <= '0';
								 er3 <= '0';
		 end case;		
	end process decodificar;

end Behavioral;

