`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 08:03:50 PM
// Design Name: 
// Module Name: mux2x4
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


module mux2x4 (output [31:0] out, input [31:0] a, input [31:0] b, input [31:0] c, input [31:0] d, input [1:0] sel);           
 
assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);  
  
endmodule  
