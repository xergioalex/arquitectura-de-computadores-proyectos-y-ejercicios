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
    
	 reg [3:0] crs,crt;
	 //Registros
	 reg [3:0] r0 = 4'b0,r1 = 4'b0, r2 = 4'b0,r3 = 4'b0;
	 wire er0,er1,er2,er3;
		
	 //Modulos
	 Multiplexor muxrs(r0,r1,r2,r3,rs,crs);
	 Multiplexor muxrs(r0,r1,r2,r3,rt,crt);
	 
	 
endmodule

module Multiplexor(r0,r1,r2,r3,control,salida);
	 input [3:0] r0;
    input [3:0] r1;
    input [3:0] r2;
    input [3:0] r3;
    input [1:0] control;        
    output [3:0] salida;
	 
	 reg [3:0] salida;
	 
	 always@(control)
	 begin
		case(control)
			'b00 : begin salida=r0; end
			'b01 : begin salida=r1; end
			'b10 : begin salida=r2; end
			'b11 : begin salida=r3; end
		endcase
	 end
	 
endmodule
