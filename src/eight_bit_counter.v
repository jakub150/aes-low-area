`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 12:21:14
// Design Name: 
// Module Name: eight_bit_counter
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


module eight_bit_counter(
    input EN,
    input clk,
    input rst,
    output [7:0] Q
    );

wire q1, q2, q3, q4, q5, q6;

jk_flip_flop jkff0(.j(EN), .k(EN), .rst(rst), .clk(clk), .q(Q[0]));
jk_flip_flop jkff1(.j(Q[0]), .k(Q[0]), .rst(rst), .clk(clk), .q(Q[1]));
jk_flip_flop jkff2(.j(q1), .k(q1), .rst(rst), .clk(clk), .q(Q[2]));
jk_flip_flop jkff3(.j(q2), .k(q2), .rst(rst), .clk(clk), .q(Q[3]));
jk_flip_flop jkff4(.j(q3), .k(q3), .rst(rst), .clk(clk), .q(Q[4]));
jk_flip_flop jkff5(.j(q4), .k(q4), .rst(rst), .clk(clk), .q(Q[5]));
jk_flip_flop jkff6(.j(q5), .k(q5), .rst(rst), .clk(clk), .q(Q[6]));
jk_flip_flop jkff7(.j(q6), .k(q6), .rst(rst), .clk(clk), .q(Q[7]));

assign q1 = Q[0] & Q[1];
assign q2 = q1 & Q[2];
assign q3 = q2 & Q[3];
assign q4 = q3 & Q[4];
assign q5 = q4 & Q[5];
assign q6 = q5 & Q[6];

endmodule
