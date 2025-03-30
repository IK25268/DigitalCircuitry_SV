`timescale 1ns / 1ps
module CPUFactorial_TB();
logic clk, reset;

CPUFactorial DUT(.clk(clk), .reset(reset));

always begin
    clk = 1'b0; #5;
    clk = 1'b1; #5;
end

initial begin
    reset = 1; #10;
    reset = 0; #2000;
$finish;
end;
endmodule
