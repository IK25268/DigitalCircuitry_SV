`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 23:09:26
// Design Name: 
// Module Name: D_flipflop
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


module D_flipflop(
    input clk,
    input d,
    output logic q
    );
    
    always_ff @(posedge clk)
    q <= d;
    
endmodule

module shiftreg(
    input clk,
    input sin,
    input [7:0] d,
    input load,
    output logic [7:0] q
    );
    
always_ff @(posedge clk)
    if (load)
        q <= d;
    else
        q <= {q[6:0], sin};
        
endmodule

module counter (
    input clk,
    input [3:0] d,
    input ud,
    output logic [3:0] q = 4'b0000
);

always_ff @(posedge clk) begin
    q[0] <= !q[0];
    
    q[1] <= 
    (
    (!(q[1]^q[0]))&(!ud))
    |
    ((q[1]^q[0])&ud
    ); 
    
    q[2] <= 
    (
    (!(q[2]^(q[1]|q[0])))&(!ud)
    )
    |
    (
    ((q[2]^(q[1]&q[0])))&ud
    ); 
    
    q[3] <= 
    (
    (!(q[3]^(q[2]|q[1]|q[0])))&(!ud)
    )
    |
    (
    ((q[3]^(q[2]&q[1]&q[0])))&ud
    ); 
end

endmodule