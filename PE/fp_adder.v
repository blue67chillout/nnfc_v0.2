module fp_adder (
    input [31:0] in_1,
    input [31:0] in_2,
    output reg [31:0] out
);

wire sign;
wire [7:0] exp_1, exp_2, exp_diff;
wire [23:0] in_1_mant, in_2_mant, in_1_aligned_mant, in_2_aligned_mant;
wire [24:0] mant_sum;
wire [7:0] final_exp;

assign exp_1 = in_1[30:23];
assign exp_2 = in_2[30:23];
assign exp_diff = (exp_1 >= exp_2) ? exp_1 - exp_2 : exp_2 - exp_1;
assign final_exp = (exp_1 >= exp_2) ? exp_1 : exp_2;

assign in_1_mant = {1'b1, in_1[22:0]};  
assign in_2_mant = {1'b1, in_2[22:0]};  

assign in_1_aligned_mant = (exp_1 >= exp_2) ? in_1_mant : (in_1_mant >> exp_diff);
assign in_2_aligned_mant = (exp_2 >= exp_1) ? in_2_mant : (in_2_mant >> exp_diff);

assign sign = (in_1_aligned_mant >= in_2_aligned_mant) ? in_1[31] : in_2[31];

assign mant_sum = (in_1[31] == in_2[31]) ? 
                  (in_1_aligned_mant + in_2_aligned_mant) : 
                  (in_1_aligned_mant > in_2_aligned_mant) ? 
                  (in_1_aligned_mant - in_2_aligned_mant) : 
                  (in_2_aligned_mant - in_1_aligned_mant);

reg [7:0] norm_exp;
reg [23:0] norm_mant;
integer shift;

always @(*) begin
    // Handle special cases
    if (in_1 == 32'h00000000) begin  
        out = in_2;
    end else if (in_2 == 32'h00000000) begin  
        out = in_1;
    end else if ((in_1 == 32'h7F800000 && in_2 == 32'hFF800000) || (in_1 == 32'hFF800000 && in_2 == 32'h7F800000)) begin
        out = 32'h7FC00000; 
    end else if (in_1 == 32'h7F800000 || in_2 == 32'h7F800000) begin
        out = 32'h7F800000; 
    end else if (in_1 == 32'hFF800000 || in_2 == 32'hFF800000) begin
        out = 32'hFF800000; 
    end else begin
        // Normalization logic
        if (mant_sum[24]) begin
            norm_mant = mant_sum[24:1]; // Shift right if carry
            norm_exp = final_exp + 1;
        end else begin
            norm_mant = mant_sum[23:0];
            norm_exp = final_exp;
        end

        // Normalize by shifting left if leading bit is zero
        shift = 0;
        while (norm_mant[23] == 0 && norm_exp > 0) begin
            norm_mant = norm_mant << 1;
            norm_exp = norm_exp - 1;
            shift = shift + 1;
        end

        // Construct the final floating-point result
        out = {sign, norm_exp, norm_mant[22:0]};
    end
end

endmodule