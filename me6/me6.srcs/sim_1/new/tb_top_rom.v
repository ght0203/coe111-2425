`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 03:09:04 PM
// Design Name: 
// Module Name: tb_top_rom
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


`timescale 1ns / 1ps

module tb_top_rom();
    reg clk;
    reg nrst;
    wire segA, segB, segC, segD, segE, segF, segG;
    wire sel;

    // Instantiate the top module
    top_rom uut (
        .clk(clk),
        .nrst(nrst),
        .segA(segA), .segB(segB), .segC(segC), .segD(segD),
        .segE(segE), .segF(segF), .segG(segG),
        .sel(sel)
    );

    // Clock Generation
    always #5 clk = ~clk;  // 10 ns period -> 100 MHz clock

    // Test sequence
    initial begin
        //$dumpfile("waveform.vcd");  // VCD file for GTKWave
        //$dumpvars(0, tb_top_rom);

        clk = 0;
        nrst = 0;
        #20 nrst = 1;  // Release reset after 20 ns

        #200 $finish;  // Run simulation for 200 ns
    end
endmodule

