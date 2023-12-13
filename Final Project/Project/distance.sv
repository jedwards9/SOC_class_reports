`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 02:15:53 PM
// Design Name: 
// Module Name: distance
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


module distance(
    input logic clk, reset,
    input  logic start, 
    output logic ready,
    output logic[32:0] distance,
    //sensor wires
    output logic distTrig,
    input  logic distEcho
    );
    
    logic[32:0] count, nextCount;
    logic[32:0] distReg, nextDist;
    logic[32:0] timeout = 5000000;
    typedef enum {idle, pulse, echoWait, echoRead} states;
    states currState, nextState;
    
    always_ff@(posedge clk, posedge reset) begin
        if(reset) begin
            count <= 0;
            currState <= idle;
            distReg <= 0;
        end
        else begin
            count <= nextCount;
            currState <= nextState;
            distReg <= nextDist;
        end
    end
    
    always_comb begin
        nextCount = count + 1;
        nextState = currState;
        nextDist = distReg;
        ready = 0;
        distTrig = 0;
        case(currState)
            idle: begin //wait for start command
                ready = 1;
                    if(start) begin
                        nextState = pulse;
                        nextCount = 0;
                    end
            end
            
            pulse: begin //10us command pulse to send ping
                distTrig = 1;
                if(count >= 1000) begin
                    nextState = echoWait;
                    nextCount = 0;
                end
            end
            
            echoWait: begin //wait for echo pulse
                if(distEcho) begin
                    nextState = echoRead;
                    nextCount = 0;
                end
                else if(count > timeout) begin //timeout
                    nextState = idle;
                    nextDist = {32{1'b1}};
                end
            end
            
            echoRead: begin //distance is proportional to width of return pulse
                if(!distEcho) begin
                    nextDist = count;
                    nextState = idle;
                end
                else if(count > timeout) begin //timeout
                    nextState = idle;
                    nextDist = {32{1'b1}};
                end
            end
        endcase
    end
    
    assign distance = distReg;
    
endmodule
