`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 07:50:53 PM
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(
    output reg [1:0] forward_rs, // ForwardRs
    output reg [1:0] forward_rt,  // ForwardRt
    input mem_wb_regwrite,     // MEM/WB.RegWrite
    input [4:0] mem_wb_rd,     // MEM/WB.RegisterRd
    input ex_mem_regwrite,     // EX/MEM.RegWrite
    input [4:0] ex_mem_rd,     // EX/MEM.RegisterRd
    input [4:0] id_ex_rs,      // ID/EX.RegisterRs
    input [4:0] id_ex_rt      // ID/EX.RegisterRt
);
always @(*) begin
    // Default no forwarding
    forward_rs = 2'b00;
    forward_rt = 2'b00;
    // EX Hazard Detection for Rs
    if (ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rs)) begin
        forward_rs = 2'b01;
    end
    // MEM Hazard Detection for Rs
    if (mem_wb_regwrite && (mem_wb_rd != 0) && (mem_wb_rd == id_ex_rs) && 
        !(ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rs))) begin
        forward_rs = 2'b10;
    end
    // EX Hazard Detection for Rt
    if (ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rt)) begin
        forward_rt = 2'b01;
    end   
    // MEM Hazard Detection for Rt
    if (mem_wb_regwrite && (mem_wb_rd != 0) && (mem_wb_rd == id_ex_rt) && 
        !(ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rt))) begin
        forward_rt = 2'b10;
    end
end

endmodule