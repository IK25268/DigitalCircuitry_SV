`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2024 08:23:51
// Design Name: 
// Module Name: board2
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

module board2(
    input TIMER,
    input BUTTON,
    output A0[7:0],
    output A1[7:0],
    output A2[7:0],
    output A3[7:0]
    );
    
logic [3:0] bufer0;
logic [3:0] bufer1;
logic [3:0] bufer2;
logic [3:0] bufer3;
logic [7:0] digit0;
logic [7:0] digit1;
logic [7:0] digit2;
logic [7:0] digit3;
     
logic [23:0] timer_bufer;

genvar i;
generate
    for (i=0; i < 8; i = i + 1)
        begin: label
                assign A0[i] = digit0[i];
                assign A1[i] = digit1[i];
                assign A2[i] = digit2[i];
                assign A3[i] = digit3[i];
        end
        
endgenerate

always @(posedge BUTTON or posedge TIMER)
    if (BUTTON)
        timer_bufer <= 24'b0;
    else if (timer_bufer == 24'hb71b00)
        timer_bufer <= 24'h0;
    else             
        timer_bufer = timer_bufer + 1;

always @(posedge BUTTON or posedge TIMER)
    if (BUTTON)
        bufer0 <= 4'b0000;
    else if (timer_bufer == 24'hb71b00)
        bufer0 <= bufer0 + 1;
    else if (bufer0 == 4'b1010)
        bufer0 <= 4'b0000;
    else 
        bufer0 <= bufer0;

always @(posedge BUTTON or posedge TIMER)
    if (BUTTON)
        bufer1 <= 4'b0000;
    else if (bufer1 == 4'b1010)
        bufer1 <= 4'b0000;
    else if (bufer0 == 4'b1010)
        bufer1 <= bufer1 + 1;
    else 
        bufer1 <= bufer1;

always @(posedge BUTTON or posedge TIMER)
    if (BUTTON)
        bufer2 <= 4'b0000;
    else if (bufer2 == 4'b1010)
        bufer2 <= 4'b0000;
    else if (bufer1 == 4'b1010)
        bufer2 <= bufer2 + 1;
    else 
        bufer2 <= bufer2;

always @(posedge BUTTON or posedge TIMER)
    if (BUTTON)
        bufer3 <= 4'b0000;
    else if (bufer3 == 4'b1010)
        bufer3 <= 4'b0000;
    else if (bufer2 == 4'b1010)
        bufer3 <= bufer3 + 1;
    else 
        bufer3 <= bufer3;
          
always @(posedge TIMER)
    casex (bufer0)
        4'b0000: digit0 <= 8'b00111111;
        4'b0001: digit0 <= 8'b00000110;
        4'b0010: digit0 <= 8'b01011011;
        4'b0011: digit0 <= 8'b01001111;
        4'b0100: digit0 <= 8'b01100110;
        4'b0101: digit0 <= 8'b01101101;
        4'b0110: digit0 <= 8'b01111101;
        4'b0111: digit0 <= 8'b00000111;
        4'b1000: digit0 <= 8'b01111111;
        4'b1001: digit0 <= 8'b01101111;
    endcase
always @(posedge TIMER)
    casex (bufer1)
        4'b0000: digit1 <= 8'b00111111;
        4'b0001: digit1 <= 8'b00000110;
        4'b0010: digit1 <= 8'b01011011;
        4'b0011: digit1 <= 8'b01001111;
        4'b0100: digit1 <= 8'b01100110;
        4'b0101: digit1 <= 8'b01101101;
        4'b0110: digit1 <= 8'b01111101;
        4'b0111: digit1 <= 8'b00000111;
        4'b1000: digit1 <= 8'b01111111;
        4'b1001: digit1 <= 8'b01101111;
    endcase
always @(posedge TIMER)
    casex (bufer2)
        4'b0000: digit2 <= 8'b00111111;
        4'b0001: digit2 <= 8'b00000110;
        4'b0010: digit2 <= 8'b01011011;
        4'b0011: digit2 <= 8'b01001111;
        4'b0100: digit2 <= 8'b01100110;
        4'b0101: digit2 <= 8'b01101101;
        4'b0110: digit2 <= 8'b01111101;
        4'b0111: digit2 <= 8'b00000111;
        4'b1000: digit2 <= 8'b01111111;
        4'b1001: digit2 <= 8'b01101111;
    endcase
always @(posedge TIMER)
    casex (bufer3)
        4'b0000: digit3 <= 8'b00111111;
        4'b0001: digit3 <= 8'b00000110;
        4'b0010: digit3 <= 8'b01011011;
        4'b0011: digit3 <= 8'b01001111;
        4'b0100: digit3 <= 8'b01100110;
        4'b0101: digit3 <= 8'b01101101;
        4'b0110: digit3 <= 8'b01111101;
        4'b0111: digit3 <= 8'b00000111;
        4'b1000: digit3 <= 8'b01111111;
        4'b1001: digit3 <= 8'b01101111;
    endcase
    
    



endmodule
