`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2026 17:33:15
// Design Name: 
// Module Name: UART_top_tb
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

module UART_top_tb;

reg clk;
reg rst;
reg [7:0] data_in;
reg wr_en;
reg rdy_clr;

wire rdy;
wire busy;
wire [7:0] data_out;

integer i;

UART_top dut(
    .rst(rst),
    .data_in(data_in),
    .wr_en(wr_en),
    .clk(clk),
    .rdy_clr(rdy_clr),
    .rdy(rdy),
    .busy(busy),
    .data_out(data_out)
);

initial
begin
    clk = 0;
    rst = 0;
    wr_en = 0;
    rdy_clr = 0;
    data_in = 8'd0;
end

always #5 clk = ~clk;


task send_byte(input [7:0] din);
begin
    @(negedge clk);
    data_in = din;
    wr_en   = 1'b1;

    @(negedge clk);
    wr_en   = 1'b0;
end
endtask


task clear_ready;
begin
    @(negedge clk);
    rdy_clr = 1'b1;

    @(negedge clk);
    rdy_clr = 1'b0;
end
endtask


initial
begin
    rst = 1'b1;
    #20;
    rst = 1'b0;

    for(i = 20; i <= 50; i = i + 1)
    begin
        send_byte(i[7:0]);

        wait(!busy);
        wait(rdy);

        $display("sent = %0d   received = %0d", i, data_out);

        clear_ready;
    end

    #1000;
    $finish;
end

endmodule