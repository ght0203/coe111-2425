`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 01:18:52 PM
// Design Name: 
// Module Name: pwm
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

module pwm(
    input clk,
    input nrst,
    input [7:0] level,
    output reg sq_wave
    );

    reg [8:0] counter = 0;

    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            counter <= 0;
            sq_wave <= 0;
        end else begin
            // PWM logic
            if (counter < level)
                sq_wave <= 1;
            else
                sq_wave <= 0;

            // Counter reset
            if (counter == 9'd511)
                counter <= 0;
            else
                counter <= counter + 1;
        end
    end


endmodule