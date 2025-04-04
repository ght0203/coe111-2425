`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 01:24:25 PM
// Design Name: 
// Module Name: test_pwm
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


module test_pwm();

    reg clk, nrst;
    reg [7:0] level;
    wire sq_wave;

    // Instantiate the Unit Under Test (UUT)
    pwm UUT (
        .clk(clk),
        .nrst(nrst),
        .level(level),
        .sq_wave(sq_wave)
    );

    // Clock generation: 10ns period (100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        nrst = 0;
        level = 8'd255;  // start with 50% toggle rate
        #20;

        nrst = 1;
        #8000;

        level = 8'd100;
        #8000;

        level = 8'd10;
        #8000;

        nrst = 0;
        #20;
        nrst = 1;
        #500;

        $stop;
    end

endmodule
