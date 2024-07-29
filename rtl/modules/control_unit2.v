`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 06:29:43 PM
// Design Name: 
// Module Name: control_unit2
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


module control_unit2(
    output reg reg_write, alusrc, reg_dst, branch, memwrite, memread, memtoreg,
    output reg [1:0] aluop,
    input [5:0] instruction
);


always @(*) begin
    casex(instruction)
        //lw
        6'b100011: begin 
            reg_dst = 0; alusrc = 1; branch = 0;
            memread = 1; memwrite = 0; reg_write = 1; 
            memtoreg = 1;
        end
        //sw
        6'b101011: begin 
            reg_dst = 0; alusrc = 1; branch = 0;
            memread = 0; memwrite = 1; reg_write = 0; 
            memtoreg = 0;  
        end
        // ori
        6'b001110: begin
            reg_dst = 0; alusrc = 1; branch = 0;
            memread = 0; memwrite = 0; reg_write = 1; 
            memtoreg = 0;  
        end
        //mul
        6'b011010: begin
            reg_dst = 1; alusrc = 0; branch = 0;
            memread = 0; memwrite = 0; reg_write = 1; 
            memtoreg = 0;  
        end
        //jr
        6'b001000: begin
            reg_dst = 0; alusrc = 0; branch = 1;
            memread = 0; memwrite = 0; reg_write = 0; 
            memtoreg = 0;  
        end
        //lui
        6'b001111: begin
            reg_dst = 0; alusrc = 1; branch = 0;
            memread = 0; memwrite = 0; reg_write = 1; 
            memtoreg = 0;  
        end
        
        default: begin
            reg_dst = 0; alusrc = 0; branch = 0;
            memread = 0; memwrite = 0; reg_write = 0; 
            memtoreg = 0;
        end
    endcase
    
    aluop = {instruction[2], instruction[0]};
end

endmodule


