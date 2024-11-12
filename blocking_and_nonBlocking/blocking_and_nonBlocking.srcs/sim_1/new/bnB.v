`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2024 12:20:05 AM
// Design Name: 
// Module Name: bnB_tb
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


module bnB_tb;
integer a, b, c, d;
bnB DUT ();
initial
	begin
		$monitor ($time, "a=%4d, b=%4d, c=%4d, d=%4d", a, b, c, d);
		a = 30; b = 20; c = 15; d = 5;
		#100 $finish;
	end
endmodule
