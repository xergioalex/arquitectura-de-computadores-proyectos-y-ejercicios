`timescale 1ns / 1ps

module RegisterFile_Comportamental (RS,DW,RW,RG_WE,RT,CLK,CRS,CRT);
    input [0:1] RS;
    input [0:3] DW;
    input [0:1] RW;
    input RG_WE;
    input [0:1] RT;
    input CLK;
    output [0:3] CRS;
    output [0:3] CRT;
	 
	 reg [0:3] CRS,CRT;
	 reg s1,s2,s3,s4;
	 reg [0:3] r0,r1,r2,r3;
	 
	 
	 always @(posedge CLK)
			if(RG_WE == 1)
				begin
					case(RW)
						'b00 : begin
									s1 = 1; s2 = 0; s3 = 0; s4 = 0;
								 end
						'b01 : begin
									s1 = 0; s2 = 1; s3 = 0; s4 = 0;
								 end
						'b10 : begin
									s1 = 0; s2 = 0; s3 = 1; s4 = 0;
								 end
						'b11 : begin
									s1 = 0; s2 = 0; s3 = 0; s4 = 1;
								 end
					 endcase
					 
						 if(s1==1) r0 = DW;
						 if(s2==1) r1 = DW;
						 if(s3==1) r2 = DW;
						 if(s4==1) r3 = DW;
					 
						 case(RS)
							'b00 : CRS = r0;
							'b01 : CRS = r1;
							'b10 : CRS = r2;
							'b11 : CRS = r3;
						 endcase
						 
						 case(RT)
							'b00 : CRT = r0;
							'b01 : CRT = r1;
							'b10 : CRT = r2;
							'b11 : CRT = r3;
						 endcase
					 
				end

endmodule
