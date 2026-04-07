create_clock [get_ports clk] -name clk -period 10.0

set_input_delay 0.0 -clock [get_clocks clk] [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 0.0 -clock [get_clocks clk] [all_outputs]

# Reset is asynchronous in function, so avoid timing closure effort on that port.
set_false_path -from [get_ports reset]
