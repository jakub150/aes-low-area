`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 07:57:40
// Design Name: 
// Module Name: mux_shift_reg
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


module mux_shift_reg(
    input [7:0] a,
    input [7:0] b,
    input c,
    input clk,
    input rst,
    output [7:0] q
    );

wire [7:0] m, d0, d1, d2;

mux_2to1 mux(.a(a), .b(b), .sel(c), .out(m));
shift_reg_8 sr0(.D(m), .clk(clk), .rst(rst), .Q(d0));
shift_reg_8 sr1(.D(d0), .clk(clk), .rst(rst), .Q(d1));
shift_reg_8 sr2(.D(d1), .clk(clk), .rst(rst), .Q(d2));
shift_reg_8 sr3(.D(d2), .clk(clk), .rst(rst), .Q(q));

endmodule
