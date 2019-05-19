library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all;

entity Sumador is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (3 downto 0));
end Sumador;

architecture Behavioral of Sumador is
signal ta : STD_LOGIC_VECTOR (3 downto 0);
signal tb : STD_LOGIC_VECTOR (3 downto 0);
signal tsalida : STD_LOGIC_VECTOR (3 downto 0);
begin
	process(a,b,ta,tb,tsalida)
	begin
		ta <= a;
		tb <= b;
		tsalida <= ta + tb;
		salida <= tsalida;
	end process;
end Behavioral;

