`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 02:49:16 PM
// Design Name: 
// Module Name: radix2_4point_tb
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


`timescale 1ns / 1ps

module tb_radix2_4point();

reg clk;
reg rst;
reg [15:0] x0, x1, x2, x3;
wire [15:0] out0, out1, out2, out3;

// Instantiate the radix2_4point module
radix2_4point uut (
    .clk(clk),
    .rst(rst),
    .x0(x0),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    x0 = 16'd0;
    x1 = 16'd0;
    x2 = 16'd0;
    x3 = 16'd0;

    // Apply reset
    #10;
    rst = 0;

    // Apply test vectors
    #10;
    x0 = 16'd1;
    x1 = 16'd2;
    x2 = 16'd3;
    x3 = 16'd4;
    
    // End of simulation
    #100;
    $finish;
end

endmodule

