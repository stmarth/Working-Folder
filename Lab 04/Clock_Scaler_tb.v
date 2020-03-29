`timescale 1ns / 1ns
`define TCQ #1
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 04:12:58 PM
// Design Name: 
// Module Name: Clock_Scaler_tb
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


module Clock_Scaler_tb( );

parameter width = 26;

reg clk;
reg reset;
reg en;
reg [3:0] step;
wire [width - 1:0] count;
wire scaled_clk;

Clock_Scaler#(.width(width))
DUT (
.clk(clk),
.reset(reset),
.en(en),
.step(step),
.count(count),
.scaled_clk(scaled_clk)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 0;
    en = 0;
    step = 26'd1;
    
    #20
    reset = 1;
    
    #10
    reset = 0;
    
    #30
    en = 1;
    
    #30
    step = 26'd2;
    
    #100
    reset = 1;
    
    #50
    step = 26'd1;
    
    #5000
    reset = 0;
end


endmodule
