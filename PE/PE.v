module PE #(
    DATA_IN_WIDTH = 64
) (
    input clk,
    input rst,

    input [3:0]rd_en,
    input [3:0]wr_en,
    input [3:0]mac_en,

    input [15:0]in_ip,
    input [DATA_IN_WIDTH -1 :0]data_in


);

wire [31:0]acc_result_0;
wire [31:0]acc_result_1;
wire [31:0]acc_result_2;
wire [31:0]acc_result_3;

wire [15:0]fifo_dout_0;
wire [15:0]fifo_dout_1;
wire [15:0]fifo_dout_2;
wire [15:0]fifo_dout_3;

wire full_0;
wire full_1;
wire full_2;
wire full_3;

wire empty_0;
wire empty_1;
wire empty_2;
wire empty_3;

fifo #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH),
    .DATA_OUT_WIDTH(16),
    .DEPTH(4)
) fifo_0 (
    .clk(clk),
    .rst(rst),
    .din(data_in),
    .rd_en(rd_en[0]),
    .wr_en(wr_en[0]),
    .dout(fifo_dout_0),
    .full(full_0),
    .empty(empty_0)
);

bf_mac #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH)
) bf_mac_0 (
    .clk(clk),
    .rst(rst),
    .in_1(in_ip),
    .in_2(fifo_dout_0),
    .mac_en(mac_en[0]),
    .acc_result(acc_result_0)
);



fifo #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH),
    .DATA_OUT_WIDTH(16),
    .DEPTH(4)
) fifo_1 (
    .clk(clk),
    .rst(rst),
    .din(acc_result_0),
    .rd_en(rd_en[1]),
    .wr_en(wr_en[1]),
    .dout(fifo_dout_1),
    .full(full_1),
    .empty(empty_1)
);

bf_mac #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH)
) bf_mac_1 (
    .clk(clk),
    .rst(rst),
    .in_1(in_ip),
    .in_2(fifo_dout_1),
    .mac_en(mac_en[1]),
    .acc_result(acc_result_1)
);



fifo #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH),
    .DATA_OUT_WIDTH(16),    
    .DEPTH(4)
) fifo_2 (
    .clk(clk),
    .rst(rst),
    .din(acc_result_1),
    .rd_en(rd_en[2]),
    .wr_en(wr_en[2]),
    .dout(fifo_dout_2),
    .full(full_2),
    .empty(empty_2)
);

bf_mac #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH)
) bf_mac_2 (
    .clk(clk),
    .rst(rst),
    .in_1(in_ip),
    .in_2(fifo_dout_2),
    .mac_en(mac_en[2]),
    .acc_result(acc_result_2)
);



fifo #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH),
    .DATA_OUT_WIDTH(16),
    .DEPTH(4)
) fifo_3 (
    .clk(clk),
    .rst(rst),
    .din(acc_result_2),
    .rd_en(rd_en[3]),
    .wr_en(wr_en[3]),
    .dout(fifo_dout_3),
    .full(full_3),
    .empty(empty_3)
);

bf_mac #(
    .DATA_IN_WIDTH(DATA_IN_WIDTH)
) bf_mac_3 (
    .clk(clk),
    .rst(rst),
    .in_1(in_ip),
    .in_2(fifo_dout_3),
    .mac_en(mac_en[3]),
    .acc_result(acc_result_3)
);



endmodule