`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 03:57:27 PM
// Design Name: 
// Module Name: tb_counter
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


module tb_counter(
    );
    reg clk;
    reg nrst;
    wire clk_div;
    wire digit1;
    wire digit2;
    fdiv fdivU1(clk, clk_div);
    //counter counter(clk_div, 
endmodule
