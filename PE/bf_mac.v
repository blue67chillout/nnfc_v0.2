`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: kushal
// 
// Create Date: 02/03/2025 07:01:03 PM
// Design Name: bfloat16 MAC
// Module Name: bf_mac
// Project Name: pynq z2
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

module bf_mac (
    input clk,
    input rst,
    input [15:0] in_1,
    input [15:0] in_2,
    input mac_en,
    output reg [31:0] acc_result
);

wire sign;
wire [7:0] exp_sum;
wire [15:0] mant_mul;
wire [6:0] mant_result;
reg [31:0] out;
wire [31:0] acc_next;

// Extract exponent and mantissa
wire [7:0] exp_1 = in_1[14:7];
wire [7:0] exp_2 = in_2[14:7];
wire [6:0] mant_1 = in_1[6:0];
wire [6:0] mant_2 = in_2[6:0];

// Detect special values
wire in_1_is_zero = (exp_1 == 0 && mant_1 == 0);
wire in_2_is_zero = (exp_2 == 0 && mant_2 == 0);
wire in_1_is_inf  = (exp_1 == 8'hFF && mant_1 == 0);
wire in_2_is_inf  = (exp_2 == 8'hFF && mant_2 == 0);
wire in_1_is_nan  = (exp_1 == 8'hFF && mant_1 != 0);
wire in_2_is_nan  = (exp_2 == 8'hFF && mant_2 != 0);


assign sign = in_1[15] ^ in_2[15];


w_mul w_mul_0 (
   {1'b1, mant_1},
   {1'b1, mant_2},
   mant_mul
);

assign mant_mul = {1'b1,mant_1} * {1'b1,mant_2};
assign exp_sum = mant_mul[15] ? exp_1 + exp_2 - 126 : exp_1 + exp_2 - 127;

// Corrected mantissa calculation
assign mant_result = mant_mul[15] ? mant_mul[14:8] : mant_mul[13:7];

// Special Case Handling for `out`
always @(*) begin
    if (in_1_is_nan || in_2_is_nan) begin
        out = 32'h7FC00000;  // NaN
    end 
    else if ((in_1_is_inf && in_2_is_zero) || (in_2_is_inf && in_1_is_zero)) begin
        out = 32'h7FC00000;  // NaN (∞ * 0 = NaN)
    end 
    else if (in_1_is_inf || in_2_is_inf) begin
        out = {sign, 8'hFF, 23'b0};  // ±∞
    end 
    else if (in_1_is_zero || in_2_is_zero) begin
        out = 32'h00000000;  // Zero
    end 
    else begin
        out = {sign, exp_sum, mant_result, 16'b0};  // Normal multiplication result
    end
end

// Floating-point adder for accumulation
fp_adder uut (
    .in_1(acc_result),
    .in_2(out),
    .out(acc_next)
);

// Accumulator logic
always @(posedge clk) begin
    if (rst) begin
        acc_result <= 32'b0;
    end 
    else if (mac_en) begin
        if ((acc_result[30:23] == 8'hFF && acc_result[22:0] != 0) || out == 32'h7FC00000) begin
            acc_result <= 32'h7FC00000;  // Propagate NaN
        end 
        else if (acc_result == 32'h7F800000 && out == 32'hFF800000) begin
            acc_result <= 32'h7FC00000;  // INF + (-INF) = NaN
        end 
        else if (acc_result == 32'hFF800000 && out == 32'h7F800000) begin
            acc_result <= 32'h7FC00000;  // -INF + INF = NaN
        end 
        else if (acc_result == 32'h7F800000 || out == 32'h7F800000) begin
            acc_result <= 32'h7F800000;  // Keep +INF if present
        end 
        else if (acc_result == 32'hFF800000 || out == 32'hFF800000) begin
            acc_result <= 32'hFF800000;  // Keep -INF if present
        end 
        else if (^acc_next === 1'bX) begin
            acc_result <= 32'b0;  // Reset if result is undefined
        end
        else begin
            acc_result <= acc_next;  // Normal accumulation
        end
    end
end

endmodule