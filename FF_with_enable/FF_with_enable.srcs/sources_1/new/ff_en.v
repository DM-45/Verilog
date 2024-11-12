`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2024 11:07:22 AM
// Design Name: 
// Module Name: ff_en
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


module ff_en(clk, d, en, q);
    input wire clk, d, en;
    output reg q;
    always @ (posedge clk) begin
        if(en) q <= d;
        else q <= q;        
    end 
endmodule
