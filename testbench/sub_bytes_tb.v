`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 19:42:05
// Design Name: 
// Module Name: sub_bytes_tb
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


module sub_bytes_tb(

    );

reg [7:0] a;
wire [7:0] z;

integer i;

sub_bytes uut(.a(a), .mode(1), .z(z));

initial begin
    //a=8'h95;
    
    for(i=0; i<256; i=i+1) begin
        a=i; #50;
    end
    
end

endmodule
