`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 06:52:30 PM
// Design Name: 
// Module Name: circuit_design
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

module circuit (clk,reset,in0,in1,in2,in3,out);

    input clk;
    input  reset;
    input [7:0] in0;  
    input  [7:0] in1;  
    input  [7:0] in2; 
    input [7:0] in3; 
    output reg [7:0] out ;

    reg [7:0] reg0, reg1, reg2, reg3;  
    reg [1:0] count; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            reg0 <= 8'b0;
            reg1 <= 8'b0;
            reg2 <= 8'b0;
            reg3 <= 8'b0;
        end else begin
            reg0 <= in0;  
            reg1 <= in1;  
            reg2 <= in2;  
            reg3 <= in3;  
        end
    end

    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 2'b00; 
        end else begin
            count <= count + 1;  
        end
    end

    // Multiplexer logic
    always @(*) begin
        case (count)
            2'b00: out = reg0;  
            2'b01: out = reg1;  
            2'b10: out = reg2;  
            2'b11: out = reg3;
            default: out = 8'b0;  // Default 
        endcase
    end
    
 endmodule