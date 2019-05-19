`timescale 1ns / 1ps

module tb_SEU;

	// Inputs
	reg [15:0] inmediate;
	reg seu_en;

	// Outputs
	wire [31:0] inm_ext;

	// Instantiate the Unit Under Test (UUT)
	SEU uut (
		.inmediate(inmediate), 
		.seu_en(seu_en), 
		.inm_ext(inm_ext)
	);

	initial begin
		// Initialize Inputs
		inmediate = 0;
		seu_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
      
	always begin 
		#100;
			seu_en = 'b1;
			inmediate = 15'b1111;
		#100
			seu_en = 'b0;
		#500;	
	end	
endmodule

