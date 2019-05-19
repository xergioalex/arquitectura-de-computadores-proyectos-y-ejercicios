`timescale 1ns / 1ps

module tb_sumador;

	// Inputs
	reg [31:0] dato1;
	reg [31:0] dato2;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	Sumador uut (
		.dato1(dato1), 
		.dato2(dato2), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		dato1 = 0;
		dato2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always begin
		#100;
			dato1 = 32'b100;
			dato2 = 32'b011;
		#100;
			dato1 = 32'b111;
			dato2 = 32'b001;
		#100;
			dato1 = 32'b001;
			dato2 = 32'b011;
		#400;	
	end
      
endmodule

