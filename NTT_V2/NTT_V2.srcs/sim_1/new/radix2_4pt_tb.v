`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2024 01:21:41 PM
// Design Name: 
// Module Name: radix2_4pt_tb
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


module radix2_4pt_tb;


  reg clk, reset;
  reg [15:0] in0, in1, in2, in3;

  wire [15:0] out0, out1, out2, out3;


  radix2_4pt dut (
    .clk(clk),
    .reset(reset),
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3)
  );

  initial begin

    reset = 1;
    clk = 0;
    #10 reset = 0;

    in0 = 16'd1;
    in1 = 16'd2;
    in2 = 16'd3;
    in3 = 16'd4;
    
    #100 $finish;
  end

always #5 clk = ~clk;

  always @(posedge clk) begin
    $monitor("Time=%t, in0=%h, in1=%h, in2=%h, in3=%h, out0=%h, out1=%h, out2=%h, out3=%h", $time, in0, in1, in2, in3, out0, out1, out2, out3);
  end

endmodule
