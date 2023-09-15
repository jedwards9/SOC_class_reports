`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 03:54:27 PM
// Design Name: 
// Module Name: BCDCounter
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


module MaxCounter#(parameter N=4)(
    input  logic rst,
    input  logic clk,
    input  logic en,
    input  logic [N-1:0] maxVal,
    output logic rollover,
    output logic [N-1:0] count
    );
    
    logic rolloverInternal;
	logic ncount;
    Counter#(.N(N)) counter(.clk(clk), .rst(rst), .UpDownn(1), .en(en), .load(rolloverInternal), .data(0), .count(count));
    
    assign rolloverInternal = count == maxVal;
    assign rollover = rolloverInternal & en;
    
    
endmodule
