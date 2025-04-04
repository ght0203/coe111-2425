`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 02:16:27 PM
// Design Name: 
// Module Name: color_changer
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


module color_changer(
    input nrst,
    input dir,
    input btn,
    output reg [23:0] rgb_code
    );
    
        // Define states as local parameters
    localparam RED = 3'd0;
    localparam ORANGE = 3'd1;
    localparam YELLOW = 3'd2;
    localparam GREEN = 3'd3;
    localparam BLUE = 3'd4;
    localparam INDIGO = 3'd5;
    localparam VIOLET = 3'd6;

    // State register
    reg [2:0] current_color, next_color;
    

    // FSM logic
    always @(posedge btn or negedge nrst) begin
        if (!nrst)
            current_color <= RED;
        else
            current_color <= next_color;
    end

    always @(current_color) begin
        case (current_color)
            RED: begin
                rgb_code <= 24'hFF0000;
                if (!dir)
                    next_color = ORANGE;
                else
                    next_color = VIOLET;
            end
            ORANGE: begin
                rgb_code <= 24'hFFA500;
                if (!dir)
                    next_color = YELLOW;
                else
                    next_color = RED;
            end
            YELLOW: begin
                rgb_code <= 24'hFFFF00;
                if (!dir)
                    next_color = GREEN;
                else
                    next_color = ORANGE;
            end
            GREEN: begin
                rgb_code <= 24'h00FF00;
                if (!dir)
                    next_color = BLUE;
                else
                    next_color = YELLOW;
            end
            BLUE: begin
                rgb_code <= 24'h0000FF;
                if (!dir)
                    next_color = INDIGO;
                else
                    next_color = GREEN;
            end
            INDIGO: begin
                rgb_code <= 24'h4B0082;
                if (!dir)
                    next_color = VIOLET;
                else
                    next_color = BLUE;
            end
            VIOLET: begin
                rgb_code <= 24'hEE82EE;
                if (!dir)
                    next_color = RED;
                else
                    next_color = INDIGO;
            end
            default: begin
                rgb_code <= 24'hFF0000;
                if (!dir)
                    next_color = ORANGE;
                else
                    next_color = VIOLET;
            end
        endcase
    end

endmodule
