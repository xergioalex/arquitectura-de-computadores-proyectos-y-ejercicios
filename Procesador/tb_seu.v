`timescale 1ns / 1ps

module tb_seu;

	// Inputs
	reg seu_en;
	reg [15:0] inm;

	// Outputs
	wire [31:0] inm_ext;

	// Instantiate the Unit Under Test (UUT)
	SEU uut (
		.seu_en(seu_en), 
		.inm(inm), 
		.inm_ext(inm_ext)
	);

	initial begin
		// Initialize Inputs
		seu_en = 'b0;
		inm = 32'b0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always begin 
		#100;
			seu_en = 'b1;
			inm = 16'b1111;
		#100
			seu_en = 'b0;
		#500;	
	end
      
endmodule

