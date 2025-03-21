`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 03:48:28 PM
// Design Name: 
// Module Name: fdiv
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


module fdiv(
    input clk, nrst,
    output reg clk_div
    );
    reg ctr;
    localparam [31:0] delay = 32'd100000000;
    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            ctr <= 32'd0;
            clk_div <= 1'b0;
        end else begin
            if (ctr == delay-1) begin
                ctr <= 32'd0;
                clk_div <= 1'b1;
            end else begin
                ctr <= ctr + 32'd1;
                clk_div <= 1'b0;
            end
        end
    end
endmodule
