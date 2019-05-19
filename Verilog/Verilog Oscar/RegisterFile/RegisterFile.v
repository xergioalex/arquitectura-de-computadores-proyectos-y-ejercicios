`timescale 1ns / 1ps

module decodifi(rw, rgwr, s1,s2,s3,s4);
    input [0:1] rw;
    input rgwr;
    output s1;
    output s2;
    output s3;
    output s4;
    
	 reg s1,s2,s3,s4;
	 
	 always @(rw or rgwr)
	 begin
	 if(rgwr==1)
		case(rw)
			'b00 : begin
						s1 = 1;s2 = 0;s3 = 0;s4 =0;
					 end
			'b01 : begin
						s1 = 0;s2 = 1;s3 = 0;s4 =0;
					 end
			'b10 : begin
						s1 = 0;s2 = 0;s3 = 1;s4 =0;
					 end
			'b11 : begin
						s1 = 0;s2 = 0;s3 = 0;s4 =1;
					 end
			default : ;
		endcase
		
		   
		
	 end
endmodule


module Multiplexor(ent1,ent2,ent3,ent4,sc,s);
    input [0:3] ent1;
    input [0:3] ent2;
    input [0:3] ent3;
    input [0:3] ent4;
    input [0:1] sc;
    output [0:3] s;
	 
	 reg [0:3] s;
    
	 always @(ent1 or ent2 or ent3 or ent4 or sc)
		begin
		case(sc)
			'b00 :  s = ent1;
			'b01 :  s = ent2;
			'b10 :  s = ent3;
			'b11 :  s = ent4;
			default : ;
		endcase
			
		end
endmodule


module Registro(ent, en, clk,s);
		input [0:3] ent;
		input en;
		input clk;      
		output [0:3] s;
		reg [0:3] s;
		
		always @(posedge clk)
		 begin
			if (en == 1) 
				s = ent;
			
		 end
endmodule


module RegisterFile(RS,DW,RW,RG_WE,RT,CLK,CRS,CRT);
    input [0:1] RS;
    input [0:3] DW;
    input [0:1] RW;
    input RG_WE;
    input [0:1] RT;
    input CLK;
    output [0:3] CRS;
    output [0:3] CRT;
	 
	 wire  s1,s2,s3,s4;
	 wire [0:3] sr1,sr2,sr3,sr4;
	 
	 
		 decodifi DEC(RW, RG_WE, s1,s2,s3,s4);
		 Registro R0(DW, s1, CLK,sr1);
		 Registro R1(DW, s2, CLK,sr2);
		 Registro R3(DW, s3, CLK,sr3);
		 Registro R4(DW, s4, CLK,sr4);
		 
		 Multiplexor M1(sr1,sr2,sr3,sr4,RS,CRS);
		 Multiplexor M2(sr1,sr2,sr3,sr4,RT,CRT);
	
	
endmodule
