// $Id: $
// File name:   tb_cdl.sv
// Created:     11/26/2019
// Author:      Yiming Li
// Lab Section: 02
// Version:     1.0  Initial Design Entry
// Description: tb cdl.sv

`timescale 1ns / 10ps

module tb_usb_tx();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay
localparam USB_CLK_PERIOD = CLK_PERIOD * 8.33;

// Sizing related constants
localparam DATA_WIDTH      = 4;
localparam ADDR_WIDTH      = 7;
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8;
localparam DATA_MAX_BIT    = DATA_WIDTH_BITS - 1;
localparam ADDR_MAX_BIT    = ADDR_WIDTH - 1;

// Preset Values
localparam [7:0] SYNC_BYTE = 8'b10000000;
localparam [7:0] ACK_BYTE = 8'b00100100;
localparam [7:0] NAK_BYTE = 8'b10100101;
localparam [7:0] DATA_BYTE = 8'b00111100;
localparam [7:0] OUT_BYTE = 8'b00011110;
localparam [7:0] IN_BYTE = 8'b10010110;
localparam [1:0] TX_IDLE = 2'b00;
localparam [1:0] TX_SEND_DATA = 2'b01;
localparam [1:0] TX_NAK = 2'b10;
localparam [1:0] TX_ACK = 2'b11;

// HTRANS Codes
localparam TRANS_IDLE = 2'd0;
localparam TRANS_BUSY = 2'd1;
localparam TRANS_NSEQ = 2'd2;
localparam TRANS_SEQ  = 2'd3;

// HBURST Codes
localparam BURST_SINGLE = 3'd0;
localparam BURST_INCR   = 3'd1;
localparam BURST_WRAP4  = 3'd2;
localparam BURST_INCR4  = 3'd3;
localparam BURST_WRAP8  = 3'd4;
localparam BURST_INCR8  = 3'd5;
localparam BURST_WRAP16 = 3'd6;
localparam BURST_INCR16 = 3'd7;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing setup signals
bit                          tb_enqueue_transaction;
bit                          tb_transaction_write;
bit                          tb_transaction_fake;
bit [(ADDR_WIDTH - 1):0]     tb_transaction_addr;
bit [((DATA_WIDTH*8) - 1):0] tb_transaction_data [];
bit [2:0]                    tb_transaction_burst;
bit                          tb_transaction_error;
bit [1:0]                    tb_transaction_size;
// Testing control signal(s)
logic    tb_model_reset;
logic    tb_enable_transactions;
integer  tb_current_addr_transaction_num;
integer  tb_current_addr_beat_num;
logic    tb_current_addr_transaction_error;
integer  tb_current_data_transaction_num;
integer  tb_current_data_beat_num;
logic    tb_current_data_transaction_error;

string                 tb_test_case;
integer                tb_test_case_num;
logic [DATA_MAX_BIT:0] tb_test_data [];
reg              [7:0] tb_test_rx_data;       
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;
integer                i;
logic [DATA_MAX_BIT:0] tb_test_data_reg72 [];

integer		       idx_tx_packet_data;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;
logic tb_usb_clk;

//*****************************************************************************
// AHB-Lite-Slave side signals
//*****************************************************************************
logic                          tb_hsel;
logic [1:0]                    tb_htrans;
logic [2:0]                    tb_hburst;
logic [(ADDR_WIDTH - 1):0]     tb_haddr;
logic [1:0]                    tb_hsize;
logic                          tb_hwrite;
logic [((DATA_WIDTH*8) - 1):0] tb_hwdata;
logic [((DATA_WIDTH*8) - 1):0] tb_hrdata;
logic                          tb_hresp;
logic                          tb_hready;

//*****************************************************************************
// USB_tx side Signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst,;
// Master Side Inputs
logic tb_hsel;
logic [6:0] tb_haddr;
logic [1:0] tb_htrans;
logic [1:0] tb_hsize;
logic tb_hwrite;
logic [31:0] tb_hwdata;
logic [2:0] tb_hburst;
// Host Side Inputs
logic tb_dplus_in;
logic tb_dminus_in;
// Master Side Outputs
logic [31:0] tb_hrdata;
logic tb_hresp;
logic tb_hready;
// Host Side Outputs
logic tb_d_mode;
logic tb_dplus_out;
logic tb_dminus_out;

// Expected value check signals
logic		 	tb_expected_dplus_out;
logic 			tb_expected_dminus_out;
logic			tb_expected_d_mode;
// Test Values
logic     		[63:0][7:0] result_list;
logic     		prev_dplus;
logic     		[63:0][7:0] data_list;
logic			[7:0] in_data;

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

always begin
  // Start with clock low to avoid false rising edge events at t=0b00101101
  tb_usb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(USB_CLK_PERIOD /2.0);
  tb_usb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(USB_CLK_PERIOD /2.0);
end

//*****************************************************************************
// Bus Model Instance
//*****************************************************************************
ahb_lite_bus_cdl 
              #(  .DATA_WIDTH(4),
                  .ADDR_WIDTH(8))
              BFM(.clk(tb_clk),
                  // Testing setup signals
                  .enqueue_transaction(tb_enqueue_transaction),
                  .transaction_write(tb_transaction_write),
                  .transaction_fake(tb_transaction_fake),
                  .transaction_addr(tb_transaction_addr),
                  .transaction_size(tb_transaction_size),
                  .transaction_data(tb_transaction_data),
                  .transaction_burst(tb_transaction_burst),
                  .transaction_error(tb_transaction_error),
                  // Testing controls
                  .model_reset(tb_model_reset),
                  .enable_transactions(tb_enable_transactions),
                  .current_addr_transaction_num(tb_current_addr_transaction_num),
                  .current_addr_beat_num(tb_current_addr_beat_num),
                  .current_addr_transaction_error(tb_current_addr_transaction_error),
                  .current_data_transaction_num(tb_current_data_transaction_num),
                  .current_data_beat_num(tb_current_data_beat_num),
                  .current_data_transaction_error(tb_current_data_transaction_error),
                  // AHB-Lite-Slave Side
                  .hsel(tb_hsel),
                  .haddr(tb_haddr),
                  .hsize(tb_hsize),
                  .htrans(tb_htrans),
                  .hburst(tb_hburst),
                  .hwrite(tb_hwrite),
                  .hwdata(tb_hwdata),
                  .hrdata(tb_hrdata),
                  .hresp(tb_hresp),
                  .hready(tb_hready));


//*****************************************************************************
// DUT Instance
//****************************************************************************
cdl DUT (.clk(tb_clk), .n_rst(tb_n_rst),
		// USB TX Signls
		.hsel(tb_hsel),
		.haddr(tb_haddr),
		.htrans(tb_htrans),
		.hsize(tb_hsize),
		.hwrite(tb_hwrite),
		.hwdata(tb_hwdata),
		.hburst(tb_hburst),
		.dplus_in(tb_dplus_in),
		.dminus_in(tb_dminus_in),
		.hrdata(tb_hrdata),
		.hresp(tb_hresp),
		.hready(tb_hready),
		.d_mode(tb_d_mode),
		.dplus_out(tb_dplus_out),
		.dminus_out(tb_dminus_out));

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
  if(tb_expected_d_mode != tb_d_mode) begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'd_mode' output %s during %s test case", check_tag, tb_test_case);
  end
end
endtask

// Check EOP
task check_eop;
  logic [2:0] expected_dplus;
  logic [2:0] expected_dminus;
  integer i;
begin
  expected_dplus = 3'b100;
  expected_dminus = 3'b000;
  for(i = 0; i < 3; i++) begin
    tb_expected_dplus_out = expected_dplus[i];
    tb_expected_dminus_out = expected_dminus[i];
    tb_expected_get_tx_packet_data = 0;
    check_outputs("EOP check");
    #(USB_CLK_PERIOD);
  end
end
endtask

// Given an expected output byte, check the decoded dplus/dminus values
task test_stream;
  input [7:0] expected_result;
  integer i;
  logic [7:0] expected_dplus;
begin
  for(i = 0; i < 8; i++) begin
    if(expected_result[i] == 0) begin
      expected_dplus[i] = !prev_dplus;
      prev_dplus = expected_dplus[i];
    end else if (expected_result[i] == 1)
      expected_dplus[i] = prev_dplus;
  end
  for(i = 0; i < 8; i++) begin
    tb_expected_dplus_out = expected_dplus[i];
    tb_expected_dminus_out = !expected_dplus[i];
    check_outputs("during test_stream");
    #(USB_CLK_PERIOD);
  end
end
endtask

// Decode one byte of data and send a stream of dplus and dminus
task send_stream;
  input  [7:0] data;
  reg    [7:0] d_plus_input;
  reg    [7:0] d_minus_input;
  integer i;
  integer j;
begin
  //initialization
  @(negedge tb_clk)
  d_plus_input = '1;
  d_minus_input = '0;
  //start or not
  if(data[0] == 1'b0) begin
     d_plus_input[7] = 1'b0;
     d_minus_input[7] = 1'b1;    
  end
  else begin
     d_plus_input[7] = 1'b1;
     d_minus_input[7] = 1'b0;
  end 
  for(i = 7; i > 0; i = i - 1) 
  begin
    if(data[i] == 1'b0) begin
      d_plus_input[i - 1] = !d_plus_input[i];
      d_minus_input[i - 1] = !d_minus_input[i];
    end 
    else begin
     d_plus_input[i - 1] = d_plus_input[i];
     d_minus_input[i - 1] = d_minus_input[i];
    end
  end

  // Send data bits
  for(j = 0; j < 8; j = j + 1)
  begin
    tb_d_plus = d_plus_input[j];
    tb_d_minus = d_minus_input[j];
    #USB_CLK_PERIOD;
  end
end
endtask

// Send EOP
task send_eop;
  reg [7:0] d_plus_input;
  reg [7:0] d_minus_input;
  integer i;
begin
  //driven low for 2 bit periods and back to the idle bus value
  d_plus_input = 8'b11111100;
  d_minus_input = 8'b0000000;
  for(i = 0; i < 8; i = i + 1) begin
    tb_d_plus = d_plus_input[i];
    tb_d_minus = d_minus_input[i];
    #USB_CLK_PERIOD;
  end
end
endtask

// Task to clear/initialize all FIR-side inputs
task init_expected_outs;
begin
  tb_expected_dplus_out = 1'b1; model_reset
  tb_expected_dminus_out = 1'b0;
  tb_expected_d_mode = 1'b0;
  
end
endtask

// Reset the Testbench
task reset_tb;
begin
  reset_dut();
  prev_dplus = tb_dplus_out;
  init_expected_outs();
  idx_tx_packet_data = 0;
end
endtask

//*****************************************************************************
// Bus Model Usage Related TB Tasks
//*****************************************************************************

// Task to pulse the reset for the bus model
task reset_model;
begin
  tb_model_reset = 1'b1;
  #(0.1);
  tb_model_reset = 1'b0;
end
endtask

// Task to enqueue a new transaction
task enqueue_transaction;
  input bit for_dut;
  input bit write_mode;
  input bit [ADDR_MAX_BIT:0] address;
  input bit [DATA_MAX_BIT:0] data [];
  input bit [2:0] burst_type;
  input bit expected_error;
  input bit [1:0] size;
begin
  // Make sure enqueue flag is low (will need a 0->1 pulse later)
  tb_enqueue_transaction = 1'b0;
  #0.1ns;

  // Setup info about transaction
  tb_transaction_fake  = ~for_dut;
  tb_transaction_write = write_mode;
  tb_transaction_addr  = address;
  tb_transaction_data  = data;
  tb_transaction_error = expected_error;
  tb_transaction_size  = {1'b0,size};
  //tb_transaction_burst = 3'b000;
  tb_transaction_burst = burst_type;

  // Pulse the enqueue flag
  tb_enqueue_transaction = 1'b1;
  #0.1ns;
  tb_enqueue_transaction = 1'b0;
end
endtask


// Task to wait for multiple transactions to happen
task execute_transactions;
  input integer num_transactions;
  integer wait_var;
begin
  // Activate the bus model
  tb_enable_transactions = 1'b1;
  @(posedge tb_clk);

  // Process the transactions (all but last one overlap 1 out of 2 cycles
  for(wait_var = 0; wait_var < num_transactions; wait_var++) begin
    @(posedge tb_clk);
  end

  // Run out the last one (currently in data phase)
  @(posedge tb_clk);

  // Turn off the bus model
  @(negedge tb_clk);
  tb_enable_transactions = 1'b0;
end
endtask

//*****************************************************************************
//*****************************************************************************
// Main TB Process
//****************************************************************************
always_comb begin
  if (tb_get_tx_packet_data == 1) begin
    tb_tx_packet_data = data_list[idx_tx_packet_data];
    idx_tx_packet_data += 1;
  end
end

initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initilization";
  tb_test_case_num   = -1;
  tb_test_data       = '0;
  tb_check_tag       = "N/A";
  tb_check           = 1'b0;
  tb_mismatch        = 1'b0;
  // Initialize all of the directly controled DUT inputs
  tb_n_rst          = 1'b1;
  init_fir_side();
  // Initialize all of the bus model control inputs
  tb_model_reset          = 1'b0;
  tb_enable_transactions  = 1'b0;
  tb_enqueue_transaction  = 1'b0;
  tb_transaction_write    = 1'b0;
  tb_transaction_fake     = 1'b0;
  tb_transaction_addr     = '0;
  tb_transaction_data     = '0;
  tb_transaction_error    = 1'b0;
  tb_transaction_size     = 3'd0;

  // Wait some time before starting first test case
  #(0.1);
  // Clear the bus model
  reset_model();

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_dut();

  // Check outputs for reset state
  init_expected_outs();
  check_outputs("after DUT reset");

  // Give some visual spacing between check and next test case start
  #(USB_CLK_PERIOD * 3);

  //*****************************************************************************
  // Master Write & Host In
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Master Write & Host In";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_tb();

  data_list[0] = 8'b11001100;
  for(i = 1; i < 64; i++) begin
    data_list[i] = data_list[i-1] ^ 8'b11111111;
  end
  tb_test_data_reg72 = '{32'd64};
  enqueue_transaction(1'b1, 1'b1, i, tb_test_data_reg72, BURST_INCR, 1'b0, 2'b00);
  execute_transactions(1);

  for(i = 0; i < 64; i+=4) begin
    tb_test_data = {data_list[i+3], data_list[i+2], data_list[i+1], data_list[i]};
    enqueue_transaction(1'b1, 1'b1, i, tb_test_data, BURST_INCR, 1'b0, 2'b10);
    execute_transactions(1);
  end
  
  send_stream(SYNC_BYTE);
  send_stream(IN_BYTE);
  send_stream(8'b00000000);
  send_stream(8'b01010000);  // ???
  send_eop();

  #(2 * CLK_PERIOD + 0.1);
  tb_expected_d_mode = 0;
  test_stream(SYNC_BYTE);
  test_stream(DATA_BYTE);
  for(i = 0; i < tb_tx_packet_data_size; i++) begin
    test_stream(data_list[i]);
  end
  // 16 bit CRC
  test_stream(8'b00000010);
  test_stream(8'b10111001);  // ??? 16 bit CRC for 64 bytes data
  check_eop();

  // Give some visual spacing between check and next test case start
  #(USB_CLK_PERIOD * 3);

  //*****************************************************************************
  // Host Out & Master Read
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Host Out & Master Read";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  reset_tb();

  data_list[0] = 8'b11110000;
  for(i = 1; i < 64; i++) begin
    data_list[i] = data_list[i-1] ^ 8'b11111111;
  end
  
  send_stream(SYNC_BYTE);
  send_stream(OUT_BYTE);
  send_stream(8'b00000000);
  send_stream(8'b01001000);  // ???
  send_eop();
  send_stream(SYNC_BYTE);
  send_stream(DATA_BYTE);
  send_stream(8'b00000000);
  send_stream(8'b01001000);  // ???
  // data field
  for(i = 0; i < tb_tx_packet_data_size; i++) begin
    send_stream(data_list[i]);
  end
  // 16 bit CRC
  send_stream(8'b00000010);
  send_stream(8'b10111001);  // ???
  send_eop();

  // ??? when to check ACK
  test_stream(SYNC_BYTE);
  test_stream(ACK_BYTE);
  check_eop();
  for(i = 0; i < 64; i+=4) begin
    tb_test_data = {data_list[i+3], data_list[i+2], data_list[i+1], data_list[i]};
    enqueue_transaction(1'b1, 1'b0, i, tb_test_data, BURST_INCR, 1'b0, 2'b10);
    execute_transactions(1);
  end

  // Give some visual spacing between check and next test case start
  #(USB_CLK_PERIOD * 3);

 end
endmodule