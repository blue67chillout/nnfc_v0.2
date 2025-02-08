module mem_array #(
      ADDR_WIDTH = 10 ,
      DATA_OUT_WIDTH = 64
) (
    input clk,
    input rst,

    input [15:0]read_en,

    input [ADDR_WIDTH-1:0]addr_0,
    input [ADDR_WIDTH-1:0]addr_1,
    input [ADDR_WIDTH-1:0]addr_2,
    input [ADDR_WIDTH-1:0]addr_3,
    input [ADDR_WIDTH-1:0]addr_4,
    input [ADDR_WIDTH-1:0]addr_5,
    input [ADDR_WIDTH-1:0]addr_6,
    input [ADDR_WIDTH-1:0]addr_7,
    input [ADDR_WIDTH-1:0]addr_8,
    input [ADDR_WIDTH-1:0]addr_9,
    input [ADDR_WIDTH-1:0]addr_10,
    input [ADDR_WIDTH-1:0]addr_11,
    input [ADDR_WIDTH-1:0]addr_12,
    input [ADDR_WIDTH-1:0]addr_13,
    input [ADDR_WIDTH-1:0]addr_14,
    input [ADDR_WIDTH-1:0]addr_15,

    output [DATA_OUT_WIDTH-1:0]data_out_0,
    output [DATA_OUT_WIDTH-1:0]data_out_1,
    output [DATA_OUT_WIDTH-1:0]data_out_2,
    output [DATA_OUT_WIDTH-1:0]data_out_3,
    output [DATA_OUT_WIDTH-1:0]data_out_4,
    output [DATA_OUT_WIDTH-1:0]data_out_5,
    output [DATA_OUT_WIDTH-1:0]data_out_6,
    output [DATA_OUT_WIDTH-1:0]data_out_7,
    output [DATA_OUT_WIDTH-1:0]data_out_8,
    output [DATA_OUT_WIDTH-1:0]data_out_9,
    output [DATA_OUT_WIDTH-1:0]data_out_10,
    output [DATA_OUT_WIDTH-1:0]data_out_11,
    output [DATA_OUT_WIDTH-1:0]data_out_12,
    output [DATA_OUT_WIDTH-1:0]data_out_13,
    output [DATA_OUT_WIDTH-1:0]data_out_14,
    output [DATA_OUT_WIDTH-1:0]data_out_15

);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_0.mem")
) mem_cell_0 (
    .clk(clk),
    .rst(rst),
    .addr(addr_0),
    .data_out(data_out_0),
    .r_en(read_en[0])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_1.mem")
) mem_cell_1 (
    .clk(clk),
    .rst(rst),
    .addr(addr_1),
    .data_out(data_out_1),
    .r_en(read_en[1])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_2.mem")
) mem_cell_2 (
    .clk(clk),
    .rst(rst),
    .addr(addr_2),
    .data_out(data_out_2),
    .r_en(read_en[2])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_3.mem")
) mem_cell_3 (
    .clk(clk),
    .rst(rst),
    .addr(addr_3),
    .data_out(data_out_3),
    .r_en(read_en[3])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_4.mem")
) mem_cell_4 (
    .clk(clk),
    .rst(rst),
    .addr(addr_4),
    .data_out(data_out_4),
    .r_en(read_en[4])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_5.mem")
) mem_cell_5 (
    .clk(clk),
    .rst(rst),
    .addr(addr_5),
    .data_out(data_out_5),
    .r_en(read_en[5])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_6.mem")
) mem_cell_6 (
    .clk(clk),
    .rst(rst),
    .addr(addr_6),
    .data_out(data_out_6),
    .r_en(read_en[6])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_7.mem")
) mem_cell_7 (
    .clk(clk),
    .rst(rst),
    .addr(addr_7),
    .data_out(data_out_7),
    .r_en(read_en[7])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_8.mem")
) mem_cell_8 (
    .clk(clk),
    .rst(rst),
    .addr(addr_8),
    .data_out(data_out_8),
    .r_en(read_en[8])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_9.mem")
) mem_cell_9 (
    .clk(clk),
    .rst(rst),
    .addr(addr_9),
    .data_out(data_out_9),
    .r_en(read_en[9])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_10.mem")
) mem_cell_10 (
    .clk(clk),
    .rst(rst),
    .addr(addr_10),
    .data_out(data_out_10),
    .r_en(read_en[10])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_11.mem")
) mem_cell_11 (
    .clk(clk),
    .rst(rst),
    .addr(addr_11),
    .data_out(data_out_11),
    .r_en(read_en[11])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_12.mem")
) mem_cell_12 (
    .clk(clk),
    .rst(rst),
    .addr(addr_12),
    .data_out(data_out_12),
    .r_en(read_en[12])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_13.mem")
) mem_cell_13 (
    .clk(clk),
    .rst(rst),
    .addr(addr_13),
    .data_out(data_out_13),
    .r_en(read_en[13])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_14.mem")
) mem_cell_14 (
    .clk(clk),
    .rst(rst),
    .addr(addr_14),
    .data_out(data_out_14),
    .r_en(read_en[14])
);

mem_cell #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_OUT_WIDTH(DATA_OUT_WIDTH),
    .MEM_FILE("weights_15.mem")
) mem_cell_15 (
    .clk(clk),
    .rst(rst),
    .addr(addr_15),
    .data_out(data_out_15),
    .r_en(read_en[15])
);
    
endmodule