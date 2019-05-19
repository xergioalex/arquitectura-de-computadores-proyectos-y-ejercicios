`timescale 1ns / 1ps

module PTD(
    input clk,
    output reg clk_out
    );
	
		
	 always@(clk)
	 begin
		if(clk)
			clk_out='b1;
		else
			clk_out='b0;
	 end
	 
	 

endmodule
