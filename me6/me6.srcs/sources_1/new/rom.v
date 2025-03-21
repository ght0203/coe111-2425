`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 02:38:20 PM
// Design Name: 
// Module Name: rom
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


module rom (
    input [3:0] digit,
    output reg segA, segB, segC, segD, segE, segF, segG
);
    always @(digit) begin
        case (digit)
            4'h1: {segA, segB, segC, segD, segE, segF, segG} = 7'b0110000;
            4'h2: {segA, segB, segC, segD, segE, segF, segG} = 7'b1101101;
            4'h3: {segA, segB, segC, segD, segE, segF, segG} = 7'b1111001;
            4'h4: {segA, segB, segC, segD, segE, segF, segG} = 7'b0110011;
            4'h5: {segA, segB, segC, segD, segE, segF, segG} = 7'b1011011;
            4'h6: {segA, segB, segC, segD, segE, segF, segG} = 7'b1011111;
            4'h7: {segA, segB, segC, segD, segE, segF, segG} = 7'b1110000;
            4'h8: {segA, segB, segC, segD, segE, segF, segG} = 7'b1111111;
            4'h9: {segA, segB, segC, segD, segE, segF, segG} = 7'b1111011;
            4'ha: {segA, segB, segC, segD, segE, segF, segG} = 7'b1110111;
            4'hb: {segA, segB, segC, segD, segE, segF, segG} = 7'b0011111;
            4'hc: {segA, segB, segC, segD, segE, segF, segG} = 7'b1001110;
            4'hd: {segA, segB, segC, segD, segE, segF, segG} = 7'b0111101;
            4'he: {segA, segB, segC, segD, segE, segF, segG} = 7'b1001111;
            4'hf: {segA, segB, segC, segD, segE, segF, segG} = 7'b1000111;
            default: {segA, segB, segC, segD, segE, segF, segG} = 7'b0000000;
        endcase
    end
endmodule
