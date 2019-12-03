onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider USB_TX_TB
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_mismatch
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_check
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/i
add wave -noupdate -expand -group {Test Bench Signals} -radix unsigned /tb_usb_tx/tb_test_case_num
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/idx_tx_packet_data
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_clk
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_n_rst
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_usb_clk
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_tx_packet_data
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_tx_packet_data_size
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/tb_tx_packet
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/result_list
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/prev_dplus
add wave -noupdate -expand -group {Test Bench Signals} /tb_usb_tx/data_list
add wave -noupdate -divider {Get tx data}
add wave -noupdate -color Blue /tb_usb_tx/tb_get_tx_packet_data
add wave -noupdate -color Blue /tb_usb_tx/tb_expected_get_tx_packet_data
add wave -noupdate -divider D+
add wave -noupdate -color {Dark Orchid} /tb_usb_tx/tb_dplus_out
add wave -noupdate -color {Dark Orchid} /tb_usb_tx/tb_expected_dplus_out
add wave -noupdate -divider D-
add wave -noupdate -color {Dark Orchid} /tb_usb_tx/tb_dminus_out
add wave -noupdate -color {Dark Orchid} /tb_usb_tx/tb_expected_dminus_out
add wave -noupdate -divider TX_CONTROLLER
add wave -noupdate -radix binary -childformat {{{/tb_usb_tx/main/A/stored_crc[15]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[14]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[13]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[12]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[11]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[10]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[9]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[8]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[7]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[6]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[5]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[4]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[3]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[2]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[1]} -radix binary} {{/tb_usb_tx/main/A/stored_crc[0]} -radix binary}} -subitemconfig {{/tb_usb_tx/main/A/stored_crc[15]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[14]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[13]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[12]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[11]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[10]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[9]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[8]} {-height 17 -radix binary} {/tb_usb_tx/main/A/stored_crc[7]} {-radix binary} {/tb_usb_tx/main/A/stored_crc[6]} {-radix binary} {/tb_usb_tx/main/A/stored_crc[5]} {-radix binary} {/tb_usb_tx/main/A/stored_crc[4]} {-radix binary} {/tb_usb_tx/main/A/stored_crc[3]} {-radix binary} {/tb_usb_tx/main/A/stored_crc[2]} {-radix binary} {/tb_usb_tx/main/A/stored_crc[1]} {-radix binary} {/tb_usb_tx/main/A/stored_crc[0]} {-radix binary}} /tb_usb_tx/main/A/stored_crc
add wave -noupdate -expand -group Controller_signals -radix binary /tb_usb_tx/main/A/CRC
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/CRC_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/bit_stuff_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/bytecomplete
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/clk
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/clk12
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/data_sent
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/enc_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/eop_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/eop_reset
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/get_tx_packet_data
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/n_rst
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/nxt_CRC_en
add wave -noupdate -expand -group Controller_signals -radix binary /tb_usb_tx/main/A/nxt_data
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/data
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/nxt_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/nxt_enc_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/nxt_eop_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/nxt_eop_reset
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/nxt_get_tx_packet_data
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/nxt_state
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/prev_parallel
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/state
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/stored_packet
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/timer_en
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/tx_packet
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/tx_packet_data
add wave -noupdate -expand -group Controller_signals /tb_usb_tx/main/A/tx_packet_data_size
add wave -noupdate -divider {USB TIMER}
add wave -noupdate -expand -group Timer_signals -color Gold /tb_usb_tx/main/F/bytecomplete
add wave -noupdate -expand -group Timer_signals -color Gold /tb_usb_tx/main/F/clk
add wave -noupdate -expand -group Timer_signals -color Gold /tb_usb_tx/main/F/clk12
add wave -noupdate -expand -group Timer_signals /tb_usb_tx/main/F/n_rst
add wave -noupdate -expand -group Timer_signals -expand /tb_usb_tx/main/F/rollover_valedit
add wave -noupdate -expand -group Timer_signals /tb_usb_tx/main/F/serial_out
add wave -noupdate -expand -group Timer_signals /tb_usb_tx/main/F/three
add wave -noupdate -expand -group Timer_signals /tb_usb_tx/main/F/timer_en
add wave -noupdate -divider USB_ENC
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/bytecomplete
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/clk
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/clk12
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/dminus_out
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/dplus_out
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/enc_en
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/eop_en
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/eop_reset
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/n_rst
add wave -noupdate -expand -group {Encoder signals} /tb_usb_tx/main/D/serial_out
add wave -noupdate -divider {CLK 12 FLEX COUNTER}
add wave -noupdate -expand -group info /tb_usb_tx/main/F/A/clear
add wave -noupdate -expand -group info /tb_usb_tx/main/F/A/clk
add wave -noupdate -expand -group info /tb_usb_tx/main/F/A/count_enable
add wave -noupdate -expand -group info /tb_usb_tx/main/F/A/count_out
add wave -noupdate -expand -group info /tb_usb_tx/main/F/A/n_rst
add wave -noupdate -expand -group info /tb_usb_tx/main/F/A/rollover_flag
add wave -noupdate -expand -group info /tb_usb_tx/main/F/A/rollover_value
add wave -noupdate -divider {BYTE COMPLETE FLEX COUNTER}
add wave -noupdate -group INFO /tb_usb_tx/main/F/B/clear
add wave -noupdate -group INFO /tb_usb_tx/main/F/B/clk
add wave -noupdate -group INFO /tb_usb_tx/main/F/B/count_enable
add wave -noupdate -group INFO /tb_usb_tx/main/F/B/count_out
add wave -noupdate -group INFO /tb_usb_tx/main/F/B/n_rst
add wave -noupdate -group INFO /tb_usb_tx/main/F/B/rollover_flag
add wave -noupdate -group INFO /tb_usb_tx/main/F/B/rollover_value
add wave -noupdate -divider {USB PTS}
add wave -noupdate -group {PTS Signals} /tb_usb_tx/main/C/clk
add wave -noupdate -group {PTS Signals} /tb_usb_tx/main/C/n_rst
add wave -noupdate -group {PTS Signals} /tb_usb_tx/main/C/clk12
add wave -noupdate -group {PTS Signals} -radix binary /tb_usb_tx/main/C/data
add wave -noupdate -group {PTS Signals} /tb_usb_tx/main/C/en
add wave -noupdate -group {PTS Signals} -color {Medium Blue} /tb_usb_tx/main/C/serial_data
add wave -noupdate -group {PTS Signals} -radix binary /tb_usb_tx/main/C/prev_parallel
add wave -noupdate -divider {CRC Gen}
add wave -noupdate -group {CRC GEN signals} /tb_usb_tx/main/E/clk
add wave -noupdate -group {CRC GEN signals} /tb_usb_tx/main/E/n_rst
add wave -noupdate -group {CRC GEN signals} -color {Orange Red} -itemcolor {Orange Red} /tb_usb_tx/main/E/input_data
add wave -noupdate -group {CRC GEN signals} /tb_usb_tx/main/E/reset_crc
add wave -noupdate -group {CRC GEN signals} -radix binary /tb_usb_tx/main/E/inverted_crc
add wave -noupdate -group {CRC GEN signals} /tb_usb_tx/main/E/STATE
add wave -noupdate -group {CRC GEN signals} -radix binary /tb_usb_tx/main/E/crc
add wave -noupdate -divider {Bit Stuffer}
add wave -noupdate -group {Bit Stuffer Signals} /tb_usb_tx/main/B/bit_stuff_en
add wave -noupdate -group {Bit Stuffer Signals} /tb_usb_tx/main/B/clk
add wave -noupdate -group {Bit Stuffer Signals} /tb_usb_tx/main/B/clk12
add wave -noupdate -group {Bit Stuffer Signals} /tb_usb_tx/main/B/n_rst
add wave -noupdate -group {Bit Stuffer Signals} /tb_usb_tx/main/B/serial_in
add wave -noupdate -divider Flex_PTS
add wave -noupdate -group {Flex PTS Signals} /tb_usb_tx/main/C/A/clk
add wave -noupdate -group {Flex PTS Signals} /tb_usb_tx/main/C/A/load_enable
add wave -noupdate -group {Flex PTS Signals} /tb_usb_tx/main/C/A/n_rst
add wave -noupdate -group {Flex PTS Signals} -radix binary /tb_usb_tx/main/C/A/parallel_in
add wave -noupdate -group {Flex PTS Signals} -radix binary /tb_usb_tx/main/C/A/parallel_out
add wave -noupdate -group {Flex PTS Signals} /tb_usb_tx/main/C/A/serial_out
add wave -noupdate -group {Flex PTS Signals} /tb_usb_tx/main/C/A/shift_enable
add wave -noupdate -divider {Bit Stuff Counter}
add wave -noupdate -divider {Bytes sent counter}
add wave -noupdate -group {Byte sent counter} /tb_usb_tx/main/A/X/clk
add wave -noupdate -group {Byte sent counter} /tb_usb_tx/main/A/X/count_enable
add wave -noupdate -group {Byte sent counter} /tb_usb_tx/main/A/X/rollover_value
add wave -noupdate -group {Byte sent counter} /tb_usb_tx/main/A/X/clear
add wave -noupdate -group {Byte sent counter} /tb_usb_tx/main/A/X/n_rst
add wave -noupdate -group {Byte sent counter} /tb_usb_tx/main/A/X/count_out
add wave -noupdate -group {Byte sent counter} /tb_usb_tx/main/A/X/rollover_flag
add wave -noupdate /tb_usb_tx/main/F/C/halt
add wave -noupdate /tb_usb_tx/main/F/C/clear
add wave -noupdate -divider Count3
add wave -noupdate /tb_usb_tx/main/F/C/clk
add wave -noupdate /tb_usb_tx/main/F/C/count_enable
add wave -noupdate /tb_usb_tx/main/F/C/count_out
add wave -noupdate /tb_usb_tx/main/F/C/rollover_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25031199 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 296
configure wave -valuecolwidth 170
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {28555008 ps}
