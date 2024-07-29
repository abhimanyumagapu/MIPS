`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2024 05:32:15 PM
// Design Name: 
// Module Name: alu
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


module alu(out0, out_op, inp1, inp2, sel);
input [31:0] inp1, inp2;
input[3:0] sel;
output reg [31:0] out_op;
output out0;

reg [31:0] temp;

always@(*)begin
    temp = inp1 + inp2;
    case(sel)
        4'b0000 : out_op = {inp2[15:0], 16'b0};//lui
        4'b0011 : out_op = inp1 | inp2; //ori
        4'b0010 : out_op = inp2 + inp1; //lw,sw
        4'b0111 : out_op = inp1 + 0; //jr
        4'b0110 : out_op = inp1 * inp2; //mul
        
        default : out_op = inp1 + inp2;
     endcase
end

assign out0 = ~(|out_op);

endmodule
