`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 04:47:54 PM
// Design Name: 
// Module Name: CounterChain
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


module CounterChain();

localparam N=4;
logic clk;
logic en;
logic rst;
logic [N-1:0] count0;
logic [N-1:0] count1;
logic ovr0;

MaxCounter counter0(.clk(clk), .en(en), .rst(rst), .rollover(ovr0), .maxVal(5), .count(count0));
MaxCounter counter1(.clk(clk), .en(ovr0), .rst(rst), .maxVal(5), .count(count1));

endmodule
