`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 04:52:20 PM
// Design Name: 
// Module Name: reg_file2
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


module reg_file2(rd_data1, rd_data2, wr_data, wr_reg_num, rd_reg_num1, rd_reg_num2, reg_write, clock, reset);
input [4:0] rd_reg_num1, rd_reg_num2, wr_reg_num;
input clock, reg_write, reset;
input [31:0] wr_data;
output reg [31:0] rd_data1, rd_data2;

reg [31:0] regmemory [31:0];
integer i;
always @(*) begin
    if(clock)begin
        if(reg_write)begin
            if ( wr_reg_num == 0 ) begin
                regmemory[wr_reg_num] = 0; end
            else regmemory[wr_reg_num] = wr_data;
        end
        else regmemory[wr_reg_num] = regmemory[wr_reg_num];
     end    
end
always @(negedge clock) begin
    rd_data1 = regmemory[rd_reg_num1];
    rd_data2 = regmemory[rd_reg_num2];
end
always @ (clock, reset)begin
    if (!reset) begin
        for (i = 0; i<32; i = i+1) begin
            regmemory[i] <= i;
            end
    end
end
endmodule


