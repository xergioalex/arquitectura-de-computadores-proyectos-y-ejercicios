`timescale 1ns / 1ps

module procesador_out(clk,alu_out,zero, alu_src_b, seu_en, rf_wr_en, dm_wr, dm_rd,dw_sel, rw_sel, next_pc_sel,alu_op,rw,next_pc, pc, pc_inc, pc_sum, instruction, crs, crt, inm_ext, alu_in,  dw, data_rd);

	input wire clk;	
	output wire [31:0] alu_out;
	
	output wire zero, alu_src_b, seu_en, rf_wr_en, dm_wr, dm_rd;
	output wire [1:0] dw_sel, rw_sel, next_pc_sel;
	output wire [3:0] alu_op;
	output wire [4:0] rw;
	output wire [31:0] next_pc, pc, pc_inc, pc_sum, instruction, crs, crt, inm_ext, alu_in, dw, data_rd;

	Program_Counter program_c(clk, next_pc, pc);
	Data_Memory memory_wr_rd(dm_wr, dm_rd, alu_out, crt, data_rd);
	Instruction_Memory instruction_m(pc, instruction);
	Control_Unit control_u(instruction[31:26], instruction[5:0], zero, seu_en, alu_src_b, alu_op, dw_sel, rw_sel, rf_wr_en, dm_wr, dm_rd, next_pc_sel);
	Register_File register_f(clk, instruction[25:21], instruction[20:16], dw, rw, rf_wr_en, crs, crt);
	SEU extension(seu_en, instruction[15:0], inm_ext);
	ALU alu_operation(alu_op, alu_in, crs, instruction[10:6], alu_out, zero);
	Mux_Alu multiplexer_a(alu_src_b, crt, inm_ext, alu_in);
	Mux_Pc multiplexer_p(next_pc_sel, pc_inc, pc_sum, crs, next_pc, pc_inc[31:28], instruction[25:0]);
	Mux_Dw multiplexer_d(dw_sel, pc_inc, data_rd, alu_out, dw);
	Mux_Rw multiplexer_r(rw_sel, instruction[15:11], instruction[20:16],rw);
	Sum_Pc sum_pc(pc, pc_inc);
	Sum_Shift sum_shift(pc_inc, inm_ext, pc_sum);

endmodule

module procesador(clk,alu_out);
//zero, alu_src_b, seu_en, rf_wr_en, dm_wr, dm_rd,dw_sel, rw_sel, next_pc_sel,alu_op,rw,next_pc, pc, pc_inc, pc_sum, instruction, crs, crt, inm_ext, alu_in, alu_out, dw, data_rd
	input wire clk;	
	output wire [31:0] alu_out;
	
	wire zero, alu_src_b, seu_en, rf_wr_en, dm_wr, dm_rd;
	wire [1:0] dw_sel, rw_sel, next_pc_sel;
	wire [3:0] alu_op;
	wire [4:0] rw;
	wire [31:0] next_pc, pc, pc_inc, pc_sum, instruction, crs, crt, inm_ext, alu_in, dw, data_rd;
	
	Program_Counter program_c(clk, next_pc, pc);
	Data_Memory memory_wr_rd(dm_wr, dm_rd, alu_out, crt, data_rd);
	Instruction_Memory instruction_m(pc, instruction);
	Control_Unit control_u(instruction[31:26], instruction[5:0], zero, seu_en, alu_src_b, alu_op, dw_sel, rw_sel, rf_wr_en, dm_wr, dm_rd, next_pc_sel);
	Register_File register_f(clk, instruction[25:21], instruction[20:16], dw, rw, rf_wr_en, crs, crt);
	SEU extension(seu_en, instruction[15:0], inm_ext);
	ALU alu_operation(alu_op, alu_in, crs, instruction[10:6], alu_out, zero);
	Mux_Alu multiplexer_a(alu_src_b, crt, inm_ext, alu_in);
	Mux_Pc multiplexer_p(next_pc_sel, pc_inc, pc_sum, crs, next_pc, pc_inc[31:28], instruction[25:0]);
	Mux_Dw multiplexer_d(dw_sel, pc_inc, data_rd, alu_out, dw);
	Mux_Rw multiplexer_r(rw_sel, instruction[15:11], instruction[20:16],rw);
	Sum_Pc sum_pc(pc, pc_inc);
	Sum_Shift sum_shift(pc_inc, inm_ext, pc_sum);

endmodule

module Program_Counter(clk, next_pc, pc);
	input clk;
	input [31:0] next_pc;
	output reg [31:0] pc;
	
	initial pc =32'b0;
	
	always@(posedge clk) 
	begin
		pc = next_pc;
	end
endmodule

module Instruction_Memory(pc, inst);
	input wire [31:0] pc;
	output wire [31:0] inst;
	
	reg [31:0] memoria[0:7];
	
	initial $readmemh("instrucciones.txt", memoria,0,7);
	
	assign inst = memoria[pc>>32'b10];
	
endmodule 

module Control_Unit(opcode, funct, zero, seu_en, alu_src_b, alu_op, dw_sel, rw_sel, rf_wr_en, dm_wr, dm_rd, next_pc_sel);
	input [5:0] opcode, funct;
	input zero;
	output reg seu_en, alu_src_b;
	output reg [3:0] alu_op;
	output reg [1:0] dw_sel, rw_sel;
	output reg rf_wr_en, dm_wr, dm_rd;
	output reg [1:0] next_pc_sel;	
	always@(funct or opcode or zero) begin
		if(opcode == 'b000000)begin
			case(funct) //tipo R 
				'b100000 : begin alu_op='b0000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //add
				'b100001 : begin alu_op='b0000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //addu
				'b100010 : begin alu_op='b0001;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //sub
				'b100011 : begin alu_op='b0001;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //subu
				'b100100 : begin alu_op='b0010;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //and
				'b100101 : begin alu_op='b0011;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //or
				'b000000 : begin alu_op='b0100;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //sll
				'b000010 : begin alu_op='b0101;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //srl
				'b101010 : begin alu_op='b1000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //slt
				'b101011 : begin alu_op='b1000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //sltu
				'b001000 : begin alu_op='b0000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b0;next_pc_sel='b11;end //jr
				default : begin alu_op='b0000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end
			endcase
		end
		else begin
			case(opcode)//tipo I
				'b001000 : begin alu_op='b0000;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b01;rf_wr_en='b1;next_pc_sel='b00;end //addi
				'b001001 : begin alu_op='b0000;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b01;rf_wr_en='b1;next_pc_sel='b00;end //addiu
				'b001100 : begin alu_op='b0010;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b01;rf_wr_en='b1;next_pc_sel='b00;end //andi
				'b001101 : begin alu_op='b0011;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b01;rf_wr_en='b1;next_pc_sel='b00;end //ori
				'b000100 : begin alu_op='b0110;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b0;next_pc_sel='b01; //beq
										if (zero == 'b1)begin next_pc_sel='b01;end 
							  end 
				'b000101 : begin alu_op='b0111;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b0;next_pc_sel='b01; //bne
										if (zero == 'b1)begin next_pc_sel='b01;end 
							  end 
				'b100011 : begin alu_op='b0000;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b1;dw_sel='b10;rw_sel='b01;rf_wr_en='b1;next_pc_sel='b00;end //lw
				'b101011 : begin alu_op='b0000;alu_src_b='b1;seu_en='b0;dm_wr='b1;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b0;next_pc_sel='b00;end //sw
				'b001010 : begin alu_op='b1000;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //slti
				'b001011 : begin alu_op='b1000;alu_src_b='b1;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end //sltiu
				'b000010 : begin alu_op='b0000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b0;next_pc_sel='b10;end //j
				'b000011 : begin alu_op='b0000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b01;rw_sel='b10;rf_wr_en='b1;next_pc_sel='b10;end //jal
				default : begin alu_op='b0000;alu_src_b='b0;seu_en='b0;dm_wr='b0;dm_rd='b0;dw_sel='b00;rw_sel='b00;rf_wr_en='b1;next_pc_sel='b00;end
			endcase
		end			
	end
endmodule

module Register_File(clk, rs, rt, dw, rw, rf_wr_en, crs, crt);
	input clk;
	input [4:0] rs,rt;
	input [31:0] dw;
	input [4:0] rw;
	input rf_wr_en;
	output [31:0] crs;
	output [31:0] crt;
	
	reg [31:0] registro[0:31]; 
	
	integer i;
	
	initial begin
		for (i=0; i < 32; i=i+1)
		begin
			registro[i] = 32'b0;
		end
	end
	
	always@(posedge clk) begin
		if(rf_wr_en == 'b1)
			registro[rw] = dw;
	end
	
	assign crs = registro[rs];
	assign crt = registro[rt];	
	
endmodule
	
module SEU(seu_en, inm, inm_ext);
	input seu_en;
	input [15:0] inm;
	output reg [31:0] inm_ext;
	
	always@(seu_en) 
	begin
		case(seu_en)
			'b0 : inm_ext = {16'b0,inm};
			'b1 : inm_ext = {16'b1111111111111111,inm};
			default: inm_ext = 32'b0;
		endcase			
	end
endmodule

module ALU(alu_op, alu_in, crs, shamt, alu_out, zero);
	input [3:0] alu_op;
	input [31:0] alu_in, crs;
	input [4:0] shamt;
	output reg [31:0] alu_out;
	output reg zero;
	
	always@(alu_op)begin
		case(alu_op)
			'b0000 : begin alu_out = crs + alu_in; zero = 'b0; end
			'b0001 : begin alu_out = crs - alu_in; zero = 'b0; end
			'b0010 : begin alu_out = crs & alu_in; zero = 'b0; end
			'b0011 : begin alu_out = crs | alu_in; zero = 'b0; end
			'b0100 : begin alu_out = crs << alu_in; zero = 'b0; end
			'b0101 : begin alu_out = crs >> alu_in; zero = 'b0; end
			'b0110 : begin alu_out = 32'b0;
							if(crs == alu_in)
								zero = 'b1;
							else
								zero = 'b0;
						end
			'b0111 : begin alu_out = 32'b0;
							if(crs != alu_in)
								zero = 'b1;
							else
								zero = 'b0;
						end
			'b1000 : begin alu_out = 32'b0;
							if(crs < alu_in)
								alu_out = 32'b01;
							else
								alu_out = 32'b0;
						end
			default: begin alu_out = 32'b0; zero = 'b0;end
		endcase
	end	
endmodule

module Data_Memory(dm_wr, dm_rd, alu_out, crt, data_rd);
	input dm_wr, dm_rd;
	input [31:0] alu_out, crt;
	output reg [31:0] data_rd;
	
	reg [31:0] memory[0:31];
	
	integer i;
	
	initial begin
		for (i=0; i < 32; i=i+1)
		begin
			memory[i] = 32'b0;
		end
	end
	
	always@(dm_wr) begin
		if(dm_wr == 'b1)
			memory[alu_out] = crt;
	end
	
	always@(dm_rd) begin
		if(dm_rd == 'b1)
			data_rd = memory[alu_out];
		else data_rd = 32'b0;
	end
	
endmodule 

module Mux_Alu(alu_src_b, crt, inm_ext, alu_in);
	input alu_src_b;
	input [31:0] crt, inm_ext;
	output reg [31:0] alu_in;
	
	always@(alu_src_b) begin
		case(alu_src_b)
			'b0 :	alu_in = crt;
			'b1 : alu_in = inm_ext;
			default : alu_in = 32'b0;
		endcase 
	end
endmodule  

module Mux_Pc(next_pc_sel, pc_inc, pc_sum, crs, next_pc, pc_conc, jump_address);
	input [1:0] next_pc_sel;
	input [31:0] pc_inc, pc_sum, crs;
	output reg [31:0] next_pc;
	input [3:0] pc_conc;
	input [25:0] jump_address;
	
	always @(next_pc_sel)begin
		case(next_pc_sel)
			'b00 : next_pc = pc_inc;
			'b01 : next_pc = pc_sum;
			'b10 : next_pc = {pc_conc,jump_address,2'b00};
			'b11 : next_pc = crs;
			default: next_pc= 2'b0;
		endcase	
	end 
endmodule

module Mux_Dw(dw_sel, pc_inc, data_rd, alu_out, dw);
	input [1:0] dw_sel;
	input [31:0] pc_inc, data_rd, alu_out;
	output reg [31:0] dw;
	
	always@(dw_sel) begin
		case(dw_sel)
			'b10 : dw = pc_inc;
			'b01 : dw = data_rd;
			'b00 : dw = alu_out;
			default: dw = 32'b0;
		endcase
	end
endmodule

module Mux_Rw(rw_sel, rd, rt,rw);
	input [1:0] rw_sel;
	input [4:0] rd, rt;
	output reg [4:0] rw;
	
	always@(rw_sel)begin
		case(rw_sel)
			'b00 : rw = rd;
			'b10 : rw = 5'b11111;
			'b01 : rw = rt;
			default: rw = 5'b0;
		endcase
	end
endmodule

module Sum_Pc( pc, pc_inc);
	input [31:0] pc;
	output [31:0] pc_inc;
	assign pc_inc = pc + 3'b100;
endmodule

module Sum_Shift(pc_inc, inm_ext, pc_sum);
	input [31:0] pc_inc, inm_ext;
	output [31:0] pc_sum;
	
	assign pc_sum = (inm_ext << 'b10) + pc_inc;
endmodule
