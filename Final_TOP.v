/*

Description : This is the Top Module of the whole processor's desifgn , that includes :
.Data Path
.Control Unit
.Instruction_Memory 
.Data_Memory

Author: Muhammad Aboseada

*/

module 	Final_TOP (

//Input Ports

input    wire              clk,rst,

//Output Ports

output   wire   [15:0]     test_value

);

//Internal Signals

wire   [31:0]    PC,ALUResult,WD,RD,Instr;
wire             MemWrite;

//Instantiation of the Control Unit and Data Path that are combined in the MIPS_TOP module

MIPS_Top UMips_Top (

.Instr(Instr),
.clk(clk),
.rst(rst),
.RD(RD),
.PC(PC),
.MemWrite(MemWrite),
.ALUResult(ALUResult),
.WD(WD)

);

//Instantiation of the Data_Memory

Data_Memory UDataMem (

.A(ALUResult),
.WD(WD),
.clk(clk),
.rst(rst),
.WE(MemWrite),
.RD(RD),
.test_value(test_value)

);

//Instantiation of the Instruction_Memory

Instruction_Memory UInistM (

.PC(PC),
.Instr(Instr)

);

endmodule