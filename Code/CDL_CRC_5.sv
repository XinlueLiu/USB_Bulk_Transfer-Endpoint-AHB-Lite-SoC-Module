// $Id: $
// File name:   CDL_CRC_16GENERATOR.sv
// Created:     11/12/2019
// Author:      Xinlue LIu
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 16 bit rx crc generator

module CDL_CRC_5
(
	input wire clk,
	input wire n_rst,
	input wire input_data, //orginal data + 16 bit 0's
	input wire reset_crc, 
	output reg [4:0] inverted_crc
);

reg [4:0] crc;
reg [4:0] next_crc;

always_ff @ (negedge n_rst, posedge clk)
	begin: REG_LOGIC
	if (!n_rst) begin
		//crc <= 5'b11111;
		crc <= 0;
	end else begin
		crc <= next_crc;
	end
end

assign inv = input_data ^ crc[4];

always_comb 
	begin: CRC_LOGIC
	next_crc = crc;
	if (reset_crc == 1) begin
		next_crc = 5'b11111;
		//next_crc = 0;
	end else begin
		next_crc[4] =  crc[3];
    		next_crc[3] =  crc[2];
		next_crc[2] =  crc[1] ^ inv;
		next_crc[1] =  crc[0];
		next_crc[0] =  inv;
	end
end

always_comb
	begin: Invertion
	inverted_crc = ~crc;
	//inverted_crc = crc;
	end
endmodule 
