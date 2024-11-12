`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 07:54:08 AM
// Design Name: 
// Module Name: kronecker_s
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


//module kronecker_s(
//input wire [7:0] a [0:3],
//input wire [7:0] b [0:3],
//output reg [15:0] c [0:7]
//    );
//    integer i, j;
//    reg [15:0] poly1, poly2, mult_result;
    
//        always @(*) begin
//            poly1 = 0;
//            for (i = 0; i < 4; i = i + 1) begin
//                poly1 = poly1 * 2**8 + a[i];
//            end
    
//            poly2 = 0;
//            for (i = 0; i < 4; i = i + 1) begin
//                poly2 = poly2 * 2**8 + b[i];
//            end
    
//            // Step 2: Perform integer multiplication
//            mult_result = poly1 * poly2;
    
//            // Step 3: Convert result back to polynomial representation
//            for (i = 0; i < 8; i = i + 1) begin
//                c[i] = mult_result % 2**8;
//                mult_result = mult_result / 2**8;
//            end
//		end
//endmodule

module kronecker_s(
    input wire [31:0] poly1_coeffs, // Flattened 4x8-bit array for polynomial 1
    input wire [31:0] poly2_coeffs, // Flattened 4x8-bit array for polynomial 2
    output reg [63:0] result_coeffs // Resulting polynomial
);
    integer i;
    reg [63:0] int_poly1, int_poly2, int_result;
    reg [7:0] poly1[0:3];
    reg [7:0] poly2[0:3];
    reg [15:0] result[0:7];

    // Convert flattened input to arrays
    always @(*) begin
        for (i = 0; i < 4; i = i + 1) begin
            poly1[i] = poly1_coeffs[i*8 +: 8];
            poly2[i] = poly2_coeffs[i*8 +: 8];
        end

        // Step 1: Convert polynomials to integer representation
        int_poly1 = 0;
        for (i = 0; i < 4; i = i + 1) begin
            int_poly1 = int_poly1 * 2**8 + poly1[i];
        end

        int_poly2 = 0;
        for (i = 0; i < 4; i = i + 1) begin
            int_poly2 = int_poly2 * 2**8 + poly2[i];
        end

        // Step 2: Perform integer multiplication
        int_result = int_poly1 * int_poly2;

        // Step 3: Convert result back to polynomial representation
        for (i = 0; i < 8; i = i + 1) begin
            result[i] = int_result % 2**8;
            int_result = int_result / 2**8;
        end

        // Flatten the result array to output
        result_coeffs = {result[7], result[6], result[5], result[4], result[3], result[2], result[1], result[0]};
    end
endmodule

