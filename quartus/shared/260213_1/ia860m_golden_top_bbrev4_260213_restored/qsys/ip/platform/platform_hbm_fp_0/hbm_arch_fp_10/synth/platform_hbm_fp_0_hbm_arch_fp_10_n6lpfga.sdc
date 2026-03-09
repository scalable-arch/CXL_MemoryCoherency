# (C) 2001-2025 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


set_false_path -from [get_keepers -no_duplicates {*|hbmss_wrapper|xhbmc~i_upll2h_hbmc_clk_reg}]
set_false_path -to   [get_keepers -no_duplicates {*|hbmss_wrapper|xhbmc~i_upll2h_hbmc_clk_reg}]
disable_min_pulse_width {*|hbmss_wrapper|xhbmc~i_upll2h_hbmc_clk_reg}

