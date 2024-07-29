`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 07:12:00 PM
// Design Name: 
// Module Name: pip_reg
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


module pp_reg #(parameter WIDTH  = 8) (out, in, clock, reset);
input clock, reset;
input [WIDTH - 1:0] in;
output reg  [WIDTH - 1:0] out;

always @(posedge clock) begin
    if(!reset)
        out<=0;
        else out <= in;
end
endmodule


