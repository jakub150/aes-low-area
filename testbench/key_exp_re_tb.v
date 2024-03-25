`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 17:02:46
// Design Name: 
// Module Name: key_exp_re_tb
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


module key_exp_re_tb(

    );
    reg clk=0;
    reg en, rst;
    reg [3:0]round;
    wire [7:0] z;
    //wire [7:0] z0, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15;
    
    key_exp_re uut(
        .clk(clk),
        .rst(rst),
        .en(en),
        .kcnt(round),
        .key(128'h4c4dc7ade059c96162408c4a2744c09b),
        .ready(),
        .z(z)
        //.z0(z0), .z1(z1), .z2(z2), .z3(z3), .z4(z4), .z5(z5), .z6(z6), .z7(z7), .z8(z8), .z9(z9), .z10(z10), .z11(z11), .z12(z12), .z13(z13), .z14(z14), .z15(z15)
        );

initial begin
    @(posedge clk) rst <= 0;
    @(posedge clk) rst <= 1;
    @(posedge clk) round <= 4'h0;
    en <= 1;
    @(posedge clk) en <= 0;
    #200;
    //@(posedge clk) en <= 1;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    //@(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;  en <= 1;
    @(posedge clk) en <= 0;
    #200;
    @(posedge clk) round <= round + 1;
    
end

always #5 clk=!clk;

/*
always @(*) begin
    #10;
    @(posedge clk) round <= round + 1;
end
*/

always @(*) begin
    #5;
    if(round > 10) $finish;
    #15;
end
endmodule
