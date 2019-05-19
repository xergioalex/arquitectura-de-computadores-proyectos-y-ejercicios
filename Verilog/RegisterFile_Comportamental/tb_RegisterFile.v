`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:15:24 11/27/2011
// Design Name:   RegisterFile_Comportamental
// Module Name:   D:/USUARIO/Desktop/Entrega Arquitectura/RegisterFile_Comportamental/tb_RegisterFile.v
// Project Name:  RegisterFile_Comportamental
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile_Comportamental
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_RegisterFile;

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
	RegisterFile_Comportamental uut (
		.RS(RS), 
		.DW(DW), 
		.RW(RW), 
		.RG_WE(RG_WE), 
		.RT(RT), 
		.CLK(CLK), 
		.CRS(CRS), 
		.CRT(CRT)
	);
	

	initial begin
		// Initialize Inputs
		RS = 0;
		DW = 1111;
		RW = 0;
		RG_WE = 1;
		RT = 0;
		CLK = 0;
		
		
		// Wait 100 ns for global reset to finish
		#50;
		CLK = 0;
		#5;
			CLK = 1;
			RS = 00;
			DW = 0001;
			RW = 00;
			RT = 00;
		#50;
		CLK = 0;
		#5;
			CLK = 1;
			RS = 01;
			DW = 0010;
			RW = 01;
			RT = 01;
		#50;
		CLK = 0;
		#5;
			CLK = 1;
			RS = 10;
			DW = 0011;
			RW = 10;
			RT = 10;
		#50;
		CLK = 0;
		#5;
			CLK = 1;
			RS = 11;
			DW = 1111;
			RW = 11;
			RT = 11;
        
		// Add stimulus here

	end
      
endmodule

