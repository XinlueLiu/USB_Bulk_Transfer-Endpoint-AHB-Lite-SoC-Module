// $Id: $
// File name:   decoder.sv
// Created:     11/11/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decoder Module for USB RX
module decoder(input wire clk,
               input wire n_rst,
               input wire d_plus_sync,
	       input wire d_minus_sync,
	       input wire shift_enable,
               output reg d_orig,
	       output reg eop_detected);
reg next_d_plus_sync;
reg next_d_orig;
reg next_d_minus_sync;
reg next_eop_detected;

always_ff @ (posedge clk, negedge n_rst) 
begin
  if(n_rst == 1'b0) begin
    next_d_plus_sync <= 1'b1;
    d_orig <= 1'b1;
    next_d_minus_sync <= 1'b0;
    eop_detected <= 1'b0;
  end
  else begin
    next_d_plus_sync <= d_plus_sync;
    d_orig <= next_d_orig;
    next_d_minus_sync <= d_minus_sync;  
    eop_detected <= next_eop_detected;
  end
end

always_comb 
begin
  next_d_orig = d_orig;
  //if (shift_enable) begin
  	if(next_d_plus_sync == d_plus_sync) begin
     	next_d_orig = 1'b1;
  	end
  	else begin
    	next_d_orig = 1'b0;
  	end
  	end
   //end
always_comb
begin
	next_eop_detected = eop_detected;
	eop_detected = 0;
	if ((next_d_minus_sync == 0) && (next_d_plus_sync == 0)) begin
		next_eop_detected = 1'b1;
		//eop_detected = 1'b1;
	end
end

endmodule
