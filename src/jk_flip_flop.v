`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.12.2023 10:26:21
// Design Name: 
// Module Name: jk_flip_flop
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


module jk_flip_flop(
    input j,
    input k,
    input clk,
    input rst,
    output reg q
    );

always@(rst) begin
    if(rst)
        q <= 0;
end

always@(posedge clk) begin
    if(!rst) begin
        case({j,k})
            2'b00: q <= q;
            2'b01: q <= 0;
            2'b10: q <= 1;
            2'b11: q <= ~q;
        endcase
    end
end

endmodule
