
/*
Description: The Instruction_Memory reads out the Instruction found at address PC

Author: Muhammad Aboseada

*/

module Instruction_Memory
#(parameter Imem_width=32 , parameter Imem_depth=100)

(

//Input Ports
input    wire    [31:0]   PC,

//Output Ports
output   reg     [31:0]   Instr   

);

//Internal Variables
reg [Imem_width-1:0] Instr_Mem [Imem_depth-1:0];

always @(*)

begin

Instr=Instr_Mem[PC>>2];

end

//Loading the Instruction Memory with a test file that contains some instructions.

initial 

begin

$readmemh("Program 3_Machine Code.txt",Instr_Mem);

end

endmodule