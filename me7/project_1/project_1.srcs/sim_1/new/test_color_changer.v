`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 02:57:31 PM
// Design Name: 
// Module Name: test_color_changer
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


module test_color_changer();
    reg clk, nrst, dir, btn;
    wire [23:0] rgb_code;
    color_changer UUT(nrst, dir, btn, rgb_code);
    
    initial clk = 0;
    always #5 clk = ~clk;
    always #50 btn = ~btn;

    initial begin
        nrst = 0;
        dir = 0;
        btn = 1;
        #20;
        nrst = 1;
        
        #1000;
        dir = 1;
        #1000;
        $stop;
    end
    
endmodule