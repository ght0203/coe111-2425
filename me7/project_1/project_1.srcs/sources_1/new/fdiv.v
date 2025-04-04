`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 03:29:36 PM
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
    input [31:0] div_n,     
    output reg clk_div  
);

    reg [31:0] counter;  

    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin 
            counter <= 0;
            clk_div <= 0;
        end else if (counter == div_n - 1) begin
            counter <= 0;           
            clk_div <= ~clk_div;    
        end else begin
            counter <= counter + 1; 
        end
    end

endmodule

