`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 00:49:55
// Design Name: 
// Module Name: four_bit_counter
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


module four_bit_counter(
    input EN,
    input clk,
    input rst,
    output [3:0] Q
    );

wire q1, q2;

jk_flip_flop jkff0(.j(EN), .k(EN), .rst(rst), .clk(clk), .q(Q[0]));
jk_flip_flop jkff1(.j(Q[0]), .k(Q[0]), .rst(rst), .clk(clk), .q(Q[1]));
jk_flip_flop jkff2(.j(q1), .k(q1), .rst(rst), .clk(clk), .q(Q[2]));
jk_flip_flop jkff3(.j(q2), .k(q2), .rst(rst), .clk(clk), .q(Q[3]));

assign q1 = Q[0] & Q[1];
assign q2 = q1 & Q[2];

endmodule
