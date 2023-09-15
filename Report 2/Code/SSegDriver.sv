`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 04:02:59 PM
// Design Name: 
// Module Name: SSegDriver
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


module SSegDriver(
    input  logic [3:0] idx,
    input  logic [7:0] seg0,
    input  logic [7:0] seg1,
    input  logic [7:0] seg2,
    input  logic [7:0] seg3,
    input  logic [7:0] seg4,
    input  logic [7:0] seg5,
    input  logic [7:0] seg6,
    input  logic [7:0] seg7,
    output logic CA, CB, CC, CD, CE, CF, CG, DP,
    output logic [7:0] AN
    );
    
    logic [7:0] currSeg;
    logic [7:0] currDigit;
    
    always_comb begin
        case(idx)
            0:currSeg = seg0;
            1:currSeg = seg1;
            2:currSeg = seg2;
            3:currSeg = seg3;
            4:currSeg = seg4;
            5:currSeg = seg5;
            6:currSeg = seg6;
            7:currSeg = seg7;
            default: currSeg = seg0;
        endcase
        
        currDigit = (8'b00000001) << idx;
        
        //write to 7seg
        CA = ~currSeg[7];
        CB = ~currSeg[6];
        CC = ~currSeg[5];
        CD = ~currSeg[4];
        CE = ~currSeg[3];
        CF = ~currSeg[2];
        CG = ~currSeg[1];
        DP = ~currSeg[0];
        AN = ~currDigit;
    end
    
    
endmodule
