`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 03:19:44 PM
// Design Name: 
// Module Name: test_rgb
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


module test_rgb();
    reg clk, nrst, dir, btn;
    wire rgb_r, rgb_g, rgb_b;
    rgb UUT(clk, nrst, dir, btn, rgb_r, rgb_g, rgb_b);
    
    initial clk = 0;
    always #5 clk = ~clk;
    always #4000 btn = ~btn;

    initial begin
        nrst = 0;
        dir = 0;
        btn = 1;
        #20;
        nrst = 1;
        
        #80000;
        dir = 1;
        #80000;
        $stop;
    end
endmodule
