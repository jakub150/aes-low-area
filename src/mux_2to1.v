`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.12.2023 09:14:48
// Design Name: 
// Module Name: mux_2to1
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


module mux_2to1(
    input [7:0] a,
    input [7:0] b,
    input sel,
    output reg [7:0] out
    );

always@(a, b, sel) begin
    case(sel)
        1'b0: out <= a;
        1'b1: out <= b;
        //default: out <= 0;
    endcase
end


//assign out = (sel == 1'b0) ? a : b;
    
endmodule
