`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 03:41:20 PM
// Design Name: 
// Module Name: test_fdiv
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


module test_fdiv();
    reg clk, nrst;
    
    wire clk_div;
    localparam DIV_N = 32'd5;
    fdiv UUT(clk, nrst, DIV_N, clk_div);
    
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        nrst = 0;
        #20;
        nrst = 1;
        
        #100;
    end
endmodule
