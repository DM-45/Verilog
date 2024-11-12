`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2024 11:45:27 PM
// Design Name: 
// Module Name: csa_tb
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


module csa_tb;
reg [4:0] a, b, c;
wire[5:0] ans;
wire cout;

csa dut( .a(a), .b(b), .c(c), .ans(ans), .cout(cout) );

initial begin
a=0; b=0; c=0;
#100 a = 5'd10; b=5'd2; c=5'd6;
#100 a = 5'd1; b=5'd2; c=5'd9;			
#100 a = 5'd1; b=5'd4; c=5'd0;
#100 a = 5'd3; b=5'd1; c=5'd2;
#100 a = 5'd1; b=5'd4; c=5'd1;
#100 a = 5'd1; b=5'd5; c=5'd9;
#100 a = 5'd7; b=5'd1; c=5'd2;

end

endmodule
