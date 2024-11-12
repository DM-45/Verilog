`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 11:57:57 PM
// Design Name: 
// Module Name: bnB
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


module bnB;
integer a, b, c, d;
always @(*)
repeat(4)
begin
#5 a = b + c;
#5 d = a - 3;
#5 b = d + 10;
#5 c = c + 1;
end 
endmodule
