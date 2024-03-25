`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 17:40:25
// Design Name: 
// Module Name: encryption_tb
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


module encryption_tb(

    );

reg clk=0, rst, start, mode;
reg [7:0] data;
wire ready;
wire [7:0] z;

encryption uut(.clk(clk), .key(128'h55888e209aa67d006a9b6f119658f49e), .data(data), .rst(rst), .start(start), .mode(mode), .z(z), .z_ready(ready));

always #5 clk = !clk;

initial begin
    @(posedge clk) rst <= 1;
    @(posedge clk) rst <= 0;
    #20;
    @(posedge clk) start <= 1;  mode <= 0;
    @(posedge clk) start <= 0;  data <= 8'h22;
    @(posedge clk) data <= 8'h50;
    @(posedge clk) data <= 8'h29;
    @(posedge clk) data <= 8'h12;
    @(posedge clk) data <= 8'h96;
    @(posedge clk) data <= 8'h95;
    @(posedge clk) data <= 8'hf1;
    @(posedge clk) data <= 8'hfe;
    @(posedge clk) data <= 8'h80;
    @(posedge clk) data <= 8'hc3;
    @(posedge clk) data <= 8'h94;
    @(posedge clk) data <= 8'h61;
    @(posedge clk) data <= 8'hda;
    @(posedge clk) data <= 8'h68;
    @(posedge clk) data <= 8'hce;
    @(posedge clk) data <= 8'h9c;
    
    //#1640;
    
    #2000;
    
    @(posedge clk) start <= 1;  mode <= 1;
    @(posedge clk) start <= 0;  data <= 8'h22;
    @(posedge clk) data <= 8'h50;
    @(posedge clk) data <= 8'h29;
    @(posedge clk) data <= 8'h12;
    @(posedge clk) data <= 8'h96;
    @(posedge clk) data <= 8'h95;
    @(posedge clk) data <= 8'hf1;
    @(posedge clk) data <= 8'hfe;
    @(posedge clk) data <= 8'h80;
    @(posedge clk) data <= 8'hc3;
    @(posedge clk) data <= 8'h94;
    @(posedge clk) data <= 8'h61;
    @(posedge clk) data <= 8'hda;
    @(posedge clk) data <= 8'h68;
    @(posedge clk) data <= 8'hce;
    @(posedge clk) data <= 8'h9c;
    //@(posedge clk) rst <= 1;
    //@(posedge clk) rst <= 0;
    
    #1640;
    @(posedge clk) start <= 1;  mode <= 0;
    @(posedge clk) start <= 0;  data <= 8'h1b;
    @(posedge clk) data <= 8'h3f;
    @(posedge clk) data <= 8'h0c;
    @(posedge clk) data <= 8'h86;
    @(posedge clk) data <= 8'h4a;
    @(posedge clk) data <= 8'h6c;
    @(posedge clk) data <= 8'h8f;
    @(posedge clk) data <= 8'he4;
    @(posedge clk) data <= 8'h85;
    @(posedge clk) data <= 8'h11;
    @(posedge clk) data <= 8'h65;
    @(posedge clk) data <= 8'h86;
    @(posedge clk) data <= 8'h29;
    @(posedge clk) data <= 8'hbd;
    @(posedge clk) data <= 8'h11;
    @(posedge clk) data <= 8'h91;
    /*
    #1690;
    @(posedge clk) rst <= 1;
    @(posedge clk) rst <= 0;
    */
end

endmodule
