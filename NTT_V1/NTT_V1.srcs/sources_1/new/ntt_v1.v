`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 12:56:58 PM
// Design Name: 
// Module Name: ntt_v1
// Project Name: BTP
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


module ntt_v1(
	
    );
endmodule

module ntt_core(i, j, N, start1, start2, t, tprev, enable, rw, clock, x1_out, x2_out, tw_ack, buf_ack);

parameter n = 4, m = 25;

input [n:0] i, j, N, t, tprev;
input clock, enable, rw, start1, start2;

output wire [m-1:0] x1_out, x2_out;
output tw_ack, buf_ack;

wire [m-1:0] u_inp, v_inp; //input from memory
wire [n:0] index1, index2; 

endmodule