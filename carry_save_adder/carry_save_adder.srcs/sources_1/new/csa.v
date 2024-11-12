`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 04:22:18 PM
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


module csa(
a, b, c, ans, cout
    );
    input [4:0] a, b, c;
    output[5:0] ans;
    output cout;
    wire [4:0] s, c_int;
    
  // 1st Level
  full_add inst1( .a(a[0]), .b(b[0]), .c(c[0]), .sum(ans[0]), .carry(c_int[0]) );
  full_add inst2( .a(a[1]), .b(b[1]), .c(c[1]), .sum(s[1]), .carry(c_int[1]) );
  full_add inst3( .a(a[2]), .b(b[2]), .c(c[2]), .sum(s[2]), .carry(c_int[2]) );
  full_add inst4( .a(a[3]), .b(b[3]), .c(c[3]), .sum(s[3]), .carry(c_int[3]) );
  full_add inst5( .a(a[4]), .b(b[4]), .c(c[4]), .sum(s[4]), .carry(c_int[4]) );
  
  // 2nd Level
  r_add andInst( .a(c_int[4:0]), .b({s[4:1]}), .r_out(ans[5:1]), .rc_out(cout) );
endmodule

// 1-bit full adder
module full_add(a, b, c, sum, carry);

input a, b, c;
output sum, carry;

assign {carry, sum} = a+b+c;

endmodule

//1-bit half adder
module half_add(a, b, sumh, carryh);

input a, b;
output sumh, carryh;

assign {carryh, sumh} = a+b;

endmodule

//Ripple carry adder
module r_add(a, b, r_out, rc_out);

input[4:0] a;
input[3:0] b;
output[4:0] r_out;
output rc_out;

wire c1, c2, c3, c4;

half_add inst1(.a(a[0]), .b(b[0]), .sumh(r_out[0]), .carryh(c1) );
full_add inst2( .a(a[1]), .b(b[1]), .c(c1), .sum(r_out[1]), .carry(c2) );
full_add inst3( .a(a[2]), .b(b[2]), .c(c2), .sum(r_out[2]), .carry(c3) );
full_add inst4( .a(a[3]), .b(b[3]), .c(c3), .sum(r_out[3]), .carry(c4) );
half_add inst5( .a(a[4]), .b(c4), .sumh(r_out[4]), .carryh(rc_out) );

endmodule