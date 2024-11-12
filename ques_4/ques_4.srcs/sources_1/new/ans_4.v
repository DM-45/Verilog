`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2024 04:28:16 PM
// Design Name: 
// Module Name: ans_4
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


module ans_4(
input [5:0] A, B,
output [11:0] C
    );
    wire pp[0:5][5:0];
    wire [5:0] s1, c1;
    wire [5:0] s2, c2;
    wire [5:0] s3, c3;
    
    
endmodule

// Adder(s) for implementing dadda multiplier
module carry_save(A, B, Cin, S, Cout);
input A, B, Cin;
output S, Cout;

assign {Cout, S} = A+B+Cin;

endmodule

module half_adda(A, B, S, Carry);
input A, B;
output S, Carry;

assign S = A^B;
assign Carry = A&B;

endmodule