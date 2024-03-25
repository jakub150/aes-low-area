`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 11:57:05
// Design Name: 
// Module Name: stp_key_tb
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


module stp_key_tb(

    );

reg [7:0] a;
reg clk=0, rst, start;
wire [127:0] z;
wire ready;

always #5 clk=!clk;

stp_key uut(.a(a), .clk(clk), .rst(rst), .start(start), .z(z), .ready(ready));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;
    #50;
    @(posedge clk) start<=1;
    @(posedge clk) a=8'h00;   start<=0;  #10;
    a<=8'h11;   #10;
    a<=8'h22;   #10;
    a<=8'h33;   #10;
    a<=8'h44;   #10;
    a<=8'h55;   #10;
    a<=8'h66;   #10;
    a<=8'h77;   #10;
    a<=8'h88;   #10;
    a<=8'h99;   #10;
    a<=8'haa;   #10;
    a<=8'hbb;   #10;
    a<=8'hcc;   #10;
    a<=8'hdd;   #10;
    a<=8'hee;   #10;
    a<=8'hff;   #10;
    a<=8'h00;   #10;
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;
    #360;
    @(posedge clk) start<=1;
    @(posedge clk) a=8'h00;   start<=0;  #10;
    a<=8'h11;   #10;
    a<=8'h22;   #10;
    a<=8'h33;   #10;
    a<=8'h44;   #10;
    a<=8'h55;   #10;
    a<=8'h66;   #10;
    a<=8'h77;   #10;
    a<=8'h88;   #10;
    a<=8'h99;   #10;
    a<=8'haa;   #10;
    a<=8'hbb;   #10;
    a<=8'hcc;   #10;
    a<=8'hdd;   #10;
    a<=8'hee;   #10;
    a<=8'hff;   #10;
    a<=8'h00;   #10;
end

endmodule
