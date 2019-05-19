`timescale 1ns / 1ps

module tb_pc;

	// Inputs
	reg clk;
	reg [31:0] next_pc;

	// Outputs
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	Program_Counter uut (
		.clk(clk), 
		.next_pc(next_pc), 
		.pc(pc)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		next_pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always begin
		#10  clk = ~clk;
	end
	
	always begin
		#100;
			next_pc = 32'b010010101;
		#100;
			next_pc = 32'b1111111111111111;
		#100;
			next_pc = 32'b010010101;
		#500;
	end
	
      
endmodule

