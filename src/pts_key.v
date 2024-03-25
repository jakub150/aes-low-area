`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 13:56:00
// Design Name: 
// Module Name: pts_key
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
/*
module key_128_to_8(
    input [127:0] a,
    output [7:0] z0,
    output [7:0] z1,
    output [7:0] z2,
    output [7:0] z3,
    output [7:0] z4,
    output [7:0] z5,
    output [7:0] z6,
    output [7:0] z7,
    output [7:0] z8,
    output [7:0] z9,
    output [7:0] z10,
    output [7:0] z11,
    output [7:0] z12,
    output [7:0] z13,
    output [7:0] z14,
    output [7:0] z15
    );

assign z0 = a[127:120];
assign z1 = a[119:112];
assign z2 = a[111:104];
assign z3 = a[103:96];
assign z4 = a[95:88];
assign z5 = a[87:80];
assign z6 = a[79:72];
assign z7 = a[71:64];
assign z8 = a[63:56];
assign z9 = a[55:48];
assign z10 = a[47:40];
assign z11 = a[39:32];
assign z12 = a[31:24];
assign z13 = a[23:16];
assign z14 = a[15:8];
assign z15 = a[7:0];

endmodule
*/
module pts_key(
    input [7:0] a0,
    input [7:0] a1,
    input [7:0] a2,
    input [7:0] a3,
    input [7:0] a4,
    input [7:0] a5,
    input [7:0] a6,
    input [7:0] a7,
    input [7:0] a8,
    input [7:0] a9,
    input [7:0] a10,
    input [7:0] a11,
    input [7:0] a12,
    input [7:0] a13,
    input [7:0] a14,
    input [7:0] a15,
    input clk,
    input rst,
    input start,
    output [7:0] z,
    output reg ready
    );

//wire [7:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;
wire [7:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14;
wire [7:0] q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15;
reg c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14;

wire [7:0] counter;
reg en;

always@(posedge rst) begin
    en <= 0;
end

always@(posedge clk) begin
    if(start)//(!rst && counter==0)
        en <= 1;
end

always@(counter, en) begin
    if(en) begin
        case(counter)
            0: begin
                c0 <= 0;
                c1 <= 0;
                c2 <= 0;
                c3 <= 0;
                c4 <= 0;
                c5 <= 0;
                c6 <= 0;
                c7 <= 0;
                c8 <= 0;
                c9 <= 0;
                c10 <= 0;
                c11 <= 0;
                c12 <= 0;
                c13 <= 0;
                c14 <= 0;
                ready <= 1;
            end
            16, 32, 48, 64, 80, 96, 112, 128, 144, 160: begin
                c0 <= 0;
                c1 <= 0;
                c2 <= 0;
                c3 <= 0;
                c4 <= 0;
                c5 <= 0;
                c6 <= 0;
                c7 <= 0;
                c8 <= 0;
                c9 <= 0;
                c10 <= 0;
                c11 <= 0;
                c12 <= 0;
                c13 <= 0;
                c14 <= 0;
                //ready <= 0;
            end
            1, 17, 33, 49, 65, 81, 97, 113, 129, 145, 161: begin
                c0 <= 1;
                c1 <= 1;
                c2 <= 1;
                c3 <= 1;
                c4 <= 1;
                c5 <= 1;
                c6 <= 1;
                c7 <= 1;
                c8 <= 1;
                c9 <= 1;
                c10 <= 1;
                c11 <= 1;
                c12 <= 1;
                c13 <= 1;
                c14 <= 1;
                //ready <= 0;
            end
            177: begin
                ready <= 0;
            end
        endcase
    end
end

eight_bit_counter ebc(.EN(en), .clk(clk), .rst(rst), .Q(counter));

//key_128_to_8 key_128_to_8(a, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);

shift_reg_8 sr0(.D(temp0), .clk(clk), .rst(rst), .Q(z));
mux_2to1 mux0(.a(a0), .b(q1), .sel(c0), .out(temp0));

shift_reg_8 sr1(.D(temp1), .clk(clk), .rst(rst), .Q(q1));
mux_2to1 mux1(.a(a1), .b(q2), .sel(c1), .out(temp1));

shift_reg_8 sr2(.D(temp2), .clk(clk), .rst(rst), .Q(q2));
mux_2to1 mux2(.a(a2), .b(q3), .sel(c2), .out(temp2));

shift_reg_8 sr3(.D(temp3), .clk(clk), .rst(rst), .Q(q3));
mux_2to1 mux3(.a(a3), .b(q4), .sel(c3), .out(temp3));

shift_reg_8 sr4(.D(temp4), .clk(clk), .rst(rst), .Q(q4));
mux_2to1 mux4(.a(a4), .b(q5), .sel(c4), .out(temp4));

shift_reg_8 sr5(.D(temp5), .clk(clk), .rst(rst), .Q(q5));
mux_2to1 mux5(.a(a5), .b(q6), .sel(c5), .out(temp5));

shift_reg_8 sr6(.D(temp6), .clk(clk), .rst(rst), .Q(q6));
mux_2to1 mux6(.a(a6), .b(q7), .sel(c6), .out(temp6));

shift_reg_8 sr7(.D(temp7), .clk(clk), .rst(rst), .Q(q7));
mux_2to1 mux7(.a(a7), .b(q8), .sel(c7), .out(temp7));

shift_reg_8 sr8(.D(temp8), .clk(clk), .rst(rst), .Q(q8));
mux_2to1 mux8(.a(a8), .b(q9), .sel(c8), .out(temp8));

shift_reg_8 sr9(.D(temp9), .clk(clk), .rst(rst), .Q(q9));
mux_2to1 mux9(.a(a9), .b(q10), .sel(c9), .out(temp9));

shift_reg_8 sr10(.D(temp10), .clk(clk), .rst(rst), .Q(q10));
mux_2to1 mux10(.a(a10), .b(q11), .sel(c10), .out(temp10));

shift_reg_8 sr11(.D(temp11), .clk(clk), .rst(rst), .Q(q11));
mux_2to1 mux11(.a(a11), .b(q12), .sel(c11), .out(temp11));

shift_reg_8 sr12(.D(temp12), .clk(clk), .rst(rst), .Q(q12));
mux_2to1 mux12(.a(a12), .b(q13), .sel(c12), .out(temp12));

shift_reg_8 sr13(.D(temp13), .clk(clk), .rst(rst), .Q(q13));
mux_2to1 mux13(.a(a13), .b(q14), .sel(c13), .out(temp13));

shift_reg_8 sr14(.D(temp14), .clk(clk), .rst(rst), .Q(q14));
mux_2to1 mux14(.a(a14), .b(q15), .sel(c14), .out(temp14));

shift_reg_8 sr15(.D(a15), .clk(clk), .rst(rst), .Q(q15));

endmodule
