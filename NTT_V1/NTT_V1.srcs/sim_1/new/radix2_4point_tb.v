`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 02:49:16 PM
// Design Name: 
// Module Name: radix2_4point_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module radix2_4point_tb;

reg signed [15:0] x0, x1, x2, x3;

wire signed [15:0] y0, y1, y2, y3;

radix2_4point dut(.x0(x0), .x1(x1), .x2(x2), .x3(x3), .y0(y0), .y1(y1), .y2(y2), .y3(y3) );

initial begin
	x0 = 1;
	x1 = 2;
	x2 = 3;
	x3 = 4;
	
	#10
	
	$finish;
end 
endmodule
