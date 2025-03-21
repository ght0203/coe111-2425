`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 02:57:01 PM
// Design Name: 
// Module Name: top_rom
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

module top_rom(
    input clk, nrst,
    output segA, segB, segC, segD, segE, segF, segG,
    output reg sel
);
    wire [3:0] digit1;
    wire [3:0] digit2;
    wire [3:0] digit;

    assign digit1 = 4'h2;  
    assign digit2 = 4'h8;  

    always @(posedge clk or negedge nrst) begin
        if (!nrst)
            sel <= 0;
        else
            sel <= ~sel;
    end
    
    assign digit = sel ? digit2 : digit1;

    rom romU1(
        .digit(digit), 
        .segA(segA), .segB(segB), .segC(segC), .segD(segD), 
        .segE(segE), .segF(segF), .segG(segG)
    );
endmodule
