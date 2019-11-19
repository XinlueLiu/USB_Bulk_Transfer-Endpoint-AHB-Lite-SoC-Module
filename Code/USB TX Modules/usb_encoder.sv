module usb_encoder(
input wire [3:0] data_id,
input wire serial_out,
input wire clk,
input wire n_rst,
input wire en,
input wire stuff_bit_en,
output reg dminus_out,
output reg dplus_out);
reg nxt_dminus,nxt_dplus;

always_ff @(posedge clk, negedge n_rst) begin
	if(n_rst == 1'b0) begin
		dminus_out=0;
		dplus_out=1;
	end
	else begin
		if(data_id == 4'b0110) begin
		dminus_out=0;
		dplus_out=0;
		end
		else if(serial_out == 1'b1) begin
			dminus_out=dminus_out;
			dplus_out=dplus_out;
		end
		else begin
			dminus_out= ~dminus_out;
			dplus_out=~dplus_out;
		end
	end	
end

endmodule 
