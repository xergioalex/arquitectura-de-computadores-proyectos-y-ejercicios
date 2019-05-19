`timescale 1ns / 1ps

module tb_control_unit;

	// Inputs
	reg [5:0] opcode;
	reg [5:0] funct;
	reg zero;

	// Outputs
	wire seu_en;
	wire alu_src_b;
	wire [3:0] alu_op;
	wire [1:0] dw_sel;
	wire [1:0] rw_sel;
	wire rf_wr_en;
	wire dm_wr;
	wire dm_rd;
	wire [1:0] next_pc_sel;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.opcode(opcode), 
		.funct(funct), 
		.zero(zero), 
		.seu_en(seu_en), 
		.alu_src_b(alu_src_b), 
		.alu_op(alu_op), 
		.dw_sel(dw_sel), 
		.rw_sel(rw_sel), 
		.rf_wr_en(rf_wr_en), 
		.dm_wr(dm_wr), 
		.dm_rd(dm_rd), 
		.next_pc_sel(next_pc_sel)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		funct = 0;
		zero = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
		always@(zero) begin
		#50;
			zero = 0;
			opcode = 6'b000000;
			funct = 6'b100000;
		#50;
			zero= 1;
		#50;
			zero=0;
			opcode = 6'b000011;
			funct = 6'b000000;
		#100;
	end

      
endmodule

