`timescale 1ns / 1ps

module tb_register_file_verilog;

	// Inputs
	reg [1:0] rs;
	reg [3:0] dw;
	reg [1:0] rw;
	reg rwe;
	reg clk;
	reg [1:0] rt;

	// Outputs
	wire [3:0] crs;
	wire [3:0] crt;

	// Instantiate the Unit Under Test (UUT)
	Register_FIle_Xergio uut (
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
     #10  clk = ~clk; // Toggle clock every 5 ticks
   end

	initial begin
		// Initialize Inputs
		rs = 0;
		dw = 0;
		rw = 0;
		rwe = 1;
		rt = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
			rs = 2'b00;
			dw = 4'b1101;
			rw = 2'b00;
			rt = 2'b11;
        
		// Add stimulus here

	end
      
endmodule

