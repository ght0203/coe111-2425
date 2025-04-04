`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 03:15:42 PM
// Design Name: 
// Module Name: rgb
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


module rgb(
    input clk,
    input nrst,
    input dir,
    input btn,
    output rgb_r,
    output rgb_g,
    output rgb_b
    );
    
    
    wire [23:0] rgb_code;
    localparam DIV_N = 32'd390625;
    color_changer color_changer_instance(nrst, dir, btn, rgb_code);
    fdiv fdiv_instance(clk, nrst, DIV_N, clk_div);
    rgb_pwm rgb_pwm_driver(clk_div, nrst, rgb_code, rgb_r, rgb_g, rgb_b);
endmodule
