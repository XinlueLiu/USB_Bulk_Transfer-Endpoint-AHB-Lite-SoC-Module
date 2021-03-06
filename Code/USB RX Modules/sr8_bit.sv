// $Id: $
// File name:   sr8_bit.sv
// Created:     11/17/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 8-bit shift register USB RX

module sr8_bit
(
  input wire clk,
  input wire n_rst,
  input wire d_orig,
  input wire shift_enable,
  output wire [7:0] Packet_Data
);

reg next_d_orig1;
reg next_d_orig2;
reg next_d_orig3;
reg next_d_orig4;
reg next_d_orig5;
reg next_d_orig6;
reg next_d_orig7;
reg next_d_orig8;
reg next_d_orig9;
//reg next_d_orig10; //only after each 8 bits activate this or shift_enable and serial in wont be allined
reg copy_d_orig;

assign copy_d_orig = d_orig;

always_ff @(posedge clk, negedge n_rst) begin
  if(n_rst == 1'b0) begin
    next_d_orig1 <= '0;
    next_d_orig2 <= '0;
    next_d_orig3 <= '0;
    next_d_orig4 <= '0;
    next_d_orig5 <= '0;
    next_d_orig6 <= '0;
    next_d_orig7 <= '0;
    next_d_orig8 <= '0;
    next_d_orig9 <= '0;
    //next_d_orig10 <= '0;
  end
  else begin
    next_d_orig1 <= copy_d_orig;
    next_d_orig2 <= next_d_orig1;
    next_d_orig3 <= next_d_orig2;
    next_d_orig4 <= next_d_orig3;
    next_d_orig5 <= next_d_orig4;
    next_d_orig6 <= next_d_orig5;
    next_d_orig7 <= next_d_orig6;
    next_d_orig8 <= next_d_orig7;
    next_d_orig9 <= next_d_orig8;
    //next_d_orig10 <= next_d_orig9;
  end
end


  flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0))
  FLEX_COUNTER(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(next_d_orig9),
    .shift_enable(shift_enable),
    .parallel_out(Packet_Data)
  );


endmodule
