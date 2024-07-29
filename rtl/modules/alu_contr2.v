`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 08:17:43 PM
// Design Name: 
// Module Name: alu_contr2
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


module alu_control2(alucontrol, aluop, instruction);

input [1:0] aluop;
output reg [3:0] alucontrol;
input [5:0] instruction;

always @(*)
    case(aluop)
        2'b01: alucontrol = 4'b0010; //lw,sw
        2'b00: begin
                    if(instruction == 6'b001000) alucontrol = 4'b0111; 
                    else if (instruction == 6'b110111) alucontrol = 4'b0110; //jr, mul
               end
        2'b11: alucontrol = 4'b0000;//lui
        2'b10: alucontrol = 4'b0011;//ori
        
        default : alucontrol = 4'b0;
        endcase
endmodule