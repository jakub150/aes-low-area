`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 00:55:07
// Design Name: 
// Module Name: decrypt
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


module decrypt(
    input [7:0] input_data,
    input clk,
    input rst,
    input rst_counter,
    input en,
    input [7:0] key,
    output [7:0] output_data,
    output [7:0] round_10,
    output output_ready
    );

reg start, en_pts, en_mc;
wire [3:0] counter;
wire [7:0] temp0, temp1, d0_out, d1_out, d2_out, d3_out;

always@(posedge rst) begin
    start <= 0;
end

always@(posedge clk) begin
    if(en) begin
        start <= 1;
        en_pts <= 1;
        en_mc <= 0;
    end
end

always@(counter, start) begin
    if(start) begin
        case(counter)
        
        0: begin
            en_pts <= 0;
            en_mc <= 0;
        end
        
        1: begin
            en_mc <= 1;
        end
        4: begin
            en_mc <= 0;
        end
        5: begin
            en_mc <= 1;
        end
        8: begin
            en_mc <= 0;
        end
        9: begin
            en_mc <= 1;
        end
        12: begin
            en_mc <= 0;
        end
        13: begin
            en_mc <= 1;
        end
        15: begin
            en_pts <= 1;
        end
        /*
        15: begin
            reset <= 0;
        end
        
        16: begin
            en_mc <= 0;
            en_pts <= 0;
        end
        17: begin
            en_mc <= 1;
        end
        20: begin
            en_mc <= 0;
        end
        21: begin
            en_mc <= 1;
        end
        24: begin
            en_mc <= 0;
        end
        25: begin
            en_mc <= 1;
        end
        28: begin
            en_mc <= 0;
        end
        32: start <= 0;
        */
        endcase
    end
end

assign output_ready = (counter==15)?1:0;

four_bit_counter fbc(.EN(start), .rst(rst), .clk(clk), .Q(counter));

byte_permutation_re bp(.data_in(input_data), .clk(clk), .rst(rst), .rst_counter(rst_counter), .en(en), .mode(1), .data_out(temp0));

//bSbox sbox(.A(temp0), .encrypt(1), .Q(output_data));
sub_bytes sbox(.a(temp0), .mode(1), .z(temp1));

add_key ak(.data(temp1), .key(key), .z(round_10));

mix_col mc(.d_in(round_10), .en(en_mc), .clk(clk), .rst(rst), .mode(1), .d0_out(d0_out), .d1_out(d1_out), .d2_out(d2_out), .d3_out(d3_out));

pts_converter pts(.data_in(0), .d0(d0_out), .d1(d1_out), .d2(d2_out), .d3(d3_out), .clk(clk), .rst(rst), .en(en_pts), .data_out(output_data));

endmodule
