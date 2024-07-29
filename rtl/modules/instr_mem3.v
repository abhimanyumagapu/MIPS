`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 04:23:56 PM
// Design Name: 
// Module Name: instr_mem3
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


module instr_mem3(instr_code, reset, pc);
input reset;
input [31:0] pc;
output [31:0] instr_code;

reg [7:0] mem [63:0]; // memory 
integer i;
assign instr_code = {mem[pc], mem[pc+1], mem[pc+2], mem[pc+3]};
always @(reset) begin

    if(!reset) begin
        mem[0] = 8'h00; mem[1] = 8'h00; mem[2] = 8'h00; mem[3] = 8'h00;
        mem[4] = 8'h25; mem[5] = 8'h43; mem[6] = 8'h17; mem[7] = 8'h89;
        mem[8] = 8'h01; mem[9] = 8'h02; mem[10] = 8'h03; mem[11] = 8'h04;
        for (i = 12; i<64;i=i+1) begin
            mem[i] = i;
            end

    end
    else begin
        mem[0] = 8'h00; mem[1] = 8'h00; mem[2] = 8'h00; mem[3] = 8'h00; 
        mem[4] = 8'h8c; mem[5] = 8'h2b; mem[6] = 8'h00; mem[7] = 8'h0c;     // lw r11, 12[r1]
        mem[8] = 8'h68; mem[9] = 8'h2b; mem[10] = 8'h10; mem[11] = 8'h37;   // mul r2, r1, r11
        mem[12] = 8'h3c; mem[13] = 8'h48; mem[14] = 8'h00; mem[15] = 8'h08; // lui r8, r2, 8
        mem[16] = 8'h20; mem[17] = 8'h80; mem[18] = 8'h00; mem[19] = 8'h08; // jr r4
        mem[20] = 8'h69; mem[21] = 8'h01; mem[22] = 8'h48; mem[23] = 8'h37; // mul r9, r8, r1
        mem[24] = 8'h68; mem[25] = 8'hc6; mem[26] = 8'h30; mem[27] = 8'h37; // mul r6, r6, r6
        mem[28] = 8'h3e; mem[29] = 8'h5f; mem[30] = 8'h00; mem[31] = 8'h59; // lui r21, r23, 89
        mem[32] = 8'h38; mem[33] = 8'hef; mem[34] = 8'h00; mem[35] = 8'h43; // ori r7, r15, 67 
        mem[36] = 8'hac; mem[37] = 8'ha4; mem[38] = 8'h00; mem[39] = 8'h04; // sw r4, 4[r5]
        mem[40] = 8'h69; mem[41] = 8'h01; mem[42] = 8'h48; mem[43] = 8'h37; // mul r9, r8, r1
    end        
end
endmodule
