`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 20:41:05
// Design Name: 
// Module Name: adder16
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
module adder4(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );
    
logic [4:0] c;
logic [3:0] p, g;

assign c[0] = cin;
    
genvar i;
generate
    for (i = 0; i < 4; i += 1)
        begin: label
            assign s[i] = (a[i] ^ b[i]) ^ c[i];
            assign g[i] = a[i] & b[i];
            assign p[i] = a[i] ^ b[i];
        
        end
endgenerate
assign cout = c[4];
assign c[1] = g[0]
            |p[0] & c[0];
assign c[2] = g[1]
            |p[1] & g[0]
            |p[1] & p[0] & c[0];     
assign c[3] = g[2]
            |p[2] & g[1]
            |p[2] & p[1] & g[0] 
            |p[2] & p[1] & p[0] & c[0];  
assign c[4] = g[3]
            |p[3] & g[2]
            |p[3] & p[2] & g[1] 
            |p[3] & p[2] & p[1] & g[0]
            |p[3] & p[2] & p[1] & p[0] & c[0];  
endmodule

module adder16(
    input [15:0] a,
    input [15:0] b,
    input CIN,
    output [15:0] s,
    output COUT
    );
logic [4:0] cBuf;

assign cBuf[0] = CIN;
genvar i;
generate 
    for(i = 0; i < 4; i += 1)
    begin: label
        adder4 ADDER(.a(a[(i+1)*4-1:i*4]), .b(b[(i+1)*4-1:i*4]), .cin(cBuf[i]), .s(s[(i+1)*4-1:i*4]), .cout(cBuf[i+1]));
    end
endgenerate    
//adder4 ADDER_03(.a(a[3:0]), .b(b[3:0]), .cin(cBuf[0]), .s(s[3:0]), .cout(cBuf[1]));
//adder4 ADDER_74(.a(a[7:4]), .b(b[7:4]), .cin(cBuf[1]), .s(s[7:4]), .cout(cBuf[2]));
//adder4 ADDER_118(.a(a[11:8]), .b(b[11:8]), .cin(cBuf[2]), .s(s[11:8]), .cout(cBuf[3]));
//adder4 ADDER_1512(.a(a[15:12]), .b(b[15:12]), .cin(cBuf[3]), .s(s[15:12]), .cout(cBuf[4]));
assign COUT = cBuf[4];
endmodule
