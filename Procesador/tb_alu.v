`timescale 1ns / 1ps


module tb_alu;

	// Inputs
	reg [3:0] alu_op;
	reg [31:0] alu_in;
	reg [31:0] crs;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] alu_out;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.alu_op(alu_op), 
		.alu_in(alu_in), 
		.crs(crs), 
		.shamt(shamt), 
		.alu_out(alu_out), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		alu_op = 0;
		alu_in = 0;
		crs = 0;
		shamt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

