`timescale 1ns / 1ps

module Instruction_Memory(pc, inst);
	input wire [31:0] pc;
	output reg [31:0] inst;
	
	reg [31:0] memory [7:0];
	
	initial $readmemh("instrucciones.txt", memory);
	
	always@(pc) begin
		inst = memory[pc];
	end
	

endmodule
