// $Id: $
// File name:   CDL_CRC_16GENERATOR.sv
// Created:     11/12/2019
// Author:      Xinlue LIu
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 16 bit rx crc generator

module CDL_CRC_16
(
	input wire clk,
	input wire n_rst,
	input wire input_data, //orginal data
	input wire reset_crc, 
	output reg [15:0] inverted_crc
);

reg [16:0] next_crc;
reg [16:0] crc;
wire inv;

always_ff @ (negedge n_rst, posedge clk)
	begin: REG_LOGIC
	if (!n_rst) begin
		//crc <= '1;
		crc <= 0;
	end else begin
		crc <= next_crc;
	end
end

assign inv = input_data ^ crc[15];

always_comb 
	begin: CRC_LOGIC
	next_crc = crc;
	if (reset_crc == 1) begin
		//next_crc = '1;
		next_crc = 0;
	end else begin //x^16 + x^15 + x^2 + 1
		next_crc[15] = crc[14] ^ inv;
		next_crc[14:3] = crc[13:2];
		next_crc[2] = crc[1] ^ inv;
		next_crc[1] = crc[0];
		next_crc[0] = inv;
		/*next_crc[16] = crc[15];
		next_crc[15] = crc[14] ^ input_data ^ crc[15];
		next_crc[14:3] = crc[13:2];
		next_crc[2] = crc[1] ^ input_data ^ crc[15];
		next_crc[1] = crc[0];
		next_crc[0] = input_data ^ crc[15];*/
	end
end

always_comb
	begin: Invertion
	//inverted_crc = ~crc[15:0];	
	inverted_crc = crc;
	end
endmodule 
