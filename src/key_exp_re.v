`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 16:53:19
// Design Name: 
// Module Name: key_exp_re
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

module shift_reg_128(
    input [127:0] D,
    input clk,
    input rst,
    output [127:0] Q
    );
    
d_flip_flop dff0(.d(D[0]), .clk(clk), .rst(rst), .q(Q[0]));
d_flip_flop dff1(.d(D[1]), .clk(clk), .rst(rst), .q(Q[1]));
d_flip_flop dff2(.d(D[2]), .clk(clk), .rst(rst), .q(Q[2]));
d_flip_flop dff3(.d(D[3]), .clk(clk), .rst(rst), .q(Q[3]));
d_flip_flop dff4(.d(D[4]), .clk(clk), .rst(rst), .q(Q[4]));
d_flip_flop dff5(.d(D[5]), .clk(clk), .rst(rst), .q(Q[5]));
d_flip_flop dff6(.d(D[6]), .clk(clk), .rst(rst), .q(Q[6]));
d_flip_flop dff7(.d(D[7]), .clk(clk), .rst(rst), .q(Q[7]));
d_flip_flop dff8(.d(D[8]), .clk(clk), .rst(rst), .q(Q[8]));
d_flip_flop dff9(.d(D[9]), .clk(clk), .rst(rst), .q(Q[9]));

d_flip_flop dff10(.d(D[10]), .clk(clk), .rst(rst), .q(Q[10]));
d_flip_flop dff11(.d(D[11]), .clk(clk), .rst(rst), .q(Q[11]));
d_flip_flop dff12(.d(D[12]), .clk(clk), .rst(rst), .q(Q[12]));
d_flip_flop dff13(.d(D[13]), .clk(clk), .rst(rst), .q(Q[13]));
d_flip_flop dff14(.d(D[14]), .clk(clk), .rst(rst), .q(Q[14]));
d_flip_flop dff15(.d(D[15]), .clk(clk), .rst(rst), .q(Q[15]));
d_flip_flop dff16(.d(D[16]), .clk(clk), .rst(rst), .q(Q[16]));
d_flip_flop dff17(.d(D[17]), .clk(clk), .rst(rst), .q(Q[17]));
d_flip_flop dff18(.d(D[18]), .clk(clk), .rst(rst), .q(Q[18]));
d_flip_flop dff19(.d(D[19]), .clk(clk), .rst(rst), .q(Q[19]));

d_flip_flop dff20(.d(D[20]), .clk(clk), .rst(rst), .q(Q[20]));
d_flip_flop dff21(.d(D[21]), .clk(clk), .rst(rst), .q(Q[21]));
d_flip_flop dff22(.d(D[22]), .clk(clk), .rst(rst), .q(Q[22]));
d_flip_flop dff23(.d(D[23]), .clk(clk), .rst(rst), .q(Q[23]));
d_flip_flop dff24(.d(D[24]), .clk(clk), .rst(rst), .q(Q[24]));
d_flip_flop dff25(.d(D[25]), .clk(clk), .rst(rst), .q(Q[25]));
d_flip_flop dff26(.d(D[26]), .clk(clk), .rst(rst), .q(Q[26]));
d_flip_flop dff27(.d(D[27]), .clk(clk), .rst(rst), .q(Q[27]));
d_flip_flop dff28(.d(D[28]), .clk(clk), .rst(rst), .q(Q[28]));
d_flip_flop dff29(.d(D[29]), .clk(clk), .rst(rst), .q(Q[29]));

d_flip_flop dff30(.d(D[30]), .clk(clk), .rst(rst), .q(Q[30]));
d_flip_flop dff31(.d(D[31]), .clk(clk), .rst(rst), .q(Q[31]));
d_flip_flop dff32(.d(D[32]), .clk(clk), .rst(rst), .q(Q[32]));
d_flip_flop dff33(.d(D[33]), .clk(clk), .rst(rst), .q(Q[33]));
d_flip_flop dff34(.d(D[34]), .clk(clk), .rst(rst), .q(Q[34]));
d_flip_flop dff35(.d(D[35]), .clk(clk), .rst(rst), .q(Q[35]));
d_flip_flop dff36(.d(D[36]), .clk(clk), .rst(rst), .q(Q[36]));
d_flip_flop dff37(.d(D[37]), .clk(clk), .rst(rst), .q(Q[37]));
d_flip_flop dff38(.d(D[38]), .clk(clk), .rst(rst), .q(Q[38]));
d_flip_flop dff39(.d(D[39]), .clk(clk), .rst(rst), .q(Q[39]));

d_flip_flop dff40(.d(D[40]), .clk(clk), .rst(rst), .q(Q[40]));
d_flip_flop dff41(.d(D[41]), .clk(clk), .rst(rst), .q(Q[41]));
d_flip_flop dff42(.d(D[42]), .clk(clk), .rst(rst), .q(Q[42]));
d_flip_flop dff43(.d(D[43]), .clk(clk), .rst(rst), .q(Q[43]));
d_flip_flop dff44(.d(D[44]), .clk(clk), .rst(rst), .q(Q[44]));
d_flip_flop dff45(.d(D[45]), .clk(clk), .rst(rst), .q(Q[45]));
d_flip_flop dff46(.d(D[46]), .clk(clk), .rst(rst), .q(Q[46]));
d_flip_flop dff47(.d(D[47]), .clk(clk), .rst(rst), .q(Q[47]));
d_flip_flop dff48(.d(D[48]), .clk(clk), .rst(rst), .q(Q[48]));
d_flip_flop dff49(.d(D[49]), .clk(clk), .rst(rst), .q(Q[49]));

d_flip_flop dff50(.d(D[50]), .clk(clk), .rst(rst), .q(Q[50]));
d_flip_flop dff51(.d(D[51]), .clk(clk), .rst(rst), .q(Q[51]));
d_flip_flop dff52(.d(D[52]), .clk(clk), .rst(rst), .q(Q[52]));
d_flip_flop dff53(.d(D[53]), .clk(clk), .rst(rst), .q(Q[53]));
d_flip_flop dff54(.d(D[54]), .clk(clk), .rst(rst), .q(Q[54]));
d_flip_flop dff55(.d(D[55]), .clk(clk), .rst(rst), .q(Q[55]));
d_flip_flop dff56(.d(D[56]), .clk(clk), .rst(rst), .q(Q[56]));
d_flip_flop dff57(.d(D[57]), .clk(clk), .rst(rst), .q(Q[57]));
d_flip_flop dff58(.d(D[58]), .clk(clk), .rst(rst), .q(Q[58]));
d_flip_flop dff59(.d(D[59]), .clk(clk), .rst(rst), .q(Q[59]));

d_flip_flop dff60(.d(D[60]), .clk(clk), .rst(rst), .q(Q[60]));
d_flip_flop dff61(.d(D[61]), .clk(clk), .rst(rst), .q(Q[61]));
d_flip_flop dff62(.d(D[62]), .clk(clk), .rst(rst), .q(Q[62]));
d_flip_flop dff63(.d(D[63]), .clk(clk), .rst(rst), .q(Q[63]));
d_flip_flop dff64(.d(D[64]), .clk(clk), .rst(rst), .q(Q[64]));
d_flip_flop dff65(.d(D[65]), .clk(clk), .rst(rst), .q(Q[65]));
d_flip_flop dff66(.d(D[66]), .clk(clk), .rst(rst), .q(Q[66]));
d_flip_flop dff67(.d(D[67]), .clk(clk), .rst(rst), .q(Q[67]));
d_flip_flop dff68(.d(D[68]), .clk(clk), .rst(rst), .q(Q[68]));
d_flip_flop dff69(.d(D[69]), .clk(clk), .rst(rst), .q(Q[69]));

d_flip_flop dff70(.d(D[70]), .clk(clk), .rst(rst), .q(Q[70]));
d_flip_flop dff71(.d(D[71]), .clk(clk), .rst(rst), .q(Q[71]));
d_flip_flop dff72(.d(D[72]), .clk(clk), .rst(rst), .q(Q[72]));
d_flip_flop dff73(.d(D[73]), .clk(clk), .rst(rst), .q(Q[73]));
d_flip_flop dff74(.d(D[74]), .clk(clk), .rst(rst), .q(Q[74]));
d_flip_flop dff75(.d(D[75]), .clk(clk), .rst(rst), .q(Q[75]));
d_flip_flop dff76(.d(D[76]), .clk(clk), .rst(rst), .q(Q[76]));
d_flip_flop dff77(.d(D[77]), .clk(clk), .rst(rst), .q(Q[77]));
d_flip_flop dff78(.d(D[78]), .clk(clk), .rst(rst), .q(Q[78]));
d_flip_flop dff79(.d(D[79]), .clk(clk), .rst(rst), .q(Q[79]));

d_flip_flop dff80(.d(D[80]), .clk(clk), .rst(rst), .q(Q[80]));
d_flip_flop dff81(.d(D[81]), .clk(clk), .rst(rst), .q(Q[81]));
d_flip_flop dff82(.d(D[82]), .clk(clk), .rst(rst), .q(Q[82]));
d_flip_flop dff83(.d(D[83]), .clk(clk), .rst(rst), .q(Q[83]));
d_flip_flop dff84(.d(D[84]), .clk(clk), .rst(rst), .q(Q[84]));
d_flip_flop dff85(.d(D[85]), .clk(clk), .rst(rst), .q(Q[85]));
d_flip_flop dff86(.d(D[86]), .clk(clk), .rst(rst), .q(Q[86]));
d_flip_flop dff87(.d(D[87]), .clk(clk), .rst(rst), .q(Q[87]));
d_flip_flop dff88(.d(D[88]), .clk(clk), .rst(rst), .q(Q[88]));
d_flip_flop dff89(.d(D[89]), .clk(clk), .rst(rst), .q(Q[89]));

d_flip_flop dff90(.d(D[90]), .clk(clk), .rst(rst), .q(Q[90]));
d_flip_flop dff91(.d(D[91]), .clk(clk), .rst(rst), .q(Q[91]));
d_flip_flop dff92(.d(D[92]), .clk(clk), .rst(rst), .q(Q[92]));
d_flip_flop dff93(.d(D[93]), .clk(clk), .rst(rst), .q(Q[93]));
d_flip_flop dff94(.d(D[94]), .clk(clk), .rst(rst), .q(Q[94]));
d_flip_flop dff95(.d(D[95]), .clk(clk), .rst(rst), .q(Q[95]));
d_flip_flop dff96(.d(D[96]), .clk(clk), .rst(rst), .q(Q[96]));
d_flip_flop dff97(.d(D[97]), .clk(clk), .rst(rst), .q(Q[97]));
d_flip_flop dff98(.d(D[98]), .clk(clk), .rst(rst), .q(Q[98]));
d_flip_flop dff99(.d(D[99]), .clk(clk), .rst(rst), .q(Q[99]));

d_flip_flop dff100(.d(D[100]), .clk(clk), .rst(rst), .q(Q[100]));
d_flip_flop dff101(.d(D[101]), .clk(clk), .rst(rst), .q(Q[101]));
d_flip_flop dff102(.d(D[102]), .clk(clk), .rst(rst), .q(Q[102]));
d_flip_flop dff103(.d(D[103]), .clk(clk), .rst(rst), .q(Q[103]));
d_flip_flop dff104(.d(D[104]), .clk(clk), .rst(rst), .q(Q[104]));
d_flip_flop dff105(.d(D[105]), .clk(clk), .rst(rst), .q(Q[105]));
d_flip_flop dff106(.d(D[106]), .clk(clk), .rst(rst), .q(Q[106]));
d_flip_flop dff107(.d(D[107]), .clk(clk), .rst(rst), .q(Q[107]));
d_flip_flop dff108(.d(D[108]), .clk(clk), .rst(rst), .q(Q[108]));
d_flip_flop dff109(.d(D[109]), .clk(clk), .rst(rst), .q(Q[109]));

d_flip_flop dff110(.d(D[110]), .clk(clk), .rst(rst), .q(Q[110]));
d_flip_flop dff111(.d(D[111]), .clk(clk), .rst(rst), .q(Q[111]));
d_flip_flop dff112(.d(D[112]), .clk(clk), .rst(rst), .q(Q[112]));
d_flip_flop dff113(.d(D[113]), .clk(clk), .rst(rst), .q(Q[113]));
d_flip_flop dff114(.d(D[114]), .clk(clk), .rst(rst), .q(Q[114]));
d_flip_flop dff115(.d(D[115]), .clk(clk), .rst(rst), .q(Q[115]));
d_flip_flop dff116(.d(D[116]), .clk(clk), .rst(rst), .q(Q[116]));
d_flip_flop dff117(.d(D[117]), .clk(clk), .rst(rst), .q(Q[117]));
d_flip_flop dff118(.d(D[118]), .clk(clk), .rst(rst), .q(Q[118]));
d_flip_flop dff119(.d(D[119]), .clk(clk), .rst(rst), .q(Q[119]));

d_flip_flop dff120(.d(D[120]), .clk(clk), .rst(rst), .q(Q[120]));
d_flip_flop dff121(.d(D[121]), .clk(clk), .rst(rst), .q(Q[121]));
d_flip_flop dff122(.d(D[122]), .clk(clk), .rst(rst), .q(Q[122]));
d_flip_flop dff123(.d(D[123]), .clk(clk), .rst(rst), .q(Q[123]));
d_flip_flop dff124(.d(D[124]), .clk(clk), .rst(rst), .q(Q[124]));
d_flip_flop dff125(.d(D[125]), .clk(clk), .rst(rst), .q(Q[125]));
d_flip_flop dff126(.d(D[126]), .clk(clk), .rst(rst), .q(Q[126]));
d_flip_flop dff127(.d(D[127]), .clk(clk), .rst(rst), .q(Q[127]));

endmodule

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

module key_exp_re(
    input clk,
    input rst,
    input [127:0] key,
    input en,
    input [3:0] kcnt,
    output [7:0] z,
    output ready
    );

wire [127:0] temp, temp128;
wire pts_ready, reg_rst;
wire [7:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;

assign reg_rst = !rst;

key_exp key_exp(.clk(clk), .rst_n(rst), .en(en), .key(key), .kcnt(kcnt), .w_data(temp), .done(pts_ready));

shift_reg_128 shift_reg_128(.D(temp), .clk(clk), .rst(reg_rst), .Q(temp128));

key_128_to_8 key_128_to_8(temp128, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);

pts_key pts_key(.a0(a0), .a1(a1), .a2(a2), .a3(a3), .a4(a4), .a5(a5), .a6(a6), .a7(a7), .a8(a8), .a9(a9), .a10(a10), .a11(a11), .a12(a12), .a13(a13), .a14(a14), .a15(a15),
                .clk(clk),.rst(reg_rst), .start(pts_ready), .z(z), .ready(ready));

endmodule
