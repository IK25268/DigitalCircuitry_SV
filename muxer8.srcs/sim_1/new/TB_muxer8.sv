`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 00:05:26
// Design Name: 
// Module Name: TB_muxer8
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


module TB_muxer8();

    logic [7:0] in;
    logic [2:0] sel;
    logic  q;
    
muxer8  DUT(.in(in), .sel(sel), .q(q));

initial begin
    
    sel = 3'b000;
        in = 8'b11111110; #10;
        in = 8'b00000001; #10;
    sel = 3'b001;
        in = 8'b11111101; #10;
        in = 8'b00000010; #10;
    sel = 3'b010;
        in = 8'b11111011; #10;
        in = 8'b00000100; #10;
    sel = 3'b011;
        in = 8'b11110111; #10;
        in = 8'b00001000; #10;
    sel = 3'b100;
        in = 8'b11101111; #10;
        in = 8'b00010000; #10;
    sel = 3'b101;
        in = 8'b11011111; #10;
        in = 8'b00100000; #10;
    sel = 3'b110;
        in = 8'b10111111; #10;
        in = 8'b01000000; #10;
    sel = 3'b111;
        in = 8'b01111111; #10;
        in = 8'b10000000; #10;
        
$finish;
end    

endmodule
