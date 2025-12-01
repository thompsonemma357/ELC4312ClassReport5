`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2025 08:32:42 PM
// Design Name: 
// Module Name: led_blinker
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


module led_blinker(
    input logic clk,
    input logic rst,
    input logic [15:0] interval_ms,
    output logic led
    );
    
  logic [31:0] counter;
  logic [31:0] n_counter;
  logic [31:0] interval;
  logic [31:0] n_interval;
  logic led_state;
  logic n_led_state;



    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            led_state <= 0;
            interval <=0;
        end else begin
            counter <= n_counter;
          	led_state <= n_led_state;
          	interval <= n_interval;
        end
    end
  
  	always_comb begin
  	 n_interval = interval_ms;
  	 n_interval = interval_ms << 17;
      if (counter >= interval) begin
        n_counter = 0;
        n_led_state = ~led_state;
      end
      else begin
        n_counter = counter+1;
        n_led_state = led_state;
      end
    end
    
  assign led = led_state;
endmodule
    
