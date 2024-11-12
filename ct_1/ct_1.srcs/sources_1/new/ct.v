`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 09:58:30 PM
// Design Name: 
// Module Name: ct
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


module ct (input [31:0] x0, input [1:0] sel, input clk,rst_n, 
output [31:0] out); 
reg [31:0] x1, x2, x3; 
reg [31:0] y0, y1; 
wire [31:0] out1, out2; 
assign out1 = x0 + x1; 
assign out2 = x2 + x3;
assign out = y0 + y1;
always @(posedge clk or negedge rst_n) begin 
 if(!rst_n) begin 
 x1 <= 0; 
 x2 <= 0; 
 x3 <= 0; 
 end 
 else if (sel==0) begin 
 x3 <= x2; 
 x2 <= x1; 
 x1 <= x0; 
 end 
 else if (sel == 01) begin 
 x3 <= x1; 
 x2 <= x0; 
 x1 <= x2; 
 end 
 else begin 
 x3 <= x3; 
 x2 <= x2; 
 x1 <= x0; 
 end 
end 
always @ (posedge clk or negedge rst_n) begin 
 if(!rst_n) begin 
 y1 <= 0; 
 y0 <= 0;
end 
 else begin 
 y1 <= out1 + y0; 
 y0 <= y1 + out2; 
end 
 end 
endmodule