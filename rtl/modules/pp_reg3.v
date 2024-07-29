`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 12:21:56 AM
// Design Name: 
// Module Name: pp_reg3
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


module pp_reg3 #(parameter WIDTH  = 8) (out, in, clock, reset, stall, branch);
input clock, reset, stall;
input [WIDTH - 1:0] in;
input branch;
output reg  [WIDTH - 1:0] out;

always @(posedge clock) begin
    if(!reset)
        out<=0;
    else if(branch)
        out<=0;
    else if(!stall) out <= in;
end
endmodule

module pp_reg4 #(parameter WIDTH  = 8) (out, in, clock, reset, branch);
input clock, reset, branch;
input [WIDTH - 1:0] in;
output reg  [WIDTH - 1:0] out;

always @(posedge clock) begin
    if(!reset)
        out<=0;
    else if ( branch ) 
        out <=0;
    else  out <= in;
end
endmodule
