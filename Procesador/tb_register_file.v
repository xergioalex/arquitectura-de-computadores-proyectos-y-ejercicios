`timescale 1ns / 1ps

module tb_register_file;

	// Inputs
	reg clk;
	reg [4:0] rs;
	reg [4:0] rt;
	reg [31:0] dw;
	reg [4:0] rw;
	reg rf_wr_en;

	// Outputs
	wire [31:0] crs;
	wire [31:0] crt;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.clk(clk), 
		.rs(rs), 
		.rt(rt), 
		.dw(dw), 
		.rw(rw), 
		.rf_wr_en(rf_wr_en), 
		.crs(crs), 
		.crt(crt)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rs = 0;
		rt = 0;
		dw = 0;
		rw = 0;
		rf_wr_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always begin
		#10  clk = ~clk;
	end
	
	always
	begin
		#100;
			rf_wr_en = 'b1;
			rs = 5'b10100;
			rt = 5'b00000;
			dw = 32'b11110101;
			rw = 5'b10100;
		#100;
			rf_wr_en = 'b0;
		#100;
			rf_wr_en = 'b0;
			rs = 5'b00000;
			rt = 5'b10100;
			dw = 32'b11110101;
			rw = 5'b10100;
		#100;
			rf_wr_en = 'b1;
			rs = 5'b11111;
			rt = 5'b00010;
			dw = 32'b000000011;
			rw = 5'b10001;
		#100;
			rf_wr_en = 'b0;
			rs = 5'b10100;
			rt = 5'b10001;
			dw = 32'b000000011;
			rw = 5'b10001;
		#300;
		  
	end
      
endmodule

