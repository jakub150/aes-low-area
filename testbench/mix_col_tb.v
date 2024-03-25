`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2024 05:10:52
// Design Name: 
// Module Name: mix_col_tb
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


module mix_col_tb(

    );

reg [7:0] d_in;
reg en=0, clk=0, rst;
wire [7:0] d0_out, d1_out, d2_out, d3_out;

always #5 clk=~clk;

mix_col uut(.d_in(d_in), .en(en), .clk(clk), .rst(rst), .mode(1), .d0_out(d0_out), .d1_out(d1_out), .d2_out(d2_out), .d3_out(d3_out));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0; //#10;
    /*
    @(posedge clk) en<=0;   d_in<=8'h87; //#10;
    @(posedge clk) en<=1;   d_in<=8'h6e; //#10;
    @(posedge clk) d_in<=8'h46; //#10;
    @(posedge clk) d_in<=8'ha6; //#10;
    @(posedge clk) en<=0;   d_in<=8'hf2; //#10;
    @(posedge clk) en<=1;   d_in<=8'h4c; //#10;
    @(posedge clk) d_in<=8'he7; //#10;
    @(posedge clk) d_in<=8'h8c; //#10;
    @(posedge clk) en<=0;   d_in<=8'h4d; //#10;
    @(posedge clk) en<=1;   d_in<=8'h90; //#10;
    @(posedge clk) d_in<=8'h4a; //#10;
    @(posedge clk) d_in<=8'hd8; //#10;
    //#100;
    @(posedge clk) en<=0;   d_in<=8'h97; //#10;
    @(posedge clk) en<=1;   d_in<=8'hec; //#10;
    @(posedge clk) d_in<=8'hc3; //#10;
    @(posedge clk) d_in<=8'h95; //#10;
    */
    
    @(posedge clk) en<=0;   d_in<=8'h47; //#10;
    @(posedge clk) en<=1;   d_in<=8'h37; //#10;
    @(posedge clk) d_in<=8'h94; //#10;
    @(posedge clk) d_in<=8'hed; //#10;
    @(posedge clk) en<=0;   d_in<=8'h40; //#10;
    @(posedge clk) en<=1;   d_in<=8'hd4; //#10;
    @(posedge clk) d_in<=8'he4; //#10;
    @(posedge clk) d_in<=8'ha5; //#10;
    @(posedge clk) en<=0;   d_in<=8'ha3; //#10;
    @(posedge clk) en<=1;   d_in<=8'h70; //#10;
    @(posedge clk) d_in<=8'h3a; //#10;
    @(posedge clk) d_in<=8'ha6; //#10;
    //#100;
    @(posedge clk) en<=0;   d_in<=8'h4c; //#10;
    @(posedge clk) en<=1;   d_in<=8'h9f; //#10;
    @(posedge clk) d_in<=8'h42; //#10;
    @(posedge clk) d_in<=8'hbc; //#10;
    
end

endmodule
