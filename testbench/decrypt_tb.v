`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 01:06:33
// Design Name: 
// Module Name: decrypt_tb
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


module decrypt_tb(

    );

reg [7:0] input_data, key;
reg rst, clk=0, en;
wire [7:0] output_data, round_10;
wire output_ready;

always #5 clk=~clk;

decrypt uut(.input_data(input_data), .rst(rst), .clk(clk), .en(en), .key(key), .output_data(output_data), .round_10(round_10), .output_ready(output_ready));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5;
    #50;
    @(posedge clk) en<=1;
    @(posedge clk) en<=0;  input_data <= 8'h3a; //#10;
    @(posedge clk) input_data <= 8'h6c; //#10;
    @(posedge clk) input_data <= 8'ha3; //#10;
    @(posedge clk) input_data <= 8'h24; //#10;
    @(posedge clk) input_data <= 8'h4d; //#10;
    @(posedge clk) input_data <= 8'hfd; //#10;
    @(posedge clk) input_data <= 8'h85; //#10;
    @(posedge clk) input_data <= 8'h54; //#10;
    @(posedge clk) input_data <= 8'h9d; //#10;
    @(posedge clk) input_data <= 8'h65; //#10;
    @(posedge clk) input_data <= 8'h7e; //#10;
    @(posedge clk) input_data <= 8'h3f; //#10;
    @(posedge clk) input_data <= 8'hd5; key <= 8'hd1;   //counter=12
    @(posedge clk) input_data <= 8'h67; key <= 8'h56;
    @(posedge clk) input_data <= 8'h52; key <= 8'h1d;
    @(posedge clk) input_data <= 8'hdf; key <= 8'h62;
    @(posedge clk) key <= 8'h47;
    @(posedge clk) key <= 8'hd1;
    @(posedge clk) key <= 8'hd2;
    @(posedge clk) key <= 8'h41;
    @(posedge clk) key <= 8'h18;
    @(posedge clk) key <= 8'h66;
    @(posedge clk) key <= 8'hce;
    @(posedge clk) key <= 8'h7d;
    @(posedge clk) key <= 8'h9e;
    @(posedge clk) key <= 8'h45;
    @(posedge clk) key <= 8'ha2;
    @(posedge clk) key <= 8'ha3;
end

endmodule
