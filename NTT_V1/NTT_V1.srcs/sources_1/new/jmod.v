`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 01:37:23 PM
// Design Name: 
// Module Name: jmod
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


module jmod(j, t, clk, jmod_out, start);

parameter n = 4;

input [n:0] j, t;
input clk, start;

output [n:0] jmod_out;

wire load1, load2, sel1, sel2, msb;

jmod_controller CON(clock, sel1, sel2, load1, load2, msb, start);
jmod_datapath DATA(j, t, clock, load1, load2, sel1, sel2, jmod_out, msb);

endmodule

module jmod_datapath(
    input [4:0] j, t,  // range 0 to 4 for 8 point NTT
    input clock, load1, load2, sel1, sel2,
    output [4:0] jmod_out, 
    output msb_out
);

parameter n = 4;

wire [n:0] w1, w2, w3, w4, w5;

assign msb_out = w3[n];

mux_2to1_4bit MUX4 (j, w3, sel1, w1);
SUB_4BIT SUB4 (w1, t, w2);
PIPO REG1 (w2, clock, load1, w3);
// demux_1to2_4bit deMUX4 (w3, sel2, w4, w5);
ADDER_4BIT ADD4 (w4, t, w5);
PIPO REG2 (w3, clock, load1, w4);
PIPO REG3 (w5, clock, load2, jmod_out);

endmodule


module jmod_controller(clock, sel1, sel2, load1, load2, msb_in, start);

input clock, start, msb_in;

output reg sel1, sel2, load1, load2;

reg [1:0] state;

always @(posedge clock) begin
    case (state)
        2'b00: begin
            sel1 <= 0; sel2 <= 1; load1 <= 1; load2 <= 0;
            state <= start ? 2'b01 : 2'b00;
        end

        2'b01: begin
            if (msb_in == 1) begin
                load1 <= 0; load2 <= 1; state <= 2'b10; // last state
            end else begin
                load1 <= 1; load2 <= 0; sel1 <= 1; state <= 2'b01;
            end
        end
        
        2'b10: begin
            load2 <= 0; state <= 2'b00;
        end

        default: begin
            state <= 2'b00;
        end
    endcase
end

endmodule

module mux_2to1_4bit(
    input [4:0] a, b,
    input sel,
    output [4:0] data_out
);

assign data_out = sel ? b : a;

endmodule

module SUB_4BIT(input [4:0] a, b, output [4:0] sub);
    assign sub = a - b;
endmodule

module PIPO(input [4:0] a, clock, load, output reg [4:0] reg_out);
    always @(posedge clock) 
        reg_out <= load ? a : reg_out;
endmodule

module ADDER_4BIT(input [4:0] a, b, output [4:0] sum);
    assign sum = a + b;
endmodule