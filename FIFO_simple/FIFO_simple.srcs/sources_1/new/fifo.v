`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 11:31:28 PM
// Design Name: 
// Module Name: fifo
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


module fifo(
input [15:0] data_in,
input push, pop,
output [15:0] data_out,
output fifo_full, fifo_empty
    );
    
endmodule

module counter(
input increment, decrement, clk, reset,
output reg [3:0] count
);
reg enable;
reg [3:0] mux_out;

always @(*) 
	enable = increment ^ decrement;

always @(*) begin
	case (increment)
		1'b0: mux_out = count - 1;
		1'b1: mux_out = count + 1;
	endcase
end

always @(posedge clk) begin
	if(reset) count <= 0;
	else if(enable) count <= mux_out;
	else count <= count;
end
endmodule