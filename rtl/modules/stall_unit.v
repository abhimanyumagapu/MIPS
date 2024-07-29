`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 11:22:59 PM
// Design Name: 
// Module Name: stall_unit
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


module stall_unit(
    output reg stall,
    input id_ex_memread,
    input [4:0] id_ex_rt,
    input [4:0] if_id_rs,
    input [4:0] if_id_rt
    
);
    always @(*) begin
        stall = id_ex_memread && ((id_ex_rt == if_id_rs) || (id_ex_rt == if_id_rt));
    end
endmodule
