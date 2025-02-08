`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2025 09:59:24
// Design Name: 
// Module Name: usr
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


module usr(
        input clk,
        input rst,
        input [1:0]en,
        input [15:0]s_left_in,
        input [15:0]s_right_in,
        input [16*32-1:0]p_in,
        output reg [16*32-1:0]p_out,
        output [15:0]s_left_out,
        output [15:0]s_right_out
);

//reg [15:0]inp;

always@(posedge clk) begin 
    if(rst) begin
        p_out<=0;
    end
else begin 

        case(en)
            2'b01: //left shift  
            p_out<={p_out[16*32-1:17],s_left_in};

            2'b10: //right shift 
            p_out<={s_right_in,p_out[16*32-1:16]};

            2'b11: //parallel load 
            p_out<=p_in;

            default: p_out<=p_out; //lock 

        endcase
    end

end
assign s_left_out=p_out[16*32-1:16*32-16];
assign s_right_out=p_out[15:0];

endmodule