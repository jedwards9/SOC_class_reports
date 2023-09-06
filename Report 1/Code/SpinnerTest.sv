`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 04:45:58 PM
// Design Name: 
// Module Name: SpinnerTest
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


module SpinnerTest();

logic [15:0] SW;
logic [15:0] LED;
logic CLK100MHZ;
logic CA, CB, CC, CD, CE, CF, CG, DP;
logic [7:0] AN;
    
Spinner UUT(.*);

//clock setup
initial begin
    CLK100MHZ  = 0;
    forever
        #5 CLK100MHZ  = ~CLK100MHZ;
end

initial begin
    SW = 0;
    SW[2] = 1;
    #10;
    SW[2] = 0;
    #10;
    SW[1] = 1;
    #200;
    SW[1] = 0;
    #30;
    SW[1] = 1;
    SW[0] = 1;
    #100;
    $finish;
end

endmodule
