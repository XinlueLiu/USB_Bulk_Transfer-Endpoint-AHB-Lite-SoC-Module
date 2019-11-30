module usb_encoder(
input wire clk,
input wire n_rst,
input wire clk12,
input wire serial_out,
input wire enc_en,
input wire eop_en,
input wire eop_reset,
input wire bit_stuff_en,
input wire bytecomplete,
output reg dminus_out,
output reg dplus_out);
reg nxt_dminus,nxt_dplus;

always_ff @(posedge clk, negedge n_rst) begin
	if(n_rst == 1'b0) begin
		dminus_out<=0;
		dplus_out<=1;
	end
	else begin
		dminus_out<=nxt_dminus;
		dplus_out<=nxt_dplus;
	end
end
always_comb begin
if(clk12 == 1'b1) begin
	if(bit_stuff_en == 1'b1) begin
		nxt_dminus = !dminus_out;
		nxt_dplus = !dplus_out;
	end
	else begin
	if(eop_en == 1'b1) begin
		nxt_dminus = 1'b0;
		nxt_dplus = 1'b0;
	end
	else if (eop_reset == 1'b1) begin
		nxt_dminus = 1'b0;
		nxt_dplus = 1'b1;
	end
	else if(serial_out == 1'b1 && enc_en) begin
		nxt_dminus = dminus_out;
		nxt_dplus  = dplus_out;
	end	
	else begin
		nxt_dminus = !dminus_out;
		nxt_dplus = !dplus_out;
	end
end
end
else begin
	nxt_dminus = dminus_out;
	nxt_dplus = dplus_out;		
end
end

endmodule 
