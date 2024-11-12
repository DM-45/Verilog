`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 06:09:43 PM
// Design Name: 
// Module Name: pulse_10
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


module ClockDivider(
    input wire clk_2MHz,
    input wire reset,
    output reg clk_100Hz
);
    reg [16:0] counter;

    always @(posedge clk_2MHz or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_100Hz <= 0;
        end else begin
            if (counter == 19999) begin
                counter <= 0;
                clk_100Hz <= ~clk_100Hz;  // Toggle the clock output every 10,000 cycles
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule

module Mod100Counter(
    input wire clk_100Hz,
    input wire reset,
    output reg [6:0] count
);
    always @(posedge clk_100Hz or posedge reset) begin
        if (reset) begin
            count <= 0;
        end else begin
            if (count == 99) begin
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule

module pulse_10(
    input wire clk_2MHz,
    input wire reset,
    output wire clk_100Hz,
    output wire [6:0] count
);
    ClockDivider clk_div(
        .clk_2MHz(clk_2MHz),
        .reset(reset),
        .clk_100Hz(clk_100Hz)
    );

    Mod100Counter mod_counter(
        .clk_100Hz(clk_100Hz),
        .reset(reset),
        .count(count)
    );
endmodule

