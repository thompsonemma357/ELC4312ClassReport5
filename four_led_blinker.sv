`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2025 08:48:07 PM
// Design Name: 
// Module Name: four_led_blinker
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


module four_led_blinker(
    input logic clk,
    input logic rst,
    input logic cs,
    input logic wr_en,
    input logic [3:0] address,
    input logic [15:0] wr_data,
    output logic [3:0] led_flash
);

    led_blinker_mmio blink0 (
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .wr_en(wr_en && address[3:2] == 2'd0),
        .address(address[1:0]),
        .wr_data(wr_data),
        .led(led_flash[0])
    );

    led_blinker_mmio blink1 (
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .wr_en(wr_en && address[3:2] == 2'd1),
        .address(address[1:0]),
        .wr_data(wr_data),
        .led(led_flash[1])
    );

    led_blinker_mmio blink2 (
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .wr_en(wr_en && address[3:2] == 2'd2),
        .address(address[1:0]),
        .wr_data(wr_data),
        .led(led_flash[2])
    );

    led_blinker_mmio blink3 (
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .wr_en(wr_en && address[3:2] == 2'd3),
        .address(address[1:0]),
        .wr_data(wr_data),
        .led(led_flash[3])
    );
endmodule
