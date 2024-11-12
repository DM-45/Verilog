`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2024 01:53:49 PM
// Design Name: 
// Module Name: clk_dvdr_tb
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


module clk_dvdr_tb;

reg reset, clk_in;
wire [3:0] count;

clk_dvdr uut(.reset(reset), .clk_in(clk_in), .count(count) );

initial begin
	clk_in = 0;
	forever #10 clk_in = ~clk_in;
end

initial begin
	reset = 1;
	#10;
	reset = 0;
end
	
endmodule
