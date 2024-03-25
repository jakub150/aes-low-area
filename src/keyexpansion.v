`timescale 1ns/1ps

module key_exp(clk, rst_n, en, kcnt, key, done, w_data);
input           clk;
input           rst_n;
input           en;
input   [3:0]   kcnt;       //round count
input   [127:0] key;        //cypher key
output          done;
output  [127:0] w_data;     //round key
reg             done;
reg     [31:0]  w[3:0];
reg     [7:0]   rcon;       //round constant
wire    [31:0]  tmp_w;
wire    [31:0]  subword;

// Rotate Word(w[3]) and Substitution
sub_bytes u0(    .a(tmp_w[23:16]), .mode(0), .z(subword[31:24])); //2 1
sub_bytes u1(    .a(tmp_w[15:08]), .mode(0), .z(subword[23:16])); //3 2
sub_bytes u2(    .a(tmp_w[07:00]), .mode(0), .z(subword[15:08])); //4 3
sub_bytes u3(    .a(tmp_w[31:24]), .mode(0), .z(subword[07:00])); //1 4

assign w_data = {w[0], w[1], w[2], w[3]};
assign tmp_w = w[3];

//     w0        w1        w2        w3      w...
//  127-120   095-086   063-056   031-024
//  119-122   087-080   055-048   023-015
//  111-104   079-072   047-040   015-008
//  103-096   071-064   039-031   007-000
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        w[0] <= 32'h0;
        w[1] <= 32'h0;
        w[2] <= 32'h0;
        w[3] <= 32'h0;
        done <= 1'b0;
    end
    else begin
        if(en) begin // initial round's key
            if (kcnt == 4'h0) begin 
                w[0] <= key[127:096];
                w[1] <= key[095:064];
                w[2] <= key[063:032];
                w[3] <= key[031:000];
            end
            else begin // 10 rounds' keys
                w[0] <= w[0]^subword^{rcon,{3{8'h0}}};                  // w[0] ^ w[3](after substituded) ^ Rcon
                w[1] <= w[1]^w[0]^subword^{rcon,{3{8'h0}}};             // w[1] ^ w[0'] ^ Rcon
                w[2] <= w[2]^w[1]^w[0]^subword^{rcon,{3{8'h0}}};        // w[2] ^ w[1'] ^ Rcon
                w[3] <= w[3]^w[2]^w[1]^w[0]^subword^{rcon,{3{8'h0}}};   // w[3] ^ w[2'] ^ Rcon
            end
            done <= 1'b1;
        end
        else begin
            done <= 1'b0;
        end
    end
end

// Rcon
always @(*) begin
    case (kcnt)
        /*
        4'h0: rcon <= 8'h01;
        4'h1: rcon <= 8'h02;
        4'h2: rcon <= 8'h04;
        4'h3: rcon <= 8'h08;
        4'h4: rcon <= 8'h10;
        4'h5: rcon <= 8'h20;
        4'h6: rcon <= 8'h40;
        4'h7: rcon <= 8'h80;
        4'h8: rcon <= 8'h1b;
        4'h9: rcon <= 8'h36;
        */
        //4'ha: rcon <= 8'h36;
        
        4'h0: rcon <= 8'h00;
        4'h1: rcon <= 8'h01;
        4'h2: rcon <= 8'h02;
        4'h3: rcon <= 8'h04;
        4'h4: rcon <= 8'h08;
        4'h5: rcon <= 8'h10;
        4'h6: rcon <= 8'h20;
        4'h7: rcon <= 8'h40;
        4'h8: rcon <= 8'h80;
        4'h9: rcon <= 8'h1b;
        4'ha: rcon <= 8'h36;
        
        default: rcon <= 8'h00;
    endcase
end

endmodule