----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:19 11/25/2011 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

entity Registers is
    Port ( Dw_Reg : in  STD_LOGIC_VECTOR (3 downto 0);
           Out_Dec_R : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0)
			);
end Registers;

architecture Behavioral of Registers is

begin

process(Clk)
begin
	if(rising_edge(Clk))then
		if(Out_Dec_R='0')then
			Q<="0000";
		else
			Q<=Dw_Reg;
		end if;
	end if;
end process;



end Behavioral;

