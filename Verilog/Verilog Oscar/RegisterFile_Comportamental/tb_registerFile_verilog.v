`timescale 1ns / 1ps


module tb_registerFile_verilog;

	// Inputs
	reg [1:0] rs;
	reg [3:0] dw;
	reg [1:0] rw;
	reg rwe;
	reg clk;
	reg [1:0] rt;

	// Outputs
	wire [0:3] crs;
	wire [0:3] crt;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.rs(rs), 
		.dw(dw), 
		.rw(rw), 
		.rwe(rwe), 
		.clk(clk), 
		.rt(rt), 
		.crs(crs), 
		.crt(crt)
	);

	initial begin
		// Initialize Inputs
		rs = 0;
		dw = 0;
		rw = 0;
		rwe = 0;
		clk = 0;
		rt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#50;
		clk = 0;
		#5;
			clk = 1;
			rwe = 1;
			rs = 01;
			rt = 10;
			rw = 10;
			dw = 0101;				
	end
      
endmodule

