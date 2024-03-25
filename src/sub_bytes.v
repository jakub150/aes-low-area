`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 19:26:36
// Design Name: 
// Module Name: sub_bytes
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

module delta(a, z);
    input [7:0] a;
    output [7:0] z;
    
    assign z[7] = a[7]^a[5];
    assign z[6] = a[7]^a[6]^a[4]^a[3]^a[2]^a[1];
    assign z[5] = a[7]^a[5]^a[3]^a[2];
    assign z[4] = a[7]^a[5]^a[3]^a[2]^a[1];
    assign z[3] = a[7]^a[6]^a[2]^a[1];
    assign z[2] = a[7]^a[4]^a[3]^a[2]^a[1];
    assign z[1] = a[6]^a[4]^a[1];
    assign z[0] = a[6]^a[1]^a[0];
endmodule

module delta_inv(a,z);
    input [7:0] a;
    output [7:0] z;
    
    assign z[7] = a[7]^a[6]^a[5]^a[1];
    assign z[6] = a[6]^a[2];
    assign z[5] = a[6]^a[5]^a[1];
    assign z[4] = a[6]^a[5]^a[4]^a[2]^a[1];
    assign z[3] = a[5]^a[4]^a[3]^a[2]^a[1];
    assign z[2] = a[7]^a[4]^a[3]^a[2]^a[1];
    assign z[1] = a[5]^a[4];
    assign z[0] = a[6]^a[5]^a[4]^a[2]^a[0];
endmodule

module x2(a, z);
    input [3:0] a;
    output [3:0] z;
    
    assign z[3] = a[3];
    assign z[2] = a[3]^a[2];
    assign z[1] = a[2]^a[1];
    assign z[0] = a[3]^a[1]^a[0];
endmodule

module lambda(a,z);
    input [3:0] a;
    output [3:0] z;
    
    assign z[3] = a[2]^a[0];
    assign z[2] = a[3]^a[2]^a[1]^a[0];
    assign z[1] = a[3];
    assign z[0] = a[2];
endmodule

module phi(a,z);
    input [1:0] a;
    output [1:0] z;
    
    assign z[1] = a[1]^a[0];
    assign z[0] = a[1];
endmodule

module gf2_mul(a,b,z);
    input [1:0] a;
    input [1:0] b;
    output [1:0] z;
    
    assign z[1] = (a[1]^a[0])&(b[1]^b[0])^a[0]*b[0];
    assign z[0] = a[1]&b[1]^a[0]&b[0];
endmodule

module gf4_mul(a,b,z);
    input [3:0] a;
    input [3:0] b;
    output [3:0] z;
    
    wire [1:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11;
    
    gf2_mul gf2m0(.a(temp0), .b(temp2), .z(temp6));
    gf2_mul gf2m1(.a(temp4), .b(temp5), .z(temp7));
    gf2_mul gf2m2(.a(temp1), .b(temp3), .z(temp8));
    phi phi(.a(temp6), .z(temp10));
    
    assign temp0 = a[3:2];
    assign temp1 = a[1:0];
    assign temp2 = b[3:2];
    assign temp3 = b[1:0];
    assign temp4 = temp0^temp1;
    assign temp5 = temp2^temp3;
    assign temp9 = temp7^temp8;
    assign temp11 = temp8^temp10;
    assign z = {temp9, temp11};
endmodule

module gf4_inv(a,z);
    input [3:0] a;
    output [3:0] z;
    
    assign z[3] = a[3]^a[3]&a[2]&a[1]^a[3]&a[0]^a[2];
    
    assign z[2] = a[3]&a[2]&a[1]^a[3]&a[2]&a[0]^a[3]&a[0]^a[2]^a[2]&a[1];
    
    assign z[1] = a[3]^a[3]&a[2]&a[1]^a[3]&a[1]&a[0]^a[2]^a[2]&a[0]^a[1];
    
    assign z[0] = a[3]&a[2]&a[1]^a[3]&a[2]&a[0]^a[3]&a[1]^a[3]&a[1]&a[0]^a[3]&a[0]^a[2]^a[2]&a[1]^a[2]&a[1]&a[0]^a[1]^a[0];
endmodule

module affine(a,z);
    input [7:0] a;
    output [7:0] z;
    
    assign z[7] = a[7]^a[6]^a[5]^a[4]^a[3];
    assign z[6] = a[6]^a[5]^a[4]^a[3]^a[2]^1'b1;
    assign z[5] = a[5]^a[4]^a[3]^a[2]^a[1]^1'b1;
    assign z[4] = a[4]^a[3]^a[2]^a[1]^a[0];
    assign z[3] = a[7]^a[3]^a[2]^a[1]^a[0];
    assign z[2] = a[7]^a[6]^a[2]^a[1]^a[0];
    assign z[1] = a[7]^a[6]^a[5]^a[1]^a[0]^1'b1;
    assign z[0] = a[7]^a[6]^a[5]^a[4]^a[0]^1'b1;
endmodule

module affine_inv(a,z);
    input [7:0] a;
    output [7:0] z;
    
    assign z[7] = a[6]^a[4]^a[1];
    assign z[6] = a[5]^a[3]^a[0];
    assign z[5] = a[7]^a[4]^a[2];
    assign z[4] = a[6]^a[3]^a[1];
    assign z[3] = a[5]^a[2]^a[0];
    assign z[2] = a[7]^a[4]^a[1]^1'b1;
    assign z[1] = a[6]^a[3]^a[0];
    assign z[0] = a[7]^a[5]^a[2]^1'b1;
endmodule

module sub_bytes(
    input [7:0] a,
    input mode,
    output [7:0] z
    );

wire [3:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9;
wire [7:0] temp, temp10, temp11, encrypt;

delta d(.a(a), .z(temp));
x2 square(.a(temp0), .z(temp3));
lambda lambda(.a(temp3), .z(temp4));
gf4_mul gfm0(.a(temp2), .b(temp1), .z(temp5));
gf4_inv gfi(.a(temp6), .z(temp7));
gf4_mul gfm1(.a(temp7), .b(temp0), .z(temp8));
gf4_mul gfm2(.a(temp7), .b(temp2), .z(temp9));
delta_inv di(.a(temp10), .z(temp11));
affine at(.a(temp11), .z(encrypt));

assign temp0 = temp[7:4];
assign temp1 = temp[3:0];
assign temp2 = temp0^temp1;
assign temp6 = temp4^temp5;
assign temp10 = {temp8, temp9};

/////////////////////////////////////////////////////////////////////////////////
wire [3:0] temp0_inv, temp1_inv, temp2_inv, temp3_inv, temp4_inv, temp5_inv, temp6_inv, temp7_inv, temp8_inv, temp9_inv;
wire [7:0] a_at, temp_inv, temp10_inv, decrypt;

affine_inv at_inv(.a(a), .z(a_at));

delta d_inv(.a(a_at), .z(temp_inv));
x2 square_inv(.a(temp0_inv), .z(temp3_inv));
lambda lambda_inv(.a(temp3_inv), .z(temp4_inv));
gf4_mul gfm0_inv(.a(temp2_inv), .b(temp1_inv), .z(temp5_inv));
gf4_inv gfi_inv(.a(temp6_inv), .z(temp7_inv));
gf4_mul gfm1_inv(.a(temp7_inv), .b(temp0_inv), .z(temp8_inv));
gf4_mul gfm2_inv(.a(temp7_inv), .b(temp2_inv), .z(temp9_inv));
delta_inv di_inv(.a(temp10_inv), .z(decrypt));

assign temp0_inv = temp_inv[7:4];
assign temp1_inv = temp_inv[3:0];
assign temp2_inv = temp0_inv^temp1_inv;
assign temp6_inv = temp4_inv^temp5_inv;
assign temp10_inv = {temp8_inv, temp9_inv};

mux_2to1 mux(.a(encrypt), .b(decrypt), .sel(mode), .out(z));

endmodule
