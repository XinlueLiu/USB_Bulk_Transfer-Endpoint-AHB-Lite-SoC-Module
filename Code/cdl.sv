// $Id: $
// File name:   cdl.sv
// Created:     11/26/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: cdl.sv

module cdl
(
	input wire clk,
	input wire n_rst,
	// Master Side Inputs
	input wire hsel,
	input wire [6:0] haddr,
	input wire [1:0] htrans,
	input wire [1:0] hsize,
	input wire hwrite,
	input wire [31:0] hwdata,
	input wire [2:0] hburst,
	// Host Side Inputs
	input wire dplus_in,
	input wire dminus_in,
	
	// Master Side Outputs
	output reg [31:0] hrdata,
	output reg hresp,
	output reg hready,
	// Host Side Outputs
	output reg d_mode,
	output reg dplus_out,
	output reg dminus_out
);

	reg rx_data_ready;
	reg rx_transfer_active;
	reg rx_error;
	reg tx_transfer_active;
	reg tx_error;
	reg clear;
	reg buffer_reserved;
	reg [6:0] tx_packet_data_size;
	reg [6:0] buffer_occupancy;
	reg get_tx_packet_data;
	reg [7:0] tx_packet_data;
	reg store_rx_packt_data;
	reg [7:0] rx_packet_data;
	reg [2:0] rx_packet;
	reg [1:0] tx_packet;


ahb_buffer AHB_LITE_SLAVE (.clk(clk), .n_rst(n_rst),
				.hsel(hsel),
				.haddr(haddr),
				.htrans(htrans),
				.hsize(hsize),
				.hwrite(hwrite),
				.hwdata(hwdata),
				.hburst(hburst),
				.hrdata(hrdata),
				.hresp(hresp),
				.hready(hready),
				// protocol controller
				.rx_data_ready(rx_data_ready),
				.rx_transfer_active(rx_transfer_active),
				.rx_error(rx_error),
				.tx_transfer_active(tx_transfer_active),
				.tx_error(tx_error),
				.clear(clear),
				.buffer_reserved(buffer_reserved),
				.tx_packet_data_size(tx_packet_data_size),
				.buffer_occupancy(buffer_occupancy),
				.get_tx_packet_data(get_tx_packet_data),
				.tx_packet_data(tx_packet_data),
				// USB RX
				.store_rx_packet_data(store_rx_packet_data),
				.rx_packet_data(rx_packet_data));


usb_rx USB_RX (.clk(clk), .n_rst(n_rst),
				.d_plus(dplus_in), 
				.d_minus(dminus_in),
				.rx_packet(rx_packet),
				.rx_packet_data(rx_packet_data),
				.store_rx_packet_data(store_rx_packet_data));


usb_tx USB_TX (.clk(clk), .n_rst(n_rst),
				.tx_packet_data(tx_packet_data),
				.tx_packet_size(tx_packet_data_size),
				.tx_packet(tx_packet),
				.dplus_out(dplus_out),
				.dminus_out(dminus_out),
				.get_tx_packet_data(get_tx_packet_data));

protocol_controller PROTOCOL_CONTROLLER (.clk(clk), .n_rst(n_rst),
				.Buffer_Occupancy(buffer_occupancy),
				.TX_Packet_Data_Size(tx_packet_data_size),
				.Buffer_Reserved(buffer_reserved),
				.RX_Packet(rx_packet),
				.RX_Error(rx_error),
				.RX_Transfer_Active(rx_transfer_active),
				.RX_Data_Ready(rx_data_ready),
				.TX_Transfer_Active(tx_transfer_active),
				.TX_Error(tx_error),
				.D_Mode(d_mode),
				.TX_Packet(tx_packet),
				.clear(clear));

endmodule