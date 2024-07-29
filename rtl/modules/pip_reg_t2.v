`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 12:08:25 AM
// Design Name: 
// Module Name: pip_reg_t2
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


module pp_reg2 #(parameter WIDTH  = 8) (out, in, clock, reset, stall, branch);
input clock, reset, stall, branch;
input [WIDTH - 1:0] in;
output reg  [WIDTH - 1:0] out;

reg [WIDTH -1:0] temp;


always @(posedge clock) begin
    if(!reset)
        out<=0;
    else if ( stall ) 
        out<=0;
    else if ( branch ) 
        out <=0;
    else out <= in; 
end
endmodule
