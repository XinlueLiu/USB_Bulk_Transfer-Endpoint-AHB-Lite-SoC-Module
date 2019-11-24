module flex_counter
#(
parameter NUM_CNT_BITS = 4
)
(
input wire clk,
input wire count_enable,
input wire  [NUM_CNT_BITS-1:0]rollover_value,
input wire clear,
input wire n_rst,
output reg [NUM_CNT_BITS-1:0]count_out,
output reg rollover_flag
);
reg [NUM_CNT_BITS:0] next_count_out;
reg next_rollover_flag;
always_ff@(posedge clk,negedge n_rst)
begin
	if(n_rst == 1'b0) begin
		count_out<= 'd0;
		rollover_flag <=1'b0;
	end 
		else begin
		count_out <= next_count_out;
		rollover_flag <= next_rollover_flag;
	
	end
end
always_comb
begin : NXT_LOGIC
	if(clear == 1'b1)
	begin
		next_count_out = 1;
		next_rollover_flag = 0;
	end
	else if(count_enable == 1'b1)
	begin
		if(rollover_flag==1)
		begin
			next_count_out = 1;
			next_rollover_flag = 0;
		end
		else if(count_out == rollover_value - 1)
		begin
			next_count_out = count_out +1 ;
			next_rollover_flag = 1;
		end
		else 
		begin
			next_count_out = count_out + 1'b1;
			next_rollover_flag = 1'b0;
		end
	 end
	 else begin
		next_count_out = count_out;
		next_rollover_flag = rollover_flag;
	end
end
endmodule


