// $Id: $
// File name:   CDL_AHB_LITE_SLAVE.sv
// Created:     11/11/2019
// Author:      Xinlue LIu
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: CDL_AHB_LITE_SLAVE

module ahb_buffer
(
	//to master
	input wire clk,
	input wire n_rst,
	input wire hsel,
	input wire [6:0] haddr,
	input wire [1:0] htrans,
	input wire [1:0] hsize,
	input wire hwrite,
	input wire [31:0] hwdata,
	input wire [2:0] hburst, 
	output reg [31:0] hrdata,
	output reg hresp,
	output reg hready,
	//to protocol controller
	input wire rx_data_ready,
	input wire rx_transfer_active,
	input wire rx_error,
	input wire tx_transfer_active,
	input wire tx_error,
	input wire clear,
	output reg buffer_reserved,
	output reg [6:0] tx_packet_data_size,
	output reg [6:0] buffer_occupancy,
	//to USB_TX
	input wire get_tx_packet_data,
	output reg [7:0] tx_packet_data,
	//TO USB_RX
	input wire store_rx_packet_data,
	input wire [7:0] rx_packet_data
);

typedef enum bit [1:0] {IDLE, READ, WRITE, ERROR} stateType;

stateType STATE;
stateType NXT_STATE;
//73 is for 71 + ptrW & ptrR
reg [73:0][7:0] next_address_mapping;
reg [73:0][7:0] address_mapping;
reg [6:0] next_haddr;
reg [1:0] next_hsize;
reg [7:0] next_tx_packet_data;
// reg [2:0] next_hburst;
reg [7:0] ptrW, next_ptrW; //pointer for write
reg [7:0] ptrR, next_ptrR; //pointer for read
//pointer at the final output logic

always_ff @ (negedge n_rst, posedge clk)
	begin: REG_LOGIC
	if (!n_rst) begin
		STATE <= IDLE;
		address_mapping <= '0;
		next_haddr <= '0;
		next_hsize <= '0;
		ptrW <= 0;
		ptrR <= 0;
		tx_packet_data <= 0;
	end else begin
		STATE <= NXT_STATE;
		address_mapping <= next_address_mapping;
		next_haddr <= haddr;
		next_hsize <= hsize;
		ptrW <= next_ptrW;
		ptrR <= next_ptrR;
		tx_packet_data <= next_tx_packet_data;
	end
end

/*if ((hsel & ((hwrite) & ((haddr >= 7'd64) & (haddr <= 7'd68)))) | ((haddr > 7'd72) | ((haddr >= 68) & (haddr <= 7'd71))) | ((htrans == 2'd3) & (((hburst == 3'd3) & 
    (haddr > 7'd60)) | ((hburst == 3'd5) & (haddr > 7'd56)) | ((hburst == 3'd7) & (haddr > 7'48))))) begin
    NXT_STATE = ERROR;*/

always_comb
	begin: NXT_LOGIC_CONTROLLER
	NXT_STATE = STATE;
	case(STATE)
	IDLE: begin
		if ((hsel & ((hwrite) & ((haddr >= 7'd64) & (haddr <= 7'd68)))) | ((haddr > 7'd72) | ((haddr >= 7'd68) & (haddr <= 7'd71))) | ((htrans == 2'd3) & (((hburst == 3'd3) & 
		      (haddr > 7'd60)) | ((hburst == 3'd5) & (haddr > 7'd56)) | ((hburst == 3'd7) & (haddr > 7'd48))))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (!hwrite)) begin
			NXT_STATE = READ;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (hwrite)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	READ: begin
		if ((hsel & ((hwrite) & ((haddr >= 7'd64) & (haddr <= 7'd68)))) | ((haddr > 7'd72) | ((haddr >= 7'd68) & (haddr <= 7'd71))) | ((htrans == 2'd3) & (((hburst == 3'd3) & 
		      (haddr > 7'd60)) | ((hburst == 3'd5) & (haddr > 7'd56)) | ((hburst == 3'd7) & (haddr > 7'd48))))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (!hwrite)) begin
			NXT_STATE = READ;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (hwrite)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	WRITE: begin
		if ((hsel & ((hwrite) & ((haddr >= 7'd64) & (haddr <= 7'd68)))) | ((haddr > 7'd72) | ((haddr >= 7'd68) & (haddr <= 7'd71))) | ((htrans == 2'd3) & (((hburst == 3'd3) & 
		      (haddr > 7'd60)) | ((hburst == 3'd5) & (haddr > 7'd56)) | ((hburst == 3'd7) & (haddr > 7'd48))))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (!hwrite)) begin
			NXT_STATE = READ;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (hwrite)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	ERROR: begin
		if ((hsel & ((hwrite) & ((haddr >= 7'd64) & (haddr <= 7'd68)))) | ((haddr > 7'd72) | ((haddr >= 7'd68) & (haddr <= 7'd71))) | ((htrans == 2'd3) & (((hburst == 3'd3) & 
		      (haddr > 7'd60)) | ((hburst == 3'd5) & (haddr > 7'd56)) | ((hburst == 3'd7) & (haddr > 7'd48))))) begin
			NXT_STATE = ERROR;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (!hwrite)) begin
			NXT_STATE = READ;
		end else if ((hsel) & ((htrans == 2'd2) | (htrans == 2'd3)) & (hwrite)) begin
			NXT_STATE = WRITE;
		end else begin
			NXT_STATE = IDLE;
		end
	end
	endcase
end

always_comb
	begin: ERROR_LOGIC
	hresp = 0;
	//write to read only addresses & increment k mode that exceeds the limit
		if ((hsel & ((hwrite) & ((haddr >= 7'd64) & (haddr <= 7'd68)))) | ((haddr > 7'd72) | ((haddr >= 7'd68) & (haddr <= 7'd71))) | ((htrans == 2'd3) & (((hburst == 3'd3) & 
		      (haddr > 7'd60)) | ((hburst == 3'd5) & (haddr > 7'd56)) | ((hburst == 3'd7) & (haddr > 7'd48))))) begin
		hresp = 1;
	end
end

always_comb
	begin: HREADY_LOGIC
	hready = 1;

	if (hsel == 1) begin
		if (hresp == 1) begin
			if (STATE == ERROR) begin
				hready = 1;
			end else begin
				hready = 0;
			end
		end
	end
end

assign tx_packet_data_size = address_mapping[72];

always_comb
	begin: OUTPUT_LOGIC_INTERMEDIATE
	next_address_mapping = address_mapping;
	next_ptrW = ptrW;
	next_ptrR = ptrR;
	hrdata = '0;
	next_tx_packet_data = tx_packet_data;

	next_address_mapping[64] = rx_data_ready;
	if (rx_transfer_active) begin
		next_address_mapping[65] = 8'd1;
	end else if (tx_transfer_active) begin
		next_address_mapping[65] = 8'b00000010;
	end

	if (rx_error == 1) begin
		next_address_mapping[66] = 8'd1;
	end 
	if (tx_error == 1) begin
		next_address_mapping[67] = 8'd1;
	end
	
	//original data_buffer
	if (clear) begin
		next_address_mapping[63:0] = 0;
		next_ptrW = 0;
		next_ptrR = 0;
	end
	if (store_rx_packet_data) begin
		next_address_mapping[ptrW] = rx_packet_data;
		next_ptrW = ptrW + 1;
	end
	if (get_tx_packet_data) begin
		next_tx_packet_data = address_mapping[ptrR];
		next_ptrR = ptrR + 1;
	end

	//store buffer_occupancy to register for master to read
	buffer_occupancy = ptrW - ptrR;
	next_address_mapping[68] = buffer_occupancy;
	buffer_reserved = hsel & hwrite;
	

	//endpoint to host transfer
	if (STATE == WRITE) begin
		if (next_haddr == 72)
			next_address_mapping[72] = hwdata[7:0];
		else if ((next_haddr >= 0) && (next_haddr <= 64)) begin
			if (next_hsize == 2'd0) begin
				if (buffer_occupancy != tx_packet_data_size) begin
					next_address_mapping[ptrW] = hwdata[7:0];
					next_ptrW = ptrW + 1;
				end
			end else if (next_hsize == 2'd1) begin
				if (buffer_occupancy != tx_packet_data_size) begin
					next_address_mapping[ptrW] = hwdata[7:0];
					next_address_mapping[ptrW + 1] = hwdata[15:8];
					next_ptrW = ptrW + 2;
				end
			end else if ((next_hsize == 2'd2) | (next_hsize == 2'd3)) begin
				if (buffer_occupancy != tx_packet_data_size) begin
					next_address_mapping[ptrW] = hwdata[7:0];
					next_address_mapping[ptrW + 1] = hwdata[15:8];
					next_address_mapping[ptrW + 2] = hwdata[23:16];
					next_address_mapping[ptrW + 3] = hwdata[31:24];
					next_ptrW = ptrW + 4;
				end
			end
		end
	end

	if (!tx_transfer_active) begin
		next_address_mapping[72] = 0;
	end
	
	if (address_mapping[64] == 1) begin
		if (STATE == READ) begin
			if (next_hsize == 2'd0) begin
				if (ptrR <= ptrW) begin
					hrdata[15:0] = {8'b0, address_mapping[ptrR]};
					hrdata[31:16] = 0;
					next_ptrR = ptrR + 1;
				end
			end else if (next_hsize == 2'd1) begin
				if (ptrR <= ptrW) begin
					hrdata[15:0] = {address_mapping[ptrR+1], address_mapping[ptrR]};
					hrdata[31:16] = 0;
					next_ptrR = ptrR + 2;
				end
			end else if ((next_hsize == 2'd2)|(next_hsize == 2'd3)) begin
				if (ptrR <= ptrW) begin
					hrdata[15:0] = {address_mapping[ptrR+1], address_mapping[ptrR]};
					hrdata[31:16] = {address_mapping[ptrR+3], address_mapping[ptrR + 2]};
					next_ptrR = ptrR + 4;
				end
			end
		end
	end
	// ??? address 72
	//next_address_mapping[72] = ptrW;
	//next_address_mapping[73] = ptrR;
end


/*always_comb
	begin: TO_MASTER_LOGIC

	hrdata = '0;
	ptrW_i = address_mapping[72];
	ptrR_i = address_mapping[73];

	if (address_mapping[64] == 1) begin
		if (STATE == READ) begin
			if (next_hsize == 2'd0) begin
				if (ptrR_i <= ptrW_i) begin
					hrdata[15:0] = {8'b0, address_mapping[ptrR_i]};
					hrdata[31:16] = 0;
					ptrR_i = ptrR_i + 1;
				end
			end else if (next_hsize == 2'd1) begin
				if (ptrR_i <= ptrW_i) begin
					hrdata[15:0] = {address_mapping[ptrR_i+1], address_mapping[ptrR_i]};
					hrdata[31:16] = 0;
					ptrR_i = ptrR_i + 2;
				end
			end else if ((next_hsize == 2'd2)|(next_hsize == 2'd3)) begin
				if (ptrR_i <= ptrW_i) begin
					hrdata[15:0] = {address_mapping[ptrR_i+1], address_mapping[ptrR_i]};
					hrdata[31:16] = {address_mapping[ptrR_i+3], address_mapping[ptrR_i + 2]};
					ptrR_i = ptrR_i + 4;
				end
			end
		end
	end
end*/
endmodule
