`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 06:55:15
// Design Name: 
// Module Name: pts_converter
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


module pts_converter(
    input [7:0] data_in,
    input [7:0] d0,
    input [7:0] d1,
    input [7:0] d2,
    input [7:0] d3,
    input clk,
    input rst,
    input en,
    output [7:0] data_out
    );

reg start;
wire [3:0] counter;
reg c0, c1, c2, c3;
wire [7:0] m1, m2, m3, q4, q3, q2, q1;

always@(posedge rst) begin
    start <= 0;
end

always@(posedge clk) begin
    if(en)
        start <= 1;
end

always@(counter, start) begin
    if(start) begin
        case(counter)
            0, 4, 8, 12: begin
                c0 <= 1'b0;
                c1 <= 1'b0;
                c2 <= 1'b0;
                c3 <= 1'b0;
            end
            1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15: begin
                c0 <= 1'b1;
                c1 <= 1'b1;
                c2 <= 1'b1;
                c3 <= 2'b1;
            end
            //16: start <= 0;
        endcase
    end
end

four_bit_counter fbc(.EN(start), .clk(clk), .rst(rst), .Q(counter));

shift_reg_8 sr4(.D(data_in), .clk(clk), .rst(rst), .Q(q4));
mux_2to1 mux3(.a(d3), .b(q4), .sel(c3), .out(m3));

shift_reg_8 sr3(.D(m3), .clk(clk), .rst(rst), .Q(q3));
mux_2to1 mux2(.a(d2), .b(q3), .sel(c2), .out(m2));

shift_reg_8 sr2(.D(m2), .clk(clk), .rst(rst), .Q(q2));
mux_2to1 mux1(.a(d1), .b(q2), .sel(c1), .out(m1));

shift_reg_8 sr1(.D(m1), .clk(clk), .rst(rst), .Q(q1));
mux_2to1 mux0(.a(d0), .b(q1), .sel(c0), .out(data_out));

endmodule
