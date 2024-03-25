`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2024 20:09:11
// Design Name: 
// Module Name: mix_col
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


module mix_col(
    input [7:0] d_in,
    input en,
    input clk,
    input rst,
    input mode,
    output [7:0] d0_out,
    output [7:0] d1_out,
    output [7:0] d2_out,
    output [7:0] d3_out
    );

wire [7:0] d2, d3, d0_out_en, d1_out_en, d2_out_en, d3_out_en;

gf256mult gfmul2(.a(d_in), .b(8'h03), .z(d2));
gf256mult gfmul3(.a(d_in), .b(8'h02), .z(d3));

mix_col_reg mcr0(.d_in(d_in), .en(en), .d_prev(d1_out_en), .clk(clk), .rst(rst), .d_out(d0_out_en));
mix_col_reg mcr1(.d_in(d_in), .en(en), .d_prev(d2_out_en), .clk(clk), .rst(rst), .d_out(d1_out_en));
mix_col_reg mcr2(.d_in(d2), .en(en), .d_prev(d3_out_en), .clk(clk), .rst(rst), .d_out(d2_out_en));
mix_col_reg mcr3(.d_in(d3), .en(en), .d_prev(d0_out_en), .clk(clk), .rst(rst), .d_out(d3_out_en));

///////////////////////////////////////////////////////////////////////////////////////////////
wire [7:0] d0_inv, d1_inv, d2_inv, d3_inv, d0_out_inv, d1_out_inv, d2_out_inv, d3_out_inv;

gf256mult gfmul0_inv(.a(d_in), .b(8'h09), .z(d0_inv));
gf256mult gfmul1_inv(.a(d_in), .b(8'h0d), .z(d1_inv));
gf256mult gfmul2_inv(.a(d_in), .b(8'h0b), .z(d2_inv));
gf256mult gfmul3_inv(.a(d_in), .b(8'h0e), .z(d3_inv));

mix_col_reg mcr0_inv(.d_in(d0_inv), .en(en), .d_prev(d1_out_inv), .clk(clk), .rst(rst), .d_out(d0_out_inv));
mix_col_reg mcr1_inv(.d_in(d1_inv), .en(en), .d_prev(d2_out_inv), .clk(clk), .rst(rst), .d_out(d1_out_inv));
mix_col_reg mcr2_inv(.d_in(d2_inv), .en(en), .d_prev(d3_out_inv), .clk(clk), .rst(rst), .d_out(d2_out_inv));
mix_col_reg mcr3_inv(.d_in(d3_inv), .en(en), .d_prev(d0_out_inv), .clk(clk), .rst(rst), .d_out(d3_out_inv));

mux_2to1 mux0(.a(d0_out_en), .b(d0_out_inv), .sel(mode), .out(d0_out));
mux_2to1 mux1(.a(d1_out_en), .b(d1_out_inv), .sel(mode), .out(d1_out));
mux_2to1 mux2(.a(d2_out_en), .b(d2_out_inv), .sel(mode), .out(d2_out));
mux_2to1 mux3(.a(d3_out_en), .b(d3_out_inv), .sel(mode), .out(d3_out));

endmodule
