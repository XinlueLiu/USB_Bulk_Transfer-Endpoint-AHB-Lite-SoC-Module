onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_clk
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_n_rst
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_d_plus
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_d_minus
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_rx_packet
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_rx_packet_data
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_store_rx_packet_data
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_test_num
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_test_data
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_expected_rx_packet
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_expected_rx_packet_data
add wave -noupdate -expand -group tb_ux_rx /tb_usb_rx/tb_expected_store_rx_packet_data
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/clk
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/n_rst
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/d_plus
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/d_minus
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/rx_packet
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/rx_packet_data
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/store_rx_packet_data
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/d_plus_sync
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/d_minus_sync
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/d_orig
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/enable_timer
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/shift_enable
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/shift_enable_const
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/invalid_bit
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/eop_detected
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/byte_complete
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/Packet_Data
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/sync_status
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/pid_status
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/crc_status
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/check_sync
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/check_pid
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/load_sync
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/load_pid
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/load_error
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/load_done
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/crc_check_5
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/crc_check_16
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/d_edge
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/crc_5bit
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/crc_16bit
add wave -noupdate -expand -group DUT /tb_usb_rx/DUT/load_data
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/clk
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/n_rst
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/d_edge
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/byte_complete
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/eop_detected
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/crc_check_5
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/crc_check_16
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/sync_status
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/pid_status
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/crc_status
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/enable_timer
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/check_pid
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/check_sync
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/load_sync
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/load_pid
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/load_data
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/load_error
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/load_done
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/state
add wave -noupdate -expand -group rcu /tb_usb_rx/DUT/controller_rcu/next_state
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/clk
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/n_rst
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/enable_timer
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/invalid_bit
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/eop_detected
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/shift_enable
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/shift_enable_const
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/byte_complete
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/enable
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/rollover_flag_1
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/count_out_1
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/count_out_2
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/clear_1
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/Timer/clear_2
add wave -noupdate -expand -group flex_counter /tb_usb_rx/DUT/sr_8bit/FLEX_COUNTER/clk
add wave -noupdate -expand -group flex_counter /tb_usb_rx/DUT/sr_8bit/FLEX_COUNTER/n_rst
add wave -noupdate -expand -group flex_counter /tb_usb_rx/DUT/sr_8bit/FLEX_COUNTER/shift_enable
add wave -noupdate -expand -group flex_counter /tb_usb_rx/DUT/sr_8bit/FLEX_COUNTER/serial_in
add wave -noupdate -expand -group flex_counter /tb_usb_rx/DUT/sr_8bit/FLEX_COUNTER/parallel_out
add wave -noupdate -expand -group flex_counter /tb_usb_rx/DUT/sr_8bit/FLEX_COUNTER/next_parallel_out
add wave -noupdate -expand -group sr_8bit /tb_usb_rx/DUT/sr_8bit/clk
add wave -noupdate -expand -group sr_8bit /tb_usb_rx/DUT/sr_8bit/n_rst
add wave -noupdate -expand -group sr_8bit /tb_usb_rx/DUT/sr_8bit/d_orig
add wave -noupdate -expand -group sr_8bit /tb_usb_rx/DUT/sr_8bit/shift_enable
add wave -noupdate -expand -group sr_8bit /tb_usb_rx/DUT/sr_8bit/Packet_Data
add wave -noupdate -expand -group sr_8bit /tb_usb_rx/DUT/sr_8bit/next_d_orig9
add wave -noupdate -expand -group sr_8bit /tb_usb_rx/DUT/sr_8bit/copy_d_orig
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/clk
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/n_rst
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/d_plus_sync
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/d_minus_sync
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/shift_enable
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/d_orig
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/eop_detected
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/next_d_plus_sync
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/next_d_orig
add wave -noupdate -expand -group Decoder /tb_usb_rx/DUT/Decoder/next_d_minus_sync
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/clk
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/n_rst
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/byte_complete
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/Packet_Data
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/clear
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/load_data
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/load_sync
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/load_pid
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/load_error
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/load_done
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/check_sync
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/check_pid
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/crc_check_5
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/crc_check_16
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/crc_5bit
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/crc_16bit
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/sync_status
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/pid_status
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/crc_status
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/rx_packet
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/rx_packet_data
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/store_rx_packet_data
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/next_pid
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/temp_pid
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/pid
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/sync_byte
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/next_rx_packet_data
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/next_store_rx_packet_data
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/next_rx_packet
add wave -noupdate -expand -group rx_data_buffer /tb_usb_rx/DUT/Rx_data_buffer/next_sync_byte
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2455000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 282
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {3354223 ps}
