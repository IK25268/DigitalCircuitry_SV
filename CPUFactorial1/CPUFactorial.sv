`timescale 1ns / 1ps
module CPUFactorial(
    input clk,
    input reset
    );
    
//Registers
logic [7:0] RAMBufer, ALUAcc;
logic [4:0] RAMPtr, instrNumber;
logic [2:0] instrType;

//Random-access memory
logic [7:0] RAM [31:0];
initial $readmemb("memory.mem", RAM, 0, 31);

always @(posedge clk)
    if (state == store)
        RAM[RAMPtr] <= ALUAcc;
        
always @(posedge clk)
    if (state == inputRAM)
        RAMBufer <= RAM[instrNumber];
    else
        RAMBufer <= RAM[RAMPtr];

//Control unit
enum logic [2:0]
{
ld = 3'b000;
st = 3'b001;
sb = 3'b010;
ic = 3'b011;
mp = 3'b100;
br = 3'b101;
ht = 3'b110;
} instr;

enum logic [4:0]
{
inputRAM = 5'b00000,
splitRAM = 5'b00001,
decodeInstr = 5'b00010,
load = 5'b00011,
store = 5'b00100,
substract = 5'b00101,
increment = 5'b00110,
multiply = 5'b00111,
branch = 5'b01000,
halt = 5'b01001
} state;

always @(posedge clk or posedge reset)
    if (reset)
        state <= inputRAM;
    else
    case (state)
        inputRAM: state <= splitRAM;
        splitRAM: state <= decodeInstr;
        decodeInstr : 
            case (instrType)
            ld: state <= load;
            st: state <= store;
            sb: state <= substract; 
            ic: state <= increment;
            mp: state <= multiply;
            br: state <= branch;
            ht: state <= halt;
            endcase
        load: state <= inputRAM;
        store: state <= inputRAM;         
        substract: state <= inputRAM;         
        increment: state <= inputRAM;    
        multiply: state <= inputRAM;       
        branch: state <= inputRAM;         
        halt: state <= halt;     
    endcase

//Arithmetic-logic unit
always @(posedge clk or posedge reset)
    if (reset)
        ALUAcc <= 8'b00000000;
    else
    case (state)
        load: ALUAcc <= RAMBufer;
        substract: ALUAcc <= ALUAcc - RAMBufer;
        increment: ALUAcc <= ALUAcc + 1;
        multiply: ALUAcc <= ALUAcc * RAMBufer;
    endcase

//RAM pointer register
always @(posedge clk or posedge reset)
    if (reset)
        RAMPtr <= 5'b00000;
    else if (state == splitRAM)
        RAMPtr <= RAMBufer[4:0];

//Instruction type register
always @(posedge clk or posedge reset)
    if (reset)
        instrType <= 3'b000;
    else if (state == splitRAM)
        instrType <= RAMBufer[7:5];

//Instruction number register
always @(posedge clk or posedge reset)
    if (reset)
        instrNumber <= 5'b00000;
    else
    case (state)
        load: instrNumber <= instrNumber + 1;
        substract: instrNumber <= instrNumber + 1;
        increment: instrNumber <= instrNumber + 1;
        multiply: instrNumber <= instrNumber + 1;
        store: instrNumber <= instrNumber + 1;
        branch: 
        if (ALUAcc == 0)
            instrNumber <= instrNumber + 1;
        else
            instrNumber <= RAMPtr;
    endcase

endmodule