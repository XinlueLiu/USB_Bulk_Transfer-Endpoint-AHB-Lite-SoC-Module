module usb_tx(
input wire [7:0] tx_packet_data,
input wire [6:0] tx_packet_size,
input wire [2:0] tx_packet,
input wire n_rst,
input wire clk,
output reg dplus_out,
output reg dminus_out,
output reg tx_transfer_active,
output reg tx_error,
output reg get_tx_packet_data
);
reg clk12,ack,en_pts,en_enc,bit_stuff_en,serial_out,bit8;
reg [15:0]CRC;
reg [3:0] data_id;
reg [7:0] parallel_out,datatopts;
usb_controller A(.clk(clk12),
		.n_rst(n_rst),
		.tx_data(tx_packet_data),
		.tx_packet(tx_packet),
		.ack(ack),
		.tx_packet_size(tx_packet_size),
		.CRC(CRC),
		.prev_parallel(parallel_out),
		.bit_stuff_en(bit_stuff_en),
		.en(en_pts),
		.get_tx(get_tx_packet_data),
		.tx_err(tx_error),
		.tx_transfer_active(tx_transfer_active),
		.enc_en(en_enc),
		.data(datatopts));
	
usb_bit_stuffer B(.clk(clk12),
		.n_rst(n_rst),
		.serial_in(serial_out),
		.data_id(data_id),
		.bit_stuff_en(bit_stuff_en));

usb_pts C(	.clk(clk12),
		.n_rst(n_rst),
		.data(datatopts),
		.en(en_pts),
		.serial_data(serial_out),
		.prev_parallel(parallel_out));
usb_encoder D(	.clk(clk12),
		.n_rst(n_rst),
		.en(en_enc),
		.serial_out(serial_out),
		.stuff_bit_en(bit_stuff_en),
		.dminus_out(dminus_out),
		.dplus_out(dplus_out));

usb_crc_gen E(	.clk(clk12),
		.n_rst(n_rst),
		.serial_out(serial_out),
		.data_id(data_id),
		.CRC(CRC));
usb_timer F(	.clk100(clk),
		.n_rst(n_rst),
		.serial_out(serial_out),
		.clk12(clk12),
		.bytecomplete(bit8));

endmodule
