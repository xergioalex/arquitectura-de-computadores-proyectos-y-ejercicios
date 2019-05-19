----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:12 11/25/2011 
-- Design Name: 
-- Module Name:    Multiplexor - Behavioral 
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

entity Multiplexor is
    Port ( Q0 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Q3 : in  STD_LOGIC_VECTOR (3 downto 0);
           R_Mux : in  STD_LOGIC_VECTOR (1 downto 0);
           Cr : out  STD_LOGIC_VECTOR (3 downto 0));
end Multiplexor;

architecture Behavioral of Multiplexor is

begin

process(Q0,Q1,Q2,Q3,R_Mux)	
begin
	
	case R_Mux is
		when "00" => Cr <= Q0;
		when "01" => Cr <= Q1;
		when "10" => Cr <= Q2;
		when "11" => Cr <= Q3;
		when others => Cr <= "0000";
	end case;
end process;

end Behavioral;

