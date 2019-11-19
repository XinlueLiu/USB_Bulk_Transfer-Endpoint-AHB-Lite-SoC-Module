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
reg d_mins_sync;
reg d_orig;
reg enable_timer;
reg shift_enable;
reg shift_enable_const;
reg invalid_bit;
reg eop;
reg byte_complete;
reg [7:0] Packet_Data;
reg [7:0] pid;
reg [1:0] sync_status;
reg [1:0] pid_status;
reg check_sync;
reg check_pid;
reg load_pid;
reg load_error;
reg load_done;

sync_high sh1 (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));

sync_low sl1 (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

rcu R1 (.clk(clk), .n_rst(n_rst), .d_edge(), .pid(pid), .byte_complete(byte_complete), .eop(eop), .crc_wrong(), 
        .crc_right(), .sync_status(sync_status), .pid_status(pid_status), .enable_timer(enable_timer), .check_sync(check_sync), .check_pid(check_pid), 
        .load_pid(load_pid), .load_data(load_data), .load_error(load_error), .load_done(load_done));

rx_data_buffer RDB (.clk(clk), .n_rst(n_rst), .byte_complete(byte_complete), .Packet_Data(Packet_Data), .clear(1'b0), .load_data(load_data), 
                    .check_sync(check_sync), .check_pid(check_pid), .load_pid(load_pid), .load_error(load_error), 
                    .load_done(load_done), .sync_status(sync_status), .pid_status(pid_status), .pid(pid), .rx_packet(rx_packet), 
                    .rx_packet_data(rx_packet_data), .store_rx_packet_data(store_rx_packet_data));

decoder D1 (.clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), .shift_enable(shift_enable_const), .d_orig(d_orig));

bit_stuffer_detector BSD (.clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .invalid_bit(invalid_bit));

sr_8bit SR8 (.clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .Packet_Data(Packet_Data));

timer T1 (.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), .invalid_bit(invalid_bit), .shift_enable(shift_enable), 
          .shift_enable_const(shift_enable_const), .byte_count(), .byte_complete(byte_complete));

eop_detector ED1 (.clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), .d_minus_sync(d_minus_sync), .shift_enable(shift_enable), .eop(eop));


endmodule
