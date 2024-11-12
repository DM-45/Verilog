`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2024 12:09:49 AM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
q3, clk, pre_n
    );
    output q3;
    input clk, pre_n;
    reg q1,q2,q3;
    wire n;
    
    assign n = q1^q3;
    
    always @ (posedge clk or negedge pre_n) begin
    	if(!pre_n) begin
    		q3 <= 1'b1;
    		q2 <= 1'b1;
    		q1 <= 1'b1;
    	end
    	else begin
    		q3 <= q2;
    		q2 <= n;
    		q1 <= q3;
    	end
    end
endmodule
