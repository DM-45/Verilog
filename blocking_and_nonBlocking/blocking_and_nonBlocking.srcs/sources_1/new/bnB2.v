`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2024 12:29:44 AM
// Design Name: 
// Module Name: bnB2
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


module bnB2(
	in, sel, out
    );
    input [7:0] in;
    input [2:0] sel;
    output reg out;
    
    always @(*) begin
    	case(sel)
    		3'b000: out = in[0];
    		3'b001: out = in[1];
    		3'b010: out = in[2];
    		3'b011: out = in[3];
    		3'b100: out = in[4];
    		3'b101: out = in[5];
    		3'b110: out = in[6];
    		3'b111: out = in[7];
    		default: out = 1'bx;
    	endcase
    end
endmodule
