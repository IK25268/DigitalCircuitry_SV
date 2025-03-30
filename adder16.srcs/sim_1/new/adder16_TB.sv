`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 20:41:44
// Design Name: 
// Module Name: adder16_TB
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


module adder16_TB();
logic [15:0] a, b, s;
logic CIN, COUT;

adder16 DUT(.a(a), .b(b), .CIN(CIN), .s(s), .COUT(COUT));

initial begin
    a = 16'h0; b = 16'h0; CIN = 0; #10;
    a = 16'hffff; b = 16'hffff; CIN = 0; #10;
    a = 16'hffff; b = 16'h0; CIN = 0; #10;
    a = 16'h0; b = 16'hffff; CIN = 0; #10;
    a = 16'h0; b = 16'h0; CIN = 1; #10;
    a = 16'hffff; b = 16'hffff; CIN = 1; #10;
    a = 16'hffff; b = 16'h0; CIN = 1; #10;
    a = 16'h0; b = 16'hffff; CIN = 1; #10;


$finish;
end
endmodule
