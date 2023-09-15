`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2023 12:39:36 PM
// Design Name: 
// Module Name: MasterClk
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


module Counter#(parameter N=8)(
    input  logic clk,
    input  logic rst,
    input  logic UpDownn,
    input  logic en,
	input  logic load,
	input  logic [N-1:0] data,
    output logic tic,
    output logic [N-1:0] count
    );
    
    //signals
    logic [N-1:0] nval;
    logic [N-1:0] val;
    
    always_ff@(posedge clk, posedge rst)
        if(rst)
            val <= {N{1'b0}};
        else
            val <= nval;
    always_comb
        if(en)
			if(load)
				nval = data;
			else
				if (UpDownn)
					nval = val + 1;
				else
					nval = val - 1;
        else
            nval = val;
        
    assign count = val;
    assign tic = (val==1) & en;
    
endmodule
