-- Vhdl test bench created from schematic C:\Users\XergioAleX\Documents\Xilinx Projects\Flip_Flop\Flip_Flop.sch - Fri Dec 09 13:44:49 2011
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY Flip_Flop_Flip_Flop_sch_tb IS
END Flip_Flop_Flip_Flop_sch_tb;
ARCHITECTURE behavioral OF Flip_Flop_Flip_Flop_sch_tb IS 

   COMPONENT Flip_Flop
   PORT( XLXN_8	:	OUT	STD_LOGIC; 
          XLXN_9	:	OUT	STD_LOGIC; 
          XLXN_24	:	IN	STD_LOGIC; 
          XLXN_25	:	IN	STD_LOGIC; 
          XLXN_26	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL XLXN_8	:	STD_LOGIC;
   SIGNAL XLXN_9	:	STD_LOGIC;
   SIGNAL XLXN_24	:	STD_LOGIC;
   SIGNAL XLXN_25	:	STD_LOGIC;
   SIGNAL XLXN_26	:	STD_LOGIC;

BEGIN

   UUT: Flip_Flop PORT MAP(
		XLXN_8 => XLXN_8, 
		XLXN_9 => XLXN_9, 
		XLXN_24 => XLXN_24, 
		XLXN_25 => XLXN_25, 
		XLXN_26 => XLXN_26
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
