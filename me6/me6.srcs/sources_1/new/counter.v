`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 03:38:52 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk_div, nrst, dir,
    output [3:0] digit1, digit2
    );
    
    reg [7:0] ctr; 
    assign digit1 = ctr[3:0];
    assign digit2 = ctr[7:4];
    
    always @(posedge clk_div or negedge nrst) begin
        if (!nrst) ctr <= 8'h0;
        else begin
            if (dir) ctr <= ctr - 1;
            else ctr <= ctr + 1;
        end
    end
endmodule
