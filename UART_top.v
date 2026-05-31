`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2026 17:23:27
// Design Name: 
// Module Name: UART_top
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

module UART_top(
    input rst,
    input [7:0] data_in,
    input wr_en,
    input clk,
    input rdy_clr,

    output rdy,
    output busy,
    output [7:0] data_out
);

wire rx_clk_en;
wire tx_clk_en;
wire tx_temp;

baud_gen bg(
    .clock(clk),
    .reset(rst),
    .enb_tx(tx_clk_en),
    .enb_rx(rx_clk_en)
);

UART_Tx tx_inst(
    .clk(clk),
    .wr_en(wr_en),
    .enb(tx_clk_en),
    .rst(rst),
    .data_in(data_in),
    .tx(tx_temp),
    .tx_busy(busy)
);

UART_Rx rx_inst(
    .clk(clk),
    .rst(rst),
    .rx(tx_temp),
    .rdy_clr(rdy_clr),
    .clken(rx_clk_en),
    .rdy(rdy),
    .data_out(data_out)
);

endmodule