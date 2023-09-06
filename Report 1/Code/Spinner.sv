`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2023 12:59:13 PM
// Design Name: 
// Module Name: Spinner
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


module Spinner(
    input  logic [15:0] SW,
    output logic [15:0] LED,
    input  logic CLK100MHZ,
    output logic CA, CB, CC, CD, CE, CF, CG, DP,
    output logic [7:0] AN
    );
    
    //how many bits are in the counter (more = slower rotation)
    localparam N = 26;
    
    logic [N-1:0] clk;
    logic [7:0] top = 8'b11000110;
    logic [7:0] bottom = 8'b00111010;
    logic [7:0] segments;
    logic [7:0] digit;
    MasterClk#(.N(N)) busClk(.boardClk(CLK100MHZ), .count(clk), .en(SW[1]), .UpDownn(SW[0]), .rst(SW[2]));
    
    always_comb begin
        //pick which display is on
        case(clk[N-1:N-3])
            0: digit = 1;
            1: digit = 2;
            2: digit = 4;
            3: digit = 8;
            4: digit = 8;
            5: digit = 4;
            6: digit = 2;
            7: digit = 1;
        endcase
        
        segments = clk[N-1]? top:bottom;   
        
        //write to 7seg
        CA = ~segments[7];
        CB = ~segments[6];
        CC = ~segments[5];
        CD = ~segments[4];
        CE = ~segments[3];
        CF = ~segments[2];
        CG = ~segments[1];
        DP = ~segments[0];
        AN = ~digit;
   
        // see all clock outputs
        LED = SW & clk[N-1:N-16];
    end    
endmodule
