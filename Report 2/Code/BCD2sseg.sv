`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 02:44:44 PM
// Design Name: 
// Module Name: BCD2sseg
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


module BCD2sseg(
    input  logic [3:0] BCD,
    output logic [7:0] sseg
    );
    
    always_comb begin
        case(BCD)
            0:sseg=8'b11111100;
            1:sseg=8'b01100000;
            2:sseg=8'b11011010;
            3:sseg=8'b11110010;
            4:sseg=8'b01100110;
            5:sseg=8'b10110110;
            6:sseg=8'b10111110;
            7:sseg=8'b11100000;
            8:sseg=8'b11111110;
            9:sseg=8'b11100110;
            default:sseg=8'b00000000;
        endcase
    end
    
endmodule
