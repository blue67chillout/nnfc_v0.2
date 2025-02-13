module npu_main #(
   
) (
    input clk,
    input rst
);

    wire [3:0]rd_en;
    wire [3:0]mac_en;
    wire [3:0]act_fn_en;
    wire feed_through;
    wire arb_en;
    wire [9:0]base_addr;
    wire [9:0]start_offset;
    wire [9:0]stride;
    wire [3:0]layer_no;

    wire fetch_en_en;
    wire [3:0]wr_en;
    wire all_done;
    wire full_0;
    wire [9:0]addr;

    wire [9:0]addr_ip;

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
    
    //input address generation

    reg [15:0] buffer [0:31] ;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            addr_ip <= 0;
        end else if (mac_en = 4'b111) begin
            addr_ip <= addr_ip + 1;
        end
    end


    main_control m_c #(
        .NO_INPUTS_FL(785),
        .NO_HIDDEN_LAYERS(2),
        .NO_NEURONS_HL(28),
        .NO_NEURONS_OL(10)
    )(
        .clk(clk),
        .rst(rst),
        .rd_en(rd_en),
        .mac_en(mac_en),
        .act_fn_en(act_fn_en),
        .feed_through(feed_through),
        .arb_en(arb_en),
        .base_addr(base_addr),
        .start_offset(start_offset),
        .stride(stride),
        .layer_no(layer_no)
    );

    arbiter arb_0 (
        .clk(clk),
        .rst(rst),
        .arb_en(arb_en),
        .base_addr(base_addr),
        .start_offset(start_offset),
        .stride(stride),
        .addr(addr),
        .fetch_en(fetch_en_en),
        .wr_en(wr_en),
        .all_done(all_done),
        .full(full_0)
    );

    mem_array mem_0 (
        .clk(clk), 
        .rst(rst),
        .read_en(fetch_en_en),
        .addr_0(addr),
        .addr_1(addr),
        .addr_2(addr),
        .addr_3(addr),
        .addr_4(addr),
        .addr_5(addr),
        .addr_6(addr),
        .addr_7(addr),
        .addr_8(addr_ip),
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



PE pe_0 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_1),
    .acc_result_0(buffer[0]),
    .acc_result_1(buffer[1]),
    .acc_result_2(buffer[2]),
    .acc_result_3(buffer[3])
);

PE pe_1 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_2),
    .acc_result_0(buffer[4]),
    .acc_result_1(buffer[5]),
    .acc_result_2(buffer[6]),
    .acc_result_3(buffer[7])
);

PE pe_2 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_3),
    .acc_result_0(buffer[8]),
    .acc_result_1(buffer[9]),
    .acc_result_2(buffer[10]),
    .acc_result_3(buffer[11])
);

PE pe_3 (
    .clk(clk),
    .rst(rst),  
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_4),
    .acc_result_0(buffer[12]),
    .acc_result_1(buffer[13]),
    .acc_result_2(buffer[14]),
    .acc_result_3(buffer[15])
);

PE pe_4 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_5),
    .acc_result_0(buffer[16]),
    .acc_result_1(buffer[17]),
    .acc_result_2(buffer[18]),
    .acc_result_3(buffer[19])
);

PE pe_5 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_6),
    .acc_result_0(buffer[20]),
    .acc_result_1(buffer[21]),
    .acc_result_2(buffer[22]),
    .acc_result_3(buffer[23])
);

PE pe_6 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_7),
    .acc_result_0(buffer[24]),
    .acc_result_1(buffer[25]),
    .acc_result_2(buffer[26]),
    .acc_result_3(buffer[27])
);

PE pe_7 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_out_8),
    .data_in(data_out_8),
    .acc_result_0(buffer[28]),
    .acc_result_1(buffer[29]),
    .acc_result_2(buffer[30]),
    .acc_result_3(buffer[31])
); 


endmodule