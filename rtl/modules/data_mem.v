`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2024 11:46:01 AM
// Design Name: 
// Module Name: data_mem
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


module data_mem(read_data, write_data, address, memread, memwrite, reset);
output reg [31:0] read_data;
input [31:0] address;
input memread, memwrite, reset;
input [31:0] write_data;

reg [7:0] mem [63:0];
integer i;

always @(posedge memread or posedge memwrite) begin


        if(memread) begin
            
            read_data <= {mem[address], mem[address+1], mem[address+2], mem[address+3]};
        end
        
        if(memwrite) begin
            mem[address+3] <= write_data[7:0];
            mem[address+2] <= write_data[15:8];
            mem[address+1] <= write_data[23:16];
            mem[address] <= write_data[31:24];
        end
    end


always @(*)begin
    if(!reset) begin
        mem[0] = 8'h00; mem[1] = 8'h00; mem[2] = 8'h00; mem[3] = 8'h00; 
        mem[4] = 8'hfc; mem[5] = 8'h20; mem[6] = 8'h00; mem[7] = 8'h04; 
        mem[8] = 8'h00; mem[9] = 8'h01; mem[10] = 8'h10; mem[11] = 8'h20; 
        mem[12] = 8'h08; mem[13] = 8'h01; mem[14] = 8'h10; mem[15] = 8'h22; 
            for (i = 16; i<64;i=i+1) begin
            mem[i] = i;
            end

        
        
         
     end
end
endmodule
