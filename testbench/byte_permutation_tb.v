`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 11:44:37
// Design Name: 
// Module Name: byte_permutation_tb
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


module byte_permutation_tb(

    );

reg [7:0] data_in_tb;
reg clk=0;
reg rst;
wire [7:0] data_out_tb;

always #5 clk=~clk;

byte_permutation uut(.data_in(data_in_tb), .clk(clk), .rst(rst), .data_out(data_out_tb));

initial begin
    @(posedge clk) rst=1;
    @(posedge clk) rst=0;// #5;
    data_in_tb <= 8'h01; #10;
    data_in_tb <= 8'h11; #10;
    data_in_tb <= 8'h22; #10;
    data_in_tb <= 8'h33; #10;
    data_in_tb <= 8'h44; #10;
    data_in_tb <= 8'h55; #10;
    data_in_tb <= 8'h66; #10;
    data_in_tb <= 8'h77; #10;
    data_in_tb <= 8'h88; #10;
    data_in_tb <= 8'h99; #10;
    data_in_tb <= 8'haa; #10;
    data_in_tb <= 8'hbb; #10;
    data_in_tb <= 8'hcc; #10;
    data_in_tb <= 8'hdd; #10;
    data_in_tb <= 8'hee; #10;
    data_in_tb <= 8'hff; #10;
    
    #500;
    @(negedge clk) rst=1;
    @(negedge clk) rst=0; #5;
    data_in_tb <= 8'h01; #10;
    data_in_tb <= 8'h11; #10;
    data_in_tb <= 8'h22; #10;
    data_in_tb <= 8'h33; #10;
    data_in_tb <= 8'h44; #10;
    data_in_tb <= 8'h55; #10;
    data_in_tb <= 8'h66; #10;
    data_in_tb <= 8'h77; #10;
    data_in_tb <= 8'h88; #10;
    data_in_tb <= 8'h99; #10;
    data_in_tb <= 8'haa; #10;
    data_in_tb <= 8'hbb; #10;
    data_in_tb <= 8'hcc; #10;
    data_in_tb <= 8'hdd; #10;
    data_in_tb <= 8'hee; #10;
    data_in_tb <= 8'hff; #10;
end

endmodule
