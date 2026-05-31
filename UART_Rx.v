`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2026 17:10:50
// Design Name: 
// Module Name: UART_Rx
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


module UART_Rx(
    input clk,
    input rst,
    input rx,
    input rdy_clr,
    input clken,

    output reg rdy,
    output reg [7:0] data_out
);

parameter RX_STATE_START = 2'b00;
parameter RX_STATE_DATA  = 2'b01;
parameter RX_STATE_STOP  = 2'b10;

reg [1:0] state;
reg [3:0] sample;
reg [3:0] index;
reg [7:0] temp;

always @(posedge clk)
begin
    if(rst)
    begin
        rdy <= 0;
        data_out <= 0;
        state <= RX_STATE_START;
        sample <= 0;
        index <= 0;
        temp <= 0;
    end
    else
    begin
        if(rdy_clr)
            rdy <= 0;

        if(clken)
        begin
            case(state)

            RX_STATE_START:
            begin
                if(!rx || sample != 0)
                    sample <= sample + 1'b1;

                if(sample == 4'd15)
                begin
                    state <= RX_STATE_DATA;
                    sample <= 0;
                    index <= 0;
                    temp <= 0;
                end
            end

            RX_STATE_DATA:
            begin
                sample <= sample + 1'b1;

                if(sample == 4'd8)
                begin
                    temp[index] <= rx;
                    index <= index + 1'b1;
                end

                if(index == 4'd8)
                begin
                    state <= RX_STATE_STOP;
                    sample <= 0;
                end
            end

            RX_STATE_STOP:
            begin
                if(sample == 4'd15)
                begin
                    state <= RX_STATE_START;
                    data_out <= temp;
                    rdy <= 1'b1;
                    sample <= 0;
                end
                else
                    sample <= sample + 1'b1;
            end

            default:
                state <= RX_STATE_START;

            endcase
        end
    end
end

endmodule