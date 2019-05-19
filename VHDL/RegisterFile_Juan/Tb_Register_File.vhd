--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:00:52 11/27/2011
-- Design Name:   
-- Module Name:   C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile/Tb_Register_File.vhd
-- Project Name:  RegisterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Registe_File
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
 
ENTITY Tb_Register_File IS
END Tb_Register_File;
 
ARCHITECTURE behavior OF Tb_Register_File IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Registe_File
    PORT(
         Rs : IN  std_logic_vector(1 downto 0);
         Rt : IN  std_logic_vector(1 downto 0);
         Clk_RF : IN  std_logic;
         Dw : IN  std_logic_vector(3 downto 0);
         Rw : IN  std_logic_vector(1 downto 0);
         Rf : IN  std_logic;
         Crs : OUT  std_logic_vector(3 downto 0);
         Crt : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs : std_logic_vector(1 downto 0) := (others => '0');
   signal Rt : std_logic_vector(1 downto 0) := (others => '0');
   signal Clk_RF : std_logic := '0';
   signal Dw : std_logic_vector(3 downto 0) := (others => '0');
   signal Rw : std_logic_vector(1 downto 0) := (others => '0');
   signal Rf : std_logic := '0';

 	--Outputs
   signal Crs : std_logic_vector(3 downto 0);
   signal Crt : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_RF_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Registe_File PORT MAP (
          Rs => Rs,
          Rt => Rt,
          Clk_RF => Clk_RF,
          Dw => Dw,
          Rw => Rw,
          Rf => Rf,
          Crs => Crs,
          Crt => Crt
        );

   -- Clock process definitions
   Clk_RF_process :process
   begin
		Clk_RF <= '0';
		wait for Clk_RF_period/2;
		Clk_RF <= '1';
		wait for Clk_RF_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		Rf <= '1';
		Rw <= "00";
		Dw <= "0001";
		Rs <= "01";	
		Rt <= "10";
      wait for 200 ns;	
		Rf <= '1';
		Rw <= "00";
		Dw <= "0110";
		Rs <= "00";	
		Rt <= "00";
		wait for 200 ns;	
		Rf <= '0';
		Rw <= "00";
		Dw <= "0111";
		Rs <= "01";	
		Rt <= "10";
		wait for 200 ns;	
		Rf <= '1';
		Rw <= "00";
		Dw <= "0111";
		Rs <= "01";	
		Rt <= "10";
		
      wait;
   end process;

END;
