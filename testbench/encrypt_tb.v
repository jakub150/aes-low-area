`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 09:41:50
// Design Name: 
// Module Name: encrypt_tb
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


module encrypt_tb(

    );

reg [7:0] input_data;
reg rst, clk=0;
wire [7:0] output_data;
wire output_ready;

always #5 clk=~clk;

encrypt uut(.input_data(input_data), .rst(rst), .clk(clk), .output_data(output_data), .output_ready(output_ready));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5;
    input_data <= 8'h5c; #10;
    input_data <= 8'h35; #10;
    input_data <= 8'h32; #10;
    input_data <= 8'haf; #10;
    input_data <= 8'h37; #10;
    input_data <= 8'hdd; #10;
    input_data <= 8'hcb; #10;
    input_data <= 8'h96; #10;
    input_data <= 8'ha8; #10;
    input_data <= 8'h93; #10;
    input_data <= 8'h67; #10;
    input_data <= 8'h88; #10;
    input_data <= 8'he8; #10;
    input_data <= 8'h5a; #10;
    input_data <= 8'h71; #10;
    input_data <= 8'h09; #10;
    
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
