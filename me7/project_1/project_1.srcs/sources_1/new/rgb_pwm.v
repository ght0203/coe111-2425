`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 01:59:15 PM
// Design Name: 
// Module Name: rgb_pwm
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


module rgb_pwm(
    input clk, nrst,
    input [23:0] rgb_code,
    output red_led,
    output green_led,
    output blue_led
    );
    
    wire [7:0] red_level, green_level, blue_level;
    assign red_level = rgb_code[23:16];
    assign green_level = rgb_code[15:8];
    assign blue_level = rgb_code[7:0];
    
    pwm red_driver(clk, nrst, red_level, red_led);
    pwm green_driver(clk, nrst, green_level, green_led);
    pwm blue_driver(clk, nrst, blue_level, blue_led);
endmodule
