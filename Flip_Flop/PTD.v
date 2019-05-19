`timescale 1ns / 1ps
module PTD(
    input clk,
    output reg enable
    );
	
	 always@(clk)
	 begin
		if(clk)
			enable='b1;
		else
			enable='b0;
	 end 

endmodule
