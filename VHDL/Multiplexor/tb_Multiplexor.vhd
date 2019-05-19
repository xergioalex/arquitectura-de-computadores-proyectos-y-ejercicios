LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_Multiplexor IS
END tb_Multiplexor;
 
ARCHITECTURE behavior OF tb_Multiplexor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexor
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         control : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal W : std_logic := '0';
   signal X : std_logic := '0';
   signal Y : std_logic := '0';

 	--Outputs
   signal Z : std_logic;  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexor PORT MAP (
          A => W,
          B => X,
          control => Y,
          salida => Z
        );
 

   -- Stimulus process
   stim_proc: process
   begin		      
      wait for 100 ns;	
		W <= '1';
		X <= '0';
		Y <= '1';
		wait for 100 ns;	
		Y <= '0';
      wait;
   end process;

END;
