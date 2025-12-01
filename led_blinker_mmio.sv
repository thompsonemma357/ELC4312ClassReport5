`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 12:13:25 PM
// Design Name: 
// Module Name: led_blinker_mmio
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


module led_blinker_mmio(
    input logic clk,
    input logic rst,
    input logic cs,
    input logic wr_en,
    input logic [1:0] address,
    input logic [15:0] wr_data,
    output logic led
    );
    
    logic [15:0] interval_ms;
    
    led_blinker core(
        .clk(clk),
        .rst(rst),
        .interval_ms(interval_ms),
        .led(led)
        );

    always_ff @(posedge clk) begin
        if (wr_en && address == 2'd0 && cs)
            interval_ms <= wr_data;
    end
    
endmodule
