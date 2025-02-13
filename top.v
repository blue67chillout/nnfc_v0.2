`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 01:05:54 AM
// Design Name: 
// Module Name: top
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


module top (
    input clk,
    input rst,
    input [3:0]rd_en,
    input [3:0]mac_en
);

wire [9:0]addr;
wire fetch_en;
//wire mac_en = 4'b1111;
wire [3:0]wr_en;
wire all_done;
wire full_0;

wire [63:0] data_out_0;
wire [63:0] data_out_1;
wire [63:0] data_out_2;
wire [63:0] data_out_3;
wire [63:0] data_out_4;
wire [63:0] data_out_5;
wire [63:0] data_out_6;
wire [63:0] data_out_7;
wire [63:0] data_out_8;
wire [63:0] data_out_9;
wire [63:0] data_out_10;
wire [63:0] data_out_11;
wire [63:0] data_out_12;
wire [63:0] data_out_13;
wire [63:0] data_out_14;
wire [63:0] data_out_15;

wire [15:0]in_ip = 16'h4000;

//wire [3:0]rd_en = 4'b1111;

arbiter arb_0 (
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .fetch_en(fetch_en),
    .wr_en(wr_en),
    .all_done(all_done),
    .full(full_0)

);

PE PE_0 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(in_ip),
    .data_in(data_out_0),
    .acc_result_0(acc_result_0),
    .acc_result_1(acc_result_1),
    .acc_result_2(acc_result_2),
    .acc_result_3(acc_result_3),
    .full_0(full_0),
    .full_1(full_1),
    .full_2(full_2),
    .full_3(full_3),
    .empty_0(empty_0),
    .empty_1(empty_1),
    .empty_2(empty_2),
    .empty_3(empty_3)
);

mem_array mem_0  (
    .clk(clk),
    .rst(rst),
    .read_en(fetch_en),
    .addr_0(addr),
    .addr_1(0),
    .addr_2(0),
    .addr_3(0),
    .addr_4(0),
    .addr_5(0),
    .addr_6(0),
    .addr_7(0),
    .addr_8(0),
    .addr_9(0),
    .addr_10(0),
    .addr_11(0),
    .addr_12(0),
    .addr_13(0),
    .addr_14(0),
    .addr_15(0),
    .data_out_0(data_out_0),
    .data_out_1(data_out_1),
    .data_out_2(data_out_2),
    .data_out_3(data_out_3),
    .data_out_4(data_out_4),
    .data_out_5(data_out_5),
    .data_out_6(data_out_6),
    .data_out_7(data_out_7),
    .data_out_8(data_out_8),
    .data_out_9(data_out_9),
    .data_out_10(data_out_10),
    .data_out_11(data_out_11),
    .data_out_12(data_out_12),
    .data_out_13(data_out_13),
    .data_out_14(data_out_14),
    .data_out_15(data_out_15)
);



    
endmodule