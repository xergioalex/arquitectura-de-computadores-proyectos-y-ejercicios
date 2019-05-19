`timescale 1ns / 1ps

module tb_ALU;

	// Inputs
	reg [31:0] crs;
	reg [31:0] alu_input;
	reg [4:0] shamnt;
	reg [3:0] alu_op;

	// Outputs
	wire zero;
	wire [31:0] alu_output;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.crs(crs), 
		.alu_input(alu_input), 
		.shamnt(shamnt), 
		.alu_op(alu_op), 
		.zero(zero), 
		.alu_output(alu_output)
	);

	initial begin
		// Initialize Inputs
		crs = 0;
		alu_input = 0;
		shamnt = 0;
		alu_op = 4'b0001;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
	always 
	begin
		#100;
			alu_op = 4'b0000;
			crs = 32'b0001;
			alu_input = 32'b1001;
			shamnt = 5'b0;			
		#100;
			crs = 32'b0001;
			alu_input = 32'b1001;
			shamnt = 5'b00011;
			alu_op = 4'b0100;
		#100;
			crs = 32'b1111;
			alu_input = 32'b1111;
			shamnt = 5'b00000;
			alu_op = 4'b0110;
		#100;
			alu_op = 4'b0000;
		#100;
			crs = 32'b1111;
			alu_input = 32'b1101;
			shamnt = 5'b00000;
			alu_op = 4'b0111;
		#400;	
	end
     
endmodule

