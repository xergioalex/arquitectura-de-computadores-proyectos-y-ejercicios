`timescale 1ns / 1ps

module tb_register_file_completo;

	// Inputs
	reg [4:0] rs;
	reg [31:0] dw;
	reg [4:0] rw;
	reg rwe;
	reg clk;
	reg [4:0] rt;

	// Outputs
	wire [31:0] crs;
	wire [31:0] crt;

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
	
	always begin
     #5  clk = ~clk; // Toggle clock every 5 ticks
   end

	initial begin
		// Initialize Inputs
		rs = 0;
		dw = 0;
		rw = 0;
		rwe = 1;
		clk = 0;
		rt = 0;

		// Wait 10 ns for global reset to finish
		#100;
      rs = 5'b00000;
		dw = 31'b1010010100101010;
		rw = 5'b00000;
		rt = 5'b00111;
		#100
		rwe = 0;
		rs = 5'b00001;			
		rt = 5'b00000;
		
		// Add stimulus here

	end
      
