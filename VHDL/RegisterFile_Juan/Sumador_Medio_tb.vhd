--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:39:09 11/27/2011
-- Design Name:   
-- Module Name:   C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile/Sumador_Medio_tb.vhd
-- Project Name:  RegisterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador_Medio
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Sumador_Medio_tb IS
END Sumador_Medio_tb;
 
ARCHITECTURE behavior OF Sumador_Medio_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador_Medio
    PORT(
			Cin : IN std_logic_vector (3 downto 0);
         A : IN  std_logic_vector (3 downto 0);
         B : IN  std_logic_vector (3 downto 0);
         Cout : OUT  std_logic_vector (3 downto 0);
         S : OUT  std_logic_vector (3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal Cin : std_logic_vector(3 downto 0) := "0000";
   signal A : std_logic_vector(3 downto 0) := "0000";
   signal B : std_logic_vector(3 downto 0) := "0000";

 	--Outputs
   signal Cout : std_logic_vector(3 downto 0) := "0000";
   signal S : std_logic_vector(3 downto 0) := "0000";
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador_Medio PORT MAP (
			 Cin => Cin,
          A => A,
          B => B,
          Cout => Cout,
          S => S
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
     
      wait for 0 ns;	
	  Cin <= "0000"; 
     A <="0000";
	  B <="0000";
	  
	 wait for 100 ns;
	  Cin <= "0000";
	  A <="1011";
	  B <="0001";
	  
--	  wait for 100 ns;
--	  Cin <= '0';
--	  A <='1';
--	  B <='0';
--	  
--	  wait for 100 ns;
--	  Cin <= '0';
--	  A <='1';
--	  B <='1';
--	  
--	  wait for 100 ns;	
--	  Cin <= '1'; 
--     A <='0';
--	  B <='0';
--	  
--	 wait for 100 ns;
--	  Cin <= '1';
--	  A <='0';
--	  B <='1';
--	  
--	  wait for 100 ns;
--	  Cin <= '1';
--	  A <='1';
--	  B <='0';
--	  
--	  wait for 100 ns;
--	  Cin <= '1';
--	  A <='1';
--	  B <='1';
--		
      wait;
   end process;

END;
