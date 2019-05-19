`timescale 1ns / 1ps

module tb_data_memory;

	// Inputs
	reg dm_wr;
	reg dm_rd;
	reg [31:0] alu_out;
	reg [31:0] crt;

	// Outputs
	wire [31:0] data_rd;

	// Instantiate the Unit Under Test (UUT)
	Data_Memory uut (
		.dm_wr(dm_wr), 
		.dm_rd(dm_rd), 
		.alu_out(alu_out), 
		.crt(crt), 
		.data_rd(data_rd)
	);

	initial begin
		// Initialize Inputs
		dm_wr = 0;
		dm_rd = 0;
		alu_out = 0;
		crt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
	always begin
		#100;
			dm_wr = 'b1;
			dm_rd = 'b0;
			alu_out = 32'b000010;
			crt = 32'b1101;
		#100;
			dm_wr = 'b0;
			dm_rd = 'b1;
			alu_out = 32'b000010;
			crt = 32'b1101;
		#100;
			dm_wr = 'b1;
			dm_rd = 'b0;
			alu_out = 32'b0011;
			crt = 32'b1001;
		#100;
			dm_wr = 'b0;
			dm_rd = 'b1;
			alu_out = 32'b0011;
		#400;
	end
      
endmodule

