`timescale 1ns / 1ps

module Register_File(rs,dw,rw,rwe,clk,rt,crs,crt);
    input [1:0] rs;
    input [3:0] dw;
    input [1:0] rw;
    input rwe;
    input clk;
    input [1:0] rt;
    output [3:0] crs;
    output [3:0] crt;
	 
	 reg [0:3] crs,crt;
	 reg [0:3] r0=4'b0;
	 reg [0:3] r1=4'b0;
	 reg [0:3] r2=4'b0;
	 reg [0:3] r3=4'b0;	 
	 
	 always@(posedge clk)
	 begin
			if(rwe == 1) begin			
				case(rw) 
					'b00: begin r0=dw; end
					'b01: begin r1=dw; end
					'b10: begin r2=dw; end
					'b11: begin r3=dw; end								
				endcase
			end			
	end
	always@(rs,rt)
	begin
			case(rs)
				'b00: begin crs=r0; end
				'b01: begin crs=r1; end
				'b10: begin crs=r2; end
				'b11: begin crs=r3; end
			endcase
			case(rt)
				'b00: begin crt=r0; end
				'b01: begin crt=r1; end
				'b10: begin crt=r2; end
				'b11: begin crt=r3; end
			endcase
	 end
endmodule
