`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2023 09:50:13
// Design Name: 
// Module Name: reg_8bit
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


module shift_reg_8(
    input [7:0] D,
    input clk,
    input rst,
    output [7:0] Q
    );

/*
wire Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7;
wire D0, D1, D2, D3, D4, D5, D6, D7;

assign D0 = D[0];
assign D1 = D[1];
assign D2 = D[2];
assign D3 = D[3];
assign D4 = D[4];
assign D5 = D[5];
assign D6 = D[6];
assign D7 = D[7];
assign Q = {Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0};
*/

d_flip_flop dff0(.d(D[0]), .clk(clk), .rst(rst), .q(Q[0]));
d_flip_flop dff1(.d(D[1]), .clk(clk), .rst(rst), .q(Q[1]));
d_flip_flop dff2(.d(D[2]), .clk(clk), .rst(rst), .q(Q[2]));
d_flip_flop dff3(.d(D[3]), .clk(clk), .rst(rst), .q(Q[3]));
d_flip_flop dff4(.d(D[4]), .clk(clk), .rst(rst), .q(Q[4]));
d_flip_flop dff5(.d(D[5]), .clk(clk), .rst(rst), .q(Q[5]));
d_flip_flop dff6(.d(D[6]), .clk(clk), .rst(rst), .q(Q[6]));
d_flip_flop dff7(.d(D[7]), .clk(clk), .rst(rst), .q(Q[7]));

endmodule
