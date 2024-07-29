`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 04:12:10 PM
// Design Name: 
// Module Name: fproc
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


module fproc(out, clock, reset);
input clock, reset;
output out;

assign out = 0;

wire [31:0] instruction, pipl_pc;

wire [31:0] read_data1, read_data2;
wire reg_write, alusrc, reg_dst, branch, memwrite, memread, memtoreg;
wire [1:0] aluop;

wire [31:0] alu_src2, alu_out;
wire [31:0] jump_add, imdata; 
wire [3:0] alusel;
wire zeroflag;
wire [4:0] write_reg;

wire [31:0] data_mem_read_data;

wire [63:0] out_if;
wire [151:0] out_id;
wire [106:0] out_ex;
wire [70:0] out_mem;

wire [31:0] write_data;

wire [1:0] forward_rs, forward_rt;
wire [31:0] alu_forward_1, alu_forward_2;

wire stall;


//stall
stall_unit m7(stall, out_id[141], out_id[9:5], out_if[25:21], out_if[20:16]);


// if
instr_fetch3 m1(instruction, pipl_pc, out_ex[101:70], out_ex[105], clock, reset, stall); 
pp_reg3 #(.WIDTH(64)) if_id(out_if, {pipl_pc, instruction}, clock, reset, stall, out_ex[105]); //pc, instruction

//decode
control_unit2 c1(reg_write, alusrc, reg_dst, branch, memwrite, memread, memtoreg, aluop, out_if[31:26]);
reg_file2 m2(read_data1, read_data2, write_data , out_mem[4:0], out_if[25:21], out_if[20:16], out_mem[70] , clock, reset); 
pp_reg2 #(.WIDTH(152)) id_ex(out_id,
 {out_if[25:21], reg_write, alusrc, reg_dst, branch, memwrite, memread, memtoreg, aluop, 
  out_if[63:32], read_data1, read_data2, {{16{out_if[15]}}, out_if[15:0]}, out_if[20:16], out_if[15:11]},
   clock, reset, stall, out_ex[105]);
//rs, control signals, pc, rd1, rd2, immdata signextended, rt, rd


//execute
assign imdata = alu_forward_1  << 2;
assign jump_add = out_id[137:106] + imdata;  
mux1x2_5 t1(write_reg, out_id[9:5], out_id[4:0], out_id[144]);
mux1x2 t2(alu_src2, alu_forward_2, out_id[41:10], out_id[145]);
alu_control2 m3(alusel,out_id[139:138],out_id[15:10]);
alu m4(zeroflag, alu_out, alu_forward_1, alu_src2, alusel);
pp_reg4 #(.WIDTH(107)) ex_mem(out_ex, 
{out_id[146], out_id[143:140], jump_add, zeroflag, alu_out, out_id[73:42], write_reg}, clock, reset, out_ex[105]);
// regwrite, branch, memwrite, memread, memtoreg, jump add, zerod, alu out, rd2,  write reg


//mem
data_mem m5(data_mem_read_data, out_ex[36:5], out_ex[68:37], out_ex[103], out_ex[104], reset);
pp_reg #(.WIDTH(71)) mem_wb(out_mem, 
{out_ex[106], out_ex[102], data_mem_read_data, out_ex[68:37], out_ex[4:0]}, clock, reset);
// regwrite, memtoreg, datamem output, alu out, write reg

//wb
mux1x2 t3(write_data, out_mem[36:5], out_mem[68:37], out_mem[69]);

//forwarding
forwarding_unit m6(forward_rs, forward_rt, out_mem[70], out_mem[4:0], out_ex[106], out_ex[4:0], out_id[151:147], out_id[9:5]);
mux2x4 l1(alu_forward_1, out_id[105:74], out_ex[68:37], out_mem[68:37], {32{1'b0}}, forward_rs);
mux2x4 l2(alu_forward_2, out_id[73:42], out_ex[68:37], out_mem[68:37], {32{1'b0}}, forward_rt);
 




endmodule