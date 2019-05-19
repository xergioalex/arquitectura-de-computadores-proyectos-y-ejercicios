`timescale 1ns / 1ps

module Register_FIle_Xergio(rs,dw,rw,rwe,clk,rt,crs,crt);
    input [1:0] rs;
    input [3:0] dw;
    input [1:0] rw;
    input rwe;
    input clk;
    input [1:0] rt;
    output [3:0] crs;
    output [3:0] crt;
    	 	
	 //Registros
	 wire [3:0] r [3:0]; 
	 wire er0,er1,er2,er3;
			 	
	 //Modulos
	 Decodificador dec(rw,rwe,er0,er1,er2,er3);
//	 always@(posedge clk)
//	 begin
//		if(er0=='b1) r0 = dw;
//		if(er1=='b1) r1 = dw;
//		if(er2=='b1) r2 = dw;
//		if(er3=='b1) r3 = dw;
//	 end
	 Registro R0 [3:0](dw, er0, clk,r[0]);
	 
	 
//	 Registro R1(dw, er1, clk,r[1]);
//	 Registro R3(dw, er2, clk,r[2]);
//	 Registro R4(dw, er3, clk,r[3]);
	 Multiplexor muxrs(r[0],r[1],r[2],r[3],rs,crs);
	 Multiplexor muxrt(r[0],r[1],r[2],r[3],rt,crt);
endmodule

module Registro(r, enr, clk,cr);
		input [3:0] r;
		input enr;
		input clk;      
		output [3:0] cr;
		reg [3:0] cr;
		
		always @(posedge clk)
		 begin
			if (enr == 1) 
				cr = r;			
		 end
endmodule

module Multiplexor(r0,r1,r2,r3,control,salida);
	 input [3:0] r0;
    input [3:0] r1;
    input [3:0] r2;
    input [3:0] r3;
    input [1:0] control;        
    output [3:0] salida;
	 
	 reg [3:0] salida;
	 wire [3:0] r0,r1,r2,r3;
	 
	 always@(control,r0,r1,r2,r3)
	 begin
		case(control)
			'b00 : salida = r0;
			'b01 : salida = r1;
			'b10 : salida = r2;
			'b11 : salida = r3;
			default : ;
		endcase
	 end
	 
endmodule

module Decodificador(rw,rwe,er0,er1,er2,er3);
	input [1:0] rw;
	input rwe;
	output er0,er1,er2,er3;
	
	wire rwe;
	wire [1:0] rw;
	//Señales
	reg er0,er1,er2,er3;
	
	always@(rw,rwe)
	begin
		if (rwe==1)
		begin
			case(rw)
				'b00:begin er0<='b1; er1<='b0; er2<='b0; er3<='b0; end
				'b01:begin er0<='b0; er1<='b1; er2<='b0; er3<='b0; end
				'b10:begin er0<='b0; er1<='b0; er2<='b1; er3<='b0; end
				'b11:begin er0<='b0; er1<='b0; er2<='b0; er3<='b1; end
			endcase
		end
	end
	
endmodule


