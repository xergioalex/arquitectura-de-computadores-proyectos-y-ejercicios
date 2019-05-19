`timescale 1ns / 1ps

module tb_procesador_out;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] alu_out;
	wire zero;
	wire alu_src_b;
	wire seu_en;
	wire rf_wr_en;
	wire dm_wr;
	wire dm_rd;
	wire [1:0] dw_sel;
	wire [1:0] rw_sel;
	wire [1:0] next_pc_sel;
	wire [3:0] alu_op;
	wire [4:0] rw;
	wire [31:0] next_pc;
	wire [31:0] pc;
	wire [31:0] pc_inc;
	wire [31:0] pc_sum;
	wire [31:0] instruction;
	wire [31:0] crs;
	wire [31:0] crt;
	wire [31:0] inm_ext;
	wire [31:0] alu_in;
	wire [31:0] dw;
	wire [31:0] data_rd;

	// Instantiate the Unit Under Test (UUT)
	procesador_out uut (
		.clk(clk), 
		.alu_out(alu_out), 
		.zero(zero), 
		.alu_src_b(alu_src_b), 
		.seu_en(seu_en), 
		.rf_wr_en(rf_wr_en), 
		.dm_wr(dm_wr), 
		.dm_rd(dm_rd), 
		.dw_sel(dw_sel), 
		.rw_sel(rw_sel), 
		.next_pc_sel(next_pc_sel), 
		.alu_op(alu_op), 
		.rw(rw), 
		.next_pc(next_pc), 
		.pc(pc), 
		.pc_inc(pc_inc), 
		.pc_sum(pc_sum), 
		.instruction(instruction), 
		.crs(crs), 
		.crt(crt), 
		.inm_ext(inm_ext), 
		.alu_in(alu_in), 
		.dw(dw), 
		.data_rd(data_rd)
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

