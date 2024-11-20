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
    input wire signed [15:0] a, b, w,
    output reg signed [15:0] y0, y1
);

    // Internal signals
    wire signed [31:0] w_b;

    // Multiply twiddle factor with b
    assign w_b = w * b;

    // Butterfly operation
//    assign y0 = (a + w_b)%7681;
//    assign y1 = (a - w_b)%7681;
    
    always @(*) begin
    	y0 = (a + w_b) % 7681;
    	if(y0 < 0) y0 <= y0 + 7681;
    	else y0 <= y0;
    end
    
    always @(*) begin
    	y1 = (a - w_b) % 7681;
    	if(y1 < 0) y1 <= y1 + 7681;
    	else y1 <= y1;
    end

endmodule
