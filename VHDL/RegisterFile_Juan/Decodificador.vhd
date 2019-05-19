----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:16 11/25/2011 
-- Design Name: 
-- Module Name:    Decodificador - Behavioral 
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

entity Decodificador is
    Port ( Rw_Dec : in  STD_LOGIC_VECTOR (1 downto 0);
           Rf_Dec : in  STD_LOGIC;
           Dec_out_R0 : out  STD_LOGIC;
			  Dec_out_R1 : out  STD_LOGIC;
			  Dec_out_R2 : out  STD_LOGIC;
			  Dec_out_R3 : out  STD_LOGIC
			 );
end Decodificador;

architecture Behavioral of Decodificador is

begin
process(Rw_Dec,Rf_Dec)
begin
	if (Rf_Dec='1') then
		case Rw_Dec is
			when "00" => Dec_out_R0 <= '1';	
							 Dec_out_R1 <= '0';
							 Dec_out_R2 <= '0';	
							 Dec_out_R3 <= '0';
							 
			when "01" => Dec_out_R0 <= '0';	
							 Dec_out_R1 <= '1';
							 Dec_out_R2 <= '0';	
							 Dec_out_R3 <= '0';
							 
			when "10" => Dec_out_R0 <= '0';	
							 Dec_out_R1 <= '0';
							 Dec_out_R2 <= '1';	
							 Dec_out_R3 <= '0';
							 
			when "11" => Dec_out_R0 <= '0';	
							 Dec_out_R1 <= '0';
							 Dec_out_R2 <= '0';	
							 Dec_out_R3 <= '1';
							 
			when others => Dec_out_R0 <= '0';	
							   Dec_out_R1 <= '0';
							   Dec_out_R2 <= '0';	
							   Dec_out_R3 <= '0';
		end case;
	else
		Dec_out_R0 <= '0';	
		Dec_out_R1 <= '0';
		Dec_out_R2 <= '0';	
		Dec_out_R3 <= '0';
	end if;
end process;
end Behavioral;

