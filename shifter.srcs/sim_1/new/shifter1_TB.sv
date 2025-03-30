`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2024 22:19:27
// Design Name: 
// Module Name: shifter1_TB
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


module shifter1_TB();

logic [7:0] in;
logic [2:0] shift;
logic [7:0] out;

shifter1 DUT(.in(in), .shift(shift), .out(out));
initial begin
    shift = 3'b000; in = 8'b00000000; #10;
    repeat (7) begin
        in = 8'b00000000; #10;
        repeat (254) begin
            in = in + 1; #10;
        end
        shift = shift + 1; #10;
    end

$finish;
end
endmodule
