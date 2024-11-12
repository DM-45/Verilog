`timescale 1ns / 1ps

module divide_by_3_tb;
	reg rst;
	reg clk;
	
	wire clk_3;
	
	divide_by_3 uut(.clk(clk), .reset(rst), .clk_3(clk_3) );
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		rst = 1;
		#15
		rst = 0;
		#1000000000;
		$finish;
	end
endmodule
