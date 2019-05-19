`timescale 1ns / 1ps


module tb_procesador_out;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] alu_output;
	wire zero;
	wire seu_en;
	wire alu_src_b;
	wire rf_wr;
	wire dm_wr;
	wire dm_rd;
	wire [1:0] dw_sel;
	wire [1:0] rw_sel;
	wire [1:0] next_pc_sel;
	wire [3:0] alu_op;
	wire [31:0] dw;
	wire [31:0] crs;
	wire [31:0] crt;
	wire [31:0] next_pc;
	wire [31:0] pc;
	wire [31:0] pc_inc;
	wire [31:0] inst;
	wire [31:0] inm_ext;
	wire [31:0] alu_input;
	wire [31:0] pc_equal;
	wire [31:0] pc_jump;
	wire [31:0] data_rd;
	wire [4:0] rw;
	wire [15:0] inm;
	wire [5:0] opcode;
	wire [5:0] funct;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] shamnt;
	wire [25:0] jump_address;
	wire [3:0] pc_inc_ini;

	// Instantiate the Unit Under Test (UUT)
	Procesador_Monociclo_out uut (
		.clk(clk), 
		.alu_output(alu_output), 
		.zero(zero), 
		.seu_en(seu_en), 
		.alu_src_b(alu_src_b), 
		.rf_wr(rf_wr), 
		.dm_wr(dm_wr), 
		.dm_rd(dm_rd), 
		.dw_sel(dw_sel), 
		.rw_sel(rw_sel), 
		.next_pc_sel(next_pc_sel), 
		.alu_op(alu_op), 
		.dw(dw), 
		.crs(crs), 
		.crt(crt), 
		.next_pc(next_pc), 
		.pc(pc), 
		.pc_inc(pc_inc), 
		.inst(inst), 
		.inm_ext(inm_ext), 
		.alu_input(alu_input), 
		.pc_equal(pc_equal), 
		.pc_jump(pc_jump), 
		.data_rd(data_rd), 
		.rw(rw), 
		.inm(inm), 
		.opcode(opcode), 
		.funct(funct), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.shamnt(shamnt), 
		.jump_address(jump_address), 
		.pc_inc_ini(pc_inc_ini)
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

