module usb_timer(
input wire clk,
input wire n_rst,
input wire serial_out,
input wire timer_en,
output reg clk12,
output reg bytecomplete);
parameter [3:0] thr = 4'b0011;;
reg [3:0]rollover_valedit;
reg [3:0] cnt_out,cnt_out2,cnt_out3;
reg  three;
flex_counter #(4)A(.clk(clk),.count_enable(timer_en),.clear(1'b0),.n_rst(n_rst),.count_out(cnt_out),.rollover_flag(clk12),.rollover_value(rollover_valedit));
flex_counter #(4)B(.clk(clk),.count_enable(clk12),.clear(1'b0),.n_rst(n_rst),.count_out(cnt_out2),.rollover_flag(bytecomplete),.rollover_value(4'b1000));
flex_counter  #(4)C(.clk(clk),.count_enable(bytecomplete),.clear(1'b0),.n_rst(n_rst),.count_out(cnt_out3),.rollover_flag(three),.rollover_value(thr));
always_comb begin
if(three == 1'b1) begin
	rollover_valedit = 4'b1000;
end 
else begin
	rollover_valedit = 4'b1000;
end
end
endmodule

