`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 08:16:35
// Design Name: 
// Module Name: sbox_tb
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


module sbox_tb(

    );

reg [7:0] A_tb;
reg encrypt_tb=1;
wire [7:0] Q_tb;
integer i;

bSbox uut(.A(A_tb), .encrypt(encrypt_tb), .Q(Q_tb));

initial begin
    for(i=0; i<256; i=i+1) begin
        A_tb=i; #50;
    end
end

endmodule
