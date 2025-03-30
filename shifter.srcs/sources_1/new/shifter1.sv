`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2024 22:18:51
// Design Name: 
// Module Name: shifter1
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


module muxer8(
    input [7:0] in8,
    input [2:0] sel8,
    output q8
);

assign q8 = !sel8[2]&!sel8[1]&!sel8[0]&in8[0] 
        |   !sel8[2]&!sel8[1]&sel8[0]&in8[1]
        |   !sel8[2]&sel8[1]&!sel8[0]&in8[2]
        |   !sel8[2]&sel8[1]&sel8[0]&in8[3]
        |   sel8[2]&!sel8[1]&!sel8[0]&in8[4]
        |   sel8[2]&!sel8[1]&sel8[0]&in8[5]
        |   sel8[2]&sel8[1]&!sel8[0]&in8[6]
        |   sel8[2]&sel8[1]&sel8[0]&in8[7];
        
    
endmodule

module shifter1(
    input [7:0] in,
    input [2:0] shift,
    output [7:0] out
    );
    
muxer8 MUXER8_07654321(.in8({in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[0]}), .sel8(shift[2:0]), .q8(out[0]));
muxer8 MUXER8_10765432(.in8({in[2], in[3], in[4], in[5], in[6], in[7], in[0], in[1]}), .sel8(shift[2:0]), .q8(out[1]));
muxer8 MUXER8_21076543(.in8({in[3], in[4], in[5], in[6], in[7], in[0], in[1], in[2]}), .sel8(shift[2:0]), .q8(out[2]));
muxer8 MUXER8_32107654(.in8({in[4], in[5], in[6], in[7], in[0], in[1], in[2], in[3]}), .sel8(shift[2:0]), .q8(out[3]));
muxer8 MUXER8_43210765(.in8({in[5], in[6], in[7], in[0], in[1], in[2], in[3], in[4]}), .sel8(shift[2:0]), .q8(out[4]));
muxer8 MUXER8_54321076(.in8({in[6], in[7], in[0], in[1], in[2], in[3], in[4], in[5]}), .sel8(shift[2:0]), .q8(out[5]));
muxer8 MUXER8_65432107(.in8({in[7], in[0], in[1], in[2], in[3], in[4], in[5], in[6]}), .sel8(shift[2:0]), .q8(out[6]));
muxer8 MUXER8_76543210(.in8({in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]}), .sel8(shift[2:0]), .q8(out[7]));
    
endmodule

