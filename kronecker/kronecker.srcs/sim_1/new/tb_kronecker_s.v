`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 08:18:42 AM
// Design Name: 
// Module Name: tb_kronecker_s
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

module tb_kronecker_s;

    // Inputs
    reg [31:0] poly1_coeffs;
    reg [31:0] poly2_coeffs;

    // Outputs
    wire [63:0] result_coeffs;

    // Instantiate the Unit Under Test (UUT)
    kronecker_substitution uut (
        .poly1_coeffs(poly1_coeffs), 
        .poly2_coeffs(poly2_coeffs), 
        .result_coeffs(result_coeffs)
    );

    initial begin
        // Initialize Inputs
        poly1_coeffs = 32'h01020304;  // Coefficients: 1, 2, 3, 4
        poly2_coeffs = 32'h05060708;  // Coefficients: 5, 6, 7, 8

        // Wait for the results to stabilize
        #10;

        // Display the result
        $display("Result Coeffs: %h", result_coeffs);

        // Add your assertions here
        // Example: check if the result is correct
        // assert (result_coeffs == expected_value);

        // End simulation
        #20;
        $stop;
    end
endmodule
