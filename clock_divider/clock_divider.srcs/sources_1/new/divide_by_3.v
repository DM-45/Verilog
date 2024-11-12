`timescale 1ns / 1ps

module divide_by_3(
input clk,
input reset,
output clk_3
    );
    
    wire q0, q1, q0_bar, q1_bar;
    wire inter;
    assign inter = q0_bar & q1_bar;
    
    dff inst_1(.clock(clk), .rst(reset), .d(inter), .q(q0), .q_bar(q0_bar) );
    dff inst_2(.clock(clk), .rst(reset), .d(q0), .q(q1), .q_bar(q1_bar) );
    
    assign clk_3 = q1;
    
endmodule


module dff(clock, rst, d, q, q_bar);
	output reg q, q_bar;
	input clock, rst, d;
	
	always @ (posedge clock) begin
		q_bar <= ~q;
		if(rst) q <= 1'b0;
		else q <= d;
	end
	
endmodule