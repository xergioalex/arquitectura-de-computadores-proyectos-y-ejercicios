`timescale 1ns / 1ps

module tb;

	// Inputs
	reg [31:0] pc;

	// Outputs
	wire [31:0] inst;
	integer i;
	// Instantiate the Unit Under Test (UUT)
	Instruction_Memory uut (
		.pc(pc), 
		.inst(inst)
	);

	initial begin
		// Initialize Inputs
		pc = 0;

		// Wait 100 ns for global reset to finish
		#100;

	end
	
	always @(pc) begin
		// Add stimulus here
		for (i=0; i < 4; i=i+1)
		begin
			#50;
			pc=pc+'b1;
		end
		
	end
      
endmodule

