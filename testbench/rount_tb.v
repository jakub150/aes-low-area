`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 12:29:23
// Design Name: 
// Module Name: rount_tb
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


module rount_tb(

    );

reg [7:0] input_data, key;
reg rst, clk=0;
wire [7:0] output_data;

always #5 clk=~clk;

round uut(.data(input_data), .rst(rst), .clk(clk), .z(output_data), .key(key));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5;
    input_data <= 8'h5c; #10;
    input_data <= 8'h24; #10;
    input_data <= 8'h10; #10;
    input_data <= 8'h9c; #10;
    input_data <= 8'h73; #10;
    input_data <= 8'h88; #10;
    input_data <= 8'had; #10;
    input_data <= 8'he1; #10;
    input_data <= 8'h20; #10;
    input_data <= 8'h0a; #10;
    input_data <= 8'hcd; #10;
    input_data <= 8'h33; #10;
    input_data <= 8'h24; #10;
    input_data <= 8'h87; #10;
    input_data <= 8'h9f; #10;
    input_data <= 8'hf6; #10;
    
    key <= 8'hc0; #10;
    key <= 8'h39; #10;
    key <= 8'h34; #10;
    key <= 8'h78; #10;
    key <= 8'h84; #10;
    key <= 8'h6c; #10;
    key <= 8'h52; #10;
    key <= 8'h0f; #10;
    key <= 8'h0c; #10;
    key <= 8'hf5; #10;
    key <= 8'hf8; #10;
    key <= 8'hb4; #10;
    key <= 8'hc0; #10;
    key <= 8'h28; #10;
    key <= 8'h16; #10;
    key <= 8'h4b; #10;
    
    #130;
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5;
    input_data <= 8'h01; #10;
    input_data <= 8'h11; #10;
    input_data <= 8'h22; #10;
    input_data <= 8'h33; #10;
    input_data <= 8'h44; #10;
    input_data <= 8'h55; #10;
    input_data <= 8'h66; #10;
    input_data <= 8'h77; #10;
    input_data <= 8'h88; #10;
    input_data <= 8'h99; #10;
    input_data <= 8'haa; #10;
    input_data <= 8'hbb; #10;
    input_data <= 8'hcc; #10;
    input_data <= 8'hdd; #10;
    input_data <= 8'hee; #10;
    input_data <= 8'hff; #10;
    
    #130;
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5;
    input_data <= 8'h01; #10;
    input_data <= 8'h11; #10;
    input_data <= 8'h22; #10;
    input_data <= 8'h33; #10;
    input_data <= 8'h44; #10;
    input_data <= 8'h55; #10;
    input_data <= 8'h66; #10;
    input_data <= 8'h77; #10;
    input_data <= 8'h88; #10;
    input_data <= 8'h99; #10;
    input_data <= 8'haa; #10;
    input_data <= 8'hbb; #10;
    input_data <= 8'hcc; #10;
    input_data <= 8'hdd; #10;
    input_data <= 8'hee; #10;
    input_data <= 8'hff; #10;
end

endmodule
