`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2024 05:07:24 PM
// Design Name: 
// Module Name: ans_6
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

module ans_6(
clk, reset, x, y
);

input clk, reset;
input signed [7:0] x;
output signed [7:0] y;

    reg signed [7:0] x_1, x_2, y_1, y_2, y_3;        

    always @(posedge clk) begin
        if (reset) begin
            x_1 <= 8'd0;
            x_2 <= 8'd0;
            y_1 <= 8'd0;
            y_2 <= 8'd0;
            y_3 <= 8'd0;
            //y   <= 8'd0;
        end 
    else begin
            //y <= x - x_1 + x_2 + y_3 + (y_1 >>> 1) + (y_2 >>> 2); 

            x_2 <= x_1; //x[n-2]
            x_1 <= x; //x[n-1]
            y_3 <= y_2; //y[n-3]
            y_2 <= y_1; //y[n-2]
            y_1 <= y; //y[n-1]
        end
    end
    assign y = x - x_1 + x_2 + y_3 + (y_1 >>> 1) + (y_2 >>> 2);
endmodule