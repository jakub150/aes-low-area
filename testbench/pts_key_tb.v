`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 15:12:53
// Design Name: 
// Module Name: pts_key_tb
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


module pts_key_tb(

    );

reg [127:0] a;
reg clk=0, rst, start;
wire [7:0] z;
wire ready;

always #5 clk=!clk;

pts_key uut(.a(a), .clk(clk), .rst(rst), .start(start), .z(z), .ready(ready));

initial begin
    @(posedge clk) rst=1;
    @(posedge clk) rst=0;
    #50;
    @(posedge clk) start<=1;
    @(posedge clk) start<=0; a=127'h00112233445566778899aabbccddeeff;
    @(posedge clk) a=0;
    #270;
    @(posedge clk) rst=1;
    @(posedge clk) rst=0;
    #350;
    @(posedge clk) start<=1;
    @(posedge clk) start<=0; a=127'h00112233445566778899aabbccddeeff;
    @(posedge clk) a=0;
end

endmodule
