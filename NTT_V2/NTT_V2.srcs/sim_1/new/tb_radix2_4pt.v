`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2024 12:02:19 PM
// Design Name: 
// Module Name: tb_radix2_4pt
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

module tb_radi2_4pt;

reg clk;
reg rst;
reg [15:0] in0, in1, in2, in3;
wire [15:0] out0, out1, out2, out3;

// Instantiate the ntt4point module
ntt4point uut (
    .clk(clk),
    .rst(rst),
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
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
    in0 = 16'd0;
    in1 = 16'd0;
    in2 = 16'd0;
    in3 = 16'd0;

    // Apply reset
    #10;
    rst = 0;

    // Apply test vectors
    #10;
    in0 = 16'd1;
    in1 = 16'd2;
    in2 = 16'd3;
    in3 = 16'd4;

    // End of simulation
    #100;
    $finish;
end

endmodule

