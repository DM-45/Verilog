`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 11:47:53 AM
// Design Name: 
// Module Name: butterfly
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


module butterfly(
    input [15:0] a, b, w, q,
    output [15:0] y0, y1
);
	wire [15:0] temp;

modmul mm(.a(b), .b(w), .q(q), .y(temp) );
modadd ma(.a(a), .b(temp), .y(y0), .q(q) );
modsub ms(.a(a), .b(temp), .y(y1), .q(q) );

endmodule

module modadd(
input [15:0] a, b, q,
output [15:0] y
);

wire[16:0] sum;
assign sum = a+b;
assign y = (sum >= q) ? sum - q : sum;

endmodule

module modsub(
input [15:0] a, b, q,
output [15:0] y
);

wire[15:0] sub;
assign sub = a - b;
assign y = (a >= b) ? sub : sub + q;

endmodule

module modmul(
	input [15:0] a, b, q,
	output [15:0] y
);
	wire [31:0] result;
	assign result = a*b;
	assign y = result % q;
	
endmodule