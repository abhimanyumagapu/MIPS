`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 04:22:18 PM
// Design Name: 
// Module Name: instr_fetch3
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




module instr_fetch3(
    output [31:0] instruction_code,
    output [31:0] pipl_pc,
    input [31:0] pc_pip,
    input pc_sel,
    input clock,
    input reset,
    input stall);
    reg [31:0] pc;
    wire [31:0] next_pc, muxed_pc;
always @(posedge clock) begin
  if (!reset) begin
    pc <= 32'b0;
  end else if (!stall) begin
    if (pc_sel) begin
      pc <= pc_pip; 
    end else begin
      pc <= muxed_pc; 
    end
  end
end  

                    
    assign pipl_pc = pc + 4;  
    instr_mem3 m1(instruction_code, reset, pc);
    mux1x2 i1(next_pc, pipl_pc, pc_pip, pc_sel);
    mux1x2 i2(muxed_pc, next_pc, pc, stall);   
endmodule





    