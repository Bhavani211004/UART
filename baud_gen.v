`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2026 17:06:07
// Design Name: 
// Module Name: baud_gen
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


module baud_gen(
    input clock,
    input reset,
    output reg enb_tx,
    output reg enb_rx
);

parameter clk_freq  = 50000000;
parameter baud_rate = 9600;

parameter divisor_tx = clk_freq/baud_rate;
parameter divisor_rx = clk_freq/(16*baud_rate);

reg [15:0] counter_tx;
reg [15:0] counter_rx;

always @(posedge clock)
begin
    if(reset)
    begin
        counter_tx <= 0;
        enb_tx <= 0;
    end
    else if(counter_tx == divisor_tx-1)
    begin
        counter_tx <= 0;
        enb_tx <= 1'b1;
    end
    else
    begin
        counter_tx <= counter_tx + 1'b1;
        enb_tx <= 1'b0;
    end
end

always @(posedge clock)
begin
    if(reset)
    begin
        counter_rx <= 0;
        enb_rx <= 0;
    end
    else if(counter_rx == divisor_rx-1)
    begin
        counter_rx <= 0;
        enb_rx <= 1'b1;
    end
    else
    begin
        counter_rx <= counter_rx + 1'b1;
        enb_rx <= 1'b0;
    end
end

endmodule