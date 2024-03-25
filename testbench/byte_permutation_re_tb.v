`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 23:28:32
// Design Name: 
// Module Name: byte_permutation_re_tb
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


module byte_permutation_re_tb(

    );

reg [7:0] data_in_tb;
reg clk=0;
reg rst;
reg en;
wire [7:0] data_out_tb;

always #5 clk=~clk;

byte_permutation_re uut(.data_in(data_in_tb), .clk(clk), .rst(rst), .en(en), .mode(0), .data_out(data_out_tb));

initial begin
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;// #5;
    //@(posedge clk) start<=1;
    //@(posedge clk) start<=0;
    #50;
    @(posedge clk) en<=1;
    @(posedge clk) en<=0;  data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    
    @(posedge clk) data_in_tb <= 8'h01;
    @(posedge clk) data_in_tb <= 8'h11;
    @(posedge clk) data_in_tb <= 8'h22;
    @(posedge clk) data_in_tb <= 8'h33;
    @(posedge clk) data_in_tb <= 8'h44;
    @(posedge clk) data_in_tb <= 8'h55;
    @(posedge clk) data_in_tb <= 8'h66;
    @(posedge clk) data_in_tb <= 8'h77;
    @(posedge clk) data_in_tb <= 8'h88;
    @(posedge clk) data_in_tb <= 8'h99;
    @(posedge clk) data_in_tb <= 8'haa;
    @(posedge clk) data_in_tb <= 8'hbb;
    @(posedge clk) data_in_tb <= 8'hcc;
    @(posedge clk) data_in_tb <= 8'hdd;
    @(posedge clk) data_in_tb <= 8'hee;
    @(posedge clk) data_in_tb <= 8'hff;
    /*
    #200;
    @(posedge clk) rst<=1;
    @(posedge clk) rst<=0;
    #50;
    @(posedge clk) en<=1;
    @(posedge clk) en<=0;// #5;
    */
    @(posedge clk) data_in_tb <= 8'h01; //#10;
    @(posedge clk) data_in_tb <= 8'h11; //#10;
    @(posedge clk) data_in_tb <= 8'h22; //#10;
    @(posedge clk) data_in_tb <= 8'h33; //#10;
    @(posedge clk) data_in_tb <= 8'h44; //#10;
    @(posedge clk) data_in_tb <= 8'h55; //#10;
    @(posedge clk) data_in_tb <= 8'h66; //#10;
    @(posedge clk) data_in_tb <= 8'h77; //#10;
    @(posedge clk) data_in_tb <= 8'h88; //#10;
    @(posedge clk) data_in_tb <= 8'h99; //#10;
    @(posedge clk) data_in_tb <= 8'haa; //#10;
    @(posedge clk) data_in_tb <= 8'hbb; //#10;
    @(posedge clk) data_in_tb <= 8'hcc; //#10;
    @(posedge clk) data_in_tb <= 8'hdd; //#10;
    @(posedge clk) data_in_tb <= 8'hee; //#10;
    @(posedge clk) data_in_tb <= 8'hff; //#10;
end

endmodule
