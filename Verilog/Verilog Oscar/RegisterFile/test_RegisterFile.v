`timescale 1ns / 1ps


module test_RegisterFile;

	// Inputs
	reg [0:1] RS;
	reg [0:3] DW;
	reg [0:1] RW;
	reg RG_WE;
	reg [0:1] RT;
	reg CLK;

	// Outputs
	wire [0:3] CRS;
	wire [0:3] CRT;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.RS(RS), 
		.DW(DW), 
		.RW(RW), 
		.RG_WE(RG_WE), 
		.RT(RT), 
		.CLK(CLK), 
		.CRS(CRS), 
		.CRT(CRT)
	);
	
	always begin
     #10  CLK = ~CLK; // Toggle clock every 5 ticks
   end
	initial begin
		// Initialize Inputs
		RS = 0;
		DW = 0;
		RW = 0;
		RG_WE = 1;
		RT = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
			RS = 00;
			DW = 0011;
			RW = 00;
			RT = 00;
		#100;
			RS = 01;
			DW = 0001;
			RW = 01;
			RT = 01;
		#100;
			RS = 10;
			DW = 0000;
			RW = 10;
			RT = 10;
		#100;
			RS = 11;
			DW = 1111;
			RW = 11;
			RT = 11;
		#100;
			RG_WE = 0;
			RS = 00;
			RT = 01;
		#100;
			RS = 01;
			RT = 01;
		#100;
			RS = 10;
			RT = 10;
		#100;
			RS = 11;
			RT = 11;
        
		// Add stimulus here

	end
      
endmodule

