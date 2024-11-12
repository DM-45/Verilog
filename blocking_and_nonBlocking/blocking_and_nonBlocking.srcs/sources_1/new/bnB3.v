`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2024 12:50:58 AM
// Design Name: 
// Module Name: bnB3
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


module bnB3(
input mode, clr, ld, clk,
input [0:7] d_in,
output reg [0:7] count
    );
    always @ (posedge clk) begin
    	if (ld) count <= d_in;
    	else if (clr) count <= 8'd0;
    	else if (mode) count <= count+1;
    	else count <= count-1;
    end
endmodule
