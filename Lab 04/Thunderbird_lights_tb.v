`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 06:16:39 PM
// Design Name: 
// Module Name: Thunderbird_lights_tb
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


module Thunderbird_lights_tb();
    reg clk = 1'b0;
    reg reset;
    reg left;
    reg right;
    wire la;
    wire lb;
    wire lc;
    wire ra;
    wire rb;
    wire rc;
    
    wire [6:0] q;
    

Thunderbird_lights DUT(
    .clk(clk),
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
    
always
    #5 clk = ~clk;

initial
begin
reset = 1;
left = 0;
right = 0;

#10
reset = 0;

#10
left = 1;

#50
left = 0;

#50
right = 1;

#50
right = 0;

#50 $finish;
end


endmodule




