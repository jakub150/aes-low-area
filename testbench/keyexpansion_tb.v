`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/10 19:19:31
// Design Name: 
// Module Name: kexp_tb
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


module kexp_tb(

    );
    reg clk=0;
    reg en=1;
    reg [3:0]round;
    wire [127:0] key_output;
    
    key_exp uut(
       .clk(clk),
       .rst_n(1'b1),
       .en(en),
        .kcnt(round),
        .key(128'h4c4dc7ade059c96162408c4a2744c09b),
        .done(),
        .w_data(key_output));

initial begin
    @(posedge clk) round <= 4'h0;
    @(posedge clk) en <= 0;// round = round + 1;
    #50 en <= 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    //@(posedge clk) en<=0;
    //#20 en <= 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
    @(posedge clk) round <= round + 1;
end

always #5 clk=!clk;

/*
always @(*) begin
    #10;
    @(posedge clk) round <= round + 1;
end
*/

always @(*) begin
    #5;
    if(round > 10) $finish;
    #15;
end
endmodule
