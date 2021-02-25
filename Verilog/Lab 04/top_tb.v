`timescale 1ms / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 09:13:16 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
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

parameter width = 26;
reg en;
reg [3:0] step;
wire [width - 1:0] count;
wire scaled_clk;

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
    
always
    #1 clk = ~clk;

initial
begin
clk = 0;
reset = 0;
step = 26'd1;
en = 1;

#20
reset = 1;
left = 0;
right = 0;

#20
reset = 0;

#20
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
