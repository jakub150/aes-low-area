`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2024 13:41:32
// Design Name: 
// Module Name: pts_converter_tb
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


module pts_converter_tb(

    );

reg [7:0] data_in, d0, d1, d2, d3;
reg rst, clk=0, en;
wire [7:0] data_out;

always #5 clk=!clk;

pts_converter uut(.data_in(data_in), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .rst(rst), .clk(clk), .en(en), .data_out(data_out));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5
    #100;
    @(posedge clk) en<=1;
    @(posedge clk) en<=0;
    data_in <= 8'h00;
    d0 <= 8'h01;
    d1 <= 8'h11;
    d2 <= 8'h22;
    d3 <= 8'h33; #10;
    d0 <= 8'h00;
    d1 <= 8'h00;
    d2 <= 8'h00;
    d3 <= 8'h00; #30;
    d0 <= 8'h44;
    d1 <= 8'h55;
    d2 <= 8'h66;
    d3 <= 8'h77; #40;
    d0 <= 8'h88;
    d1 <= 8'h99;
    d2 <= 8'haa;
    d3 <= 8'hbb; #40;
    d0 <= 8'hcc;
    d1 <= 8'hdd;
    d2 <= 8'hee;
    d3 <= 8'hff; #500;

    d0 <= 8'h01;
    d1 <= 8'h11;
    d2 <= 8'h22;
    d3 <= 8'h33; #40;
    d0 <= 8'h44;
    d1 <= 8'h55;
    d2 <= 8'h66;
    d3 <= 8'h77; #40;
    d0 <= 8'h88;
    d1 <= 8'h99;
    d2 <= 8'haa;
    d3 <= 8'hbb; #40;
    d0 <= 8'hcc;
    d1 <= 8'hdd;
    d2 <= 8'hee;
    d3 <= 8'hff;
end

endmodule
