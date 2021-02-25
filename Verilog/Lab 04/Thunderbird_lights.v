`timescale 1ns / 1ps
`define TCQ #1
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 03:21:06 PM
// Design Name: 
// Module Name: Thunderbird_lights
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


module Thunderbird_lights(
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
    output reg [6:0] q
    );
// One-Hot state encoding
    parameter RESET = 7'b000_000_1;
    parameter LA = 7'b001_000_0;
    parameter LB = 7'b010_000_0;
    parameter LC = 7'b100_000_0;
    parameter RA = 7'b000_100_0;
    parameter RB = 7'b000_010_0;
    parameter RC = 7'b000_001_0;
    reg [6:0] state;
    reg [6:0] next_state;
//State Registers
always @ (posedge clk)
begin
    if(reset)
        state <= `TCQ RESET; //fake delay insertion
    else
        state <= `TCQ next_state;
end

always @ (*) //output logic
begin
    q = state;
    case (state)
    RESET: {la,lb,lc,ra,rb,rc} = 6'b000_000;
    LA: {lc,lb,la,ra,rb,rc} = 6'b001_000;
    LB: {lc,lb,la,ra,rb,rc} = 6'b011_000;
    LC: {lc,lb,la,ra,rb,rc} = 6'b111_000;
    RA: {la,lb,lc,ra,rb,rc} = 6'b000_100;
    RB: {la,lb,lc,ra,rb,rc} = 6'b000_110;
    RC: {la,lb,lc,ra,rb,rc} = 6'b000_111;
    default: {la,lb,lc,ra,rb,rc} = 6'b000_000;
    endcase
end

always @ (*) //State Transition Logic
begin
    case (state)
    
    RESET: begin
    if(left)
        next_state = LA;
    else if(right)
        next_state = RA;
    else
        next_state = state;
    end
    
    LA: begin
    next_state = LB;
    end
    
    LB: begin
    next_state = LC;
    end
    
    LC: begin
    next_state = RESET;
    end
    
    RA: begin
    next_state = RB;
    end
    
    RB: begin
    next_state = RC;
    end
    
    RC: begin
    next_state = RESET;
    end
    
    endcase
end
     
     
endmodule




