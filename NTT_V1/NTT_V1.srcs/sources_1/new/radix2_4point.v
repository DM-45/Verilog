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
input wire signed [15:0] x0, x1, x2, x3,
output wire signed [15:0] y0, y1, y2, y3
    );
    wire signed [15:0] w[0:1];
    wire signed [15:0] inter[0:3];
    
    assign w[0] = 16'd1;
    assign w[1] = 16'd3383;
    
    //First stage - two 2-input butterfly units
    butterfly bu0(.a(x0), .b(x2), .w(w[0]), .y0(inter[0]), .y1(inter[2]) );
    butterfly bu1(.a(x1), .b(x3), .w(w[0]), .y0(inter[1]), .y1(inter[3]) );
    
    //Second stage - combining 2 input butterfly units
    butterfly bu2(.a(inter[0]), .b(inter[1]), .w(w[0]), .y0(y0), .y1(y2) );
    butterfly bu3(.a(inter[2]), .b(inter[3]), .w(w[1]), .y0(y1), .y1(y3) );
endmodule
