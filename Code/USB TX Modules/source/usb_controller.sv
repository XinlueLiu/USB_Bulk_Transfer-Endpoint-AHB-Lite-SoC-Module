module usb_controller(
input wire clk,
input wire n_rst,
input wire clk12,
input wire [1:0]tx_packet,
input wire [7:0]tx_packet_data,
input wire [6:0]tx_packet_data_size,
input wire [15:0]CRC,
input wire serial_out,
input wire [7:0] prev_parallel,
input wire bytecomplete,
input wire bytealmostcomplete,
input wire bit_stuff_en,
output reg eop_en,
output reg eop_reset,
output reg en,
output reg CRC_en,
output reg [7:0]nxt_data,
output reg enc_en,
output reg timer_en,
output reg get_tx_packet_data
);
reg[15:0] stored_crc;
reg nxt_eop_en,nxt_eop_reset;
reg [2:0] tx_pack = 3'b000;
typedef enum bit [3:0]{IDLE,
			SYNC,
			PID,
			DATA,
			STUFFER_BIT,
			CRC1,
			CRC2,
			WAIT1,
			WAIT2,
			EOP1,
			EOP2,
			EOP3
}StateType;
StateType state,nxt_state;
reg[6:0] current_packet;
reg [1:0]stored_packet;
reg data_sent;
reg data_set,nxt_data_set;
reg count_packet,nxt_count_packet;
reg nxt_get_tx_packet_data;
reg nxt_en,nxt_CRC_en,nxt_enc_en,nxt_timer_en;
reg [7:0] data;
always_ff@(posedge clk,negedge n_rst) begin
	if(n_rst == 1'b0) begin
		state<= IDLE;
		eop_en<=1'b0;
		eop_reset<=1'b0;
		en<=1'b0;	
		CRC_en<=1'b0;
		enc_en<=1'b0;
		timer_en<=1'b0;
		//data<= 8'b0;
		data_set<=1'b0;
		count_packet<= 1'b0;
		get_tx_packet_data<=1'b0;
	end
	else begin
		eop_en<=nxt_eop_en;
		eop_reset<=nxt_eop_reset;
		state<=nxt_state;
		//data<=nxt_data;
		en<=nxt_en;
		CRC_en<=nxt_CRC_en;
		enc_en<=nxt_enc_en;
		timer_en<=nxt_timer_en;
		data_set<=nxt_data_set;
		count_packet<=nxt_count_packet;
		get_tx_packet_data<=nxt_get_tx_packet_data;
	end
end
flex_counter3#(7) X(.clk(clk),
		  .count_enable(nxt_get_tx_packet_data),
		  .clear(1'b0),
		  .n_rst(n_rst),
		  .halt(bit_stuff_en),
  .count_out(cnt_out),
		  .rollover_flag(data_sent),
	      .rollover_value(tx_packet_data_size +1'b1));


always_comb begin
	nxt_count_packet = bytecomplete&&data_set;
	case(state)
	IDLE:begin
		nxt_enc_en = 1'b0;
		nxt_eop_reset = 1'b0;
		if(tx_packet != 2'b00) begin
			nxt_state = SYNC;
			stored_packet = tx_packet;
			nxt_timer_en = 1'b1;
			nxt_en = 1'b1;
			nxt_enc_en = 1'b1;
			nxt_data = 8'b10000000;
		end
		else begin
			nxt_en = 1'b0;
			nxt_state = IDLE;
		end
	end
	SYNC:begin
		if(bytecomplete == 1'b1&&clk12 ==1'b1) begin
			nxt_state = PID;
			nxt_en = 1'b1;
			if(stored_packet ==2'b01) begin
					nxt_data = 8'b00111100;
				end
			else if(stored_packet == 2'b10) begin
					nxt_data = 8'b10100101;
			end
			else begin
				nxt_data = 8'b00100100;	
			end
		end
		else begin
			nxt_en = 1'b0;
			nxt_state = SYNC;
		end
	end
	PID:begin
		nxt_get_tx_packet_data = 1'b0;
		if(bytealmostcomplete == 1'b1&&clk12 == 1'b1 && stored_packet == 2'b01) begin
			nxt_get_tx_packet_data = 1'b1;
			end		
		if(bytecomplete == 1'b1&&clk12 == 1'b1) begin
			if(stored_packet ==2'b01) begin
				nxt_state = DATA;
				nxt_en = 1'b1;
				nxt_CRC_en = 1'b1;
				nxt_data = tx_packet_data;
				
			end
			else if (stored_packet == 2'b10) begin
				nxt_state =EOP1;
			end
			else begin
				nxt_state = EOP1;
				
			end
		end
		else begin
			nxt_en = 1'b0;
			nxt_state = PID;
		end
	end
	DATA:begin
		nxt_get_tx_packet_data = 1'b0;
		nxt_count_packet = 1'b0;
		
		if(bit_stuff_en == 1'b1) begin	
			nxt_state = STUFFER_BIT;
		end
		else if(bytecomplete == 1'b1 && data_sent == 1'b1 && clk12 == 1'b1) begin
				nxt_state = CRC1;
				stored_crc = CRC;
				nxt_data = CRC[7:0];
				nxt_en = 1'b1;	
				nxt_CRC_en = 1'b0;			
				//nxt_state = WAIT1;
				//nxt_data = 8'b00000000;
				//nxt_en = 1'b1;
				//nxt_CRC_en = 1'b0;
		end
		else if(bytecomplete == 1'b1&&clk12 == 1'b1) begin
			nxt_state = DATA;
			nxt_en = 1'b1;
			nxt_data = tx_packet_data;
		end
		else if(bytealmostcomplete == 1'b1&&clk12 == 1'b1) begin
			nxt_get_tx_packet_data = 1'b1;
			end
		else begin
			nxt_state = DATA;
			nxt_en = 1'b0;
		end
	end
	STUFFER_BIT: begin
		
		if(clk12 == 1'b1 && bytecomplete == 1'b1&&data_sent == 1'b1) begin
		nxt_state = CRC1;
		stored_crc = CRC;
		nxt_data = CRC[7:0];

		nxt_en = 1'b1;		
		end
		else if(clk12 == 1'b1 && bytecomplete == 1'b1) begin
		nxt_state = DATA;
		end
		else begin
		nxt_state = STUFFER_BIT;
		
		end
		end
	WAIT1:begin
		nxt_en = 1'b0;
		if(bytecomplete == 1'b1 && clk12 == 1'b1) begin
			nxt_state = WAIT2;
			nxt_en = 1'b1;
			nxt_data = 8'b00000000;		
		end
		else begin
			nxt_state = WAIT1;
			nxt_en = 1'b0;
		end
	end
	WAIT2:begin
		
		if(bytecomplete == 1'b1 && clk12 == 1'b1) begin
			nxt_state = CRC1;
			stored_crc = CRC;
			nxt_data = CRC[7:0];
			nxt_en = 1'b1;
		end
		else begin
			nxt_state = WAIT2;
			nxt_en = 1'b0;
		end
	end
	CRC1:begin
		if(bytecomplete == 1'b1 && clk12 == 1'b1) begin
			nxt_state = CRC2;
			nxt_en = 1'b1;		
			nxt_data = stored_crc[15:8];
		end
		else begin
			nxt_en = 1'b0;
			nxt_state = CRC1;
		end
	end
	CRC2:begin	

		nxt_en = 1'b0;
		if(bytealmostcomplete == 1'b1 && clk12 == 1'b1) begin
		end
		if(bytecomplete == 1'b1 && clk12 == 1'b1) begin
			nxt_state = EOP1;
			nxt_eop_en = 1'b1;
		end
		else begin
			nxt_state = CRC2;
		end
	end
	EOP1:begin
	nxt_eop_en = 1'b1;
	if(clk12 == 1'b1) begin
		nxt_state = EOP2;
		nxt_eop_en = 1'b1;
	end
	else begin
		nxt_state = EOP1;
	end	
	end
	EOP2:begin
	if(clk12 == 1'b1) begin		
		nxt_state = EOP3;
		nxt_eop_en = 1'b0;
		nxt_eop_reset = 1'b1;
	end 
	else begin
		nxt_state = EOP2;
	end
	end
	EOP3:begin
	if(clk12 == 1'b1) begin	
		nxt_state = IDLE;
		nxt_en = 1'b0;
		nxt_timer_en = 1'b0;
		nxt_eop_reset = 1'b1;
	end
	else begin
		nxt_state = EOP3;
	end
	end
endcase
end			
endmodule




			
			

