`timescale 1ns / 1ps

module tb_registe_file_completo;

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
	#10 clk = ~clk;
	end

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
			rwe = 1;
			rs = 5'b00001;
			dw = 32'b011100001101;
			rw = 5'b00000;
			rt = 5'b00100;
      #100
			rwe = 0;
			rs = 5'b00000;						
			rt = 5'b00000;
		#100
			rwe = 1;
			rs = 5'b01000;
			dw = 32'b010101010;
			rw = 5'b01010;
			rt = 5'b00100;
		#100
			rwe = 0;
			rs = 5'b00000;						
			rt = 5'b01010;
		#5
			$display("HOLA MUNDO");
		// Add stimulus here

	end
      
endmodule

