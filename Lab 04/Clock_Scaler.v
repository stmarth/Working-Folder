`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2020 03:21:06 PM
// Design Name: 
// Module Name: Clock_Scaler
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


module Clock_Scaler#(
    parameter width = 26
    )(
    input clk,
    input reset,
    input en,
    input [3:0] step,
    output reg [width - 1:0] count,
    output reg scaled_clk
    );
 
    always @ (posedge clk)
    begin
    if((reset) || (count == 26'd49_999_999))
        count <= {width{1'b0}};
    else if (en)
        count <= count + 1'b1;
    end
    
    always @ (posedge clk)
    begin
    if(reset)
        scaled_clk <= 1'b0;
    else if (count == 26'd49_999_999)
        scaled_clk <= ~scaled_clk;
    end



endmodule
