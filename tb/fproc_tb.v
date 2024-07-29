`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 09:48:24 AM
// Design Name: 
// Module Name: fproc_tb
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


module fproc_tb();

reg clock, reset;
wire out;

fproc q1(out, clock, reset);

parameter stop_time = 900;

initial #stop_time $finish;

initial begin
    clock = 0;
    forever #5 clock = ~clock;

end

initial begin
    reset = 0;
    #1 reset = 1;
    #1 reset = 0;
    #8 reset = 1;

end

endmodule
