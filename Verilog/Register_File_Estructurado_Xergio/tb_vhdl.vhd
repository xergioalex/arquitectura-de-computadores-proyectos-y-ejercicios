--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:18:14 12/05/2011
-- Design Name:   
-- Module Name:   C:/Users/XergioAleX/Documents/Xilinx Projects/Verilog Oscar/Register_File_Estructurado_Xergio/tb_vhdl.vhd
-- Project Name:  Register_File_Estructurado_Xergio
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_FIle_Xergio
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
 
ENTITY tb_vhdl IS
END tb_vhdl;
 
ARCHITECTURE behavior OF tb_vhdl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_FIle_Xergio
    PORT(
         rs : IN  std_logic_vector(1 downto 0);
         dw : IN  std_logic_vector(3 downto 0);
         rw : IN  std_logic_vector(1 downto 0);
         rwe : IN  std_logic;
         clk : IN  std_logic;
         rt : IN  std_logic_vector(1 downto 0);
         crs : OUT  std_logic_vector(3 downto 0);
         crt : OUT  std_logic_vector(3 downto 0)
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
   signal crs : std_logic_vector(3 downto 0);
   signal crt : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_FIle_Xergio PORT MAP (
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
			rwe <= '1';
			rs <= "01";
			rt <= "10";
			rw <= "10";
			dw <= "0101";
      wait for clk_period*10;

      -- insert stimulus here 
		
      wait;
   end process;

END;
