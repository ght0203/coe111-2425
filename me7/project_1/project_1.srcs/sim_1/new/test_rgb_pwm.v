`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 02:03:31 PM
// Design Name: 
// Module Name: test_rgb_pwm
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


module test_rgb_pwm();
    reg clk, nrst;
    reg [23:0] rgb_level;
    wire red_led, green_led, blue_led;

    // Instantiate the Unit Under Test (UUT)
    rgb_pwm UUT (clk, nrst, rgb_level, red_led, green_led, blue_led);

    // Clock generation: 10ns period (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        nrst = 0;
        rgb_level = 24'hFF11FF;
        #20;

        nrst = 1;
        #16000;

        $stop;
    end
    
endmodule
