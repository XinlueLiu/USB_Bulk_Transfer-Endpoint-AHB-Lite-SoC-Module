// $Id: $
// File name:   tb_usb_tx.sv
// Created:     11/17/2019
// Author:      Karan Oberoi
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: Starter bus model based test bench for the AHB-Lite-slave module

`timescale 1ns / 10ps

module tb_usb_tx();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay


//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing control signal(s)
string                 tb_check_tag;
string		       tb_test_case;
logic                  tb_mismatch;
logic                  tb_check;
integer		       tb_test_case_num;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// USB_tx side Signals
//*****************************************************************************
logic			[7:0] tb_tx_packet_data;
logic			[6:0] tb_tx_packet_size;
logic			[2:0] tb_tx_packet;
logic			tb_dplus_out;
logic			tb_dminus_out;
logic		 	tb_get_tx_packet_data;
// Expected value check signals
logic		 	tb_expected_dplus_out;
logic 		tb_expected_dminus_out;
logic 		tb_expected_get_tx_packet_data;

//*****************************************************************************
// Clock Generation Block
//*****************************************************************************
// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

//*****************************************************************************
// DUT Instance
//****************************************************************************
usb_tx main (.clk(tb_clk), .n_rst(tb_n_rst),
            // USB TX Signls
            .tx_packet_data(tb_tx_packet_data),
            .tx_packet_size(tb_tx_packet_size),
            .tx_packet(tb_tx_packet),
            .dplus_out(tb_dplus_out),
            .dminus_out(tb_dminus_out),
            .tx_transfer_active(tb_tx_tranfer_active),
            .tx_error(tb_tx_error),
            .get_tx_packet_data(tb_get_tx_packet_data),
            .hresp(tb_hresp));

//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
// Task for standard DUT reset procedure
task reset_dut;
begin
  // Activate the reset
  tb_n_rst = 1'b0;

  // Maintain the reset for more than one cyclediuo
  @(posedge tb_clk);
  @(posedge tb_clk);

  // Wait until safely away from rising edge of the clock before releasing
  @(negedge tb_clk);
  tb_n_rst = 1'b1;

  // Leave out of reset for a couple cycles before allowing other stimulus
  // Wait for negative clock edges, 
  // since inputs to DUT should normally be applied away from rising clock edges
  @(negedge tb_clk);
  @(negedge tb_clk);
end
endtask

// Task to cleanly and consistently check DUT output values
task check_outputs;
  input string check_tag;
begin
  tb_mismatch = 1'b0;
  if(tb_expected_dplus_out != tb_dplus_out) begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'dplus' output %s during %s test case", check_tag, tb_test_case);
  end
  if(tb_expected_dminus_out != tb_dminus_out) begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'dminus' output %s during %s test case", check_tag, tb_test_case);
  end
  if(tb_expected_get_tx_packet_data != tb_get_tx_packet_data) begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'get_tx_packet_data' output %s during %s test case", check_tag, tb_test_case);
  end
  #(0.1);
end
endtask

// Task to clear/initialize all FIR-side inputs
task init_expected_outs;
begin
  tb_expected_dplus_out = 1'b1; 
  tb_expected_dminus_out = 1'b0;
  tb_expected_get_tx_packet_data = 1'b0;
  
end
endtask

//*****************************************************************************
//*****************************************************************************
// Main TB Process
//****************************************************************************
initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initilization";
  tb_test_case_num   = -1;
  // Wait some time before starting first test case
  init_expected_outs();
  #(0.1);

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();

  // Check outputs for reset state
  check_outputs("after DUT reset");

  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);
 end
endmodule
