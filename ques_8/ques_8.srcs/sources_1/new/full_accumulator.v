`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 06:14:33 PM
// Design Name: 
// Module Name: full_accumulator
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


module full_accumulator(
input signed [15:0] x,
input clk, rst,
output reg [31:0] accmltr,
output reg ovflow, uflow,
output reg [15:0] minVal, maxVal,
output reg [31:0] cycleC
    );
    always @(posedge clk, posedge rst) begin
    	if(rst) begin
    		accmltr <= 32'd0;
    		ovflow <= 1'b0;
    		uflow <= 1'b0;
    		minVal <= 16'h7FFF; // minimum 16 bit signed value
    		maxVal <= 16'h8000; // maximum 16 bit signed value
    		cycleC <= 32'd0;
    	end
    	
    	else begin
    		accmltr <= accmltr + x;
    		
    		if(accmltr > 32'h7FFFFFFF) begin
    			ovflow <= 1'b1;
    			uflow <= 1'b0;
    			cycleC <= cycleC;
    		end
    		else if(accmltr < 32'h80000000) begin
    			ovflow <= 1'b0;
    			uflow <= 1'b1;
    			cycleC <= cycleC;
    		end
    		else begin
    			uflow <= 1'b0;
    			ovflow <= 1'b0;
    			cycleC <= cycleC + 1'b1;
    		end
    		
    		if(x < minVal) 
    			minVal <= x;
    		else if(x > maxVal)
    			maxVal <= x;
    		else begin
    			minVal <= minVal;
    			maxVal <= maxVal;
    		end
    	end
    end
endmodule
