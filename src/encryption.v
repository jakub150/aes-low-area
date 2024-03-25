`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 15:29:26
// Design Name: 
// Module Name: encryption
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


module encryption(
    input clk,
    input [127:0] key,
    input [7:0] data,
    input rst,
    input start,
    input mode,
    output [7:0] z,
    output reg z_ready
    );

reg en_counter, en_key, en_encrypt, sel, rst_counter, rst_counter_encrypt, rst_key, encrypt_z_ready;
reg [3:0] round;
reg [7:0] key_mem [0:10][0:15];
wire ready_key, ready_encrypt;
wire [7:0] r_key, counter, q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, ak0, e0, m0, round_10, encrypt_z;

//assign rst_key = !rst;

always@(posedge rst) begin
    en_counter <= 0;
    rst_counter <= 1;
    rst_counter_encrypt <= 1;
    rst_key <= 0;
    //@(posedge clk) rst_counter <= 0;    rst_counter_encrypt <= 0;   rst_key <= 1;
end

always@(posedge clk) begin
    if(start) begin//(!rst && counter==0)
        en_counter <= 1;
        sel <= 0;
        encrypt_z_ready <= 0;
        rst_counter <= 0;    rst_counter_encrypt <= 0;   rst_key <= 1;
    end
end

always@(counter, en_counter) begin
    if(en_counter) begin
        case(counter)
            0: begin
                round <= 4'h0;
                en_key <= 1;
            end
            1: begin
                en_key <= 0;
            end
            2: begin
                en_encrypt <= 1;
            end
            3: begin
                en_encrypt <= 0;
            end
            16, 32, 48, 64, 80, 96, 112, 128, 144, 160: begin
                round <= round + 1;
                en_key <= 1;
            end
            17, 33, 49, 65, 81, 97, 113, 129, 145, 161: begin
                en_key <= 0;
            end
            19: begin
                sel <= 1;
            end
            162: begin
                encrypt_z_ready <= 1;
            end
            163: begin
                encrypt_z_ready <= 0;
            end
            179: begin
                en_counter <= 0;
                rst_counter <= 1;
                rst_counter_encrypt <= 1;
                rst_key <= 0;
                round <= 4'h0;
                //@(posedge clk) rst_counter <= 0;    rst_counter_encrypt <= 0;   rst_key <= 1;
            end
        endcase
    end
end

eight_bit_counter ebc(.EN(en_counter), .clk(clk), .rst(rst_counter), .Q(counter));

shift_reg_8 sr0(.D(data), .clk(clk), .rst(rst), .Q(q0));
shift_reg_8 sr1(.D(q0), .clk(clk), .rst(rst), .Q(q1));
shift_reg_8 sr2(.D(q1), .clk(clk), .rst(rst), .Q(q2));
mux_2to1 mux(.a(q2), .b(e0), .sel(sel), .out(m0));

add_key ak(.data(m0), .key(r_key), .z(ak0));
add_key ak1(.data(q6), .key(r_key), .z(encrypt_z));

encrypt_re encrypt(.input_data(ak0), .clk(clk), .rst(rst), .rst_counter(rst_counter_encrypt), .en(en_encrypt), .output_data(e0), .round_10(round_10), .output_ready(ready_encrypt));

shift_reg_8 sr3(.D(round_10), .clk(clk), .rst(rst), .Q(q3));
shift_reg_8 sr4(.D(q3), .clk(clk), .rst(rst), .Q(q4));
shift_reg_8 sr5(.D(q4), .clk(clk), .rst(rst), .Q(q5));
shift_reg_8 sr6(.D(q5), .clk(clk), .rst(rst), .Q(q6));

always@(posedge clk) begin
    if(ready_key) begin
        key_mem[(counter-3)/16][(counter-3)%16] <= r_key;
    end
end

key_exp_re ker(.clk(clk), .rst(rst_key), .key(key), .en(en_key), .kcnt(round), .z(r_key), .ready(ready_key));

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
reg rst_counter_decrypt, sel_inv, en_decrypt, decrypt_z_ready;
reg [3:0] round_inv;
wire ready_decrypt;
wire [7:0] k0, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, decrypt_z, counter_inv, r_key0_inv, r_key1_inv, ak0_inv, m0_inv, d0;

always@(posedge rst) begin
    rst_counter_decrypt <= 1;
    //@(posedge clk) rst_counter_decrypt <= 0;
end

always@(posedge clk) begin
    if(start) begin
        sel_inv <= 0;
        en_decrypt <= 1;
        rst_counter_decrypt <= 0;
    end
end

always@(counter_inv, en_counter) begin
    if(en_counter) begin
        case(counter_inv)
            0: begin
                round_inv <= 4'ha;
                //en_decrypt <= 0;
            end
            1: begin
                en_decrypt <= 0;
            end
            2: begin
            end
            3: begin
            end
            16, 32, 48, 64, 80, 96, 112, 128, 144, 160: begin
                round_inv <= round_inv - 1;
            end
            17: begin
                sel_inv <= 1;
            end
            19: begin
            end
            156: begin
                decrypt_z_ready <= 1;
            end
            157: begin
                decrypt_z_ready <= 0;
            end
            179: begin
                rst_counter_decrypt <= 1;
                round_inv <= 4'ha;
                //@(posedge clk) rst_counter_decrypt <= 0;
            end
        endcase
    end
end

assign r_key0_inv = key_mem[round_inv][counter_inv%16];
assign r_key1_inv = key_mem[9-(counter_inv-1)/16][(counter_inv-1)%16];

eight_bit_counter ebc_inv(.EN(en_counter), .clk(clk), .rst(rst_counter), .Q(counter_inv));

add_key add_key0(.data(data), .key(r_key0_inv), .z(ak0_inv));

shift_reg_8 sr0_inv(.D(ak0_inv), .clk(clk), .rst(rst), .Q(k0));

mux_2to1 mux_inv(.a(k0), .b(d0), .sel(sel_inv), .out(m0_inv));

shift_reg_8 sr1_inv(.D(r_key1_inv), .clk(clk), .rst(rst), .Q(k1));
shift_reg_8 sr2_inv(.D(k1), .clk(clk), .rst(rst), .Q(k2));
shift_reg_8 sr3_inv(.D(k2), .clk(clk), .rst(rst), .Q(k3));
shift_reg_8 sr4_inv(.D(k3), .clk(clk), .rst(rst), .Q(k4));
shift_reg_8 sr5_inv(.D(k4), .clk(clk), .rst(rst), .Q(k5));
shift_reg_8 sr6_inv(.D(k5), .clk(clk), .rst(rst), .Q(k6));
shift_reg_8 sr7_inv(.D(k6), .clk(clk), .rst(rst), .Q(k7));
shift_reg_8 sr8_inv(.D(k7), .clk(clk), .rst(rst), .Q(k8));
shift_reg_8 sr9_inv(.D(k8), .clk(clk), .rst(rst), .Q(k9));
shift_reg_8 sr10_inv(.D(k9), .clk(clk), .rst(rst), .Q(k10));
shift_reg_8 sr11_inv(.D(k10), .clk(clk), .rst(rst), .Q(k11));
shift_reg_8 sr12_inv(.D(k11), .clk(clk), .rst(rst), .Q(k12));

decrypt decrypt(.input_data(m0_inv), .clk(clk), .rst(rst), .rst_counter(rst_counter_decrypt), .en(en_decrypt), .key(k12), .output_data(d0), .round_10(decrypt_z), .output_ready(ready_decrypt));

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

mux_2to1 mux_z(.a(encrypt_z), .b(decrypt_z), .sel(mode), .out(z));
//mux_2to1 mux_z_ready(.a(encrypt_z_ready), .b(decrypt_z_ready), .sel(mode), .out(z_ready));
always@(encrypt_z_ready, decrypt_z_ready, mode) begin
    case(mode)
        1'b0: z_ready <= encrypt_z_ready;
        1'b1: z_ready <= decrypt_z_ready;
        default: z_ready <= 0;
    endcase
end

endmodule
