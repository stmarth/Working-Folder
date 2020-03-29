`timescale 1ms / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 03:21:06 PM
// Design Name: 
// Module Name: top
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

parameter width = 26;
module top(
    input wire clk,
    input wire reset,
    input wire left,
    input wire right,
    output reg la,
    output reg lb,
    output reg lc,
    output reg ra,
    output reg rb,
    output reg rc,
    output reg [6:0] q,
    
    input wire en,
    input wire [3:0] step,
    output reg [width - 1:0] count,
    output reg scaled_clk
    
    );
    
    Clock_Scaler cs (
    .clk(clk),
    .reset(reset),
    .en(en),
    .step(step),
    .count(count),
    .scaled_clk(scaled_clk)
    );
    
    Thunderbird_lights tl (
    .clk(scaled_clk),
    .reset(reset),
    .left(left),
    .right(right),
    .la(la),
    .lb(lb),
    .lc(lc),
    .ra(ra),
    .rb(rb),
    .rc(rc)
    );
    
endmodule
