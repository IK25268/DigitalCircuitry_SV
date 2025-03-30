`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 23:10:00
// Design Name: 
// Module Name: D_flipflop_TB
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


module D_flipflop_TB();

logic [3:0] d, clk;
D_flipflop DUT(.clk(clk), .d(d), .q(q));

always begin
    clk = 0; #5;
    clk = 1; #5;
end
initial begin
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
$finish;
end
endmodule

module shiftreg_TB();

logic [7:0] d, q;
logic load, sin, clk;
shiftreg DUT(.clk(clk), .d(d), .q(q), .sin(sin), .load(load));

always begin
    clk = 0; #5;
    clk = 1; #5;
end

initial begin
    d = 8'haa; load = 1; #10;
    sin = 0; load = 0; #10;
    sin = 1; load = 0; #10;
    sin = 0; load = 0; #10;
    sin = 1; load = 0; #10;
    sin = 0; load = 0; #10;
    sin = 1; load = 0; #10;
    sin = 0; load = 0; #10;
    sin = 1; load = 0; #10;
$finish;
end
endmodule

module counter_TB();

logic [3:0] q;
logic clk, ud;
counter DUT(.clk(clk), .ud(ud), .q(q));

always begin
    clk = 0; #5;
    clk = 1; #5;
end

initial begin
    ud = 1; #200;
    ud = 0; #200;
$finish;
end
endmodule
