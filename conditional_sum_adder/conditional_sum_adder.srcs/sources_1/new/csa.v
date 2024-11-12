`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2024 01:39:38 PM
// Design Name: 
// Module Name: csa
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


module csa

// Inputs declarations
(input [7:0] a, b, // Two inputs a and b with a carry in cin
input cin,
// Outputs declarations
output reg [7:0] sum, // Sum and carry cout
output reg cout);

parameter W=8;

// Intermediate wires
wire s1_0, c2_0, s2_0, c3_0, s3_0, c4_0, s4_0, c5_0, s5_0, c6_0, s6_0, c7_0, s7_0, c8_0;
wire s1_1, c2_1, s2_1, c3_1, s3_1, c4_1, s4_1, c5_1, s5_1, c6_1, s6_1, c7_1, s7_1, c8_1;

// Intermediate registers
reg fcout;
reg s3level_10, s3level_11, s5level_10, s5level_11, s7level_10, s7level_11;
reg c4level_10, c4level_11, c6level_10, c6level_11, c8level_10,c8level_11;
reg c2level_1;
reg c4level_2;
reg s6level_20, s6level_21, s7level_20, s7level_21, c8level_20,c8level_21;

// Level 0
always @*
{fcout,sum[0]} =  a[0] + b[0] + cin;
// Conditional cells instantiation
cc c1( a[1], b[1], s1_0, s1_1, c2_0, c2_1);
cc c2( a[2], b[2], s2_0, s2_1, c3_0, c3_1);
cc c3( a[3], b[3], s3_0, s3_1, c4_0, c4_1);
cc c4( a[4], b[4], s4_0, s4_1, c5_0, c5_1);
cc c5( a[5], b[5], s5_0, s5_1, c6_0, c6_1);
cc c6( a[6], b[6], s6_0, s6_1, c7_0, c7_1);
cc c7( a[7], b[7], s7_0, s7_1, c8_0, c8_1);

// Level 1 muxes
always @*
case(fcout) // For first mux
1'b0: {c2level_1, sum[1]} = {c2_0, s1_0};
1'b1: {c2level_1, sum[1]} = {c2_1, s1_1};
endcase

always @* // For 2nd mux
case(c3_0)
1'b0: {c4level_10, s3level_10} = {c4_0, s3_0};
1'b1: {c4level_10, s3level_10} = {c4_1, s3_1};
endcase

always @* // For 3rd mux
case(c3_1)
1'b0: {c4level_11, s3level_11} = {c4_0, s3_0};
1'b1: {c4level_11, s3level_11} = {c4_1, s3_1};
endcase

always @* // For 4th mux
case(c5_0)
1'b0: {c6level_10, s5level_10} = {c6_0, s5_0};
1'b1: {c6level_10, s5level_10} = {c6_1, s5_1};
endcase

always @* // For 5th mux
case(c5_1)
1'b0: {c6level_11, s5level_11} = {c6_0, s5_0};
1'b1: {c6level_11, s5level_11} = {c6_1, s5_1};
endcase

always @* // For 6th mux
case(c7_0)
1'b0: {c8level_10, s7level_10} = {c8_0, s7_0};
1'b1: {c8level_10, s7level_10} = {c8_1, s7_1};
endcase

always @* // For 7th mux
case(c7_1)
1'b0: {c8level_11, s7level_11} = {c8_0, s7_0};
1'b1: {c8level_11, s7level_11} = {c8_1, s7_1};
endcase

// Level 2 muxes
always @* // First mux of level2
case(c2level_1)
1'b0: {c4level_2, sum[3], sum[2]} = {c4level_10, s3level_10, s2_0};
1'b1: {c4level_2, sum[3], sum[2]} = {c4level_11, s3level_11, s2_1};
endcase

always @* // 2nd mux of level2
case(c6level_10)
1'b0: {c8level_20, s7level_20, s6level_20}={c8level_10, s7level_10, s6_0};
1'b1: {c8level_20, s7level_20, s6level_20}={c8level_11, s7level_11, s6_1};
endcase

always @* // 3rd mux of level2
case(c6level_11)
1'b0: {c8level_21, s7level_21, s6level_21}={c8level_10, s7level_10, s6_0};
1'b1: {c8level_21, s7level_21, s6level_21}={c8level_11, s7level_11, s6_1};
endcase

// Level 3 mux
always @*
case(c4level_2)
1'b0: {cout,sum[7:4]} = {c8level_20, s7level_20, s6level_20, s5level_10, s4_0};
1'b1: {cout,sum[7:4]} = {c8level_21, s7level_21, s6level_21, s5level_11, s4_1};
endcase

endmodule

// Module for conditional cell
module cc(a, b, s_0, s_1, c_0, c_1);
input a,b;
output s_0, c_0, s_1, c_1;
assign s_0 = a^b; // sum with carry in 0
assign c_0 =  a&b; // carry with carry in 0
assign s_1 = s_0; // sum with carry in 1
assign c_1 = a | b; // carry with carry in 1
endmodule