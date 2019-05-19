`timescale 1ns / 1ps

/*
  NAME: Procesador Segmentado  
  COPYRIGHT: TODOS LOS DERECHOS RESERVADOS
  AUTHOR: Sergio Alexander Florez Galeano
			 Camilo Fernandez Bernal
			 
  DESCRIPTION: Implementacion del procesador Segmentado mediante el lenguaje de descripcion de Hardware Verilog			
*/

// MODULO: Procesador Segmentado (TOP LEVEL)
module Procesador_Segmentado(clk, alu_output);
	 
	 //----Entradas y Salidas---//
    input clk;
	 output wire [31:0] alu_output;
	 
	 //------Señales del Procesador Segmentado---------//
	 
	 //FETCH
	 wire [31:0] next_pc, pc, pc_inc, inst;	 
	 //DECODE
	 wire [31:0] inst_de,pc_inc_de, crs_de, crt_de, pc_equal_de, pc_jump_de,inm_ext_de;
	 wire [25:0] jump_address_de;
	 wire [15:0] inm_de;
	 wire [5:0] opcode_de,funct_de;
	 wire [4:0] rs_de, rt_de, rd_de, shamnt_de;
	 wire [3:0] pc_inc_ini_de, alu_op_de;
	 wire [1:0] next_pc_sel_de, rw_sel_de, dw_sel_de;
	 wire seu_en_de, alu_src_b_de, dm_rd_de, dm_wr_de, rf_wr_de, zero_de;
	 //EXECUTE
	 wire [31:0] pc_inc_ex, crs_ex, crt_ex, inm_ext_ex, alu_input_ex, alu_output_ex;
	 wire [4:0] rd_ex, rt_ex, rw_ex, shamnt_ex;
	 wire [3:0] alu_op_ex;
	 wire [1:0] rw_sel_ex, dw_sel_ex;
	 wire alu_src_b_ex, dm_rd_ex, dm_wr_ex, rf_wr_ex;
	 //MEMORY
	 wire [31:0] pc_inc_me, crt_me, alu_output_me, data_rd_me;
	 wire [4:0] rw_me;
	 wire [1:0] dw_sel_me;
	 wire dm_rd_me, dm_wr_me, rf_wr_me;
	 //WRITE BACK
	 wire [31:0] pc_inc_wb, alu_output_wb, dw_wb, data_rd_wb;
	 wire [4:0] rw_wb;
	 wire [1:0] dw_sel_wb;
	 wire rf_wr_wb;
	 
	 //--------ASIGNACION DE SEÑALES---------------//
	 
	 assign inm_de = inst_de[15:0];
	 assign opcode_de = inst_de[31:26];
	 assign funct_de = inst_de[5:0];
	 assign rs_de = inst_de[25:21];
	 assign rt_de = inst_de[20:16];
	 assign rd_de = inst_de[15:11];
	 assign shamnt_de = inst_de[10:6];
	 assign pc_inc_ini_de = pc_inc_de[31:28];
	 assign jump_address_de = inst_de[25:0];
	 
	 //---------ASIGNACION DE REGISTROS----------------//
	 
	 //FECTH -> DECODE
	 Registro32 Inst_de(clk, inst, inst_de);
	 Registro32 Pc_inc_de(clk, pc_inc, pc_inc_de);
	 //DECODE -> EXCECUTE
	 Registro32 Pc_inc_ex(clk, pc_inc_de, pc_inc_ex);
	 Registro32 Crt_ex(clk, crt_de, crt_ex);
	 Registro32 Crs_ex(clk, crs_de, crs_ex);
	 Registro32 Inm_ext_ex(clk, inm_ext_de, inm_ext_ex);
	 Registro5  Shamnt_ex(clk, shamnt_de, shamnt_ex);
	 Registro5  Rd_ex(clk, rd_de, rd_ex);
	 Registro5  Rt_ex(clk, rt_de, rt_ex);
	 Registro4  Alu_op_ex(clk,alu_op_de, alu_op_ex);
	 Registro2  Rx_sel_ex(clk, rw_sel_de, rw_sel_ex);
	 Registro2  Dw_sel_ex(clk, dw_sel_de, dw_sel_ex);
	 Registro1  Alu_src_b_ex(clk, alu_src_b_de, alu_src_b_ex);
	 Registro1  Dm_rd_ex(clk, dm_rd_de, dm_rd_ex);
	 Registro1  Dm_wr_ex(clk, dm_wr_de, dm_wr_ex);
	 Registro1  Rf_wr_ex(clk, rf_wr_de, rf_wr_ex);	 
	 //EXECUTE -> MEMORY
	 Registro32 Pc_inc_me(clk, pc_inc_ex, pc_inc_me);
	 Registro32 Crt_me(clk, crt_ex, crt_me);
	 Registro32 Alu_output_me(clk, alu_output_ex, alu_output_me);
	 Registro5  Rw_me(clk, rw_ex, rw_me);
	 Registro2  Dw_sel_me(clk, dw_sel_ex, dw_sel_me);
	 Registro1  Dm_rd_me(clk, dm_rd_ex, dm_rd_me);
	 Registro1  Dm_wr_me(clk, dm_wr_ex, dm_wr_me);
	 Registro1  Rf_wr_me(clk, rf_wr_ex, rf_wr_me);
	 //MEMORY -> WRITE BACK
	 Registro32 PC_inc_wb(clk, pc_inc_me, pc_inc_wb);
	 Registro32 Data_rd_wb(clk, data_rd_me, data_rd_wb);
	 Registro32 Alu_output_wb(clk, alu_output_me, alu_output_wb);
	 Registro5  Rw_wb(clk, rw_me, rw_wb);
	 Registro2  Dw_sel_wb(clk, dw_sel_me, dw_sel_wb);	 
	 Registro1  Rf_wr_wb(clk, rf_wr_me, rf_wr_wb);
	 
	 
	 //------------------MODULOS-------------------//
	 
	 //FETCH
	 Program_Counter PC (clk, next_pc,pc);	 
	 Instruction_Memory Memoria_de_Instrucciones (pc, inst);
	 Sumador_pc Incrementar_PC (pc, pc_inc);	
	 //DECODE
	 Control_Unit Unidad_de_Control_Total (opcode_de, funct_de, zero_de, seu_en_de, alu_src_b_de, alu_op_de, dw_sel_de, rw_sel_de, rf_wr_de, dm_wr_de, dm_rd_de, next_pc_sel_de); 	  
	 Register_File Archivo_de_Registros(rs_de, rt_de, dw_wb, rw_wb, rf_wr_wb, clk , crs_de, crt_de);
	 SEU Unidad_Extension_Bits (inm_de, seu_en_de, inm_ext_de);
	 Comparador Zero_Ouput(crs_de, crt_de, zero_de);
	 Sumador_pc_inc Adress_BEQ_BNE (pc_inc_de, inm_ext_de, pc_equal_de);
	 Ampersan Unidad_de_Concatenacion(pc_inc_ini_de, jump_address_de, pc_jump_de);
	 MUX_PC Pc_Mux (pc_inc, pc_equal_de, pc_jump_de, crs_de, next_pc_sel_de, next_pc);
	 //EXCECUTE
	 MUX_ALU Alu_Mux (crt_ex, inm_ext_ex, alu_src_b_ex, alu_input_ex);
	 ALU Unidad_Aritmeticologica (crs_ex, alu_input_ex, shamnt_ex, alu_op_ex, alu_output_ex);
	 MUX_RW Rw_Mux (rd_ex, rt_ex, rw_sel_ex, rw_ex);
	 //MEMORY
	 Data_Memory Memoria_de_Datos (alu_output_me, crt_me, dm_wr_me, dm_rd_me, data_rd_me);
	 //WRITE BACK
	 MUX_DW Dw_Mux (pc_inc_wb, data_rd_wb, alu_output_wb, dw_sel_wb, dw_wb);
	 
	 //-------------Asignacion de Salidas---------------//
	 assign alu_output = alu_output_ex;
	 
endmodule

// MODULO: Registro de un (1) bit
module Registro1(clk, r_input, r_output);
	input wire clk;
	input wire r_input;
	output reg r_output;
	
	initial r_output = 'b0;

	always @ (posedge clk)begin
		r_output = r_input;
	end
	
endmodule

// MODULO: Registro de dos (2) bits
module Registro2(clk, r_input, r_output);
	input clk;
	input wire [1:0] r_input;
	output reg [1:0] r_output;
	
	initial r_output = 2'b0;
	
	always @ (posedge clk)begin
		r_output = r_input;
	end
endmodule

// MODULO: Registro de Cuatro (4) bits
module Registro4(clk, r_input, r_output);
	input clk;
	input wire [3:0] r_input;
	output reg [3:0] r_output;
	
	initial r_output = 4'b0;
	
	always @ (posedge clk)begin
		r_output = r_input;
	end
endmodule

// MODULO: Registro de Cinco (5) bits
module Registro5(clk, r_input, r_output);
	input clk;
	input wire [4:0] r_input;
	output reg [4:0] r_output;
	
	initial r_output = 5'b0;
	
	always @ (posedge clk)begin
		r_output = r_input;
	end
endmodule

// MODULO: Registro de Treinta y Dos (32) bits
module Registro32(clk, r_input, r_output);
	input clk;
	input wire [31:0] r_input;
	output reg [31:0] r_output;
	
	initial r_output = 32'b0;
	
	always @ (posedge clk)begin
		r_output = r_input;
	end
endmodule

// MODULO: Unidad de comparacion de bits: Devuelve 1 si ambas señales son iguales o 0 de lo contrario
module Comparador(crs,alu_input,zero);
	input wire [31:0] crs;
	input wire [31:0] alu_input;
	output reg zero;
	
	always@(crs or alu_input)
	begin
		if(crs==alu_input)
			zero='b1;
		else
			zero='b0;
	end
endmodule

// MODULO: Control Unit : envia las señales de control a cada modulo.
module Control_Unit(opcode, funct, zero,seu_en, alu_src_b, alu_op, dw_sel, rw_sel, rf_wr, dm_wr, dm_rd, next_pc_sel);
	input [5:0] opcode,funct;
	input zero;	
	output reg [3:0] alu_op;
	output reg [1:0] dw_sel,rw_sel,next_pc_sel;
	output reg seu_en,alu_src_b,rf_wr,dm_wr,dm_rd;
		
	initial begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b0; next_pc_sel=2'b00; end
		 
	always@(opcode or funct or zero)
	begin
		case(opcode) //Tipo I
			6'b000000 : case(funct) //Tipo R
			   //ADD ADDU
				6'b100000: begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				6'b100001: begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				//SUB SUBU
				6'b100010: begin alu_op = 4'b0001; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				6'b100011: begin alu_op = 4'b0001; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				//AND
				6'b100100: begin alu_op = 4'b0010; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				//OR
				6'b100101: begin alu_op = 4'b0011; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				//SLL SRL
				6'b000000: begin alu_op = 4'b0100; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				6'b000010: begin alu_op = 4'b0101; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				//SLT SLTU
				6'b101010: begin alu_op = 4'b1000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				6'b101011: begin alu_op = 4'b1000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b1; next_pc_sel=2'b00; end
				//JUMP
				//JR
				6'b001000: begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b0; next_pc_sel=2'b11; end
				default : begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b0; next_pc_sel=2'b00; end
			endcase
			//ADDI ADDIU
			6'b001000: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
			6'b001001: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
			//ANDI
			6'b001100: begin alu_op = 4'b0010; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
			//ORI
			6'b001101: begin alu_op = 4'b0011; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
			//BEQ BNE
			6'b000100: begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b0;  next_pc_sel=2'b00; if(zero==1)next_pc_sel=2'b01;	end
			6'b000101: begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b0;  next_pc_sel=2'b00; if(zero==0)next_pc_sel=2'b01;	end
			//LW SW
			6'b100011: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b1; dw_sel=2'b10; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
			6'b100101: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b1; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b0; next_pc_sel=2'b00; end
			//SLTI SLTIU
			6'b001010: begin alu_op = 4'b1000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
			6'b001011: begin alu_op = 4'b1000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
			//JUMP
			//J JAL
			6'b000010: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b0; next_pc_sel=2'b10; end
			6'b000011: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b01; rw_sel=2'b11; rf_wr='b1; next_pc_sel=2'b01; end				
			default : begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b0; next_pc_sel=2'b00; end
		endcase
	end
	
endmodule

// MODULO: Unidad Aritmeticologica (ALU) : Realiza las operaciones del procesador
module ALU(crs, alu_input, shamnt, alu_op, alu_output);
	input wire[31:0] crs,alu_input;
	input wire [4:0] shamnt;
	input wire [3:0] alu_op;
	output reg [31:0] alu_output;
	
	initial begin alu_output = 32'b0; end

	always@(alu_op or crs or alu_input or shamnt) 
	begin
		case(alu_op)
			//ADD ADDU ADDI ADDIU LW SW
			4'b0000 : begin alu_output = crs + alu_input; end
			//SUB SUBU SUBI
			4'b0001 : begin alu_output = crs - alu_input; end
			//MULT MULTU
			//4'b0100 : alu_output = crs * alu_input;
			//DIV DIVU
			//4'b0101 : alu_output = crs / alu_input;
			//AND ANDI
			4'b0010 : begin alu_output = crs & alu_input;  end
			//OR ORI
			4'b0011 : begin alu_output = crs | alu_input;  end
			//SLL
			4'b0100 : begin alu_output = crs << shamnt; end
			//SRL
			4'b0101 : begin alu_output = crs >> shamnt; end
			//BEQ
			4'b0110 : begin alu_output = 32'b0; end
			//BNQ
			4'b0111 : begin alu_output = 32'b0; end
			//SLT SLTU SLTI
			4'b1000 : begin if(crs<alu_input) alu_output=32'b1; else alu_output=32'b0; end
			default : begin alu_output = 32'b0; end
		endcase
	end

endmodule

// MODULO: Memoria de Datos : Es la memoria del procesador
module Data_Memory(address, data_wr, dm_wr, dm_rd, data_rd);
	input wire [31:0] address,data_wr;
	input wire dm_wr,dm_rd;
	output reg [31:0] data_rd = 32'b0;
	reg [31:0] memory [0:7];
	
	always @(dm_wr or address or data_wr)
	begin
		if(dm_wr=='b1) 
			memory[address] = data_wr;		
	end

	always @(dm_rd or address ) 
	begin
		if(dm_rd=='b1) 
			data_rd = memory[address];	
		else
			data_rd = 32'b0;
	end
	
endmodule

// MODULO: Extiende el inmediate de 16 bits a 32 bitss.
module SEU(inmediate, seu_en, inm_ext);
	input wire [15:0] inmediate;
	input wire seu_en;
	output reg [31:0] inm_ext;
	
	always@(seu_en or inmediate) 
	begin
		case(seu_en)
			'b0 : inm_ext = {16'b0,inmediate};
			'b1 : inm_ext = {16'b1111111111111111,inmediate};		
			default : inm_ext = 32'b0;
		endcase
	end
	
endmodule


// MODULO: Archivo de Registros: Lee y Escribe los 32 registros de la arquitectura MIPS
module Register_File(rs,rt,dw,rw,rf_wr,clk,crs,crt);
	input wire [4:0] rs,rt,rw;
	input wire [31:0] dw;
	input wire clk,rf_wr;
	output [31:0] crs,crt;
	
	//Registros 32x32
	 reg [31:0] registros [0:31];
	 
	 integer i;
	
	 initial begin
		for (i=0; i < 32; i=i+1)
		begin
			registros[i] = 32'b0;
		end
	 end
	 
	 always@(posedge clk) begin
			if(rf_wr == 'b1) 
				registros[rw] =dw;
	 end
	 
	 assign crs = registros[rs];
	 assign crt = registros[rt];
	
endmodule

// MODULO: Instruction Memory: Devuelve la instruccion referente a la direccion de memoria enviada por el Program Counter
module Instruction_Memory(pc, inst);
	input [31:0] pc;
	output [31:0] inst;
	
	reg [31:0] memory [0:8];
	
	initial begin $readmemb("for.txt",memory,0,8); end
	
	assign inst = memory[pc>>2];
	
endmodule 

// MODULO: Program Counter: Devuelve la direccion donde se encuentra almacenada la siguiente instruccion
module Program_Counter(clk, next_pc, pc);
	input wire [31:0] next_pc;
	input wire clk;
	output reg [31:0] pc;
	
	initial pc =32'b0;
	
	always@(posedge clk) begin
		pc = next_pc;
	end
	
endmodule

// MODULO: Suma el PC incrementado con el inmediato extendido
module Sumador_pc_inc(pc_inc,inm_ext, result);
	input wire [31:0] pc_inc,inm_ext;
	output [31:0]  result;
	wire [31:0] inm_ext_sll;
	
	assign inm_ext_sll = inm_ext<<32'b10;
	assign result = pc_inc + inm_ext_sll;
	
endmodule

// MODULO: Suma a la direccion del PC Cuatro(4)
module Sumador_pc(pc, pc_inc);
	input wire [31:0] pc;
	output [31:0] pc_inc;
	
	assign pc_inc = pc + 32'b100;
	
endmodule

// MODULO: Unidad de Concatenacion de bits: Concatena el pc_inc con el jump_adress
module Ampersan(pc_inc, jump_address, pc_jump);
	input wire [25:0] jump_address;
	input wire [3:0] pc_inc;
	output [31:0] pc_jump;
	
	assign pc_jump = {pc_inc, jump_address, 2'b00};
	
endmodule

//-----------MULTIPLEXORES-----------//
 
// MODULO: Multiplexor del Registro rw: Direccion del dato a donde se va a a escribir -> Register_File
module MUX_RW(rd,rt,rw_sel,rw);
   input wire [4:0] rd,rt;   
	input wire [1:0] rw_sel;
   output reg [4:0] rw;	
	
	always @(rw_sel or rd or rt)
	begin
		case(rw_sel)
			'b01: rw = rt;
			'b10: rw = 5'b11111;
			'b00: rw = rd;
			default: ;
		endcase
	end
endmodule

// MODULO: Multiplexor del registro dw: Direccion del dato que se desea escribir -> Register_File
module MUX_DW(pc_inc, data_rd, alu_output, dw_sel, dw);
	input wire [31:0] pc_inc,data_rd,alu_output;
	input wire [1:0] dw_sel;
	output reg [31:0] dw;
	
	always @(dw_sel or pc_inc or data_rd or alu_output )
	begin
		case(dw_sel)
			'b01: dw = pc_inc;
			'b10: dw = data_rd;
			'b00: dw = alu_output;
			default: dw = 32'b0;
		endcase
	end
endmodule

// MODULO: Multiplexor del registro next_pc: Direccion de la siguiente instruccion a ejecutar -> Program_Counter
module MUX_PC(pc_inc, pc_equal, pc_jump, crs, next_pc_sel, next_pc);
	input wire[31:0] pc_inc,pc_equal,pc_jump,crs;
	input wire [1:0] next_pc_sel;
	output reg [31:0] next_pc;
	
	always @(next_pc_sel or pc_inc or pc_equal or pc_jump or crs)
	begin
		case(next_pc_sel)
			'b00 : next_pc = pc_inc;
			'b01 : next_pc =pc_equal;
			'b10 : next_pc = pc_jump;
			'b11 : next_pc = crs;
			default: next_pc = 32'b0;
		endcase
	end
endmodule

// MODULO: Multiplexor de la entrada de la ALU : Elije entre el registro crt y inm_ext -> ALU
module MUX_ALU(crt, inm_ext, alu_src_b, alu_input);
	input wire [31:0] crt;
	input wire [31:0] inm_ext;
	input wire alu_src_b;
	output reg [31:0] alu_input;
	
	always @(alu_src_b or crt or inm_ext)
	begin
		case(alu_src_b)
			'b0 : alu_input= crt;
			'b1 : alu_input = inm_ext;
			default: alu_input= 32'b0;
		endcase
	end
endmodule
