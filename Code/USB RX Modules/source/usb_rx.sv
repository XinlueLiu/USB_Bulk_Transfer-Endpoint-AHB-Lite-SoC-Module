// $Id: $
// File name:   usb_rx.sv
// Created:     11/12/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: USB Receiver (RX) Module
module usb_rx(input wire clk,
              input wire n_rst,
              input wire d_plus,
              input wire d_minus,
              output reg [2:0] rx_packet,
              output reg [7:0] rx_packet_data,
              output reg store_rx_packet_data);
reg d_plus_sync;
reg d_minus_sync;
reg d_orig;
reg enable_timer;
reg shift_enable;
reg shift_enable_const;
reg invalid_bit;
reg eop_detected;
reg byte_complete;
reg [7:0] Packet_Data;
reg [1:0] sync_status;
reg [2:0] pid_status;
reg [1:0] crc_status;
reg check_sync;
reg check_pid;
reg load_sync;
reg load_pid;
reg load_error;
reg load_done;
reg crc_check_5;
reg crc_check_16;
reg d_edge;
reg [4:0] crc_5bit;
reg [15:0] crc_16bit;
reg clear;


sync_high sync_high (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));

sync_low sync_low (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

start_bit_det Start_bit_detector (.clk(clk), .n_rst(n_rst), .serial_in(d_plus_sync), .start_bit_detected(d_edge));

rcu controller_rcu (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .byte_complete(byte_complete), .eop_detected(eop_detected), 
        .crc_check_5(crc_check_5), 
        .crc_check_16(crc_check_16), .sync_status(sync_status), .pid_status(pid_status), .crc_status(crc_status), .enable_timer(enable_timer), .clear(clear), 
	.check_pid(check_pid), .check_sync(check_sync), 
        .load_sync(load_sync), .load_pid(load_pid), .load_data(load_data), .load_error(load_error), .load_done(load_done));

rx_data_buffer Rx_data_buffer (.clk(clk), .n_rst(n_rst), .byte_complete(byte_complete), .Packet_Data(Packet_Data), .clear(clear), .load_data(load_data), 
                    .load_sync(load_sync), .load_pid(load_pid), .load_error(load_error), .load_done(load_done), 
                    .check_sync(check_sync), .check_pid(check_pid), .crc_check_5(crc_check_5), .crc_check_16(crc_check_16),   
                     .crc_5bit(crc_5bit), .crc_16bit(crc_16bit), .sync_status(sync_status), .pid_status(pid_status), .rx_packet(rx_packet), 
                    .rx_packet_data(rx_packet_data), .store_rx_packet_data(store_rx_packet_data), .crc_status(crc_status));

decoder Decoder (.clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), .d_minus_sync(d_minus_sync), .shift_enable(shift_enable_const), .d_orig(d_orig), .eop_detected(eop_detected));
//decoder Decoder (.clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), .d_orig(d_orig));

bit_stuffer_detector bit_stuffer (.clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .invalid_bit(invalid_bit));

sr8_bit sr_8bit (.clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .Packet_Data(Packet_Data));

timer Timer (.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .invalid_bit(invalid_bit), .eop_detected(eop_detected), .shift_enable(shift_enable), 
          .shift_enable_const(shift_enable_const), .byte_complete(byte_complete));

//eop_detector EOP_detector (.clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), .d_minus_sync(d_minus_sync), .shift_enable(shift_enable), .eop(eop));

CDL_CRC_16 CRC_16bit (.clk(shift_enable), .n_rst(n_rst), .input_data(d_orig), .reset_crc(1'b0), .inverted_crc(crc_16bit));

CDL_CRC_5 CRC_5bit (.clk(shift_enable), .n_rst(n_rst), .input_data(d_orig), .reset_crc(1'b0), .inverted_crc(crc_5bit));


endmodule
