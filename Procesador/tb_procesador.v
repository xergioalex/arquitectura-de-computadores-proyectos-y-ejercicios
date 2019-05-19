`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:28 12/12/2011
// Design Name:   procesador
// Module Name:   C:/Users/XergioAleX/Documents/Xilinx Projects/Procesador/tb_procesador.v
// Project Name:  Procesador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: procesador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_procesador;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] alu_out;

	// Instantiate the Unit Under Test (UUT)
	procesador uut (
		.clk(clk), 
		.alu_out(alu_out)
	);
	
	always begin
		#100  clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

