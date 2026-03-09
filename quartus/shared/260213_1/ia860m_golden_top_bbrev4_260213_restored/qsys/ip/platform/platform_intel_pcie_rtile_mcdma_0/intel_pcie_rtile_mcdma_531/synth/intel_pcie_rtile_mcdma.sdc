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
# Get the current Native PCIe IP instance
set inst [get_current_instance]

#################################### Core16 #########################################################
# Timing exception for core16-mcdma instance
set_false_path -to [get_registers -nowarn ${inst}|*mcdma|rtile_flr_intf|flr_completed|gen_pf_flr[*].flr_completed_pf_sync_inst|din_s1]
set_false_path -to [get_registers -nowarn ${inst}|*mcdma|rtile_flr_intf|flr_rcvd|gen_pf_flr[*].flr_rcvd_pf_sync_inst|din_s1]
#set_false_path -to [get_registers -nowarn ${inst}|*mcdma|rtile_adapter|crdt_intf|gen_cdc.tx_cdts_limit_init_done_sync_inst|din_s1]
#set_false_path -to [get_registers -nowarn ${inst}|*mcdma|rtile_adapter|crdt_intf|gen_cdc.rx_buffer_limit_init_done_sync_inst|din_s1]

   # HIP reconfig polling for RO register
   set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.config_extractor_hip_reconfig|hip_config_auto_neg_link_width_o[*][*]]
   set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.config_extractor_hip_reconfig|hip_config_auto_neg_link_speed_o[*][*]]

      # EP mode
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_bus_master_en_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_ext_tag_en_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_10bits_tag_req_en_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_max_payload_size_o[*]]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_max_read_req_size_o[*]]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_enable_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_multiple_msg_cap_o[*]]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_multiple_msg_en_o[*]]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_64_bit_addr_cap_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_pvm_support_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_ext_data_cap_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_ext_data_en_o]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_address_o[*]]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_mask_o[*]]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_data_o[*]]





#################################### Core8 #########################################################
   # Timing exception for core8-mcdma instance
   set_false_path -to [get_registers -nowarn ${inst}|*mcdma1|rtile_flr_intf|flr_completed|gen_pf_flr[*].flr_completed_pf_sync_inst|din_s1]
   set_false_path -to [get_registers -nowarn ${inst}|*mcdma1|rtile_flr_intf|flr_rcvd|gen_pf_flr[*].flr_rcvd_pf_sync_inst|din_s1]
   #set_false_path -to [get_registers -nowarn ${inst}|*mcdma1|rtile_adapter|crdt_intf|gen_cdc.tx_cdts_limit_init_done_sync_inst|din_s1]
   #set_false_path -to [get_registers -nowarn ${inst}|*mcdma1|rtile_adapter|crdt_intf|gen_cdc.rx_buffer_limit_init_done_sync_inst|din_s1]

      # HIP reconfig polling for RO register
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.config_extractor_hip_reconfig|hip_config_auto_neg_link_width_o[*][*]]
      set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.config_extractor_hip_reconfig|hip_config_auto_neg_link_speed_o[*][*]]

         # EP mode
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_bus_master_en_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_ext_tag_en_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_10bits_tag_req_en_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_max_payload_size_o[*]]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_max_read_req_size_o[*]]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_enable_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_multiple_msg_cap_o[*]]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_multiple_msg_en_o[*]]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_64_bit_addr_cap_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_pvm_support_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_ext_data_cap_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_ext_data_en_o]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_address_o[*]]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_mask_o[*]]
         set_false_path -from [get_keepers -nowarn ${inst}|*mcdma1|dma_mode.mcdma_inst|hip_reconfig_r_tile.rtile_ep_mode.config_extractor_cii|gen_cii_func[*].config_extractor_cii_func|hip_config_msi_data_o[*]]



#################################### Core4_0 #########################################################


#################################### Core4_1 #########################################################


# Recovery and Removal Timing Violation Warnings when Compiling a DCFIFO
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_rx_st|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_rx_st|auto_generated|rdaclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_tx_st|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_tx_st|auto_generated|rdaclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_app_err_to|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_app_err_to|auto_generated|rdaclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_cpl_to|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_cpl_to|auto_generated|rdaclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_flr_rcvd|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_flr_rcvd|auto_generated|rdaclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_flr_completed|auto_generated|wraclr|dffe*a[0]]
set_false_path -to [get_registers -nowarn ${inst}|*dcfifo_flr_completed|auto_generated|rdaclr|dffe*a[0]]



