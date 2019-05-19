`timescale 1ns / 1ps

module tb_mux_dw;

	// Inputs
	reg [31:0] pc_inc;
	reg [31:0] data_rd;
	reg [31:0] alu_output;
	reg [1:0] dw_sel;

	// Outputs
	wire [31:0] dw;

	// Instantiate the Unit Under Test (UUT)
	MUX_DW uut (
		.pc_inc(pc_inc), 
		.data_rd(data_rd), 
		.alu_output(alu_output), 
		.dw_sel(dw_sel), 
		.dw(dw)
	);

	initial begin
		// Initialize Inputs
		pc_inc = 0;
		data_rd = 0;
		alu_output = 0;
		dw_sel = 2'b11;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
		#100;
			pc_inc = 32'b1111;
			data_rd = 32'b1001;
			alu_output = 32'b0101;
			dw_sel = 2'b00;
		#100;
			pc_inc = 32'b1111;
			data_rd = 32'b1001;
			alu_output = 32'b0101;
			dw_sel = 2'b01;
		#100;
			pc_inc = 32'b1111;
			data_rd = 32'b1001;
			alu_output = 32'b0101;
			dw_sel = 2'b10;
		#500;
	end
      
endmodule

