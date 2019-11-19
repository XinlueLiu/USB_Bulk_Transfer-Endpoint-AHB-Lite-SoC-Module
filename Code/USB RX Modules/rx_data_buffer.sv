// $Id: $
// File name:   rx_data_buffer.sv
// Created:     11/11/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: RX Data Buffer
module rx_data_buffer(input wire clk,
                      input wire n_rst,
                      input wire byte_complete,
                      input wire [7:0] Packet_Data,
                      input wire clear,
                      input wire load_data,
                      input wire check_sync,
                      input wire check_pid,
                      input wire load_pid,
                      input wire load_error,
                      input wire load_done,
                      output reg [1:0] sync_status,
                      output reg [1:0] pid_status,
                      output reg [7:0] pid,
                      output reg [2:0] rx_packet,
                      output reg [7:0] rx_packet_data,
                      output reg store_rx_packet_data);
parameter IDLE = 3'b000;
parameter IN = 3'b001;
parameter OUT = 3'b010;
parameter ACK = 3'b011;
parameter ERROR = 3'b100;
parameter DONE = 3'b101;
parameter NACK = 3'b110;

reg [7:0] next_pid; 
reg [7:0] temp_pid;
reg [7:0] sync_byte;
reg [7:0] next_rx_packet_data;
reg next_store_rx_packet_data;
reg [2:0] next_rx_packet;

always_ff @ (posedge clk, negedge n_rst) 
begin
  if(n_rst == 1'b0) begin
    pid <= 8'b0;
    rx_packet_data <= 8'b0;
    rx_packet <= IDLE;
  end
  else begin
    pid <= next_pid;
    rx_packet_data <= next_rx_packet_data;
    store_rx_packet_data <= next_store_rx_packet_data;
    rx_packet <= next_rx_packet;
  end
end


always_comb 
begin : PACKET_DATA_LOGIC
  next_pid = pid;
  temp_pid = pid;
  sync_byte = 8'b0;
  next_rx_packet_data = rx_packet_data;
  if(byte_complete && load_pid) begin
    next_pid = Packet_Data;
    temp_pid = Packet_Data;
  end
  if(byte_complete && load_data) begin
    next_rx_packet_data = Packet_Data;
    next_store_rx_packet_data = 1'b1;
  end
  else begin
    next_store_rx_packet_data = 1'b0;    
  end
  if(check_sync && byte_complete) begin
      sync_byte = Packet_Data;
  end
end

always_comb 
begin : ERROR_CHECKING_LOGIC
 if(check_pid && byte_complete) begin
    if(temp_pid[0] != !temp_pid[4] || temp_pid[1] != !temp_pid[5] || temp_pid[2] != !temp_pid[6] || temp_pid[3] != !temp_pid[7]) begin
       pid_status = 2'b10;
    end
    else begin
       pid_status = 2'b01;
    end
 end
 else begin
    pid_status = 2'b0;
 end
 if(check_sync && byte_complete) begin
    if(sync_byte == 8'b00000001) begin
       sync_status = 2'b01;
    end
    else begin
      sync_status = 2'b10;
    end
 end
 else begin
    sync_status = 2'b0;
 end
end

always_comb 
begin : RX_PACKET_LOGIC
  next_rx_packet = rx_packet;
  if(pid == 4'b1001) begin
     next_rx_packet = IN;
  end
  else if(pid == 4'b0001) begin
     next_rx_packet = OUT;
  end
  else if(load_error) begin
    next_rx_packet = ERROR;
  end
  else if(pid == 4'b0010) begin
    next_rx_packet = ACK;
  end
  else if(pid == 4'b1010) begin
    next_rx_packet = NACK;
  end
  else if(load_done) begin
    next_rx_packet = DONE;
  end
end
endmodule
