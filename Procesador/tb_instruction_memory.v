`timescale 1ns / 1ps

module tb_instruction_memory;

	// Inputs
	reg [31:0] pc;
	integer i;
	// Outputs
	wire [31:0] inst;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Memory uut (
		.pc(pc), 
		.inst(inst)
	);

	initial begin
		// Initialize Inputs
		pc = 32'b0;
		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always  
	begin
		#100;
		// Add stimulus here
		for (i=0; i < 4; i=i+1)
		begin
			#100;
			pc=pc+'b1;
		end
		
	end
	
	
	
	
endmodule

