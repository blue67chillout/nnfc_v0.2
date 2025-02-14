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

    wire [15:0] data_inp = (layer_no >=1) ? buffer[0] : data_out_8;

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
    
   
    integer i;
    reg [6:0]count;
    reg [15:0] buffer [0:31] ;


     //input address generation

    wire [15:0] acc_result_0;
    wire [15:0] acc_result_1;
    wire [15:0] acc_result_2;
    wire [15:0] acc_result_3;
    wire [15:0] acc_result_4;
    wire [15:0] acc_result_5;
    wire [15:0] acc_result_6;
    wire [15:0] acc_result_7;
    wire [15:0] acc_result_8;
    wire [15:0] acc_result_9;
    wire [15:0] acc_result_10;
    wire [15:0] acc_result_11;
    wire [15:0] acc_result_12;
    wire [15:0] acc_result_13;
    wire [15:0] acc_result_14;
    wire [15:0] acc_result_15;
    wire [15:0] acc_result_16;
    wire [15:0] acc_result_17;
    wire [15:0] acc_result_18;
    wire [15:0] acc_result_19;
    wire [15:0] acc_result_20;
    wire [15:0] acc_result_21;
    wire [15:0] acc_result_22;
    wire [15:0] acc_result_23;
    wire [15:0] acc_result_24;
    wire [15:0] acc_result_25;
    wire [15:0] acc_result_26;
    wire [15:0] acc_result_27;
    wire [15:0] acc_result_28;
    wire [15:0] acc_result_29;
    wire [15:0] acc_result_30;
    wire [15:0] acc_result_31;

    always@(posedge clk) begin
            buffer[0] <= 16'h0000;
            buffer[1] <= 16'h0000;
            buffer[2] <= 16'h0000;
            buffer[3] <= 16'h0000;
            buffer[4] <= 16'h0000;
            buffer[5] <= 16'h0000;
            buffer[6] <= 16'h0000;
            buffer[7] <= 16'h0000;
            buffer[8] <= 16'h0000;
            buffer[9] <= 16'h0000;
            buffer[10] <= 16'h0000;
            buffer[11] <= 16'h0000;
            buffer[12] <= 16'h0000;
            buffer[13] <= 16'h0000;
            buffer[14] <= 16'h0000;
            buffer[15] <= 16'h0000;
            buffer[16] <= 16'h0000;
            buffer[17] <= 16'h0000;
            buffer[18] <= 16'h0000;
            buffer[19] <= 16'h0000;
            buffer[20] <= 16'h0000;
            buffer[21] <= 16'h0000;
            buffer[22] <= 16'h0000;
            buffer[23] <= 16'h0000;
            buffer[24] <= 16'h0000;
            buffer[25] <= 16'h0000;
            buffer[26] <= 16'h0000;
            buffer[27] <= 16'h0000;
            buffer[28] <= 16'h0000;
            buffer[29] <= 16'h0000;
            buffer[30] <= 16'h0000;
            buffer[31] <= 16'h0000;
        if(rst) begin
            buffer[0] <= 16'h0000;
            buffer[1] <= 16'h0000;
            buffer[2] <= 16'h0000;
            buffer[3] <= 16'h0000;
            buffer[4] <= 16'h0000;
            buffer[5] <= 16'h0000;
            buffer[6] <= 16'h0000;
            buffer[7] <= 16'h0000;
            buffer[8] <= 16'h0000;
            buffer[9] <= 16'h0000;
            buffer[10] <= 16'h0000;
            buffer[11] <= 16'h0000;
            buffer[12] <= 16'h0000;
            buffer[13] <= 16'h0000;
            buffer[14] <= 16'h0000;
            buffer[15] <= 16'h0000;
            buffer[16] <= 16'h0000;
            buffer[17] <= 16'h0000;
            buffer[18] <= 16'h0000;
            buffer[19] <= 16'h0000;
            buffer[20] <= 16'h0000;
            buffer[21] <= 16'h0000;
            buffer[22] <= 16'h0000;
            buffer[23] <= 16'h0000;
            buffer[24] <= 16'h0000;
            buffer[25] <= 16'h0000;
            buffer[26] <= 16'h0000;
            buffer[27] <= 16'h0000;
            buffer[28] <= 16'h0000;
            buffer[29] <= 16'h0000;
            buffer[30] <= 16'h0000;
            buffer[31] <= 16'h0000;
    end
        else if(feed_through) begin
            buffer[0] <= acc_result_0;
            buffer[1] <= acc_result_1;
            buffer[2] <= acc_result_2;
            buffer[3] <= acc_result_3;
            buffer[4] <= acc_result_4;
            buffer[5] <= acc_result_5;
            buffer[6] <= acc_result_6;
            buffer[7] <= acc_result_7;
            buffer[8] <= acc_result_8;
            buffer[9] <= acc_result_9;
            buffer[10] <= acc_result_10;
            buffer[11] <= acc_result_11;
            buffer[12] <= acc_result_12;
            buffer[13] <= acc_result_13;
            buffer[14] <= acc_result_14;
            buffer[15] <= acc_result_15;
            buffer[16] <= acc_result_16;
            buffer[17] <= acc_result_17;
            buffer[18] <= acc_result_18;
            buffer[19] <= acc_result_19;
            buffer[20] <= acc_result_20;
            buffer[21] <= acc_result_21;
            buffer[22] <= acc_result_22;
            buffer[23] <= acc_result_23;
            buffer[24] <= acc_result_24;
            buffer[25] <= acc_result_25;
            buffer[26] <= acc_result_26;
            buffer[27] <= acc_result_27;
            buffer[28] <= acc_result_28;
            buffer[29] <= acc_result_29;
            buffer[30] <= acc_result_30;
            buffer[31] <= acc_result_31; 
        end

    end

    always @(posedge clk ) begin
        if (rst) begin
            addr_ip <= 0;
        end else if (mac_en = 4'b111) begin
            addr_ip <= addr_ip + 1;
        end
    end
    always@(posedge clk)begin 
        count<=0;
        if(rst)begin
            count <= 0;
        end
        else if(mac_en == 4'b111 && feed_through==1)begin
            data_inp <= buffer[0];
            buffer[0]<=buffer[1];
            buffer[1]<=buffer[2];
            buffer[2]<=buffer[3];
            buffer[3]<=buffer[4];
            buffer[4]<=buffer[5];
            buffer[5]<=buffer[6];
            buffer[6]<=buffer[7];
            buffer[7]<=buffer[8];
            buffer[8]<=buffer[9];
            buffer[9]<=buffer[10];
            buffer[10]<=buffer[11];
            buffer[11]<=buffer[12];
            buffer[12]<=buffer[13];
            buffer[13]<=buffer[14];
            buffer[14]<=buffer[15];
            buffer[15]<=buffer[16];
            buffer[16]<=buffer[17];
            buffer[17]<=buffer[18];
            buffer[18]<=buffer[19];
            buffer[19]<=buffer[20];
            buffer[20]<=buffer[21];
            buffer[21]<=buffer[22];
            buffer[22]<=buffer[23];
            buffer[23]<=buffer[24];
            buffer[24]<=buffer[25];
            buffer[25]<=buffer[26];
            buffer[26]<=buffer[27];
            buffer[27]<=buffer[28];
            buffer[28]<=buffer[29];
            buffer[29]<=buffer[30];
            buffer[30]<=buffer[31];
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
    .in_ip(data_inp),
    .data_in(data_out_1),
    .acc_result_0(acc_result_0),
    .acc_result_1(acc_result_1),
    .acc_result_2(acc_result_2),
    .acc_result_3(acc_result_3)
);

PE pe_1 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_inp),
    .data_in(data_out_2),
    .acc_result_0(acc_result_4),
    .acc_result_1(acc_result_5),
    .acc_result_2(acc_result_6),
    .acc_result_3(acc_result_7)
);

PE pe_2 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_inp),
    .data_in(data_out_3),
    .acc_result_0(acc_result_8),
    .acc_result_1(acc_result_9),
    .acc_result_2(acc_result_10),
    .acc_result_3(acc_result_11)
);

PE pe_3 (
    .clk(clk),
    .rst(rst),  
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_inp),
    .data_in(data_out_4),
    .acc_result_0(acc_result_12),
    .acc_result_1(acc_result_13),   
    .acc_result_2(acc_result_14),
    .acc_result_3(acc_result_15)
);

PE pe_4 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_inp),
    .data_in(data_out_5),
    .acc_result_0(acc_result_16),
    .acc_result_1(acc_result_17),
    .acc_result_2(acc_result_18),
    .acc_result_3(acc_result_19)
);

PE pe_5 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_inp),
    .data_in(data_out_6),
    .acc_result_0(acc_result_20),
    .acc_result_1(acc_result_21),
    .acc_result_2(acc_result_22),   
    .acc_result_3(acc_result_23)
);

PE pe_6 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_inp),
    .data_in(data_out_7),
    .acc_result_0(acc_result_24),
    .acc_result_1(acc_result_25),
    .acc_result_2(acc_result_26),
    .acc_result_3(acc_result_27)
);

PE pe_7 (
    .clk(clk),
    .rst(rst),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .mac_en(mac_en),
    .in_ip(data_inp),
    .data_in(data_out_8),
    .acc_result_0(acc_result_28),
    .acc_result_1(acc_result_29),
    .acc_result_2(acc_result_30),
    .acc_result_3(acc_result_31)
); 


endmodule