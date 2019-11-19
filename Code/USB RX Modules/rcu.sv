// $Id: $
// File name:   rcu.sv
// Created:     11/11/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit for USB Receiver
module rcu(input wire clk,
           input wire n_rst,    
           input wire d_edge,
           input wire [7:0] pid,
           input wire byte_complete,
           input wire eop,
           input wire crc_wrong,
           input wire crc_right,
           input wire [1:0] sync_status,
           input wire [1:0] pid_status,
           output reg enable_timer,
           output reg check_sync,
           output reg check_pid,
           output reg load_pid,
           output reg load_data,
           output reg load_error,
           output reg load_done);

typedef enum bit [3:0] {IDLE, RECEIVE, SYNC, PID, DATAINOUT, DATA01, CHECK5, CHECK16, ERROR, DONE} stateType;
stateType state;
stateType next_state;


always_ff @(posedge clk, negedge n_rst) begin
  if(n_rst == 1'b0) begin
    state <= IDLE;
  end
  else begin
    state <= next_state;
  end
end

always_comb 
begin : NEXT_STATE_LOGIC
  next_state = state;
  case(state) 
    IDLE:
    begin
      if(d_edge) begin
         next_state = RECEIVE;
      end
      else begin
         next_state = IDLE;
      end
    end
    RECEIVE:
    begin
      next_state = SYNC;
    end
// do I need a receive state to enable the timer or not?
    SYNC:
    begin
     if(byte_complete && sync_status == 2'b01) begin
       next_state = PID;
     end
     else if(sync_status == 2'b0) begin
       next_state = SYNC;
     end
     else if(sync_status == 2'b10) begin
        next_state = ERROR;
     end
    end
    PID:
    begin
      if(byte_complete && (pid_status == 2'b01) &&((pid == 4'b0010) || (pid == 4'b1010) || (pid == 4'b1110))) begin
        next_state = DONE;
      end
      else if (byte_complete && ((pid == 4'b0001) || (pid == 4'b1001))) begin 
        next_state = DATAINOUT;
      end
      else if(byte_complete && ((pid == 4'b0010) || (pid == 4'b1010))) begin
        next_state = DATA01;
      end
      else if(byte_complete && (pid == 4'b0000)) begin
        next_state = PID;
      end
      else if(pid_status == 2'b10) begin
         next_state = ERROR;
      end
      else begin
         $display("Error, either timing was off or an invalid pid was given.");
      end
    end
    DATAINOUT:
    begin
       if(eop != 1'b1) begin
          next_state = DATAINOUT;
       end
       else begin
          next_state = CHECK5;
       end
    end
    DATA01:
    begin
       if(eop != 1'b1) begin
         next_state = DATA01;
       end
       else begin
         next_state = CHECK16;
       end
    end
// right now I have it set up like this because it is more ideal. It needs to be reflecting the actual output of the two CRC checkers.
// Do I need a stop state to disable the timer or does stopping it at the check states suffice?
    CHECK5:
    begin // TODO: Update to work based on actual CRC checker outputs
      if(crc_wrong == 1'b1) begin
        next_state = ERROR;
      end
      else if(crc_right == 1'b1) begin
        next_state = DONE;
      end
      else begin
        next_state = CHECK5;
      end
    end
    CHECK16:
    begin // TODO: Update to work based on actual CRC checker outputs
      if(crc_wrong == 1'b1) begin
        next_state = ERROR;
      end
      else if(crc_right == 1'b1) begin
        next_state = DONE;
      end
      else begin
        next_state = CHECK16;
      end
    end
    ERROR:
    begin
      next_state = DONE;
    end
    DONE:
    begin
      next_state = IDLE;
    end
  endcase
end

always_comb 
begin : OUTPUT_LOGIC
  if(state == RECEIVE) begin
    enable_timer = 1'b1;
  end
  if(state == SYNC) begin
    check_sync = 1'b1;
  end
  else begin
    check_sync = 1'b0;
  end
  if(state == PID) begin
    load_pid = 1'b1;
    check_pid = 1'b1;
  end
  else begin
    load_pid = 1'b0;
    check_pid = 1'b0;
  end
  if((state == DATA01) || (state == DATAINOUT)) begin
    load_data = 1'b1;
  end
  else begin
    load_data = 1'b0;
  end
  if((state == CHECK5) || (state == CHECK16)) begin
    enable_timer = 1'b0;
  end
  if(state == ERROR) begin
    load_error = 1'b1;
  end
  else begin
    load_error = 1'b0;
  end
  if(state == DONE) begin
    load_done = 1'b1;
  end
  else begin
    load_done = 1'b0;
  end 
end
endmodule
