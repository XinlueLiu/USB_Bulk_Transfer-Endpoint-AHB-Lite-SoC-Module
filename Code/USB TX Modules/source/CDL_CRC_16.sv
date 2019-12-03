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
	input wire clk12,
	input wire input_data, //orginal data
	input wire reset_crc, 
	output reg [15:0] inverted_crc
);

reg [15:0] next_crc;
reg [15:0] crc;

always_ff @ (negedge n_rst, posedge clk)
	begin: REG_LOGIC
	if (!n_rst) begin
		crc <= 0;
	end else begin
		crc <= next_crc;
	end
end


assign inv = input_data ^ crc[15];
	
always_comb 
	begin: CRC_LOGIC
if(clk12 == 1'b1) begin

	next_crc = crc;
	if (reset_crc == 1) begin
		next_crc = 16'h0000;
		//next_crc = 0;
	end else begin //x^16 + x^15 + x^2 + 1
		next_crc[15] = crc[14] ^ inv;
		next_crc[14:3] = crc[13:2];
		next_crc[2] = crc[1] ^ inv;
		next_crc[1] = crc[0];
		next_crc[0] = inv;
	end
end
	else begin
		next_crc = crc;
	end
end

always_comb
	begin: Invertion
	inverted_crc = crc;	
	//inverted_crc = crc;
	end
endmodule 
