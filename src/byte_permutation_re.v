`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 23:24:30
// Design Name: 
// Module Name: byte_permutation_re
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


module byte_permutation_re(
    input [7:0] data_in,
    input clk,
    input rst,
    input rst_counter,
    input en,
    input mode,
    output [7:0] data_out
    );

reg c0, c1, c2, start;
reg [1:0] c3;
wire [7:0] counter;
wire [7:0] d3, d7, d11;

always@(posedge clk) begin
    if(en)//(!rst && counter==0)
        start <= 1;
end

always@(counter, start) begin
    if(start) begin
        if(mode==0) begin
            case(counter)
                /*
                0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 16, 20, 22, 24, 25, 26, 27, 28, 32, 36, 38, 40, 41, 42, 43: begin
                    c0 <= 1'b0;
                    c1 <= 1'b0;
                    c2 <= 1'b0;
                    c3 <= 2'b11;
                end
                */
                13, 17, 21, 23, 29, 33, 37, 39, 45, 49, 53, 55, 61, 65, 69, 71, 77, 81, 85, 87, 93, 97, 101, 103, 109, 113, 117, 119, 125, 129, 133, 135, 141, 145, 149, 151, 157, 161, 165, 167: begin
                    c0 <= 1'b0;
                    c1 <= 1'b0;
                    c2 <= 1'b1;
                    c3 <= 2'b10;
                end
                14, 18, 19, 30, 34, 35, 46, 50, 51, 62, 66, 67, 78, 82, 83, 94, 98, 99, 110, 114, 115, 126, 130, 131, 142, 146, 147, 158, 162, 163: begin
                    c0 <= 1'b0;
                    c1 <= 1'b1;
                    c2 <= 1'b0;
                    c3 <= 2'b01;
                end
                15, 31, 47, 63, 79, 95, 111, 127, 143, 159: begin
                    c0 <= 1'b1;
                    c1 <= 1'b0;
                    c2 <= 1'b0;
                    c3 <= 2'b00;
                end
                172: start <= 0;
                default: begin
                    c0 <= 1'b0;
                    c1 <= 1'b0;
                    c2 <= 1'b0;
                    c3 <= 2'b11;
                end
            endcase
        end
        else if(mode==1) begin
            case(counter)
                13, 29, 45, 61, 77, 93, 109, 125, 141, 157: begin
                    c0 <= 1'b1;
                    c1 <= 1'b0;
                    c2 <= 1'b0;
                    c3 <= 2'b00;
                end
                14, 17, 18, 30, 33, 34, 46, 49, 50, 62, 65, 66, 78, 81, 82, 94, 97, 98, 110, 113, 114, 126, 129, 130, 142, 145, 146, 158, 161, 162: begin
                    c0 <= 1'b0;
                    c1 <= 1'b1;
                    c2 <= 1'b0;
                    c3 <= 2'b01;
                end
                15, 31, 47, 63, 79, 95, 111, 127, 143, 159: begin
                    c0 <= 1'b0;
                    c1 <= 1'b0;
                    c2 <= 1'b1;
                    c3 <= 2'b10;
                end
                19, 21, 23, 35, 37, 39, 51, 53, 55, 67, 69, 71, 83, 85, 87, 99, 101, 103, 115, 117, 119, 131, 133, 135, 147, 149, 151, 163, 165, 167: begin
                    c0 <= 1'b0;
                    c1 <= 1'b0;
                    c2 <= 1'b1;
                    c3 <= 2'b10;
                end
                172: start <= 0;
                default: begin
                    c0 <= 1'b0;
                    c1 <= 1'b0;
                    c2 <= 1'b0;
                    c3 <= 2'b11;
                end
            endcase
        end
    end
end

eight_bit_counter ebc(.EN(start), .clk(clk), .rst(rst_counter), .Q(counter));

mux_shift_reg msr0(.a(data_in), .b(d11), .c(c0), .clk(clk), .rst(rst), .q(d3));
mux_shift_reg msr1(.a(d3), .b(d11), .c(c1), .clk(clk), .rst(rst), .q(d7));
mux_shift_reg msr2(.a(d7), .b(d11), .c(c2), .clk(clk), .rst(rst), .q(d11));

mux_4to1 mux4(.a(data_in), .b(d3), .c(d7), .d(d11), .sel(c3), .out(data_out));

endmodule
