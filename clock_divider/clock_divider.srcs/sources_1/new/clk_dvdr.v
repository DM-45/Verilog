`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 05:45:41 PM
// Design Name: 
// Module Name: clk_dvdr
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


module clk_dvdr(
reset, clk_in, count
    );
    input reset, clk_in;
    output reg [3:0] count;
    reg [29:0] counter;
    wire clk_dummy;
    
    always @(posedge clk_in or posedge reset) begin
		if(reset) begin 
			counter <= 30'd0;
//			clk_dummy <= 1'b0;
		end
		else begin
			if(counter == 30'd50000000) begin
//				clk_dummy <= ~clk_dummy;
				counter <= 30'd0;
			end
			else
				counter <= counter + 1'b1;
		end
	end
	
	assign clk_dummy = counter[28];
	
//	always @ (posedge clk_dummy or posedge reset) begin
//		if(reset || count == 15) begin
//			count <= 4'd0;
//		end
//		else count <= count + 1'b1;
//	end
endmodule



