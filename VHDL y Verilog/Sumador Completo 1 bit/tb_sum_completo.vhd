
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_sum_completo IS
END tb_sum_completo;
 
---XERGIO 
 
ARCHITECTURE behavior OF tb_sum_completo IS 
 
    ---XERGIO 
 
    COMPONENT sum_completo
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   signal X,Y,Z : std_logic := '0';   
   signal O : std_logic;
   signal U : std_logic;
 
BEGIN
 
	
   uut: sum_completo PORT MAP (
          A => X,
          B => Y,
          Cin => Z,
          S => O,
          Cout => U
    );
   
   
   estimulo: process
		begin
			wait for 20 ns;
				Z <= '0';
				X <= '0';
				Y <= '0';
			wait for 20 ns;
				Z <= '0';
				X <= '0';
				Y <= '1';
			wait for 20 ns;
				Z <= '0';
				X <= '1';
				Y <= '0';
			wait for 20 ns;
				Z <= '0';
				X <= '1';
				Y <= '1';
			wait for 20 ns;
				Z <= '1';
				X <= '0';
				Y <= '0';
			wait for 20 ns;
				Z <= '1';
				X <= '0';
				Y <= '1';
			wait for 20 ns;
				Z <= '1';
				X <= '1';
				Y <= '0';
			wait for 20 ns;
				Z <= '1';
				X <= '1';
				Y <= '1';	
			wait;

	end process;

END;
