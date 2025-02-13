module main_control #(
    parameter NO_INPUTS_FL = 785,
    parameter NO_HIDDEN_LAYERS = 2,
    parameter NO_NEURONS_HL = 28,
    parameter NO_NEURONS_OL = 10
) (
    input clk,
    input rst,
    output reg [3:0] rd_en,
    output reg [3:0] mac_en,
    output reg [3:0] act_fn_en,
    output reg feed_through,
    output reg arb_en,
    output reg [9:0] base_addr,
    output reg [9:0] start_offset,
    output reg [9:0] stride,
    output reg [2:0] layer_no
);


    reg [10:0] counter;
    reg [2:0] state;
    reg [10:0] compute_cycles;
    reg [1:0] act_fn_index;

    localparam IDLE       = 4'b0000,
              // MEM_DELAY  = 5'b00001,
               LOAD_FIFO  = 4'b0001,
               COMPUTE    = 4'b0010,
               ACTIVATE   = 4'b0100,
               FEED_NEXT  = 5'b1000;

    always @(posedge clk ) begin

        if (rst) begin
            state <= IDLE;
            counter <= 0;
            rd_en <= 4'b0000;
            mac_en <= 4'b0000;
            act_fn_en <= 4'b0000;
            feed_through <= 1'b0;
            arb_en <= 1'b0;
            base_addr <= 10'b0;
            start_offset <= 10'b0;
            stride <= 10'b0;
            layer_no <= 0;
            compute_cycles <= NO_INPUTS_FL + 1;
            act_fn_index <= 0;
        end else begin

            case (state)
                IDLE: begin
                    counter <= 0;
                    arb_en <= 1'b1;
                    if (arb_en) state <= LOAD_FIFO;
                end
            
                LOAD_FIFO: begin
                    counter <= counter + 1;
                    if (counter == 2) begin
                        counter <= 0;
                        state <= COMPUTE;
                    end
                end
                
                COMPUTE: begin
                    counter <= counter + 1;
                    if (counter >= 4) begin 
                        rd_en <= 4'b1111;
                        mac_en <= 4'b1111;
                    end
                    if (counter == compute_cycles + 4) begin
                        counter <= 0;
                        rd_en <= 4'b0000;
                        mac_en <= 4'b0000;
                        state <= ACTIVATE;
                    end
                end
                
                ACTIVATE: begin
                    act_fn_en <= 4'b1111;
                    state <= FEED_NEXT;
                    // act_fn_en[act_fn_index] <= 1'b1;
                    // act_fn_index <= act_fn_index + 1;
                    // if (act_fn_index == 3) begin
                    //     act_fn_index <= 0;
                    //     state <= FEED_NEXT;
                    // end
                end
                
                FEED_NEXT: begin
                    feed_through <= 1'b1;
                    arb_en <= 1'b1;
                    layer_no <= layer_no + 1;
                    if (layer_no == 0) compute_cycles <= NO_NEURONS_FL + 1;
                    else if (layer_no == NO_HIDDEN_LAYERS) compute_cycles <= NO_NEURONS_OL + 1;
                    else compute_cycles <= NO_NEURONS_HL;
                    state <= COMPUTE;
                end
            endcase
        end
    end
endmodule

