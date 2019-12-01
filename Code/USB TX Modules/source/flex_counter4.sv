module flex_counter4
#(
parameter NUM_CNT_BITS = 4
)
(
input wire clk,
input wire count_enable,
input wire  [NUM_CNT_BITS-1:0]rollover_value,
input wire clear,
input wire clk12,
input wire n_rst,
input wire halt,
output reg [NUM_CNT_BITS-1:0]count_out,
output reg rollover_flag 
);
reg [NUM_CNT_BITS:0] next_count_out;
reg next_rollover_flag;
always_ff@(posedge clk,negedge n_rst)
begin
	if(n_rst == 1'b0) begin
		count_out<= 'd0;
		//rollover_flag <=1'b0;
	end 
		else begin
		count_out <= next_count_out;
		//rollover_flag <= next_rollover_flag;
	
	end
end
always_comb
begin : NXT_LOGIC
if(clk12 == 1'b1) begin
	if(halt == 1'b1) begin
		next_count_out = count_out;
		next_rollover_flag = rollover_flag;
	end
	if(clear == 1'b1)
	begin
		next_count_out = 0;
		rollover_flag = 0;
	end
	else if(count_enable == 1'b1)
	begin
		if(rollover_flag==1)
		begin
			next_count_out = 1;
			rollover_flag = 0;
		end
		else if(count_out == rollover_value - 1)
		begin
			next_count_out = count_out +1 ;
			rollover_flag = 1;
		end
		else 
		begin
			next_count_out = count_out + 1'b1;
			rollover_flag = 1'b0;
		end
	 end
	 else begin
		next_count_out = count_out;
		rollover_flag = 0;
	end
end
else begin
	next_count_out = count_out;
	rollover_flag = 0;
end
end
endmodule


