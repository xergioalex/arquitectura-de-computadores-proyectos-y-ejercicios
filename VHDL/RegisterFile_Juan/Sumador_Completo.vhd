----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:02 11/27/2011 
-- Design Name: 
-- Module Name:    Sumador_Completo - Behavioral 
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

entity Sumador_Medio is

    Port ( 
			  Cin: in STD_LOGIC_Vector (3 downto 0);
			  A : in  STD_LOGIC_Vector (3 downto 0);
           B : in  STD_LOGIC_Vector (3 downto 0);
           Cout : out  STD_LOGIC_Vector (3 downto 0);
           S : out  STD_LOGIC_Vector (3 downto 0)
			 );
end Sumador_Medio;

architecture Behavioral of Sumador_Medio is

begin

S <= (Cin xor A xor B);
Cout <= ((A and B) or (Cin and(A xor B)));

end Behavioral;

