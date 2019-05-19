`timescale 1ns / 1ps

module tb_ampersan;

	// Inputs
	reg [3:0] pc_inc;
	reg [25:0] jump_address;

	// Outputs
	wire [31:0] pc_jump;

	// Instantiate the Unit Under Test (UUT)
	Ampersan uut (
		.pc_inc(pc_inc), 
		.jump_address(jump_address), 
		.pc_jump(pc_jump)
	);

	initial begin
		// Initialize Inputs
		pc_inc = 0;
		jump_address = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always begin
		#100;
			pc_inc = 4'b1111;
			jump_address = 26'b1011;
		#100;
			pc_inc = 4'b1000;
			jump_address = 26'b111111111;
		#500;
	end
	
      
endmodule

