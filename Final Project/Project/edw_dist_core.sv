module edw_dist_core(
    input  logic clk,
    input  logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    // external signal    
    output logic distTrig,
    input  logic distEcho
   );

   // signal declaration
   logic start;
   logic ready;
   logic[32:0] distTime;
   logic[7:0] numReadings, nextNumReadings; 
   
   // instantiate controller
   distance dist_unit(
    .clk(clk), .reset(reset), 
    .start(start),
    .ready(ready),
    .distance(distTime),
    .distTrig(distTrig),
    .distEcho(distEcho)    
   );
   
   always_ff @(posedge clk, posedge reset) begin
    if(reset) begin
        numReadings <= 0;
    end
    else begin
        numReadings <= nextNumReadings;
    end
   end
   
   // decoding
   always_comb begin
    start = 0;
    nextNumReadings = numReadings;
    if(cs & write) begin
        start = 1;
        nextNumReadings = numReadings + 1;
    end
   end
   
   // read multiplexing 
   always_comb begin
    rd_data = distTime;
    if(addr[0]) begin
        rd_data = {23'b0, ready, numReadings};
    end
   end
   
endmodule  
