`timescale 1ns / 1ps

module Procesador_Monociclo(clk,alu_out);
    input clk;	 
    output [31:0] alu_out;
	 
	 //señales control unit
	 wire seu_en,alu_src_b,rf_wr,dm_rd,dm_wr;
	 wire[1:0] dw_sel,rw_sel,next_pc_sel;
	 wire [4:0] alu_op;
	 //Entradas y Salidas	 	 
	 wire [31:0] next_pc,pc,pc_inc,pc_jump,pc_sum,inst,dw,crs,crt,inm_ext,alu_input,alu_output,data_rd;
	 wire [4:0] rw;
	 wire zero;
	 
	 Program_Counter program_pc (clk,next_pc,pc);
	 Instruccion_Memory instruction (pc, inst);
	 Control_Unit Control_Total(inst[31:26],inst[5:0],zero,seu_en,dw_sel,rw_sel,alu_src_b,rf_wr,dm_rd,dm_wr,next_pc_sel,alu_op);
	 Register_File register_file (inst[25:21],dw,rw,rf_wr,clk,inst[20:16],crs,crt);
	 SEU extender_bits(inst[15:0],seu_en,inm_ext);
	 MUX_ALU mux_alu_input (crt,inm_ext,alu_src_b,alu_input);
	 ALU unidad_aritmeticologica(crs,alu_input,alu_op,inst[10:6],zero,alu_output);
	 Anpersan concatenar_jump_adress(pc_inc, inst[26:0], pc_jump);
	 Sumador inc_pc(pc,32'b0100,pc_inc);
	 Sumador sumar_pc_equal(pc_inc,inm_ext<<2,pc_sum);	 	 
	 MUX_PC mux_pc (pc_inc,pc_sum,pc_jump,crs,next_pc_sel,next_pc);	 
	 MUX_DW mux_dw (alu_output,pc_inc,data_rd,dw_sel,dw);
	 MUX_RW mux_rw (inst[15:11],inst[20:16],'b11111,rw_sel,rw);
	 Data_Memory memoria_rd_rw (alu_output,crt,dm_wr, dm_rd, data_rd);
	 
	 
endmodule

module Control_Unit(opcode,Function,zero,seu_en,dw_sel,rw_sel,alu_src_b,rf_wr,dm_rd,dm_wr,next_pc_sel,alu_op);
	 input [5:0] opcode;
	 input [5:0] Function;
	 input zero;
	 output seu_en,dw_sel,rw_sel,alu_src_b,rf_wr,dm_rd,dm_wr;
	 output [1:0] next_pc_sel;
	 output [4:0] alu_op;
	 
endmodule

module Program_Counter(clk,next_pc,pc);
	 input clk;
	 input [31:0] next_pc;
	 output [31:0] pc;
	 
endmodule

module Instruccion_Memory(pc,instruction);
	 input [31:0] pc;
	 output [31:0] instruction;
	 
endmodule

module Register_File(rs,dw,rw,rwe,clk,rt,crs,crt);
    input [4:0] rs,rt,rw;
    input [31:0] dw;    
    input rwe;
    input clk;    
    output [31:0] crs,crt;	 
	 
	 //Registros
	 reg [31:0] r [31:0];
	 	 
	 always@(posedge clk)	 
	 begin
			if(rwe == 1) 
				r[rw] =dw;
	 end
	 
	 assign crs = r[rs];
	 assign crt = r[rt];
	 
endmodule

module Data_Memory(address, data_wr, dm_wr, dm_rd, data_rd);
	input [31:0] address;
	input [31:0] data_wr;
	input dm_wr,dm_rd;	
	output reg [31:0] data_rd;
	reg [31:0] dw [5:0];
	
	always @(dm_wr or dm_rd)
	begin
		if(dm_wr)
			dw[address] = data_wr;
		else if(dm_rd)
					data_rd = dw[address];
		else
			dw[address] = 31'b0;
	end	
endmodule

module ALU(crs,alu_input,alu_op,shamnt,zero,alu_output);
	input [31:0] crs,alu_input;
	input [4:0] shamnt;	
	input [3:0] alu_op;
	output reg [31:0] alu_output;
	output reg zero='b0;		
	
//	always@(alu_op)
//	begin
//		case(alu_op)
//			//ADD ADDU ADDI ADDIU LW SW
//			4'b0000 : alu_output = crs + alu_input;
//			//SUB SUBU SUBI
//			4'b0010 : alu_output = crs - alu_input;
//			//MULT MULTU
//			4'b0100 : alu_output = crs * alu_input;
//			//DIV DIVU
//			//4'b0101 : alu_output = crs / alu_input;
//			//AND ANDI
//			4'b0111 : alu_output = crs & alu_input;
//			//OR ORI
//			4'b0111 : alu_output = crs | alu_input;
//			//SLL
//			4'b0111 : alu_output = crs << alu_input;
//			//SRL
//			4'b0111 : alu_output = crs >> alu_input;
//			//BEQ
//			4'b0111 : if(crs==alu_input) zero='b1; else zero='b0;
//			//BNQ
//			4'b0111 : if(crs==alu_input) zero='b0; else zero='b1;
//			//SLT SLTU SLTI
//			4'b0111 : if(crs<alu_input) alu_output=32'b1; else zero=32'b0;
//			default : alu_output = 32'b0;
//		endcase
//	end
	
endmodule

module SEU(inmediate,seu_en,inmediate_ext);
	 input [15:0] inmediate;
	 input seu_en;
	 output reg [31:0] inmediate_ext;
	 
	 always@(seu_en)
	 begin 
		if(seu_en=='b0)
			inmediate_ext = {16'b0,inmediate[15:0]};
		else
			inmediate_ext = {16'b1,inmediate[15:0]};
	 end
	 
endmodule  


module MUX_ALU(crt,inmediate_ext,alu_src_b,alu_input);
	 input [31:0] crt,inmediate_ext;
	 input alu_src_b;
	 output reg [31:0] alu_input= 32'b0;
	 
	 always@(alu_src_b)
	 begin
		case(alu_src_b)
			'b0 : alu_input = crt;
			'b1 : alu_input = inmediate_ext;
			default : ;
		endcase
	 end
	 
endmodule	 
	 
module MUX_DW(alu_output,pc_inc,data_rd,dw_sel,dw);
	 input [31:0] alu_output,pc_inc,data_rd;
	 input [1:0] dw_sel;
	 output [31:0] dw;
	 
	 reg [31:0] dw= 32'b0;
	 
//	 always@(dw_sel)
//	 begin
//		case(dw_sel)
//			'b00 : dw = alu_output;
//			'b01 : dw = pc_inc;
//			'b10 : dw = data_rd;			
//			default : ;
//		endcase
//	 end
	 
endmodule

module MUX_RW(rd,rt,ra,rw_sel,rw);
	 input [5:0] rd,rt,ra;
	 input [1:0] rw_sel;
	 output reg [5:0] rw;
	 
	 always@(rw_sel)
	 begin
		case(rw_sel)
			'b00 : rw = rd;
			'b01 : rw = rt;
			'b10 : rw = ra;			
			default : rw = 5'b0;
		endcase
	 end
endmodule

module MUX_PC(pc_inc,pc_equal,pc_jump,pc_jr,next_pc_sel,next_pc);
	 input [31:0] pc_inc,pc_equal,pc_jump,pc_jr;
	 input [1:0] next_pc_sel;
	 output reg [31:0] next_pc;
	 
	 always@(next_pc_sel)
	 begin
		case(next_pc_sel)
			'b00 : next_pc = pc_inc;
			'b01 : next_pc = pc_equal;
			'b10 : next_pc = pc_jump;
			'b11 : next_pc = pc_jr;
			default : next_pc = pc_inc;
		endcase
	 end
	 
endmodule

module Sumador(ent1,ent2,sal);
	input [31:0] ent1,ent2;
	output [31:0] sal;
	
	//assign sal = ent1 + ent2;
	
endmodule
	 
module Anpersan (pc_inc, jump_address, out_anpersan);
	input [3:0] pc_inc;
	input [26:0] jump_address;
	output [31:0] out_anpersan;

   //assign out_anpersan = {pc_inc, 00, jump_address};

endmodule	 

