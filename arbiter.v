module arbiter #(
    parameter NUM_MACS = 4,           
    parameter ADDR_WIDTH = 10             
)(
    input                  clk,        
    input                  rst,        
    input                  arb_en,       
    input  [ADDR_WIDTH-1:0] base_addr,   
    input  [ADDR_WIDTH-1:0] start_offset, 
    input  [ADDR_WIDTH-1:0] stride,      
    output reg [ADDR_WIDTH-1:0] addr,  
    output reg             fetch_en,   
    output reg [NUM_MACS-1:0] wr_en,   
    output reg             all_done,   
    input                  full        
);

    reg [1:0] current_fifo;  
    reg [ADDR_WIDTH-1:0] offset;  
    reg [NUM_MACS-1:0] wr_en_delay; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            addr <= 0;
            fetch_en <= 0;
            wr_en <= 0;
            wr_en_delay <= 0;
            current_fifo <= 0;
            offset <= start_offset; 
            all_done <= 0;
        end else if (arb_en) begin  
            if ((offset >= stride) && !all_done) begin 
                all_done <= 1;
                fetch_en <= 0;
                wr_en <= 0;
                wr_en_delay <= 0;
            end else if (!full && !all_done) begin
                fetch_en <= 1;
                addr <= base_addr + (current_fifo * stride) + offset; 
                
                wr_en_delay <= (1 << current_fifo); 
                wr_en <= wr_en_delay; 

                current_fifo <= current_fifo + 1;

                if (current_fifo == NUM_MACS - 1) begin
                    current_fifo <= 0;
                    offset <= offset + 1; 
                end
            end else begin
                fetch_en <= 0;
                wr_en <= 0;
                wr_en_delay <= 0;
            end
        end else begin
            
            fetch_en <= 0;
            wr_en <= 0;
            wr_en_delay <= 0;
        end
    end
endmodule