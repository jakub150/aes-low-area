`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 00:22:57
// Design Name: 
// Module Name: encrypt_re_tb
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


module encrypt_re_tb(

    );

reg [7:0] input_data;
reg rst, clk=0, en;
wire [7:0] output_data;
wire output_ready;

always #5 clk=~clk;

encrypt_re uut(.input_data(input_data), .rst(rst), .clk(clk), .en(en), .output_data(output_data), .output_ready(output_ready));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5;
    #50;
    @(posedge clk) en<=1;
    @(posedge clk) en<=0;  input_data <= 8'h5c; //#10;
    @(posedge clk) input_data <= 8'h35; //#10;
    @(posedge clk) input_data <= 8'h32; //#10;
    @(posedge clk) input_data <= 8'haf; //#10;
    @(posedge clk) input_data <= 8'h37; //#10;
    @(posedge clk) input_data <= 8'hdd; //#10;
    @(posedge clk) input_data <= 8'hcb; //#10;
    @(posedge clk) input_data <= 8'h96; //#10;
    @(posedge clk) input_data <= 8'ha8; //#10;
    @(posedge clk) input_data <= 8'h93; //#10;
    @(posedge clk) input_data <= 8'h67; //#10;
    @(posedge clk) input_data <= 8'h88; //#10;
    @(posedge clk) input_data <= 8'he8; //#10;
    @(posedge clk) input_data <= 8'h5a; //#10;
    @(posedge clk) input_data <= 8'h71; //#10;
    @(posedge clk) input_data <= 8'h09; //#10;
    
    @(posedge clk) input_data <= 8'h5c;
    @(posedge clk) input_data <= 8'h35;
    @(posedge clk) input_data <= 8'h32;
    @(posedge clk) input_data <= 8'haf;
    @(posedge clk) input_data <= 8'h37;
    @(posedge clk) input_data <= 8'hdd;
    @(posedge clk) input_data <= 8'hcb;
    @(posedge clk) input_data <= 8'h96;
    @(posedge clk) input_data <= 8'ha8;
    @(posedge clk) input_data <= 8'h93;
    @(posedge clk) input_data <= 8'h67;
    @(posedge clk) input_data <= 8'h88;
    @(posedge clk) input_data <= 8'he8;
    @(posedge clk) input_data <= 8'h5a;
    @(posedge clk) input_data <= 8'h71;
    @(posedge clk) input_data <= 8'h09;
    
    @(posedge clk) input_data <= 8'h03;
    @(posedge clk) input_data <= 8'hb9;
    @(posedge clk) input_data <= 8'hcb;
    @(posedge clk) input_data <= 8'h32;
    @(posedge clk) input_data <= 8'hb2;
    @(posedge clk) input_data <= 8'hc9;
    @(posedge clk) input_data <= 8'h6f;
    @(posedge clk) input_data <= 8'h73;
    @(posedge clk) input_data <= 8'hed;
    @(posedge clk) input_data <= 8'h2d;
    @(posedge clk) input_data <= 8'ha3;
    @(posedge clk) input_data <= 8'h83;
    @(posedge clk) input_data <= 8'h6b;
    @(posedge clk) input_data <= 8'hb3;
    @(posedge clk) input_data <= 8'hc9;
    @(posedge clk) input_data <= 8'h22;
    
    @(posedge clk) input_data <= 8'h77;
    @(posedge clk) input_data <= 8'h3d;
    @(posedge clk) input_data <= 8'h57;
    @(posedge clk) input_data <= 8'h26;
    @(posedge clk) input_data <= 8'hbf;
    @(posedge clk) input_data <= 8'hde;
    @(posedge clk) input_data <= 8'h9f;
    @(posedge clk) input_data <= 8'h10;
    @(posedge clk) input_data <= 8'hc9;
    @(posedge clk) input_data <= 8'h41;
    @(posedge clk) input_data <= 8'h0a;
    @(posedge clk) input_data <= 8'hfa;
    @(posedge clk) input_data <= 8'h38;
    @(posedge clk) input_data <= 8'h46;
    @(posedge clk) input_data <= 8'h66;
    @(posedge clk) input_data <= 8'h40;
    /*
    #120;
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
    */
end

endmodule
