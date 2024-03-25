`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2024 11:30:53
// Design Name: 
// Module Name: mix_col_reg
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


module mix_col_reg(
    input [7:0] d_in,
    input en,
    input [7:0] d_prev,
    input clk,
    input rst,
    output [7:0] d_out
    );

wire [7:0] en0, xor0;

assign en0 = d_prev&{8{en}};

assign xor0 = d_in^en0;

shift_reg_8 sr(.D(xor0), .clk(clk), .rst(rst), .Q(d_out));

endmodule
