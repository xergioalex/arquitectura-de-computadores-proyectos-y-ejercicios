`timescale 1ns / 1ps

module tb_mux_pc;

	// Inputs
	reg [31:0] pc_inc;
	reg [31:0] pc_equal;
	reg [31:0] pc_jump;
	reg [31:0] crs;
	reg [1:0] next_pc_sel;

	// Outputs
	wire [31:0] next_pc;

	// Instantiate the Unit Under Test (UUT)
	MUX_PC uut (
		.pc_inc(pc_inc), 
		.pc_equal(pc_equal), 
		.pc_jump(pc_jump), 
		.crs(crs), 
		.next_pc_sel(next_pc_sel), 
		.next_pc(next_pc)
	);

	initial begin
		// Initialize Inputs
		pc_inc = 0;
		pc_equal = 0;
		pc_jump = 0;
		crs = 0;
		next_pc_sel = 2'b11;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
	always begin
		#100;
			pc_inc = 32'b001;
			pc_equal = 32'b010;
			pc_jump = 32'b011;
			crs = 32'b100;
			next_pc_sel = 2'b00;
		#100;
			pc_inc = 32'b001;
			pc_equal = 32'b010;
			pc_jump = 32'b011;
			crs = 32'b100;
			next_pc_sel = 2'b01;
		#100;
			pc_inc = 32'b001;
			pc_equal = 32'b010;
			pc_jump = 32'b011;
			crs = 32'b100;
			next_pc_sel = 2'b10;
		#100;
			pc_inc = 32'b001;
			pc_equal = 32'b010;
			pc_jump = 32'b011;
			crs = 32'b100;
			next_pc_sel = 2'b11;
		#500;
			
	end
      
endmodule

