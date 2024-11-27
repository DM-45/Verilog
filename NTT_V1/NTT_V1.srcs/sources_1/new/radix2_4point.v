`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 02:16:12 PM
// Design Name: 
// Module Name: radix2_4point
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


module radix2_4point(
input clk, rst,
input [15:0] x0, x1, x2, x3,
output reg [15:0] out0, out1, out2, out3
    );
    wire [15:0] q_val = 16'd7681;
    wire [15:0] w0 = 16'd1;
    wire [15:0] w1 = 16'd3383;
    wire [15:0] inter0, inter1, inter2, inter3;
    wire [15:0] y0, y1, y2, y3;
    
    //First stage - two 2-input butterfly units
    butterfly bu0(.a(x0), .b(x2), .w(w0), .y0(inter0), .y1(inter2) );
    butterfly bu1(.a(x1), .b(x3), .w(w0), .y0(inter1), .y1(inter3) );
    
    //Second stage - combining 2 input butterfly units
    butterfly bu2(.a(inter0), .b(inter1), .w(w0), .y0(y0), .y1(y2), .q(q_val) );
    butterfly bu3(.a(inter2), .b(inter3), .w(w1), .y0(y1), .y1(y3), .q(q_val) );
    
    always @(posedge clk) begin
    	if(rst) begin
    		out0 <= 0; out1 <= 0; out2 <= 0; out3  <=0;
    	end else begin
    		out0 <= y0; out1 <= y1; out2 <= y2; out3 <= y3;
    	end
    end    
endmodule
