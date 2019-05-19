`timescale 1ns / 1ps
//$readmemh

// Modulo: Procesador Monociclo (TOP LEVEL)
module Procesador_Monociclo(clk, alu_out);
    input clk;
	 output [31:0] alu_out;
	
	 //Control_Unit: Señales de Control
	 wire seu_en, alu_src_b, rf_wr, dm_wr, dm_rd;
	 wire [1:0] dw_sel,rw_sel,next_pc_sel;
	 wire [3:0] alu_op;	 
	 
	 //Señales de Entrada y Salida de los modulos
	 wire [31:0] dw,crs,crt,next_pc,pc,pc_inc,inst,inm_ext,alu_input,alu_output,pc_equal,pc_jump, data_rd;	 	 
	 wire [4:0] rw;
	 wire zero;
	 
	 Program_Counter PC_adress (clk,next_pc,pc);	 
	 Instruction_Memory Instruction (pc, inst);
	 Control_Unit Control_Total (inst[31:26], inst[5:0], zero, seu_en, alu_src_b, alu_op, dw_sel, rw_sel, rf_wr, dm_wr, dm_rd, next_pc_sel);
	 Register_File Archivo_Registro(inst[25:21],inst[20:16],dw,rw,rf_wr,clk,crs,crt);
	 SEU Unidad_Extension_Bits (inst[15:0],seu_en,inm_ext);	 
	 ALU Unidad_Aritmeticologica (crs, alu_input, inst[10:6], alu_op, zero, alu_output);
	 Sumador Sumar_pc_jump (pc_inc, inm_ext<<2, pc_equal);
	 Sumador Sumar_pc (pc,32'b0100,pc_inc);
	 Ampersan Unidad_Concatenacion(pc_inc[31:28], inst[25:0], pc_jump);
	 MUX_ALU alu_mux (crt, inm_ext, alu_src_b, alu_input);
	 MUX_PC pc_mux (pc_inc, pc_equal, pc_jump, crs, next_pc_sel, next_pc);
	 Data_Memory dato_memoria (alu_output, crt, dm_wr, dm_rd, data_rd);
	 MUX_DW dw_mux (pc_inc, data_rd, alu_output, dw_sel, dw);
	 MUX_RW rw_mux (inst[15:11],inst[20:16],rw_sel,rw);
	 
	 assign alu_out = alu_output;
	 	 	
endmodule

// Control Unit envia las señales de control a cada modulo.
module Control_Unit(opcode, funct, zero,seu_en, alu_src_b, alu_op, dw_sel, rw_sel, rf_wr, dm_wr, dm_rd, next_pc_sel);
	input [5:0] opcode,funct;
	input zero;
	output reg seu_en,alu_src_b;
	output reg [3:0] alu_op;
	output reg [1:0] dw_sel,rw_sel,next_pc_sel;
	output reg rf_wr,dm_wr,dm_rd;
		
	initial begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b00; rf_wr='b0; next_pc_sel=2'b10; end
	
	
	always@(opcode or funct or zero)
	begin
		if(opcode==5'b00000) begin //Tipo R
			case(funct)
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
		end
		else begin
			case(opcode)
				//ADDI ADDIU
				6'b001000: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
				6'b001001: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
				//ANDI
				6'b001100: begin alu_op = 4'b0010; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
				//ORI
				6'b001101: begin alu_op = 4'b0011; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
				//BEQ BNE
				6'b000100: begin alu_op = 4'b0110; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; if(zero==1)next_pc_sel=2'b01; end
				6'b000101: begin alu_op = 4'b0111; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; if(zero==1)next_pc_sel=2'b01; end
				//LW SW
				6'b100011: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b1; dw_sel=2'b10; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
				6'b100101: begin alu_op = 4'b0000; alu_src_b ='b1; seu_en='b0; dm_wr='b1; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b0; next_pc_sel=2'b00; end
				//SLTI SLTIU
				6'b001010: begin alu_op = 4'b1000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
				6'b001011: begin alu_op = 4'b1000; alu_src_b ='b1; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b00; end
				//JUMP
				//J JAL
				6'b000010: begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b1; next_pc_sel=2'b10; end
				6'b000011: begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b01; rw_sel=2'b11; rf_wr='b1; next_pc_sel=2'b01; end				
				default :begin alu_op = 4'b0000; alu_src_b ='b0; seu_en='b0; dm_wr='b0; dm_rd='b0; dw_sel=2'b00; rw_sel=2'b01; rf_wr='b0; next_pc_sel=2'b10; end
			endcase
		end
				
		
	end	 
	
endmodule

// Unidad Aritmeticologica (ALU) : Realiza las operaciones del procesador
module ALU(crs, alu_input, shamnt, alu_op, zero, alu_output);
	input wire[31:0] crs,alu_input;
	input wire [4:0] shamnt;
	input wire [3:0] alu_op;
	output reg [31:0] alu_output = 32'b0;
	output reg zero = 'b0;
	
	always@(alu_op) 
	begin
		case(alu_op)
			//ADD ADDU ADDI ADDIU LW SW
			4'b0000 : alu_output = crs + alu_input;
			//SUB SUBU SUBI
			4'b0001 : alu_output = crs - alu_input;
			//MULT MULTU
			//4'b0100 : alu_output = crs * alu_input;
			//DIV DIVU
			//4'b0101 : alu_output = crs / alu_input;
			//AND ANDI
			4'b0010 : alu_output = crs & alu_input;
			//OR ORI
			4'b0011 : alu_output = crs | alu_input;
			//SLL
			4'b0100 : alu_output = crs << shamnt;
			//SRL
			4'b0101 : alu_output = crs >> shamnt;
			//BEQ
			4'b0110 : if(crs==alu_input) zero='b1; else zero='b0;
			//BNQ
			4'b0111 : if(crs==alu_input) zero='b0; else zero='b1;
			//SLT SLTU SLTI
			4'b1000 : if(crs<alu_input) alu_output=32'b1; else alu_output=32'b0;
			default : alu_output = 32'b0;
		endcase
	end
	
endmodule

// Memoria de Datos : Es la memoria del procesador
module Data_Memory(address, data_wr, dm_wr, dm_rd, data_rd);
	input wire [31:0] address,data_wr;
	input wire dm_wr,dm_rd;
	output reg [31:0] data_rd = 32'b0;
	reg [31:0] memory [5:0];
	
	always @(dm_wr or dm_rd)
	begin
		if(dm_wr) memory[address] = data_wr;
		else if(dm_rd) data_rd = memory[address];
	end
	
endmodule



// Extiende el inmediate de 16 bits a 32 bitss.
module SEU(inmediate, seu_en, inm_ext);
	input wire [15:0] inmediate;
	input wire seu_en;
	output reg [31:0] inm_ext;
	
	always@(seu_en) 
	begin
		if(seu_en) inm_ext = {16'b0,inmediate};
		else inm_ext = {16'b1111111111111111,inmediate};		
	end
	
endmodule


// Archivo de Registros: Lee y Escribe los 32 registros de la arquitectura MIPS
module Register_File(rs,rt,dw,rw,rf_wr,clk,crs,crt);
	input wire [4:0] rs,rt,rw;
	input wire [31:0] dw;
	input wire clk,rf_wr;
	output [31:0] crs,crt;
	
	//Registros 32x32
	 reg [31:0] r [31:0];
	 
	 initial r['b00000] = 'b00000;
	 
	 always@(posedge clk) begin
			if(rf_wr == 1) 
				r[rw] =dw;
	 end
	 
	 assign crs = r[rs];
	 assign crt = r[rt];
	
endmodule

// Instruction Memory: Devuelve la instruccion referente a la direccion de memoria enviada por el Program Counter
module Instruction_Memory(pc, inst);
	input wire [31:0] pc;
	output [31:0] inst;
	
//	reg [31:0] memory [7:0];
//	wire pc_sll = pc<<2;
	//initial $readmemh("instrucciones.txt", memory);

	//always@(pc)
	//begin
	// inst= memory[pc_sll];
	//end
	//assign inst = memory[pc_sll];

endmodule

//Program Counter: Devuelve la direccion donde se encuentra almacenada la siguiente instruccion
module Program_Counter(clk, next_pc, pc);
	input wire [31:0] next_pc;
	input wire clk;
	output reg [31:0] pc=32'b0;
	
	always@(posedge clk) begin
		pc = next_pc;
	end
	
endmodule

// Suma dos digitos binarios
module Sumador(dato1,dato2, result);
	input wire [31:0] dato1,dato2;
	output [31:0]  result;
	
	assign result = dato1 + dato2;
	
endmodule

//Unidad de Concatenacion de bits: Concatena el pc_inc con el jump_adress
module Ampersan(pc_inc, jump_address, pc_jump);
	input wire [25:0] jump_address;
	input wire [3:0] pc_inc;
	output [31:0] pc_jump;
	
	assign pc_jump = {pc_inc, jump_address, 2'b00};
	
endmodule

//MULTIPLEXORES

//Multiplexor del Registro rw: Direccion del dato a donde se va a a escribir -> Register_File
module MUX_RW(rd,rt,rw_sel,rw);
   input wire [4:0] rd,rt;   
	input wire [1:0] rw_sel;
   output reg [4:0] rw;	
	
	always @(rw_sel)
	begin
		case(rw_sel)
			'b01: rw = rt;
			'b10: rw = 5'b11111;
			'b00: rw = rd;
			default:;
		endcase
	end
endmodule

//Multiplexor del registro dw: Direccion del dato que se desea escribir -> Register_File
module MUX_DW(pc_inc, data_rd, alu_output, dw_sel, dw);
	input wire [31:0] pc_inc,data_rd,alu_output;
	input wire [1:0] dw_sel;
	output reg [31:0] dw;
	
	always @(dw_sel)
	begin
		case(dw_sel)
			'b01: dw = pc_inc;
			'b10: dw = data_rd;
			'b00: dw = alu_output;
			default: dw = 32'b0;
		endcase
	end
endmodule

//Multiplexor del registro next_pc: Direccion de la siguiente instruccion a ejecutar -> Program_Counter
module MUX_PC(pc_inc, pc_equal, pc_jump, crs, next_pc_sel, next_pc);
	input wire[31:0] pc_inc,pc_equal,pc_jump,crs;
	input wire [1:0] next_pc_sel;
	output reg [31:0] next_pc;
	
	always @(next_pc_sel)
	begin
		case(next_pc_sel)
			'b00 : next_pc = pc_inc;
			'b01 : next_pc =pc_equal;
			'b10 : next_pc = pc_jump;
			'b11 : next_pc = crs;
			default:;
		endcase
	end
endmodule

//Multiplexor de la entrada de la ALU : Elije entre el registro crt y inm_ext -> ALU
module MUX_ALU(crt, inm_ext, alu_src_b, alu_input);
	input wire [31:0] crt,inm_ext;
	input wire alu_src_b;
	output reg [31:0] alu_input;
	
	always @(alu_src_b)
	begin
		case(alu_src_b)
			'b0 : alu_input= crt;
			'b1 : alu_input = inm_ext;
			default;
		endcase
	end
endmodule
