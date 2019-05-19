--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:44:15 12/02/2011
-- Design Name:   
-- Module Name:   C:/Users/XergioAleX/Documents/Xilinx Projects/Verilog Oscar/RegisterFile_Comportamental/tb_register_file.vhd
-- Project Name:  RegisterFile_Comportamental
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY tb_register_file IS
END tb_register_file;
 
RCHITECTURE behavior OF tb_register_file IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         rs : IN  std_logic_vector(1 downto 0);
         dw : IN  std_logic_vector(3 downto 0);
         rw : IN  std_logic_vector(1 downto 0);
         rwe : IN  std_logic;
         clk : IN  std_logic;
         rt : IN  std_logic_vector(1 downto 0);
         crs : OUT  std_logic_vector(0 to 3);
         crt : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal rs : std_logic_vector(1 downto 0) := (others => '0');
   signal dw : std_logic_vector(3 downto 0) := (others => '0');
   signal rw : std_logic_vector(1 downto 0) := (others => '0');
   signal rwe : std_logic := '0';
   signal clk : std_logic := '0';
   signal rt : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal crs : std_logic_vector(0 to 3);
   signal crt : std_logic_vector(0 to 3);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          rs => rs,
          dw => dw,
          rw => rw,
          rwe => rwe,
          clk => clk,
          rt => rt,
          crs => crs,
          crt => crt
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
