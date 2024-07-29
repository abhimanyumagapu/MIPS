`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2024 01:44:47 PM
// Design Name: 
// Module Name: misc
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


module mux1x2(y, in0, in1, sel);
output [31:0] y;
input [31:0] in1, in0;
input sel;

assign y = sel? in1 : in0;

endmodule

module mux1x2_5(y, in0, in1, sel);
output [4:0] y;
input [4:0] in1, in0;
input sel;

assign y = sel? in1 : in0;

endmodule
