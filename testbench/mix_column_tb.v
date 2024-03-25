`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2024 06:36:38
// Design Name: 
// Module Name: mix_column_tb
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


module mix_column_tb(

    );

reg [7:0] d_in;
reg en, clk=0, rst;
wire [7:0] d0_out, d1_out, d2_out, d3_out;

always #5 clk=!clk;

mix_column uut(.d_in(d_in), .en(en), .clk(clk), .rst(rst), .d0_out(d0_out), .d1_out(d1_out), .d2_out(d2_out), .d3_out(d3_out));

initial begin
    @(negedge clk) rst=1;
    @(negedge clk) rst=0;// #5;
    en=0;   d_in=8'h87; #10;
    en=1;   d_in=8'h6e; #10;
    d_in=8'h46; #10;
    d_in=8'ha6; #10;
    en=0;   d_in=8'hf2; #10;
    en=1;   d_in=8'h4c; #10;
    d_in=8'he7; #10;
    d_in=8'h8c; #10;
    en=0;   d_in=8'h4d; #10;
    en=1;   d_in=8'h90; #10;
    d_in=8'h4a; #10;
    d_in=8'hd8; #10;
    #100;
    en=0;   d_in=8'h97; #10;
    en=1;   d_in=8'hec; #10;
    d_in=8'hc3; #10;
    d_in=8'h95; #10;
end

endmodule
