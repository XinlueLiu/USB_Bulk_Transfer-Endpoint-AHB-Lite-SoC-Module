// $Id: $
// File name:   tb_CDL_CRC_5.sv
// Created:     12/1/2019
// Author:      Xinlue LIu
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: testbench for crc 5
// $Id: $
// File name:   tb_crc.sv
// Created:     12/1/2019
// Author:      Xinlue LIu
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: testbench for crc

`timescale 1ns / 10ps

module tb_CDL_CRC_5();

parameter CLK_PERIOD = 10;

reg tb_clk;
reg tb_n_rst;
reg tb_input_data;
reg tb_reset_crc;
reg [4:0] tb_inverted_crc;

logic tb_check;
logic tb_mismatch;
 
integer tb_test_num;
string  tb_test_case;

reg [7:0] tb_test_data;
integer i;

CDL_CRC5 DUT
(
	.clk (tb_clk),
	.n_rst(tb_n_rst),
	.input_data(tb_input_data),
	.reset_crc(tb_reset_crc),
	.inverted_crc(tb_inverted_crc)
);

  task check_outputs;

  begin
    tb_check = 1'b1;
    tb_mismatch = 1'b0;
    $info("checking");
    tb_check = 1'b0;
   end
endtask

task reset_dut;
  begin
    // Activate the design's reset (does not need to be synchronize with clock)
    tb_n_rst = 1'b0;
    
    // Wait for a couple clock cycles
    @(posedge tb_clk);
    @(posedge tb_clk);
    
    // Release the reset
    @(negedge tb_clk);
    tb_n_rst = 1;
    
    // Wait for a while before activating the design
    @(posedge tb_clk);
    @(posedge tb_clk);
  end
  endtask


  always
  begin : CLK_GEN
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
  end


/*task send_packet;
	input [7:0] data;
	integer i;
begin
   //@(negedge tb_clk)
   for(i = 0; i < 8; i = i + 1)
    begin
      tb_input_data = data[i];
      #CLK_PERIOD;
    end
end
endtask*/

initial
  begin : TEST_PROC
    tb_test_num               = -1;
    tb_test_case              = "TB Init";

    tb_test_data              = 8'b0;
    tb_input_data	 = 8'b0;
    tb_reset_crc = 1'b1;

    tb_n_rst      = 1'b1; 

    tb_check                  = 1'b0;
    tb_mismatch               = 1'b0;

    /******************************************************************************
	Test case 0: Basic Power on Reset
    /******************************************************************************/   
    /*tb_test_num  = 0;
    tb_test_case = "Power-on-Reset";

    tb_test_data        = 8'd10;
    reset_dut();
    send_packet(tb_test_data, 1'b0);
    reset_dut();*/
    /******************************************************************************
	Test case 1: test crc behavior
    /******************************************************************************/  
    tb_test_num  = 0;
    tb_test_case = "test crc behavior"; 

    reset_dut();

    //x^16 + x^15 + x^2 + 1
    tb_test_data = 8'b00000000;
    tb_reset_crc = 1'b0;
    for(i = 0; i < 8; i = i + 1)
    begin
      tb_input_data = tb_test_data[i];
      #CLK_PERIOD;
    end

    tb_test_data = 8'b00100001;
    for(i = 0; i < 8; i = i + 1)
    begin
      tb_input_data = tb_test_data[i];
      #CLK_PERIOD;
    end


    reset_dut();
    tb_reset_crc = 1'b1;
    
end

















endmodule 