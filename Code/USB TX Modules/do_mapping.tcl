# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {CDL_CRC_16.sv flex_counter.sv flex_pts_sr.sv usb_bit_stuffer.sv usb_controller.sv usb_encoder.sv usb_pts.sv usb_timer.sv flex_counter2.sv flex_counter3.sv flex_counter4.sv usb_tx.sv}
elaborate usb_tx -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/usb_tx.rep
report_area >> reports/usb_tx.rep
report_power -hier >> reports/usb_tx.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/usb_tx.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
