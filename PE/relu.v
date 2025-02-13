module relu (
    input clk,
    input rst,
    input [31:0]in,
    output reg [15:0]relu_out
);

    always @(posedge clk) begin
        if (rst) begin
            relu_out <= 16'h0000;
        end
        else begin
            relu_out = (in[31] == 1'b1) ? 16'h0000 : in[15:0];
        end
    end



endmodule