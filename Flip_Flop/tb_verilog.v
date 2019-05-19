// Verilog test fixture created from schematic C:\Users\XergioAleX\Documents\Xilinx Projects\Flip_Flop\Flip_Flop.sch - Fri Dec 09 13:45:27 2011

`timescale 1ns / 1ps

module Flip_Flop_Flip_Flop_sch_tb();

// Inputs
   reg XLXN_24;
   reg XLXN_25;
   reg XLXN_26;

// Output
   wire XLXN_8;
   wire XLXN_9;

// Bidirs

// Instantiate the UUT
   Flip_Flop UUT (
		.XLXN_8(XLXN_8), 
		.XLXN_9(XLXN_9), 
		.XLXN_24(XLXN_24), 
		.XLXN_25(XLXN_25), 
		.XLXN_26(XLXN_26)
   );
// Initialize Inputs
   initial begin
		XLXN_24 = 'b0;
		XLXN_25 = 'b0;
		XLXN_26 = 'b0;
   end
	
	always begin
		XLXN_26 = ~ XLXN_26;
	end
	
	always begin
		#10;
			XLXN_24 = 'b1;
			XLXN_25 = 'b0;
	end
endmodule
