`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 04:13:02 PM
// Design Name: 
// Module Name: ReactionTimer
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


module ReactionTimer(
    //input  logic button,
    input  logic CLK100MHZ,
    input  logic [15:0] SW,
    //output logic light,
    output logic [15:0] LED,
    output logic CA, CB, CC, CD, CE, CF, CG, DP,
    output logic [7:0] AN
    );
        
    logic [7:0] seg0;
    logic [7:0] seg1;
    logic [7:0] seg2;
    logic [7:0] seg3;
    logic [7:0] seg4;
    logic [7:0] seg5;
    logic [7:0] seg6;
    logic [7:0] seg7;
    
    logic msEn;
    logic [16:0] msVal;
    logic oneInc;
    logic [3:0] oneVal;
    logic [7:0] segOne;
    logic tenInc;
    logic [3:0] tenVal;
    logic [7:0] segTen;
    logic hundredInc;
    logic [3:0] hundredVal;
    logic [7:0] segHundred;
    logic thousandInc;
    logic [3:0] thousandVal;
    logic [7:0] segThousand;
    logic timerRst;
    
    //7seg multiplexing
    localparam  N = 18;
    logic [N-1:0] counterVal;
    Counter#(.N(N)) counter(.clk(CLK100MHZ), .rst(0), .load(0), .UpDownn(1), .en(1), .count(counterVal), .data(0));
    SSegDriver ssegDriver(.idx(counterVal[N-1:N-3]), .*);
    
    //RNG counters
    logic RNGen;
    logic RNGRst;
    logic RandomWait;
    logic [30:0] currWait;
    logic [4:0] RNGVal;
    MaxCounter#(.N(5)) RNG(.rst(0), .en(RNGen), .clk(CLK100MHZ), .maxVal(4'b10101), .count(RNGVal));
    Counter#(.N(31))(.clk(CLK100MHZ), .rst(RNGRst), .UpDownn(1), .en(randomWait), .load(0), .count(currWait));
    
    //ms counters
    MaxCounter#(.N(17)) msCounter(.rst(timerRst), .en(msEn),        .clk(CLK100MHZ), .maxVal(100000), .rollover(oneInc),      .count(msVal));
    MaxCounter#(.N(4)) ones      (.rst(timerRst), .en(oneInc),      .clk(CLK100MHZ), .maxVal(9),      .rollover(tenInc),      .count(oneVal));
    MaxCounter#(.N(4)) tens      (.rst(timerRst), .en(tenInc),      .clk(CLK100MHZ), .maxVal(9),      .rollover(hundredInc),  .count(tenVal));
    MaxCounter#(.N(4)) hundreds  (.rst(timerRst), .en(hundredInc),  .clk(CLK100MHZ), .maxVal(9),      .rollover(thousandInc), .count(hundredVal));
    MaxCounter#(.N(4)) thousands (.rst(timerRst), .en(thousandInc), .clk(CLK100MHZ), .maxVal(9),      .rollover(),            .count(thousandVal));
    
    //7seg decoders
    BCD2sseg dig0(.BCD(oneVal),      .sseg(segOne));
    BCD2sseg dig1(.BCD(tenVal),      .sseg(segTen));
    BCD2sseg dig2(.BCD(hundredVal),  .sseg(segHundred));
    BCD2sseg dig3(.BCD(thousandVal), .sseg(segThousand));
    
    parameter  Hss = 8'b01101110;
    parameter  Iss = 8'b00001100;
    parameter  Zss = 8'b00000000;
    parameter  Xss = 8'b11110110;
    
    assign seg4 = Zss;
    assign seg5 = Zss;
    assign seg6 = Zss;
    assign seg7 = Zss;
    
    
    parameter intro    = 3'b000;
    parameter waiting  = 3'b001;
    parameter reacting = 3'b010;
    parameter timeout  = 3'b011;
    parameter results  = 3'b100;
    parameter cheated  = 3'b101;
    
    logic [2:0] state;
    logic [2:0] nstate;
    
    always_ff @(posedge CLK100MHZ) begin
        state = nstate;
    end
    
    always_comb begin
        case(state)
            intro: begin 
                timerRst = 1;
                msEn = 0;
                seg0 = Iss;
                seg1 = Hss;
                seg2 = Zss;
                seg3 = Zss;
                RNGen = 1;
                RNGRst = 1;
                RandomWait = 0;
                LED[0] = 0;
                if(SW[0])
                    nstate = waiting;
                else
                    nstate = intro;
            end
            waiting: begin 
                timerRst = 1;
                msEn = 0;
                seg0 = Zss;
                seg1 = Zss;
                seg2 = Zss;
                seg3 = Zss;
                RNGen = 0;
                RNGRst = 0;
                RandomWait = 1;
                LED[0] = 0;
                LED[1] = 1;
                if(RNGVal + 1 <= currWait[30:26])
                    nstate = reacting;
                else
                    nstate = waiting;
            end
            reacting: begin 
                timerRst = 0;
                msEn = 1;
                seg0 = segOne;
                seg1 = segTen;
                seg2 = segHundred;
                seg3 = segThousand;
                LED[0] = 1;
                if(segThousand == 8'b11011010)
                    nstate = intro;
                else
                    nstate = reacting;
            end
            timeout: begin
                timerRst = 0;
                msEn = 0;
                seg0 = segOne;
                seg1 = segTen;
                seg2 = segHundred;
                seg3 = segThousand;
                LED[0] = 0;
				if(SW[15])
					nstate = waiting;
				else
					nstate = timeout;
            end
            results: begin 
                timerRst = 0;
                msEn = 0;
                seg0 = segOne;
                seg1 = segTen;
                seg2 = segHundred;
                seg3 = segThousand;
                LED[0] = 0;
				if(SW[15])
					nstate = waiting;
				else
					nstate = results;
            end
            cheated: begin
                timerRst = 0;
                msEn = 0;
                seg0 = Xss;
                seg1 = Xss;
                seg2 = Xss;
                seg3 = Xss;
                LED[0] = 0;
				if(SW[15])
					nstate = waiting;
				else
					nstate = cheated;
            end
        endcase
    end  
endmodule
