`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2023 09:55:08
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop(
    input d,
    input clk,
    input rst,
    output reg q
    );

/*
always@(posedge rst) begin
    //if(rst)
    q <= 0;
end

always@(posedge clk) begin
    //if(!rst)
    q <= d;
        //$monitor("[%0t] d=%0b, q=%0b", $time, d, q);
end
*/

always @(posedge clk or posedge rst) 
begin
    if(rst==1'b1)
        q <= 1'b0; 
    else 
        q <= d; 
end 

endmodule
