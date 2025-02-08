module relu (
    input [31:0]in,
    output [15:0]relu_out
);
    assign relu_out = in[31] == 1 ? 16'h0 : in[31:16];

endmodule