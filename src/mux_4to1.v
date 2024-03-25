`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.12.2023 08:38:48
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1(
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    input [1:0] sel,
    output reg [7:0] out
    );
    
always@(a, b, c, d, sel) begin
    case(sel)
        2'b00: out <= a;
        2'b01: out <= b;
        2'b10: out <= c;
        2'b11: out <= d;
    endcase
end
    
endmodule
