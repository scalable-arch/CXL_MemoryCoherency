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


# Ref. https://www.intel.com/content/www/us/en/docs/programmable/683068/18-1/clock-divider-example-divide-by.html
 
if [info exists inst] {
  unset inst
  }
# Get the current Native PCIe AXI-MCDMA IP instance
set inst [get_current_instance]


## 500 MHz = 2ns
## 400 MHz = 2.5ns
set LITE_CLK_PERIOD 4.0
set ST_CLK_PERIOD   2.0 
set MM_CLK_PERIOD   2.0
set REFCLK_PERIOD   10.0
 
 
create_clock -name axi_st_clk    -period $ST_CLK_PERIOD   [get_ports axi_st_clk]
create_clock -name axi_lite_clk  -period $LITE_CLK_PERIOD [get_ports axi_lite_clk]
create_clock -name axi_mm_clk    -period $MM_CLK_PERIOD   [get_ports axi_mm_clk]

set_clock_groups -asynchronous -group {axi_st_clk} -group {axi_lite_clk} -group {axi_mm_clk} 

#################################### Core16 ########################################################

# False path from PCIe Config information via Control-shadow interface
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|mcdma_wrapper_i|cfg_max_payload_size[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|mcdma_wrapper_i|cfg_max_read_request_size[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|mcdma_wrapper_i|cfg_bus_master_enable[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|mcdma_wrapper_i|cfg_10bits_tag_enable]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|mcdma_wrapper_i|cfg_msix_enable]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|mcdma_wrapper_i|cfg_msi_enable[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|mcdma_wrapper_i|cfg_ext_tag_enable]

# False path for Data registers for the Request/Ack CDC handshake in CS interface block
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|ss_app_st_rxcpl_ack_readdata[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|ss_app_st_rxcpl_ack_response[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|app_ss_st_txreq_req_write]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|app_ss_st_txreq_req_address[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|app_ss_st_txreq_req_writedata[*]]
set_false_path -from [get_keepers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|app_ss_st_txreq_req_byteenable[*]]

# False path for Syncronizing the Qualifiers for the Request/Ack CDC handshake in CS interface block
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|ss_app_st_rxcpl_ack_sync_inst|din_s1]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|ss_app_st_txreq_tready_sync_inst|din_s1]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_cs_i|app_ss_st_txreq_req_sync_inst|din_s1]

# Recovery and Removal Timing Violation Warnings when Compiling a DCFIFO
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_axilite_cpl1|cpl_cmd_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_axilite_rw1|avmm_data_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_axilite_rw1|avmm_cmd_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_axilite_rw1|cpl_cmd_fifo|auto_generated|wraclr|dffe*a[0]]

set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_aximm_cpl1|cpl_cmd_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_aximm_rw1|avmm_data_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_aximm_rw1|avmm_wrcmd_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_aximm_rw1|avmm_rdcmd_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*intel_pcie_axi_mcdma_bam_aximm_rw1|cpl_cmd_fifo|auto_generated|wraclr|dffe*a[0]]

set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_bas_i|mcdma_bas_read_i|aximm_ar_info_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_bas_i|mcdma_bas_read_i|aximm_r_resp_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_bas_i|mcdma_bas_write_i|aximm_aw_info_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_bas_i|mcdma_bas_write_i|aximm_b_info_fifo|auto_generated|wraclr|dffe*a[0]]

set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_msi_ctrl_i|user_msi_fifo|auto_generated|wraclr|dffe*a[0]]

set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_cplto_intf_i|cpl_timeout_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_cplto_intf_i|app_error_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_error_intf_i|app_error_fifo|auto_generated|wraclr|dffe*a[0]]

set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_status_ctrl_i|user_msix_fifo|auto_generated|wraclr|dffe*a[0]]

set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_flr_ctrl_i|flr_ch_mapper|h2d_flr_qreset_fifo|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|mcdma_top_i|*mcdma_flr_ctrl_i|flr_ch_mapper|d2h_flr_qreset_fifo|auto_generated|wraclr|dffe*a[0]]


####################################################################################################

