`timescale 1ns / 1ps

module tb_procesador;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] alu_output;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	Procesador_Monociclo uut (
		.clk(clk), 
		.alu_output(alu_output), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
		#10  clk = ~clk;
	end
      
endmodule

