// (C) 2001-2025 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module platform_intel_pcie_rtile_mcdma_0_intel_pcie_rtile_mcdma_531_ecgie4y
  # (
     parameter tile_hwtcl                             = "R", 
     parameter ST_CHANNEL_WIDTH                       = 11,
     parameter MPS_SUPPORTED                          = 512,

     parameter top_topology_integer_hwtcl             = 0,
     parameter maxpayload_size_hwtcl                  = 512,
     parameter seg_num_hwtcl                          = 2, // 4-seg (OR) 2-seg
     parameter seg_width_hwtcl                        = 256, // 256 (OR) 128
     parameter single_width_integer_hwtcl             = 0, // 0 = DoubleWidth, 1 = SingleWidth mode
     parameter address_width_hwtcl                    = 64,
     parameter data_width_hwtcl                       = 512,
     parameter empty_width_hwtcl                      = $clog2(data_width_hwtcl/8),
     parameter burst_width_hwtcl                      = (data_width_hwtcl == 512) ? 4 : (data_width_hwtcl == 256) ? 5 : 6,
     parameter payload_width_integer_hwtcl            = 256,
     parameter hdr_width_integer_hwtcl                = 256,
     parameter pfx_width_integer_hwtcl                = 64,
     parameter double_width_integer_hwtcl             = 1,
     parameter total_pf_count_hwtcl                   = 4,
     parameter total_pf_count_width_hwtcl             = 2,
     parameter total_vf_count_hwtcl                   = 0,
     parameter total_vf_count_width_hwtcl             = 1,
     parameter device_family                          = "Agilex 7",
     parameter silicon_revc_fm41_hwtcl                = 0,
     parameter enable_32bit_address_hwtcl             = 0,
     parameter independent_perst_hwtcl                = 0,     
     parameter enable_user_flr_hwtcl                  = 1,
     parameter enable_user_msix_hwtcl                 = 1,
     parameter en_metadata_8_hwtcl                    = 0,
     parameter enable_mcdma_hwtcl                     = 1,
     parameter enable_data_mover_hwtcl                = 0,
     parameter enable_bursting_master_hwtcl           = 0,
     parameter enable_bursting_slave_hwtcl            = 0,
     parameter enable_byte_aligned_txfr_hwtcl         = 1, // 0 = Cache-line aligned txfr, 1 = Byte aligned txfr
     parameter enable_user_cii_hwtcl                  = 0,
     parameter dynamic_cmap_en_hwtcl                  = 0,
     parameter dynamic_num_channel_hwtcl              = 256,
     parameter enable_cs_hwtcl                        = 0,
     parameter pfnum_hwtcl                            = 1,
     parameter pfcnt_w_hwtcl                          = 1,
     parameter vfcnt_w_hwtcl                          = 1,
     parameter bas_address_width_hwtcl                = 64,
     parameter max_bar_address_width_hwtcl            = 32,
     parameter pfnum_width_hwtcl                      = 3,
     parameter vfnum_width_hwtcl                      = 11,
     parameter pio_address_width_hwtcl                = 64,
     parameter pio_data_width_hwtcl                   = 64,
     parameter pio_bar2_size_per_f_hwtcl              = 64,//map to actual BAR2 allocation later
     parameter num_h2d_uport_hwtcl                    = 4,
     parameter num_d2h_uport_hwtcl                    = 4,
     parameter uport_type_h2d_hwtcl                   = 4'hF,
     parameter uport_type_d2h_hwtcl                   = 4'hF,
     parameter d2h_num_active_channel_hwtcl           = 1,
     parameter d2h_max_num_desc_fetch_hwtcl           = 16,
     parameter pf0_enable_sriov_hwtcl                 = 0,
     parameter pf0_num_vf_per_pf_hwtcl                = 0,
     parameter pf0_num_dma_chan_pf_hwtcl              = 0,
     parameter pf0_num_dma_chan_per_vf_hwtcl          = 0,
     parameter pf1_enable_sriov_hwtcl                 = 0,
     parameter pf1_num_vf_per_pf_hwtcl                = 0,
     parameter pf1_num_dma_chan_pf_hwtcl              = 0,
     parameter pf1_num_dma_chan_per_vf_hwtcl          = 0,
     parameter pf2_enable_sriov_hwtcl                 = 0,
     parameter pf2_num_vf_per_pf_hwtcl                = 0,
     parameter pf2_num_dma_chan_pf_hwtcl              = 0,
     parameter pf2_num_dma_chan_per_vf_hwtcl          = 0,
     parameter pf3_enable_sriov_hwtcl                 = 0,
     parameter pf3_num_vf_per_pf_hwtcl                = 0,
     parameter pf3_num_dma_chan_pf_hwtcl              = 0,
     parameter pf3_num_dma_chan_per_vf_hwtcl          = 0,
     parameter pf4_enable_sriov_hwtcl                 = 0,
     parameter pf4_num_vf_per_pf_hwtcl                = 0,
     parameter pf4_num_dma_chan_pf_hwtcl              = 0,
     parameter pf4_num_dma_chan_per_vf_hwtcl          = 0,
     parameter pf5_enable_sriov_hwtcl                 = 0,
     parameter pf5_num_vf_per_pf_hwtcl                = 0,
     parameter pf5_num_dma_chan_pf_hwtcl              = 0,
     parameter pf5_num_dma_chan_per_vf_hwtcl          = 0,
     parameter pf6_enable_sriov_hwtcl                 = 0,
     parameter pf6_num_vf_per_pf_hwtcl                = 0,
     parameter pf6_num_dma_chan_pf_hwtcl              = 0,
     parameter pf6_num_dma_chan_per_vf_hwtcl          = 0,
     parameter pf7_enable_sriov_hwtcl                 = 0,
     parameter pf7_num_vf_per_pf_hwtcl                = 0,
     parameter pf7_num_dma_chan_pf_hwtcl              = 0,
     parameter pf7_num_dma_chan_per_vf_hwtcl          = 0,
     parameter cs_address_width_hwtcl                 = 14,
     parameter att_en_for_bas_cs_hwtcl                = 0,
     parameter mapping_table_address_width_hwtcl      = 3,
     parameter mapping_window_address_width_hwtcl     = 16,
     parameter msi_enable_hwtcl                       = 0,
     parameter per_vec_mask_capable_hwtcl             = 0,
     parameter addr_64bit_capable_hwtcl               = 0,
     parameter multi_msg_capable_hwtcl                = 1,
     parameter ext_msg_data_capable_hwtcl             = 0,
     
     parameter m1_att_en_for_bas_cs_hwtcl             = 0,
     parameter m1_mapping_table_address_width_hwtcl   = 3,
     parameter m1_mapping_window_address_width_hwtcl  = 16,
     parameter m1_top_topology_integer_hwtcl          = 0,
     parameter m1_maxpayload_size_hwtcl               = 512,
     parameter m1_seg_num_hwtcl                       = 2, // 4-seg (OR) 2-seg
     parameter m1_seg_width_hwtcl                     = 256, // 256 (OR) 128
     parameter m1_single_width_integer_hwtcl          = 0, // 0 = DoubleWidth, 1 = SingleWidth mode
     parameter m1_address_width_hwtcl                 = 64,
     parameter m1_data_width_hwtcl                    = 512,
     parameter m1_enable_32bit_address_hwtcl          = 0,
     parameter m1_empty_width_hwtcl                   = $clog2(m1_data_width_hwtcl/8),
     parameter m1_burst_width_hwtcl                   = (m1_data_width_hwtcl == 512) ? 4 : (m1_data_width_hwtcl == 256) ? 5 : 6,
     parameter m1_payload_width_integer_hwtcl         = 256,
     parameter m1_hdr_width_integer_hwtcl             = 256,
     parameter m1_pfx_width_integer_hwtcl             = 64,
     parameter m1_double_width_integer_hwtcl          = 1,
     parameter m1_total_pf_count_hwtcl                = 4,
     parameter m1_total_pf_count_width_hwtcl          = 2,
     parameter m1_total_vf_count_hwtcl                = 0,
     parameter m1_total_vf_count_width_hwtcl          = 1,
     parameter m1_device_family                       = "Agilex 7",
     parameter m1_enable_user_flr_hwtcl               = 1,
     parameter m1_enable_user_msix_hwtcl              = 1,
     parameter m1_en_metadata_8_hwtcl                 = 0,
     parameter m1_enable_mcdma_hwtcl                  = 1,
     parameter m1_enable_data_mover_hwtcl             = 0,
     parameter m1_enable_bursting_master_hwtcl        = 0,
     parameter m1_enable_bursting_slave_hwtcl         = 0,
     parameter m1_enable_byte_aligned_txfr_hwtcl      = 1, // 0 = Cache-line aligned txfr, 1 = Byte aligned txfr
     parameter m1_enable_user_cii_hwtcl               = 0,
     parameter m1_dynamic_cmap_en_hwtcl               = 0,
     parameter m1_dynamic_num_channel_hwtcl           = 256,
     parameter m1_enable_cs_hwtcl                     = 0,
     parameter m1_pfnum_hwtcl                         = 1,
     parameter m1_pfcnt_w_hwtcl                       = 1,
     parameter m1_vfcnt_w_hwtcl                       = 1,
     parameter m1_bas_address_width_hwtcl             = 64,
     parameter m1_max_bar_address_width_hwtcl         = 32,
     parameter m1_pfnum_width_hwtcl                   = 3,
     parameter m1_vfnum_width_hwtcl                   = 11,
     parameter m1_pio_address_width_hwtcl             = 64,
     parameter m1_pio_data_width_hwtcl                = 64,
     parameter m1_pio_bar2_size_per_f_hwtcl           = 64,//map to actual BAR2 allocation later
     parameter m1_num_h2d_uport_hwtcl                 = 4,
     parameter m1_num_d2h_uport_hwtcl                 = 4,
     parameter m1_uport_type_h2d_hwtcl                = 4'hF,
     parameter m1_uport_type_d2h_hwtcl                = 4'hF,
     parameter m1_d2h_num_active_channel_hwtcl        = 1,
     parameter m1_d2h_max_num_desc_fetch_hwtcl        = 16,
     parameter m1_pf0_enable_sriov_hwtcl              = 0,
     parameter m1_pf0_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf0_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf0_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_pf1_enable_sriov_hwtcl              = 0,
     parameter m1_pf1_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf1_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf1_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_pf2_enable_sriov_hwtcl              = 0,
     parameter m1_pf2_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf2_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf2_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_pf3_enable_sriov_hwtcl              = 0,
     parameter m1_pf3_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf3_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf3_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_pf4_enable_sriov_hwtcl              = 0,
     parameter m1_pf4_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf4_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf4_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_pf5_enable_sriov_hwtcl              = 0,
     parameter m1_pf5_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf5_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf5_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_pf6_enable_sriov_hwtcl              = 0,
     parameter m1_pf6_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf6_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf6_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_pf7_enable_sriov_hwtcl              = 0,
     parameter m1_pf7_num_vf_per_pf_hwtcl             = 0,
     parameter m1_pf7_num_dma_chan_pf_hwtcl           = 0,
     parameter m1_pf7_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m1_cs_address_width_hwtcl              = 14,
     parameter m1_msi_enable_hwtcl                    = 0,
     parameter m1_per_vec_mask_capable_hwtcl          = 0,
     parameter m1_addr_64bit_capable_hwtcl            = 0,
     parameter m1_multi_msg_capable_hwtcl             = 1,
     parameter m1_ext_msg_data_capable_hwtcl          = 0,

     parameter m2_att_en_for_bas_cs_hwtcl             = 0,
     parameter m2_mapping_table_address_width_hwtcl   = 3,
     parameter m2_mapping_window_address_width_hwtcl  = 16,
     parameter m2_top_topology_integer_hwtcl          = 0,
     //parameter m2_maxpayload_size_hwtcl               = 512,
     parameter m2_seg_num_hwtcl                       = 2, // 4-seg (OR) 2-seg
     parameter m2_seg_width_hwtcl                     = 256, // 256 (OR) 128
     parameter m2_single_width_integer_hwtcl          = 0, // 0 = DoubleWidth, 1 = SingleWidth mode
     parameter m2_address_width_hwtcl                 = 64,
     parameter m2_data_width_hwtcl                    = 512,
     parameter m2_enable_32bit_address_hwtcl          = 0,
     parameter m2_empty_width_hwtcl                   = $clog2(m2_data_width_hwtcl/8),
     parameter m2_burst_width_hwtcl                   = (m2_data_width_hwtcl == 512) ? 4 : (m2_data_width_hwtcl == 256) ? 5 : 6,
     parameter m2_payload_width_integer_hwtcl         = 256,
     parameter m2_hdr_width_integer_hwtcl             = 256,
     parameter m2_pfx_width_integer_hwtcl             = 64,
     parameter m2_double_width_integer_hwtcl          = 1,
     //parameter m2_total_pf_count_hwtcl                = 4,
     //parameter m2_total_pf_count_width_hwtcl          = 2,
     //parameter m2_total_vf_count_hwtcl                = 0,
     //parameter m2_total_vf_count_width_hwtcl          = 1,
     parameter m2_device_family                       = "Agilex 7",
     //parameter m2_enable_user_flr_hwtcl               = 1,
     //parameter m2_enable_user_msix_hwtcl              = 1,
     parameter m2_en_metadata_8_hwtcl                 = 0,
     parameter m2_enable_mcdma_hwtcl                  = 1,
     parameter m2_enable_data_mover_hwtcl             = 0,
     parameter m2_enable_bursting_master_hwtcl        = 0,
     parameter m2_enable_bursting_slave_hwtcl         = 0,
     parameter m2_enable_byte_aligned_txfr_hwtcl      = 1, // 0 = Cache-line aligned txfr, 1 = Byte aligned txfr
     parameter m2_enable_user_cii_hwtcl               = 0,
     parameter m2_dynamic_cmap_en_hwtcl               = 0,
     parameter m2_dynamic_num_channel_hwtcl           = 256,
     parameter m2_enable_cs_hwtcl                     = 0,
     parameter m2_pfnum_hwtcl                         = 1,
     parameter m2_pfcnt_w_hwtcl                       = 1,
     parameter m2_vfcnt_w_hwtcl                       = 1,
     parameter m2_bas_address_width_hwtcl             = 64,
     parameter m2_max_bar_address_width_hwtcl         = 32,
     parameter m2_pfnum_width_hwtcl                   = 3,
     parameter m2_vfnum_width_hwtcl                   = 11,
     parameter m2_pio_address_width_hwtcl             = 64,
     parameter m2_pio_data_width_hwtcl                = 64,
     parameter m2_pio_bar2_size_per_f_hwtcl           = 64,//map to actual BAR2 allocation later
     parameter m2_num_h2d_uport_hwtcl                 = 4,
     parameter m2_num_d2h_uport_hwtcl                 = 4,
     parameter m2_uport_type_h2d_hwtcl                = 4'hF,
     parameter m2_uport_type_d2h_hwtcl                = 4'hF,
     parameter m2_d2h_num_active_channel_hwtcl        = 1,
     parameter m2_d2h_max_num_desc_fetch_hwtcl        = 16,
     //parameter m2_pf0_enable_sriov_hwtcl              = 0,
     //parameter m2_pf0_num_vf_per_pf_hwtcl             = 0,
     parameter m2_pf0_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf0_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m2_pf1_enable_sriov_hwtcl              = 0,
     //parameter m2_pf1_num_vf_per_pf_hwtcl             = 0,
     //parameter m2_pf1_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf1_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m2_pf2_enable_sriov_hwtcl              = 0,
     //parameter m2_pf2_num_vf_per_pf_hwtcl             = 0,
     //parameter m2_pf2_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf2_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m2_pf3_enable_sriov_hwtcl              = 0,
     //parameter m2_pf3_num_vf_per_pf_hwtcl             = 0,
     //parameter m2_pf3_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf3_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m2_pf4_enable_sriov_hwtcl              = 0,
     //parameter m2_pf4_num_vf_per_pf_hwtcl             = 0,
     //parameter m2_pf4_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf4_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m2_pf5_enable_sriov_hwtcl              = 0,
     //parameter m2_pf5_num_vf_per_pf_hwtcl             = 0,
     //parameter m2_pf5_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf5_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m2_pf6_enable_sriov_hwtcl              = 0,
     //parameter m2_pf6_num_vf_per_pf_hwtcl             = 0,
     //parameter m2_pf6_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf6_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m2_pf7_enable_sriov_hwtcl              = 0,
     //parameter m2_pf7_num_vf_per_pf_hwtcl             = 0,
     //parameter m2_pf7_num_dma_chan_pf_hwtcl           = 0,
     //parameter m2_pf7_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m2_cs_address_width_hwtcl              = 14,
     //parameter m2_msi_enable_hwtcl                    = 0,
     //parameter m2_per_vec_mask_capable_hwtcl          = 0,
     //parameter m2_addr_64bit_capable_hwtcl            = 0,
     //parameter m2_multi_msg_capable_hwtcl             = 1,
     //parameter m2_ext_msg_data_capable_hwtcl          = 0,

     parameter m3_att_en_for_bas_cs_hwtcl             = 0,
     parameter m3_mapping_table_address_width_hwtcl   = 3,
     parameter m3_mapping_window_address_width_hwtcl  = 16,
     parameter m3_top_topology_integer_hwtcl          = 0,
     //parameter m3_maxpayload_size_hwtcl               = 512,
     parameter m3_seg_num_hwtcl                       = 2, // 4-seg (OR) 2-seg
     parameter m3_seg_width_hwtcl                     = 256, // 256 (OR) 128
     parameter m3_single_width_integer_hwtcl          = 0, // 0 = DoubleWidth, 1 = SingleWidth mode
     parameter m3_address_width_hwtcl                 = 64,
     parameter m3_data_width_hwtcl                    = 512,
     parameter m3_enable_32bit_address_hwtcl          = 0,
     parameter m3_empty_width_hwtcl                   = $clog2(m3_data_width_hwtcl/8),
     parameter m3_burst_width_hwtcl                   = (m3_data_width_hwtcl == 512) ? 4 : (m3_data_width_hwtcl == 256) ? 5 : 6,
     parameter m3_payload_width_integer_hwtcl         = 256,
     parameter m3_hdr_width_integer_hwtcl             = 256,
     parameter m3_pfx_width_integer_hwtcl             = 64,
     parameter m3_double_width_integer_hwtcl          = 1,
     //parameter m3_total_pf_count_hwtcl                = 4,
     //parameter m3_total_pf_count_width_hwtcl          = 2,
     //parameter m3_total_vf_count_hwtcl                = 0,
     //parameter m3_total_vf_count_width_hwtcl          = 1,
     parameter m3_device_family                       = "Agilex 7",
     //parameter m3_enable_user_flr_hwtcl               = 1,
     //parameter m3_enable_user_msix_hwtcl              = 1,
     parameter m3_en_metadata_8_hwtcl                 = 0,
     parameter m3_enable_mcdma_hwtcl                  = 1,
     parameter m3_enable_data_mover_hwtcl             = 0,
     parameter m3_enable_bursting_master_hwtcl        = 0,
     parameter m3_enable_bursting_slave_hwtcl         = 0,
     parameter m3_enable_byte_aligned_txfr_hwtcl      = 1, // 0 = Cache-line aligned txfr, 1 = Byte aligned txfr
     parameter m3_enable_user_cii_hwtcl               = 0,
     parameter m3_dynamic_cmap_en_hwtcl               = 0,
     parameter m3_dynamic_num_channel_hwtcl           = 256,
     parameter m3_enable_cs_hwtcl                     = 0,
     parameter m3_pfnum_hwtcl                         = 1,
     parameter m3_pfcnt_w_hwtcl                       = 1,
     parameter m3_vfcnt_w_hwtcl                       = 1,
     parameter m3_bas_address_width_hwtcl             = 64,
     parameter m3_max_bar_address_width_hwtcl         = 32,
     parameter m3_pfnum_width_hwtcl                   = 3,
     parameter m3_vfnum_width_hwtcl                   = 11,
     parameter m3_pio_address_width_hwtcl             = 64,
     parameter m3_pio_data_width_hwtcl                = 64,
     parameter m3_pio_bar2_size_per_f_hwtcl           = 64,//map to actual BAR2 allocation later
     parameter m3_num_h2d_uport_hwtcl                 = 4,
     parameter m3_num_d2h_uport_hwtcl                 = 4,
     parameter m3_uport_type_h2d_hwtcl                = 4'hF,
     parameter m3_uport_type_d2h_hwtcl                = 4'hF,
     parameter m3_d2h_num_active_channel_hwtcl        = 1,
     parameter m3_d2h_max_num_desc_fetch_hwtcl        = 16,
     //parameter m3_pf0_enable_sriov_hwtcl              = 0,
     //parameter m3_pf0_num_vf_per_pf_hwtcl             = 0,
     parameter m3_pf0_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf0_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m3_pf1_enable_sriov_hwtcl              = 0,
     //parameter m3_pf1_num_vf_per_pf_hwtcl             = 0,
     //parameter m3_pf1_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf1_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m3_pf2_enable_sriov_hwtcl              = 0,
     //parameter m3_pf2_num_vf_per_pf_hwtcl             = 0,
     //parameter m3_pf2_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf2_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m3_pf3_enable_sriov_hwtcl              = 0,
     //parameter m3_pf3_num_vf_per_pf_hwtcl             = 0,
     //parameter m3_pf3_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf3_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m3_pf4_enable_sriov_hwtcl              = 0,
     //parameter m3_pf4_num_vf_per_pf_hwtcl             = 0,
     //parameter m3_pf4_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf4_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m3_pf5_enable_sriov_hwtcl              = 0,
     //parameter m3_pf5_num_vf_per_pf_hwtcl             = 0,
     //parameter m3_pf5_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf5_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m3_pf6_enable_sriov_hwtcl              = 0,
     //parameter m3_pf6_num_vf_per_pf_hwtcl             = 0,
     //parameter m3_pf6_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf6_num_dma_chan_per_vf_hwtcl       = 0,
     //parameter m3_pf7_enable_sriov_hwtcl              = 0,
     //parameter m3_pf7_num_vf_per_pf_hwtcl             = 0,
     //parameter m3_pf7_num_dma_chan_pf_hwtcl           = 0,
     //parameter m3_pf7_num_dma_chan_per_vf_hwtcl       = 0,
     parameter m3_cs_address_width_hwtcl              = 14,
     //parameter m3_msi_enable_hwtcl                    = 0,
     //parameter m3_per_vec_mask_capable_hwtcl          = 0,
     //parameter m3_addr_64bit_capable_hwtcl            = 0,
     //parameter m3_multi_msg_capable_hwtcl             = 1,
     //parameter m3_ext_msg_data_capable_hwtcl          = 0,

     parameter qhip_p2_disable_hwtcl                   = 1,
     parameter qhip_csb2wire_en_hwtcl                  = 1,
     parameter qhip_csb_clk_div_hwtcl                  = 1,
     parameter qhip_mmio_enable_hwtcl                  = 0,
     parameter independent_perst_int_hwtcl             = 0,
     parameter qhip_silicon_reva_revb_hwtcl            = 0,
     parameter qhip_silicon_revc_hwtcl                 = 0,


     parameter core16_total_pf_count_width_hwtcl                                     = 1,
     parameter core16_total_vf_count_width_hwtcl                                     = 0,
     parameter core16_total_pf_count_hwtcl                                           = 1,
     parameter core16_total_vf_count_hwtcl                                           = 1,
     parameter core8_total_pf_count_width_hwtcl                                      = 1,
     parameter core8_total_vf_count_width_hwtcl                                      = 0,
     parameter core8_total_pf_count_hwtcl                                            = 1,
     parameter core8_total_vf_count_hwtcl                                            = 1,
     parameter core16_enable_sriov_hwtcl                                             = 0,
     parameter core8_enable_sriov_hwtcl                                              = 0,
     parameter core16_enable_cii_hwtcl                                               = 1,
     parameter core8_enable_cii_hwtcl                                                = 1,
     parameter core4_0_enable_cii_hwtcl                                              = 1,
     parameter core4_1_enable_cii_hwtcl                                              = 1,
     parameter core16_enable_cpl_timeout_hwtcl                                       = 0,
     parameter core8_enable_cpl_timeout_hwtcl                                        = 0,
     parameter core4_0_enable_cpl_timeout_hwtcl                                      = 0,
     parameter core4_1_enable_cpl_timeout_hwtcl                                      = 0,
     parameter core16_ehp_ctrl0_header_format_hwtcl                                  = 1,
     parameter core8_ehp_ctrl0_header_format_hwtcl                                   = 1,
     parameter core4_0_ehp_ctrl0_header_format_hwtcl                                 = 1,
     parameter core4_1_ehp_ctrl0_header_format_hwtcl                                 = 1,
     parameter core16_func_mode_integer_hwtcl                                        = 0,
     parameter core8_func_mode_integer_hwtcl   					     = 0,
     parameter core4_0_func_mode_integer_hwtcl 					     = 0,
     parameter core4_1_func_mode_integer_hwtcl 					     = 0,
     //DBI_RO_WR_EN func_mode
     parameter core16_dbi_ro_wr_disable_hwtcl                                        = 0,
     parameter core8_dbi_ro_wr_disable_hwtcl                                         = 0,
     parameter core4_0_dbi_ro_wr_disable_hwtcl                                       = 0,
     parameter core4_1_dbi_ro_wr_disable_hwtcl                                       = 0,
     parameter core16_txempty_enable_hwtcl                                           = 0,
     parameter core16_flr_cap_hwtcl                                                  = 0,
     parameter core8_flr_cap_hwtcl                                                   = 0,
     
     // VIRTIO - core16
     parameter core16_enable_virtio_hwtcl                                            = 0,
     parameter core16_pf0_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf0_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf0_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf0_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf0_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf0_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf0_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf0_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf0_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf0_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf0_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf0_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf0_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf0_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf0_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf0_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf0_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf0_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf1_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf1_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf1_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf1_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf1_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf1_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf1_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf1_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf1_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf1_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf1_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf1_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf1_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf1_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf1_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf1_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf1_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf1_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf2_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf2_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf2_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf2_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf2_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf2_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf2_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf2_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf2_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf2_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf2_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf2_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf2_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf2_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf2_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf2_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf2_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf2_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf3_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf3_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf3_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf3_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf3_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf3_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf3_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf3_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf3_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf3_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf3_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf3_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf3_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf3_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf3_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf3_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf3_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf3_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf4_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf4_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf4_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf4_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf4_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf4_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf4_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf4_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf4_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf4_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf4_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf4_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf4_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf4_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf4_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf4_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf4_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf4_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf5_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf5_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf5_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf5_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf5_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf5_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf5_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf5_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf5_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf5_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf5_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf5_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf5_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf5_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf5_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf5_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf5_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf5_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf6_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf6_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf6_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf6_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf6_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf6_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf6_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf6_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf6_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf6_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf6_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf6_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf6_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf6_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf6_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf6_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf6_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf6_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf7_virtio_capability_present_hwtcl                            = 0,
     parameter core16_pf7_virtio_device_specific_cap_present_hwtcl                   = 0,
     parameter core16_pf7_virtio_cmn_config_bar_indicator_hwtcl                      = 0,
     parameter core16_pf7_virtio_cmn_config_bar_offset_hwtcl                         = 0,
     parameter core16_pf7_virtio_cmn_config_structure_length_hwtcl                   = 0,
     parameter core16_pf7_virtio_notification_bar_indicator_hwtcl                    = 0,
     parameter core16_pf7_virtio_notification_bar_offset_hwtcl                       = 0,
     parameter core16_pf7_virtio_notification_structure_length_hwtcl                 = 0,
     parameter core16_pf7_virtio_notify_off_multiplier_hwtcl                         = 0,
     parameter core16_pf7_virtio_isrstatus_bar_indicator_hwtcl                       = 0,
     parameter core16_pf7_virtio_isrstatus_bar_offset_hwtcl                          = 0,
     parameter core16_pf7_virtio_isrstatus_structure_length_hwtcl                    = 0,
     parameter core16_pf7_virtio_devspecific_bar_indicator_hwtcl                     = 0,
     parameter core16_pf7_virtio_devspecific_bar_offset_hwtcl                        = 0,
     parameter core16_pf7_virtio_devspecific_structure_length_hwtcl                  = 0,
     parameter core16_pf7_virtio_pciconfig_access_bar_indicator_hwtcl                = 0,
     parameter core16_pf7_virtio_pciconfig_access_bar_offset_hwtcl                   = 0,
     parameter core16_pf7_virtio_pciconfig_access_structure_length_hwtcl             = 0,
     parameter core16_pf0vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf0vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf0vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf0vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf0vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf0vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf0vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf0vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf0vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf0vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf0vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf0vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf0vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf0vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf0vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf0vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf0vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf0vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,
     parameter core16_pf1vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf1vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf1vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf1vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf1vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf1vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf1vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf1vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf1vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf1vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf1vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf1vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf1vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf1vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf1vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf1vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf1vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf1vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,
     parameter core16_pf2vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf2vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf2vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf2vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf2vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf2vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf2vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf2vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf2vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf2vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf2vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf2vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf2vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf2vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf2vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf2vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf2vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf2vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,
     parameter core16_pf3vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf3vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf3vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf3vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf3vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf3vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf3vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf3vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf3vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf3vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf3vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf3vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf3vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf3vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf3vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf3vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf3vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf3vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,
     parameter core16_pf4vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf4vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf4vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf4vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf4vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf4vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf4vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf4vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf4vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf4vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf4vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf4vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf4vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf4vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf4vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf4vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf4vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf4vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,
     parameter core16_pf5vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf5vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf5vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf5vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf5vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf5vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf5vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf5vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf5vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf5vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf5vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf5vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf5vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf5vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf5vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf5vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf5vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf5vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,
     parameter core16_pf6vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf6vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf6vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf6vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf6vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf6vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf6vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf6vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf6vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf6vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf6vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf6vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf6vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf6vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf6vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf6vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf6vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf6vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,
     parameter core16_pf7vf_virtio_capability_present_hwtcl                          = 0,
     parameter core16_pf7vf_virtio_device_specific_cap_present_hwtcl                 = 0,
     parameter core16_pf7vf_virtio_cmn_config_bar_indicator_hwtcl                    = 0,
     parameter core16_pf7vf_virtio_cmn_config_bar_offset_hwtcl                       = 0,
     parameter core16_pf7vf_virtio_cmn_config_structure_length_hwtcl                 = 0,
     parameter core16_pf7vf_virtio_notification_bar_indicator_hwtcl                  = 0,
     parameter core16_pf7vf_virtio_notification_bar_offset_hwtcl                     = 0,
     parameter core16_pf7vf_virtio_notification_structure_length_hwtcl               = 0,
     parameter core16_pf7vf_virtio_notify_off_multiplier_hwtcl                       = 0,
     parameter core16_pf7vf_virtio_isrstatus_bar_indicator_hwtcl                     = 0,
     parameter core16_pf7vf_virtio_isrstatus_bar_offset_hwtcl                        = 0,
     parameter core16_pf7vf_virtio_isrstatus_structure_length_hwtcl                  = 0,
     parameter core16_pf7vf_virtio_devspecific_bar_indicator_hwtcl                   = 0,
     parameter core16_pf7vf_virtio_devspecific_bar_offset_hwtcl                      = 0,
     parameter core16_pf7vf_virtio_devspecific_structure_length_hwtcl                = 0,
     parameter core16_pf7vf_virtio_pciconfig_access_bar_indicator_hwtcl              = 0,
     parameter core16_pf7vf_virtio_pciconfig_access_bar_offset_hwtcl                 = 0,
     parameter core16_pf7vf_virtio_pciconfig_access_structure_length_hwtcl           = 0,

     // VIRTIO - core8
     parameter core8_enable_virtio_hwtcl                                             = 0,
     parameter core8_pf0_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf0_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf0_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf0_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf0_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf0_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf0_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf0_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf0_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf0_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf0_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf0_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf0_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf0_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf0_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf0_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf0_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf0_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf1_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf1_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf1_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf1_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf1_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf1_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf1_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf1_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf1_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf1_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf1_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf1_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf1_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf1_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf1_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf1_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf1_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf1_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf2_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf2_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf2_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf2_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf2_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf2_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf2_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf2_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf2_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf2_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf2_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf2_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf2_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf2_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf2_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf2_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf2_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf2_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf3_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf3_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf3_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf3_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf3_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf3_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf3_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf3_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf3_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf3_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf3_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf3_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf3_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf3_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf3_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf3_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf3_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf3_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf4_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf4_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf4_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf4_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf4_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf4_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf4_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf4_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf4_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf4_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf4_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf4_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf4_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf4_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf4_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf4_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf4_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf4_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf5_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf5_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf5_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf5_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf5_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf5_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf5_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf5_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf5_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf5_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf5_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf5_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf5_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf5_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf5_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf5_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf5_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf5_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf6_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf6_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf6_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf6_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf6_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf6_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf6_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf6_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf6_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf6_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf6_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf6_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf6_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf6_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf6_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf6_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf6_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf6_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf7_virtio_capability_present_hwtcl                             = 0,
     parameter core8_pf7_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core8_pf7_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core8_pf7_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core8_pf7_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core8_pf7_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core8_pf7_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core8_pf7_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core8_pf7_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core8_pf7_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core8_pf7_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core8_pf7_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core8_pf7_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core8_pf7_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core8_pf7_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core8_pf7_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core8_pf7_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core8_pf7_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     parameter core8_pf0vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf0vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf0vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf0vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf0vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf0vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf0vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf0vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf0vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf0vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf0vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf0vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf0vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf0vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf0vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf0vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf0vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf0vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,
     parameter core8_pf1vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf1vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf1vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf1vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf1vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf1vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf1vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf1vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf1vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf1vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf1vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf1vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf1vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf1vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf1vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf1vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf1vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf1vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,
     parameter core8_pf2vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf2vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf2vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf2vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf2vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf2vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf2vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf2vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf2vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf2vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf2vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf2vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf2vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf2vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf2vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf2vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf2vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf2vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,
     parameter core8_pf3vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf3vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf3vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf3vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf3vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf3vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf3vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf3vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf3vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf3vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf3vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf3vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf3vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf3vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf3vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf3vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf3vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf3vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,
     parameter core8_pf4vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf4vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf4vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf4vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf4vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf4vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf4vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf4vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf4vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf4vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf4vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf4vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf4vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf4vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf4vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf4vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf4vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf4vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,
     parameter core8_pf5vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf5vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf5vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf5vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf5vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf5vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf5vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf5vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf5vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf5vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf5vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf5vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf5vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf5vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf5vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf5vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf5vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf5vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,
     parameter core8_pf6vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf6vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf6vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf6vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf6vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf6vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf6vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf6vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf6vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf6vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf6vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf6vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf6vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf6vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf6vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf6vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf6vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf6vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,
     parameter core8_pf7vf_virtio_capability_present_hwtcl                           = 0,
     parameter core8_pf7vf_virtio_device_specific_cap_present_hwtcl                  = 0,
     parameter core8_pf7vf_virtio_cmn_config_bar_indicator_hwtcl                     = 0,
     parameter core8_pf7vf_virtio_cmn_config_bar_offset_hwtcl                        = 0,
     parameter core8_pf7vf_virtio_cmn_config_structure_length_hwtcl                  = 0,
     parameter core8_pf7vf_virtio_notification_bar_indicator_hwtcl                   = 0,
     parameter core8_pf7vf_virtio_notification_bar_offset_hwtcl                      = 0,
     parameter core8_pf7vf_virtio_notification_structure_length_hwtcl                = 0,
     parameter core8_pf7vf_virtio_notify_off_multiplier_hwtcl                        = 0,
     parameter core8_pf7vf_virtio_isrstatus_bar_indicator_hwtcl                      = 0,
     parameter core8_pf7vf_virtio_isrstatus_bar_offset_hwtcl                         = 0,
     parameter core8_pf7vf_virtio_isrstatus_structure_length_hwtcl                   = 0,
     parameter core8_pf7vf_virtio_devspecific_bar_indicator_hwtcl                    = 0,
     parameter core8_pf7vf_virtio_devspecific_bar_offset_hwtcl                       = 0,
     parameter core8_pf7vf_virtio_devspecific_structure_length_hwtcl                 = 0,
     parameter core8_pf7vf_virtio_pciconfig_access_bar_indicator_hwtcl               = 0,
     parameter core8_pf7vf_virtio_pciconfig_access_bar_offset_hwtcl                  = 0,
     parameter core8_pf7vf_virtio_pciconfig_access_structure_length_hwtcl            = 0,

     // VIRTIO - core4_0
     parameter core4_0_enable_virtio_hwtcl                                             = 0,
     parameter core4_0_pf0_virtio_capability_present_hwtcl                             = 0,
     parameter core4_0_pf0_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core4_0_pf0_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core4_0_pf0_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core4_0_pf0_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core4_0_pf0_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core4_0_pf0_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core4_0_pf0_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core4_0_pf0_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core4_0_pf0_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core4_0_pf0_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core4_0_pf0_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core4_0_pf0_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core4_0_pf0_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core4_0_pf0_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core4_0_pf0_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core4_0_pf0_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core4_0_pf0_virtio_pciconfig_access_structure_length_hwtcl              = 0,
     
     // VIRTIO - core4_1
     parameter core4_1_enable_virtio_hwtcl                                             = 0,
     parameter core4_1_pf0_virtio_capability_present_hwtcl                             = 0,
     parameter core4_1_pf0_virtio_device_specific_cap_present_hwtcl                    = 0,
     parameter core4_1_pf0_virtio_cmn_config_bar_indicator_hwtcl                       = 0,
     parameter core4_1_pf0_virtio_cmn_config_bar_offset_hwtcl                          = 0,
     parameter core4_1_pf0_virtio_cmn_config_structure_length_hwtcl                    = 0,
     parameter core4_1_pf0_virtio_notification_bar_indicator_hwtcl                     = 0,
     parameter core4_1_pf0_virtio_notification_bar_offset_hwtcl                        = 0,
     parameter core4_1_pf0_virtio_notification_structure_length_hwtcl                  = 0,
     parameter core4_1_pf0_virtio_notify_off_multiplier_hwtcl                          = 0,
     parameter core4_1_pf0_virtio_isrstatus_bar_indicator_hwtcl                        = 0,
     parameter core4_1_pf0_virtio_isrstatus_bar_offset_hwtcl                           = 0,
     parameter core4_1_pf0_virtio_isrstatus_structure_length_hwtcl                     = 0,
     parameter core4_1_pf0_virtio_devspecific_bar_indicator_hwtcl                      = 0,
     parameter core4_1_pf0_virtio_devspecific_bar_offset_hwtcl                         = 0,
     parameter core4_1_pf0_virtio_devspecific_structure_length_hwtcl                   = 0,
     parameter core4_1_pf0_virtio_pciconfig_access_bar_indicator_hwtcl                 = 0,
     parameter core4_1_pf0_virtio_pciconfig_access_bar_offset_hwtcl                    = 0,
     parameter core4_1_pf0_virtio_pciconfig_access_structure_length_hwtcl              = 0,

     parameter core16_pf0_vf_count_hwtcl                                             = 0,
     parameter core16_pf1_vf_count_hwtcl                                             = 0,
     parameter core16_pf2_vf_count_hwtcl                                             = 0,
     parameter core16_pf3_vf_count_hwtcl                                             = 0,
     parameter core16_pf4_vf_count_hwtcl                                             = 0,
     parameter core16_pf5_vf_count_hwtcl                                             = 0,
     parameter core16_pf6_vf_count_hwtcl                                             = 0,
     parameter core16_pf7_vf_count_hwtcl                                             = 0,
     parameter core8_pf0_vf_count_hwtcl                                              = 0,
     parameter core8_pf1_vf_count_hwtcl                                              = 0,
     parameter core8_pf2_vf_count_hwtcl                                              = 0,
     parameter core8_pf3_vf_count_hwtcl                                              = 0,
     parameter core8_pf4_vf_count_hwtcl                                              = 0,
     parameter core8_pf5_vf_count_hwtcl                                              = 0,
     parameter core8_pf6_vf_count_hwtcl                                              = 0,
     parameter core8_pf7_vf_count_hwtcl                                              = 0,

     // HIP_TOP params - core16
     parameter pf0_bar0_address_width_hwtcl                                   = 16,
     parameter pf0_bar1_address_width_hwtcl                                   = 16,
     parameter pf0_bar2_address_width_hwtcl                                   = 16,
     parameter pf0_bar3_address_width_hwtcl                                   = 16,
     parameter pf0_bar4_address_width_hwtcl                                   = 16,
     parameter pf0_bar5_address_width_hwtcl                                   = 16,
     parameter pf1_bar0_address_width_hwtcl                                   = 16,
     parameter pf1_bar1_address_width_hwtcl                                   = 16,
     parameter pf1_bar2_address_width_hwtcl                                   = 16,
     parameter pf1_bar3_address_width_hwtcl                                   = 16,
     parameter pf1_bar4_address_width_hwtcl                                   = 16,
     parameter pf1_bar5_address_width_hwtcl                                   = 16,
     parameter pf2_bar0_address_width_hwtcl                                   = 16,
     parameter pf2_bar1_address_width_hwtcl                                   = 16,
     parameter pf2_bar2_address_width_hwtcl                                   = 16,
     parameter pf2_bar3_address_width_hwtcl                                   = 16,
     parameter pf2_bar4_address_width_hwtcl                                   = 16,
     parameter pf2_bar5_address_width_hwtcl                                   = 16,
     parameter pf3_bar0_address_width_hwtcl                                   = 16,
     parameter pf3_bar1_address_width_hwtcl                                   = 16,
     parameter pf3_bar2_address_width_hwtcl                                   = 16,
     parameter pf3_bar3_address_width_hwtcl                                   = 16,
     parameter pf3_bar4_address_width_hwtcl                                   = 16,
     parameter pf3_bar5_address_width_hwtcl                                   = 16,
     parameter pf4_bar0_address_width_hwtcl                                   = 16,
     parameter pf4_bar1_address_width_hwtcl                                   = 16,
     parameter pf4_bar2_address_width_hwtcl                                   = 16,
     parameter pf4_bar3_address_width_hwtcl                                   = 16,
     parameter pf4_bar4_address_width_hwtcl                                   = 16,
     parameter pf4_bar5_address_width_hwtcl                                   = 16,
     parameter pf5_bar0_address_width_hwtcl                                   = 16,
     parameter pf5_bar1_address_width_hwtcl                                   = 16,
     parameter pf5_bar2_address_width_hwtcl                                   = 16,
     parameter pf5_bar3_address_width_hwtcl                                   = 16,
     parameter pf5_bar4_address_width_hwtcl                                   = 16,
     parameter pf5_bar5_address_width_hwtcl                                   = 16,
     parameter pf6_bar0_address_width_hwtcl                                   = 16,
     parameter pf6_bar1_address_width_hwtcl                                   = 16,
     parameter pf6_bar2_address_width_hwtcl                                   = 16,
     parameter pf6_bar3_address_width_hwtcl                                   = 16,
     parameter pf6_bar4_address_width_hwtcl                                   = 16,
     parameter pf6_bar5_address_width_hwtcl                                   = 16,
     parameter pf7_bar0_address_width_hwtcl                                   = 16,
     parameter pf7_bar1_address_width_hwtcl                                   = 16,
     parameter pf7_bar2_address_width_hwtcl                                   = 16,
     parameter pf7_bar3_address_width_hwtcl                                   = 16,
     parameter pf7_bar4_address_width_hwtcl                                   = 16,
     parameter pf7_bar5_address_width_hwtcl                                   = 16,

     parameter pf0_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf0_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf0_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf0_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf0_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf0_sriov_vf_bar5_address_width_hwtcl                          = 16,
     parameter pf1_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf1_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf1_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf1_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf1_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf1_sriov_vf_bar5_address_width_hwtcl                          = 16,
     parameter pf2_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf2_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf2_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf2_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf2_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf2_sriov_vf_bar5_address_width_hwtcl                          = 16,
     parameter pf3_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf3_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf3_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf3_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf3_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf3_sriov_vf_bar5_address_width_hwtcl                          = 16,
     parameter pf4_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf4_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf4_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf4_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf4_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf4_sriov_vf_bar5_address_width_hwtcl                          = 16,
     parameter pf5_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf5_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf5_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf5_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf5_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf5_sriov_vf_bar5_address_width_hwtcl                          = 16,
     parameter pf6_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf6_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf6_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf6_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf6_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf6_sriov_vf_bar5_address_width_hwtcl                          = 16,
     parameter pf7_sriov_vf_bar0_address_width_hwtcl                          = 16,
     parameter pf7_sriov_vf_bar1_address_width_hwtcl                          = 16,
     parameter pf7_sriov_vf_bar2_address_width_hwtcl                          = 16,
     parameter pf7_sriov_vf_bar3_address_width_hwtcl                          = 16,
     parameter pf7_sriov_vf_bar4_address_width_hwtcl                          = 16,
     parameter pf7_sriov_vf_bar5_address_width_hwtcl                          = 16,

     // HIP_TOP params - core8
     parameter m1_pf0_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf0_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf0_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf0_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf0_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf0_bar5_address_width_hwtcl                                = 16,
     parameter m1_pf1_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf1_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf1_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf1_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf1_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf1_bar5_address_width_hwtcl                                = 16,
     parameter m1_pf2_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf2_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf2_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf2_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf2_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf2_bar5_address_width_hwtcl                                = 16,
     parameter m1_pf3_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf3_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf3_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf3_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf3_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf3_bar5_address_width_hwtcl                                = 16,
     parameter m1_pf4_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf4_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf4_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf4_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf4_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf4_bar5_address_width_hwtcl                                = 16,
     parameter m1_pf5_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf5_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf5_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf5_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf5_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf5_bar5_address_width_hwtcl                                = 16,
     parameter m1_pf6_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf6_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf6_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf6_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf6_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf6_bar5_address_width_hwtcl                                = 16,
     parameter m1_pf7_bar0_address_width_hwtcl                                = 16,
     parameter m1_pf7_bar1_address_width_hwtcl                                = 16,
     parameter m1_pf7_bar2_address_width_hwtcl                                = 16,
     parameter m1_pf7_bar3_address_width_hwtcl                                = 16,
     parameter m1_pf7_bar4_address_width_hwtcl                                = 16,
     parameter m1_pf7_bar5_address_width_hwtcl                                = 16,

     parameter m1_pf0_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf0_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf0_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf0_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf0_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf0_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter m1_pf1_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf1_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf1_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf1_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf1_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf1_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter m1_pf2_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf2_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf2_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf2_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf2_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf2_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter m1_pf3_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf3_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf3_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf3_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf3_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf3_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter m1_pf4_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf4_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf4_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf4_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf4_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf4_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter m1_pf5_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf5_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf5_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf5_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf5_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf5_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter m1_pf6_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf6_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf6_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf6_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf6_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf6_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter m1_pf7_sriov_vf_bar0_address_width_hwtcl                        = 16,
     parameter m1_pf7_sriov_vf_bar1_address_width_hwtcl                        = 16,
     parameter m1_pf7_sriov_vf_bar2_address_width_hwtcl                        = 16,
     parameter m1_pf7_sriov_vf_bar3_address_width_hwtcl                        = 16,
     parameter m1_pf7_sriov_vf_bar4_address_width_hwtcl                        = 16,
     parameter m1_pf7_sriov_vf_bar5_address_width_hwtcl                        = 16,
     parameter rtile_debug_toolkit_hwtcl                                       = 0,
     parameter rtile_enable_pciess_register_access_hwtcl                       = 0,
     parameter rtile_link_insp_en_hwtcl                                        = 0,

//Shoaib
     // HIP_TOP params - core4_0
     parameter m2_pf0_bar0_address_width_hwtcl                                = 16,
     parameter m2_pf0_bar1_address_width_hwtcl                                = 16,
     parameter m2_pf0_bar2_address_width_hwtcl                                = 16,
     parameter m2_pf0_bar3_address_width_hwtcl                                = 16,
     parameter m2_pf0_bar4_address_width_hwtcl                                = 16,
     parameter m2_pf0_bar5_address_width_hwtcl                                = 16,
//Shoaib
     // HIP_TOP params - core4_1
     parameter m3_pf0_bar0_address_width_hwtcl                                = 16,
     parameter m3_pf0_bar1_address_width_hwtcl                                = 16,
     parameter m3_pf0_bar2_address_width_hwtcl                                = 16,
     parameter m3_pf0_bar3_address_width_hwtcl                                = 16,
     parameter m3_pf0_bar4_address_width_hwtcl                                = 16,
     parameter m3_pf0_bar5_address_width_hwtcl                                = 16

     )(
       //Serial ports
       input                                                                              rx_n_in0, 
       input                                                                              rx_n_in1, 
       input                                                                              rx_n_in2, 
       input                                                                              rx_n_in3, 
       input                                                                              rx_n_in4, 
       input                                                                              rx_n_in5, 
       input                                                                              rx_n_in6, 
       input                                                                              rx_n_in7, 
       input                                                                              rx_n_in8, 
       input                                                                              rx_n_in9, 
       input                                                                              rx_n_in10, 
       input                                                                              rx_n_in11, 
       input                                                                              rx_n_in12, 
       input                                                                              rx_n_in13, 
       input                                                                              rx_n_in14, 
       input                                                                              rx_n_in15, 
       input                                                                              rx_p_in0, 
       input                                                                              rx_p_in1, 
       input                                                                              rx_p_in2, 
       input                                                                              rx_p_in3, 
       input                                                                              rx_p_in4, 
       input                                                                              rx_p_in5, 
       input                                                                              rx_p_in6, 
       input                                                                              rx_p_in7, 
       input                                                                              rx_p_in8, 
       input                                                                              rx_p_in9, 
       input                                                                              rx_p_in10, 
       input                                                                              rx_p_in11, 
       input                                                                              rx_p_in12, 
       input                                                                              rx_p_in13, 
       input                                                                              rx_p_in14, 
       input                                                                              rx_p_in15, 
       output                                                                             tx_n_out0, 
       output                                                                             tx_n_out1, 
       output                                                                             tx_n_out2, 
       output                                                                             tx_n_out3, 
       output                                                                             tx_n_out4, 
       output                                                                             tx_n_out5, 
       output                                                                             tx_n_out6, 
       output                                                                             tx_n_out7, 
       output                                                                             tx_n_out8, 
       output                                                                             tx_n_out9, 
       output                                                                             tx_n_out10, 
       output                                                                             tx_n_out11, 
       output                                                                             tx_n_out12, 
       output                                                                             tx_n_out13, 
       output                                                                             tx_n_out14, 
       output                                                                             tx_n_out15, 
       output                                                                             tx_p_out0, 
       output                                                                             tx_p_out1, 
       output                                                                             tx_p_out2, 
       output                                                                             tx_p_out3, 
       output                                                                             tx_p_out4, 
       output                                                                             tx_p_out5, 
       output                                                                             tx_p_out6, 
       output                                                                             tx_p_out7, 
       output                                                                             tx_p_out8, 
       output                                                                             tx_p_out9, 
       output                                                                             tx_p_out10, 
       output                                                                             tx_p_out11, 
       output                                                                             tx_p_out12, 
       output                                                                             tx_p_out13, 
       output                                                                             tx_p_out14, 
       output                                                                             tx_p_out15, 
       input                                                                              refclk0, 
       input                                                                              refclk1,
       input                                                                              refclk2,
  
       input                                                                              ninit_done, 
  
       output                                                                             app_clk, 
       output                                                                             app_rst_n,
       output                                                                             app_slow_clk,
  
       
       // AVMM Master PIO interface "(!enable_mcdma_hwtcl) || (enable_mcdma_hwtcl && enable_bursting_master_hwtcl)"
       output [pio_address_width_hwtcl-1:0]                                               rx_pio_address_o,
       output [pio_data_width_hwtcl/8-1:0]                                                rx_pio_byteenable_o,
       output                                                                             rx_pio_read_o,
       output                                                                             rx_pio_write_o,
       output [pio_data_width_hwtcl-1:0]                                                  rx_pio_writedata_o,
       output [3:0]                                                                       rx_pio_burstcount_o,
       input                                                                              rx_pio_waitrequest_i,
       input [pio_data_width_hwtcl-1:0]                                                   rx_pio_readdata_i,
       input                                                                              rx_pio_readdatavalid_i,
       input [1:0]                                                                        rx_pio_response_i,
       input                                                                              rx_pio_writeresponsevalid_i,

       // H2D AVST Master Interface    "(num_h2d_avst_uport_hwtcl < 1) || (!enable_mcdma_hwtcl)"
       output logic                                                                       h2d_st_sof_0_o,
       output logic                                                                       h2d_st_eof_0_o,
       output logic [empty_width_hwtcl-1:0]                                               h2d_st_empty_0_o,
       input logic                                                                        h2d_st_ready_0_i,
       output logic                                                                       h2d_st_valid_0_o,
       output logic [data_width_hwtcl-1:0]                                                h2d_st_data_0_o,
       output logic [ST_CHANNEL_WIDTH-1:0]                                                h2d_st_channel_0_o,
       // H2D AVST Master Interface   "(num_h2d_avst_uport_hwtcl < 2) || (!enable_mcdma_hwtcl)"
       output logic                                                                       h2d_st_sof_1_o,
       output logic                                                                       h2d_st_eof_1_o,
       output logic [empty_width_hwtcl-1:0]                                               h2d_st_empty_1_o,
       input logic                                                                        h2d_st_ready_1_i,
       output logic                                                                       h2d_st_valid_1_o,
       output logic [data_width_hwtcl-1:0]                                                h2d_st_data_1_o,
       output logic [ST_CHANNEL_WIDTH-1:0]                                                h2d_st_channel_1_o,
       // H2D AVST Master Interface    "(num_h2d_avst_uport_hwtcl < 3) || (!enable_mcdma_hwtcl)"
       output logic                                                                       h2d_st_sof_2_o,
       output logic                                                                       h2d_st_eof_2_o,
       output logic [empty_width_hwtcl-1:0]                                               h2d_st_empty_2_o,
       input logic                                                                        h2d_st_ready_2_i,
       output logic                                                                       h2d_st_valid_2_o,
       output logic [data_width_hwtcl-1:0]                                                h2d_st_data_2_o,
       output logic [ST_CHANNEL_WIDTH-1:0]                                                h2d_st_channel_2_o,
       // H2D AVST Master Interface    "(num_h2d_avst_uport_hwtcl < 4) || (!enable_mcdma_hwtcl)"
       output logic                                                                       h2d_st_sof_3_o,
       output logic                                                                       h2d_st_eof_3_o,
       output logic [empty_width_hwtcl-1:0]                                               h2d_st_empty_3_o,
       input logic                                                                        h2d_st_ready_3_i,
       output logic                                                                       h2d_st_valid_3_o,
       output logic [data_width_hwtcl-1:0]                                                h2d_st_data_3_o,
       output logic [ST_CHANNEL_WIDTH-1:0]                                                h2d_st_channel_3_o,
       // H2D AVMM Master Interface  "(num_h2d_avmm_uport_hwtcl < 1) || (!enable_mcdma_hwtcl)" 
       input logic                                                                        h2ddm_waitrequest_i,
       input logic                                                                        h2ddm_writeresponsevalid_i,
       output logic                                                                       h2ddm_write_o,
       output logic [address_width_hwtcl-1:0]                                             h2ddm_address_o,
       output logic [burst_width_hwtcl-1:0]                                               h2ddm_burstcount_o,
       output logic [data_width_hwtcl/8-1:0]                                              h2ddm_byteenable_o,
       output logic [data_width_hwtcl-1:0]                                                h2ddm_writedata_o,
       // D2H AVST interface    "num_d2h_avst_uport_hwtcl < 1 || enable_mcdma_hwtcl == 0"
       input logic                                                                        d2h_st_sof_0_i,
       input logic                                                                        d2h_st_eof_0_i,
       input logic [empty_width_hwtcl-1:0]                                                d2h_st_empty_0_i,
       input logic [ST_CHANNEL_WIDTH-1:0]                                                 d2h_st_channel_0_i,
       input logic                                                                        d2h_st_valid_0_i,
       input logic [data_width_hwtcl-1:0]                                                 d2h_st_data_0_i,
       output logic                                                                       d2h_st_ready_0_o,
       // D2H AVST interface   "num_d2h_avst_uport_hwtcl < 2 || enable_mcdma_hwtcl == 0"
       input logic                                                                        d2h_st_sof_1_i,
       input logic                                                                        d2h_st_eof_1_i,
       input logic [empty_width_hwtcl-1:0]                                                d2h_st_empty_1_i,
       input logic [ST_CHANNEL_WIDTH-1:0]                                                 d2h_st_channel_1_i,
       input logic                                                                        d2h_st_valid_1_i,
       input logic [data_width_hwtcl-1:0]                                                 d2h_st_data_1_i,
       output logic                                                                       d2h_st_ready_1_o,
       // D2H AVST interface   "num_d2h_avst_uport_hwtcl < 3 || enable_mcdma_hwtcl == 0"
       input logic                                                                        d2h_st_sof_2_i,
       input logic                                                                        d2h_st_eof_2_i,
       input logic [empty_width_hwtcl-1:0]                                                d2h_st_empty_2_i,
       input logic [ST_CHANNEL_WIDTH-1:0]                                                 d2h_st_channel_2_i,
       input logic                                                                        d2h_st_valid_2_i,
       input logic [data_width_hwtcl-1:0]                                                 d2h_st_data_2_i,
       output logic                                                                       d2h_st_ready_2_o,
       // D2H AVST interface     "num_d2h_avst_uport_hwtcl < 4 || enable_mcdma_hwtcl == 0"
       input logic                                                                        d2h_st_sof_3_i,
       input logic                                                                        d2h_st_eof_3_i,
       input logic [empty_width_hwtcl-1:0]                                                d2h_st_empty_3_i,
       input logic [ST_CHANNEL_WIDTH-1:0]                                                 d2h_st_channel_3_i,
       input logic                                                                        d2h_st_valid_3_i,
       input logic [data_width_hwtcl-1:0]                                                 d2h_st_data_3_i,
       output logic                                                                       d2h_st_ready_3_o,
       //D2H AVMM Read Master Interface    "(num_d2h_avmm_uport_hwtcl < 1) || (!enable_mcdma_hwtcl)"
       output logic [address_width_hwtcl-1:0]                                             d2hdm_address_o,
       output logic [data_width_hwtcl/8-1:0]                                              d2hdm_byteenable_o,
       output logic                                                                       d2hdm_read_o,
       output logic [burst_width_hwtcl-1:0]                                               d2hdm_burstcount_o,
       input logic                                                                        d2hdm_waitrequest_i,
       input logic [data_width_hwtcl-1:0]                                                 d2hdm_readdata_i,
       input logic                                                                        d2hdm_readdatavalid_i,
       input logic [1:0]                                                                  d2hdm_response_i,

       //AVST interface
       //H2D descriptor input on AVST sink interface
       output logic                                                                       h2ddm_desc_ready_o,
       input logic                                                                        h2ddm_desc_valid_i, 
       input logic [255:0]                                                                h2ddm_desc_data_i, // h2d_desc_bypass_t
       //H2D AVST Status source interface                                                
       output logic [31:0]                                                                h2ddm_desc_status_data_o, // h2d_desc_status_t
       output logic                                                                       h2ddm_desc_status_valid_o,
       //H2D AVST Source completion interface                                            
       output logic [data_width_hwtcl-1:0]                                                h2ddm_desc_cmpl_data_o, // h2d_desc_cmpl_t
       output logic [empty_width_hwtcl-1:0]                                               h2ddm_desc_cmpl_empty_o,
       output logic                                                                       h2ddm_desc_cmpl_sop_o, 
       output logic                                                                       h2ddm_desc_cmpl_eop_o, 
       output logic                                                                       h2ddm_desc_cmpl_valid_o, 
       input logic                                                                        h2ddm_desc_cmpl_ready_i,
       //D2H descriptor input on AVST sink interface                                     
       output logic                                                                       d2hdm_desc_ready_o, 
       input logic                                                                        d2hdm_desc_valid_i, 
       input logic [255:0]                                                                d2hdm_desc_data_i, // d2h_desc_bypass_t
       //D2H AVST Status source interface                                                
       output logic [31:0]                                                                d2hdm_desc_status_data_o, // d2h_desc_status_t
       output logic                                                                       d2hdm_desc_status_valid_o,
  
       // "(!enable_bursting_master_hwtcl)" 
       input logic                                                                        bam_waitrequest_i, 
       output logic [enable_cs_hwtcl ==1 ? address_width_hwtcl-1 : (((pfcnt_w_hwtcl+vfcnt_w_hwtcl)+max_bar_address_width_hwtcl)+4)-1:0] bam_address_o, 
       output logic [(data_width_hwtcl/8)-1:0]                                            bam_byteenable_o, 
       output logic                                                                       bam_read_o, 
       input logic [data_width_hwtcl-1:0]                                                 bam_readdata_i, 
       input logic                                                                        bam_readdatavalid_i, 
       output logic                                                                       bam_write_o, 
       output logic [data_width_hwtcl-1:0]                                                bam_writedata_o, 
       output logic [burst_width_hwtcl-1:0]                                               bam_burstcount_o, 

       // Configuration Intercept Interface (CII) to User
       output logic                                                                       usr_cii_req_o,
       output logic                                                                       usr_cii_hdr_poisoned_o,
       output logic [3:0]                                                                 usr_cii_hdr_first_be_o,
       output logic [2:0]                                                                 usr_cii_func_num_o,
       output logic                                                                       usr_cii_wr_o,
       output logic [9:0]                                                                 usr_cii_addr_o,
       output logic [31:0]                                                                usr_cii_dout_o,
       input  logic                                                                       usr_cii_override_en_i,
       input  logic [31:0]                                                                usr_cii_override_din_i,
       input  logic                                                                       usr_cii_halt_i,
       output logic                                                                       usr_cii_wr_vf_active_o,
       output logic [10:0]                                                                usr_cii_vf_num_o,

       // MSI-X Request interface from application/user side    !enable_user_msix_hwtcl
       input logic                                                                        usr_event_msix_valid_i,
       output logic                                                                       usr_event_msix_ready_o,
       input logic [15:0]                                                                 usr_event_msix_data_i,
       //FLR interface to application/user side   !enable_user_flr_hwtcl
       output logic                                                                       usr_flr_rcvd_val_o,
       output logic [10:0]                                                                usr_flr_rcvd_chan_num_o,
       input logic                                                                        usr_flr_completed_i,
       // BAS interface   "(!enable_bursting_slave_hwtcl)"
       input logic                                                                        bas_vfactive_i,
       input logic [pfnum_width_hwtcl-1:0]                                                bas_pfnum_i,
       input logic [vfnum_width_hwtcl-1:0]                                                bas_vfnum_i,
       input logic [bas_address_width_hwtcl-1:0]                                          bas_address_i,
       input logic [data_width_hwtcl/8-1:0]                                               bas_byteenable_i,
       input logic                                                                        bas_read_i,
       input logic                                                                        bas_write_i,
       input logic [data_width_hwtcl-1:0]                                                 bas_writedata_i,
       input logic [burst_width_hwtcl-1:0]                                                bas_burstcount_i,
       output logic                                                                       bas_waitrequest_o,
       output logic [data_width_hwtcl-1:0]                                                bas_readdata_o,
       output logic                                                                       bas_readdatavalid_o,
       output logic [1:0]                                                                 bas_response_o,
       // Usr Reconfig interface   "(!enable_user_hip_reconfig_hwtcl)"
       output logic                                                                       usr_hip_reconfig_rst_n_o,
       output logic                                                                       usr_hip_reconfig_clk_o,
       input logic [31:0]                                                                 usr_hip_reconfig_address_i,
       input logic                                                                        usr_hip_reconfig_read_i,
       input logic                                                                        usr_hip_reconfig_write_i,
       input logic [7:0]                                                                  usr_hip_reconfig_writedata_i,
       output logic [7:0]                                                                 usr_hip_reconfig_readdata_o,
       output logic                                                                       usr_hip_reconfig_readdatavalid_o,
       output logic                                                                       usr_hip_reconfig_waitrequest_o,
       //CS AVMM slave interface   "(!enable_cs_hwtcl)"
       output logic                                                                       cs_waitrequest_o,
       input logic [cs_address_width_hwtcl-1:0]                                           cs_address_i,
       input logic [3:0]                                                                  cs_byteenable_i,
       input logic                                                                        cs_read_i,
       output logic [31:0]                                                                cs_readdata_o,
       output logic                                                                       cs_readdatavalid_o,
       input logic                                                                        cs_write_i,
       input logic [31:0]                                                                 cs_writedata_i,
       output logic [1:0]                                                                 cs_response_o, 
       output logic                                                                       cs_writeresponsevalid_o,

       //MSI interface to user
       input  logic                                                                       msi_req_i,
       input  logic [pfnum_width_hwtcl-1:0]                                               msi_func_num_i,
       input  logic [4:0]                                                                 msi_num_i,
       output logic                                                                       msi_ack_o,
       output logic [1:0]                                                                 msi_status_o,
       output                                                                             dtk_reconfig_clk,
       input                                                                              dummy_user_avmm_rst,

 //LLTAN_FAST_PIPE
   output   fastp_pcie_pipe_p0_lane_rst_n,
   output   fastp_pcie_pipe_p1_lane_rst_n,
   output   fastp_pcie_pipe_p2_lane_rst_n,
   output   fastp_pcie_pipe_p3_lane_rst_n,
   output	fastp_pcie_l0_pipe_clk,
   output	fastp_pcie_l1_pipe_clk,
   output	fastp_pcie_l2_pipe_clk,
   output	fastp_pcie_l3_pipe_clk,
   output	fastp_pcie_l4_pipe_clk,
   output	fastp_pcie_l5_pipe_clk,
   output	fastp_pcie_l6_pipe_clk,
   output	fastp_pcie_l7_pipe_clk,
   output	fastp_pcie_l8_pipe_clk,
   output	fastp_pcie_l9_pipe_clk,
   output	fastp_pcie_l10_pipe_clk,
   output	fastp_pcie_l11_pipe_clk,
   output	fastp_pcie_l12_pipe_clk,
   output	fastp_pcie_l13_pipe_clk,
   output	fastp_pcie_l14_pipe_clk,
   output	fastp_pcie_l15_pipe_clk,
   output [7:0]	fastp_pcie_mac_phy_ch0_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch0_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch0_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch0_rate_o,
   output	fastp_pcie_mac_phy_ch0_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch0_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch0_txdata_o,
   output	fastp_pcie_mac_phy_ch0_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch0_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch0_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch0_width_o,
   output	fastp_pcie_mac_phy_ch0_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch0_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch0_rxtermination_o,
   output	fastp_pcie_mac_phy_ch0_srisenable_o,
   output	fastp_pcie_mac_phy_ch0_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch0_messagebus_i,
   input	fastp_pcie_phy_mac_ch0_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch0_rxdata_i,
   input	fastp_pcie_phy_mac_ch0_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch0_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch0_rxstatus_i,
   input	fastp_pcie_phy_mac_ch0_rxvalid_i,
   input	fastp_pcie_phy_mac_ch0_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch1_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch1_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch1_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch1_rate_o,
   output	fastp_pcie_mac_phy_ch1_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch1_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch1_txdata_o,
   output	fastp_pcie_mac_phy_ch1_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch1_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch1_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch1_width_o,
   output	fastp_pcie_mac_phy_ch1_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch1_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch1_rxtermination_o,
   output	fastp_pcie_mac_phy_ch1_srisenable_o,
   output	fastp_pcie_mac_phy_ch1_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch1_messagebus_i,
   input	fastp_pcie_phy_mac_ch1_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch1_rxdata_i,
   input	fastp_pcie_phy_mac_ch1_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch1_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch1_rxstatus_i,
   input	fastp_pcie_phy_mac_ch1_rxvalid_i,
   input	fastp_pcie_phy_mac_ch1_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch2_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch2_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch2_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch2_rate_o,
   output	fastp_pcie_mac_phy_ch2_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch2_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch2_txdata_o,
   output	fastp_pcie_mac_phy_ch2_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch2_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch2_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch2_width_o,
   output	fastp_pcie_mac_phy_ch2_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch2_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch2_rxtermination_o,
   output	fastp_pcie_mac_phy_ch2_srisenable_o,
   output	fastp_pcie_mac_phy_ch2_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch2_messagebus_i,
   input	fastp_pcie_phy_mac_ch2_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch2_rxdata_i,
   input	fastp_pcie_phy_mac_ch2_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch2_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch2_rxstatus_i,
   input	fastp_pcie_phy_mac_ch2_rxvalid_i,
   input	fastp_pcie_phy_mac_ch2_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch3_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch3_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch3_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch3_rate_o,
   output	fastp_pcie_mac_phy_ch3_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch3_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch3_txdata_o,
   output	fastp_pcie_mac_phy_ch3_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch3_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch3_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch3_width_o,
   output	fastp_pcie_mac_phy_ch3_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch3_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch3_rxtermination_o,
   output	fastp_pcie_mac_phy_ch3_srisenable_o,
   output	fastp_pcie_mac_phy_ch3_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch3_messagebus_i,
   input	fastp_pcie_phy_mac_ch3_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch3_rxdata_i,
   input	fastp_pcie_phy_mac_ch3_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch3_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch3_rxstatus_i,
   input	fastp_pcie_phy_mac_ch3_rxvalid_i,
   input	fastp_pcie_phy_mac_ch3_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch4_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch4_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch4_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch4_rate_o,
   output	fastp_pcie_mac_phy_ch4_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch4_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch4_txdata_o,
   output	fastp_pcie_mac_phy_ch4_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch4_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch4_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch4_width_o,
   output	fastp_pcie_mac_phy_ch4_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch4_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch4_rxtermination_o,
   output	fastp_pcie_mac_phy_ch4_srisenable_o,
   output	fastp_pcie_mac_phy_ch4_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch4_messagebus_i,
   input	fastp_pcie_phy_mac_ch4_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch4_rxdata_i,
   input	fastp_pcie_phy_mac_ch4_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch4_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch4_rxstatus_i,
   input	fastp_pcie_phy_mac_ch4_rxvalid_i,
   input	fastp_pcie_phy_mac_ch4_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch5_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch5_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch5_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch5_rate_o,
   output	fastp_pcie_mac_phy_ch5_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch5_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch5_txdata_o,
   output	fastp_pcie_mac_phy_ch5_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch5_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch5_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch5_width_o,
   output	fastp_pcie_mac_phy_ch5_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch5_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch5_rxtermination_o,
   output	fastp_pcie_mac_phy_ch5_srisenable_o,
   output	fastp_pcie_mac_phy_ch5_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch5_messagebus_i,
   input	fastp_pcie_phy_mac_ch5_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch5_rxdata_i,
   input	fastp_pcie_phy_mac_ch5_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch5_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch5_rxstatus_i,
   input	fastp_pcie_phy_mac_ch5_rxvalid_i,
   input	fastp_pcie_phy_mac_ch5_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch6_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch6_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch6_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch6_rate_o,
   output	fastp_pcie_mac_phy_ch6_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch6_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch6_txdata_o,
   output	fastp_pcie_mac_phy_ch6_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch6_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch6_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch6_width_o,
   output	fastp_pcie_mac_phy_ch6_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch6_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch6_rxtermination_o,
   output	fastp_pcie_mac_phy_ch6_srisenable_o,
   output	fastp_pcie_mac_phy_ch6_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch6_messagebus_i,
   input	fastp_pcie_phy_mac_ch6_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch6_rxdata_i,
   input	fastp_pcie_phy_mac_ch6_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch6_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch6_rxstatus_i,
   input	fastp_pcie_phy_mac_ch6_rxvalid_i,
   input	fastp_pcie_phy_mac_ch6_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch7_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch7_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch7_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch7_rate_o,
   output	fastp_pcie_mac_phy_ch7_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch7_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch7_txdata_o,
   output	fastp_pcie_mac_phy_ch7_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch7_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch7_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch7_width_o,
   output	fastp_pcie_mac_phy_ch7_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch7_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch7_rxtermination_o,
   output	fastp_pcie_mac_phy_ch7_srisenable_o,
   output	fastp_pcie_mac_phy_ch7_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch7_messagebus_i,
   input	fastp_pcie_phy_mac_ch7_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch7_rxdata_i,
   input	fastp_pcie_phy_mac_ch7_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch7_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch7_rxstatus_i,
   input	fastp_pcie_phy_mac_ch7_rxvalid_i,
   input	fastp_pcie_phy_mac_ch7_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch8_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch8_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch8_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch8_rate_o,
   output	fastp_pcie_mac_phy_ch8_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch8_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch8_txdata_o,
   output	fastp_pcie_mac_phy_ch8_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch8_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch8_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch8_width_o,
   output	fastp_pcie_mac_phy_ch8_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch8_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch8_rxtermination_o,
   output	fastp_pcie_mac_phy_ch8_srisenable_o,
   output	fastp_pcie_mac_phy_ch8_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch8_messagebus_i,
   input	fastp_pcie_phy_mac_ch8_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch8_rxdata_i,
   input	fastp_pcie_phy_mac_ch8_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch8_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch8_rxstatus_i,
   input	fastp_pcie_phy_mac_ch8_rxvalid_i,
   input	fastp_pcie_phy_mac_ch8_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch9_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch9_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch9_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch9_rate_o,
   output	fastp_pcie_mac_phy_ch9_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch9_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch9_txdata_o,
   output	fastp_pcie_mac_phy_ch9_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch9_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch9_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch9_width_o,
   output	fastp_pcie_mac_phy_ch9_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch9_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch9_rxtermination_o,
   output	fastp_pcie_mac_phy_ch9_srisenable_o,
   output	fastp_pcie_mac_phy_ch9_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch9_messagebus_i,
   input	fastp_pcie_phy_mac_ch9_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch9_rxdata_i,
   input	fastp_pcie_phy_mac_ch9_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch9_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch9_rxstatus_i,
   input	fastp_pcie_phy_mac_ch9_rxvalid_i,
   input	fastp_pcie_phy_mac_ch9_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch10_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch10_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch10_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch10_rate_o,
   output	fastp_pcie_mac_phy_ch10_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch10_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch10_txdata_o,
   output	fastp_pcie_mac_phy_ch10_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch10_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch10_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch10_width_o,
   output	fastp_pcie_mac_phy_ch10_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch10_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch10_rxtermination_o,
   output	fastp_pcie_mac_phy_ch10_srisenable_o,
   output	fastp_pcie_mac_phy_ch10_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch10_messagebus_i,
   input	fastp_pcie_phy_mac_ch10_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch10_rxdata_i,
   input	fastp_pcie_phy_mac_ch10_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch10_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch10_rxstatus_i,
   input	fastp_pcie_phy_mac_ch10_rxvalid_i,
   input	fastp_pcie_phy_mac_ch10_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch11_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch11_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch11_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch11_rate_o,
   output	fastp_pcie_mac_phy_ch11_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch11_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch11_txdata_o,
   output	fastp_pcie_mac_phy_ch11_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch11_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch11_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch11_width_o,
   output	fastp_pcie_mac_phy_ch11_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch11_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch11_rxtermination_o,
   output	fastp_pcie_mac_phy_ch11_srisenable_o,
   output	fastp_pcie_mac_phy_ch11_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch11_messagebus_i,
   input	fastp_pcie_phy_mac_ch11_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch11_rxdata_i,
   input	fastp_pcie_phy_mac_ch11_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch11_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch11_rxstatus_i,
   input	fastp_pcie_phy_mac_ch11_rxvalid_i,
   input	fastp_pcie_phy_mac_ch11_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch12_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch12_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch12_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch12_rate_o,
   output	fastp_pcie_mac_phy_ch12_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch12_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch12_txdata_o,
   output	fastp_pcie_mac_phy_ch12_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch12_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch12_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch12_width_o,
   output	fastp_pcie_mac_phy_ch12_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch12_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch12_rxtermination_o,
   output	fastp_pcie_mac_phy_ch12_srisenable_o,
   output	fastp_pcie_mac_phy_ch12_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch12_messagebus_i,
   input	fastp_pcie_phy_mac_ch12_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch12_rxdata_i,
   input	fastp_pcie_phy_mac_ch12_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch12_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch12_rxstatus_i,
   input	fastp_pcie_phy_mac_ch12_rxvalid_i,
   input	fastp_pcie_phy_mac_ch12_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch13_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch13_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch13_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch13_rate_o,
   output	fastp_pcie_mac_phy_ch13_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch13_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch13_txdata_o,
   output	fastp_pcie_mac_phy_ch13_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch13_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch13_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch13_width_o,
   output	fastp_pcie_mac_phy_ch13_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch13_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch13_rxtermination_o,
   output	fastp_pcie_mac_phy_ch13_srisenable_o,
   output	fastp_pcie_mac_phy_ch13_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch13_messagebus_i,
   input	fastp_pcie_phy_mac_ch13_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch13_rxdata_i,
   input	fastp_pcie_phy_mac_ch13_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch13_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch13_rxstatus_i,
   input	fastp_pcie_phy_mac_ch13_rxvalid_i,
   input	fastp_pcie_phy_mac_ch13_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch14_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch14_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch14_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch14_rate_o,
   output	fastp_pcie_mac_phy_ch14_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch14_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch14_txdata_o,
   output	fastp_pcie_mac_phy_ch14_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch14_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch14_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch14_width_o,
   output	fastp_pcie_mac_phy_ch14_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch14_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch14_rxtermination_o,
   output	fastp_pcie_mac_phy_ch14_srisenable_o,
   output	fastp_pcie_mac_phy_ch14_pclkchangeack_o,
   input  [7:0]	fastp_pcie_phy_mac_ch14_messagebus_i,
   input	fastp_pcie_phy_mac_ch14_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch14_rxdata_i,
   input	fastp_pcie_phy_mac_ch14_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch14_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch14_rxstatus_i,
   input	fastp_pcie_phy_mac_ch14_rxvalid_i,
   input	fastp_pcie_phy_mac_ch14_pclkchangeok_i,
   output [7:0]	fastp_pcie_mac_phy_ch15_messagebus_o,
   output [2:0]	fastp_pcie_mac_phy_ch15_pclk_rate_o,
   output [3:0]	fastp_pcie_mac_phy_ch15_powerdown_o,
   output [2:0]	fastp_pcie_mac_phy_ch15_rate_o,
   output	fastp_pcie_mac_phy_ch15_rxstandby_o,
   output [1:0]	fastp_pcie_mac_phy_ch15_rxwidth_o,
   output [39:0]	fastp_pcie_mac_phy_ch15_txdata_o,
   output	fastp_pcie_mac_phy_ch15_txdatavalid_o,
   output	fastp_pcie_mac_phy_ch15_txdetectrx_loopback_o,
   output [3:0]	fastp_pcie_mac_phy_ch15_txelecidle_o,
   output [1:0]	fastp_pcie_mac_phy_ch15_width_o,
   output	fastp_pcie_mac_phy_ch15_rxelecidle_disable_o,
   output	fastp_pcie_mac_phy_ch15_txcmnmode_disable_o,
   output	fastp_pcie_mac_phy_ch15_rxtermination_o,
   output	fastp_pcie_mac_phy_ch15_srisenable_o,
   output	fastp_pcie_mac_phy_ch15_pclkchangeack_o,
   input	fastp_pcie_phy_mac_ch15_pclkchangeok_i,
   input  [7:0]	fastp_pcie_phy_mac_ch15_messagebus_i,
   input	fastp_pcie_phy_mac_ch15_phystatus_i,
   input  [39:0]	fastp_pcie_phy_mac_ch15_rxdata_i,
   input	fastp_pcie_phy_mac_ch15_rxelecidle_i,
   input	fastp_pcie_phy_mac_ch15_rxstandbystatus_i,
   input  [2:0]	fastp_pcie_phy_mac_ch15_rxstatus_i,
   input	fastp_pcie_phy_mac_ch15_rxvalid_i,
   input	fastp_pcie_phy_mac_rx0_clk_i,
   input	fastp_pcie_phy_mac_rx1_clk_i,
   input	fastp_pcie_phy_mac_rx2_clk_i,
   input	fastp_pcie_phy_mac_rx3_clk_i,
   input	fastp_pcie_phy_mac_rx4_clk_i,
   input	fastp_pcie_phy_mac_rx5_clk_i,
   input	fastp_pcie_phy_mac_rx6_clk_i,
   input	fastp_pcie_phy_mac_rx7_clk_i,
   input	fastp_pcie_phy_mac_rx8_clk_i,
   input	fastp_pcie_phy_mac_rx9_clk_i,
   input	fastp_pcie_phy_mac_rx10_clk_i,
   input	fastp_pcie_phy_mac_rx11_clk_i,
   input	fastp_pcie_phy_mac_rx12_clk_i,
   input	fastp_pcie_phy_mac_rx13_clk_i,
   input	fastp_pcie_phy_mac_rx14_clk_i,
   input	fastp_pcie_phy_mac_rx15_clk_i,

 //LLTAN_FAST_PIPE


        // AVMM Master PIO interface "(!m1_enable_mcdma_hwtcl) || (m1_enable_mcdma_hwtcl && m1_enable_bursting_master_hwtcl)"
        output [m1_pio_address_width_hwtcl-1:0]                                       p1_rx_pio_address_o,
        output [m1_pio_data_width_hwtcl/8-1:0]                                        p1_rx_pio_byteenable_o,
        output                                                                        p1_rx_pio_read_o,
        output                                                                        p1_rx_pio_write_o,
        output [m1_pio_data_width_hwtcl-1:0]                                          p1_rx_pio_writedata_o,
        output [3:0]                                                                  p1_rx_pio_burstcount_o,
        input                                                                         p1_rx_pio_waitrequest_i,
        input  [m1_pio_data_width_hwtcl-1:0]                                          p1_rx_pio_readdata_i,
        input                                                                         p1_rx_pio_readdatavalid_i,
        input  [1:0]                                                                  p1_rx_pio_response_i,
        input                                                                         p1_rx_pio_writeresponsevalid_i,
       
        // H2D AVST Master Interface    "(m1_num_h2d_avst_uport_hwtcl < 1) || (!m1_enable_mcdma_hwtcl)"
        output logic                                                                  p1_h2d_st_sof_0_o,
        output logic                                                                  p1_h2d_st_eof_0_o,
        output logic [m1_empty_width_hwtcl-1:0]                                       p1_h2d_st_empty_0_o,
        input  logic                                                                  p1_h2d_st_ready_0_i,
        output logic                                                                  p1_h2d_st_valid_0_o,
        output logic [m1_data_width_hwtcl-1:0]                                        p1_h2d_st_data_0_o,
        output logic [ST_CHANNEL_WIDTH-1:0]                                           p1_h2d_st_channel_0_o,
        // H2D AVST Master Interface   "(m1_num_h2d_avst_uport_hwtcl < 2) || (!m1_enable_mcdma_hwtcl)"
        output logic                                                                  p1_h2d_st_sof_1_o,
        output logic                                                                  p1_h2d_st_eof_1_o,
        output logic [m1_empty_width_hwtcl-1:0]                                       p1_h2d_st_empty_1_o,
        input  logic                                                                  p1_h2d_st_ready_1_i,
        output logic                                                                  p1_h2d_st_valid_1_o,
        output logic [m1_data_width_hwtcl-1:0]                                        p1_h2d_st_data_1_o,
        output logic [ST_CHANNEL_WIDTH-1:0]                                           p1_h2d_st_channel_1_o,
        // H2D AVST Master Interface    "(m1_num_h2d_avst_uport_hwtcl < 3) || (!m1_enable_mcdma_hwtcl)"
        output logic                                                                  p1_h2d_st_sof_2_o,
        output logic                                                                  p1_h2d_st_eof_2_o,
        output logic [m1_empty_width_hwtcl-1:0]                                       p1_h2d_st_empty_2_o,
        input  logic                                                                  p1_h2d_st_ready_2_i,
        output logic                                                                  p1_h2d_st_valid_2_o,
        output logic [m1_data_width_hwtcl-1:0]                                        p1_h2d_st_data_2_o,
        output logic [ST_CHANNEL_WIDTH-1:0]                                           p1_h2d_st_channel_2_o,
        // H2D AVST Master Interface    "(m1_num_h2d_avst_uport_hwtcl < 4) || (!m1_enable_mcdma_hwtcl)"
        output logic                                                                  p1_h2d_st_sof_3_o,
        output logic                                                                  p1_h2d_st_eof_3_o,
        output logic [m1_empty_width_hwtcl-1:0]                                       p1_h2d_st_empty_3_o,
        input  logic                                                                  p1_h2d_st_ready_3_i,
        output logic                                                                  p1_h2d_st_valid_3_o,
        output logic [m1_data_width_hwtcl-1:0]                                        p1_h2d_st_data_3_o,
        output logic [ST_CHANNEL_WIDTH-1:0]                                           p1_h2d_st_channel_3_o,
        // H2D AVMM Master Interface  "(m1_num_h2d_avmm_uport_hwtcl < 1) || (!m1_enable_mcdma_hwtcl)" 
        input  logic                                                                  p1_h2ddm_waitrequest_i,
        input  logic                                                                  p1_h2ddm_writeresponsevalid_i,
        output logic                                                                  p1_h2ddm_write_o,
        output logic [m1_address_width_hwtcl-1:0]                                     p1_h2ddm_address_o,
        output logic [m1_burst_width_hwtcl-1:0]                                       p1_h2ddm_burstcount_o,
        output logic [m1_data_width_hwtcl/8-1:0]                                      p1_h2ddm_byteenable_o,
        output logic [m1_data_width_hwtcl-1:0]                                        p1_h2ddm_writedata_o,
        // D2H AVST interface    "m1_num_d2h_avst_uport_hwtcl < 1 || m1_enable_mcdma_hwtcl == 0"
        input logic                                                                   p1_d2h_st_sof_0_i,
        input logic                                                                   p1_d2h_st_eof_0_i,
        input logic [m1_empty_width_hwtcl-1:0]                                        p1_d2h_st_empty_0_i,
        input logic [ST_CHANNEL_WIDTH-1:0]                                            p1_d2h_st_channel_0_i,
        input logic                                                                   p1_d2h_st_valid_0_i,
        input logic [m1_data_width_hwtcl-1:0]                                         p1_d2h_st_data_0_i,
        output logic                                                                  p1_d2h_st_ready_0_o,
        // D2H AVST interface   "m1_num_d2h_avst_uport_hwtcl < 2 || m1_enable_mcdma_hwtcl == 0"
        input logic                                                                   p1_d2h_st_sof_1_i,
        input logic                                                                   p1_d2h_st_eof_1_i,
        input logic [m1_empty_width_hwtcl-1:0]                                        p1_d2h_st_empty_1_i,
        input logic [ST_CHANNEL_WIDTH-1:0]                                            p1_d2h_st_channel_1_i,
        input logic                                                                   p1_d2h_st_valid_1_i,
        input logic [m1_data_width_hwtcl-1:0]                                         p1_d2h_st_data_1_i,
        output logic                                                                  p1_d2h_st_ready_1_o,
        // D2H AVST interface   "m1_num_d2h_avst_uport_hwtcl < 3 || m1_enable_mcdma_hwtcl == 0"
        input logic                                                                   p1_d2h_st_sof_2_i,
        input logic                                                                   p1_d2h_st_eof_2_i,
        input logic [m1_empty_width_hwtcl-1:0]                                        p1_d2h_st_empty_2_i,
        input logic [ST_CHANNEL_WIDTH-1:0]                                            p1_d2h_st_channel_2_i,
        input logic                                                                   p1_d2h_st_valid_2_i,
        input logic [m1_data_width_hwtcl-1:0]                                         p1_d2h_st_data_2_i,
        output logic                                                                  p1_d2h_st_ready_2_o,
        // D2H AVST interface     "m1_num_d2h_avst_uport_hwtcl < 4 || m1_enable_mcdma_hwtcl == 0"
        input logic                                                                   p1_d2h_st_sof_3_i,
        input logic                                                                   p1_d2h_st_eof_3_i,
        input logic [m1_empty_width_hwtcl-1:0]                                        p1_d2h_st_empty_3_i,
        input logic [ST_CHANNEL_WIDTH-1:0]                                            p1_d2h_st_channel_3_i,
        input logic                                                                   p1_d2h_st_valid_3_i,
        input logic [m1_data_width_hwtcl-1:0]                                         p1_d2h_st_data_3_i,
        output logic                                                                  p1_d2h_st_ready_3_o,
        //D2H AVMM Read Master Interface    "(m1_num_d2h_avmm_uport_hwtcl < 1) || (!m1_enable_mcdma_hwtcl)"
        output logic [m1_address_width_hwtcl-1:0]                                     p1_d2hdm_address_o,
        output logic [m1_data_width_hwtcl/8-1:0]                                      p1_d2hdm_byteenable_o,
        output logic                                                                  p1_d2hdm_read_o,
        output logic [m1_burst_width_hwtcl-1:0]                                       p1_d2hdm_burstcount_o,
        input logic                                                                   p1_d2hdm_waitrequest_i,
        input logic [m1_data_width_hwtcl-1:0]                                         p1_d2hdm_readdata_i,
        input logic                                                                   p1_d2hdm_readdatavalid_i,
        input logic [1:0]                                                             p1_d2hdm_response_i,
       
        //AVST interface
        //H2D descriptor input on AVST sink interface
        output logic                                                                  p1_h2ddm_desc_ready_o,
        input logic                                                                   p1_h2ddm_desc_valid_i, 
        input logic [255:0]                                                           p1_h2ddm_desc_data_i, // h2d_desc_bypass_t
        //H2D AVST Status source interface                                           
        output logic [31:0]                                                           p1_h2ddm_desc_status_data_o, // h2d_desc_status_t
        output logic                                                                  p1_h2ddm_desc_status_valid_o,
        //H2D AVST Source completion interface                                       
        output logic [m1_data_width_hwtcl-1:0]                                        p1_h2ddm_desc_cmpl_data_o, // h2d_desc_cmpl_t
        output logic [m1_empty_width_hwtcl-1:0]                                       p1_h2ddm_desc_cmpl_empty_o,
        output logic                                                                  p1_h2ddm_desc_cmpl_sop_o, 
        output logic                                                                  p1_h2ddm_desc_cmpl_eop_o, 
        output logic                                                                  p1_h2ddm_desc_cmpl_valid_o, 
        input logic                                                                   p1_h2ddm_desc_cmpl_ready_i,
        //D2H descriptor input on AVST sink interface                                
        output logic                                                                  p1_d2hdm_desc_ready_o, 
        input logic                                                                   p1_d2hdm_desc_valid_i, 
        input logic [255:0]                                                           p1_d2hdm_desc_data_i, // d2h_desc_bypass_t
        //D2H AVST Status source interface                                           
        output logic [31:0]                                                           p1_d2hdm_desc_status_data_o, // d2h_desc_status_t
        output logic                                                                  p1_d2hdm_desc_status_valid_o,
 
        // "(!m1_enable_bursting_master_hwtcl)" 
        input  logic                                                                  p1_bam_waitrequest_i, 
        output logic [m1_enable_cs_hwtcl == 1 ? m1_address_width_hwtcl-1 : 1+m1_pfcnt_w_hwtcl+m1_vfcnt_w_hwtcl+3+m1_max_bar_address_width_hwtcl-1:0]    p1_bam_address_o,
        output logic [(m1_data_width_hwtcl/8)-1:0]                                    p1_bam_byteenable_o,     
        output logic                                                                  p1_bam_read_o,           
        input  logic [m1_data_width_hwtcl-1:0]                                        p1_bam_readdata_i,       
        input  logic                                                                  p1_bam_readdatavalid_i,  
        output logic                                                                  p1_bam_write_o,          
        output logic [m1_data_width_hwtcl-1:0]                                        p1_bam_writedata_o,      
        output logic [m1_burst_width_hwtcl-1:0]                                       p1_bam_burstcount_o,    

        // Configuration Intercept Interface (CII) to User
        output logic                                                                           p1_usr_cii_req_o,
        output logic                                                                           p1_usr_cii_hdr_poisoned_o,
        output logic [3:0]                                                                     p1_usr_cii_hdr_first_be_o,
        output logic [2:0]                                                                     p1_usr_cii_func_num_o,
        output logic                                                                           p1_usr_cii_wr_o,
        output logic [9:0]                                                                     p1_usr_cii_addr_o,
        output logic [31:0]                                                                    p1_usr_cii_dout_o,
        input  logic                                                                           p1_usr_cii_override_en_i,
        input  logic [31:0]                                                                    p1_usr_cii_override_din_i,
        input  logic                                                                           p1_usr_cii_halt_i,
        output logic                                                                           p1_usr_cii_wr_vf_active_o,
        output logic [10:0]                                                                    p1_usr_cii_vf_num_o,

       // MSI-X Request interface from application/user side    !m1_enable_user_msix_hwtcl
       input  logic                                                                            p1_usr_event_msix_valid_i,
       output logic                                                                            p1_usr_event_msix_ready_o,
       input  logic [15:0]                                                                     p1_usr_event_msix_data_i,
       //FLR interface to application/user side   !m1_enable_user_flr_hwtcl
       output logic                                                                            p1_usr_flr_rcvd_val_o,
       output logic [10:0]                                                                     p1_usr_flr_rcvd_chan_num_o,
       input  logic                                                                            p1_usr_flr_completed_i,
       // BAS interface   "(!m1_enable_bursting_slave_hwtcl)"
       input logic                                                                             p1_bas_vfactive_i,
       input logic [m1_pfnum_width_hwtcl-1:0]                                                  p1_bas_pfnum_i,
       input logic [m1_vfnum_width_hwtcl-1:0]                                                  p1_bas_vfnum_i,
       input logic [m1_bas_address_width_hwtcl-1:0]                                            p1_bas_address_i,
       input logic [m1_data_width_hwtcl/8-1:0]                                                 p1_bas_byteenable_i,
       input logic                                                                             p1_bas_read_i,
       input logic                                                                             p1_bas_write_i,
       input logic [m1_data_width_hwtcl-1:0]                                                   p1_bas_writedata_i,
       input logic [m1_burst_width_hwtcl-1:0]                                                  p1_bas_burstcount_i,
       output logic                                                                            p1_bas_waitrequest_o,
       output logic [m1_data_width_hwtcl-1:0]                                                  p1_bas_readdata_o,
       output logic                                                                            p1_bas_readdatavalid_o,
       output logic [1:0]                                                                      p1_bas_response_o,
        // Usr Reconfig interface   "(!m1_enable_user_hip_reconfig_hwtcl)"
       output logic                                                                            p1_usr_hip_reconfig_rst_n_o,
       output logic                                                                            p1_usr_hip_reconfig_clk_o,
       input logic [31:0]                                                                      p1_usr_hip_reconfig_address_i,
       input logic                                                                             p1_usr_hip_reconfig_read_i,
       input logic                                                                             p1_usr_hip_reconfig_write_i,
       input logic [7:0]                                                                       p1_usr_hip_reconfig_writedata_i,
       output logic [7:0]                                                                      p1_usr_hip_reconfig_readdata_o,
       output logic                                                                            p1_usr_hip_reconfig_readdatavalid_o,
       output logic                                                                            p1_usr_hip_reconfig_waitrequest_o,
       //CS AVMM slave interface   "(!m1_enable_cs_hwtcl)"
       output logic                                                                            p1_cs_waitrequest_o,
       input  logic [m1_cs_address_width_hwtcl-1:0]                                            p1_cs_address_i,
       input  logic [3:0]                                                                      p1_cs_byteenable_i,
       input  logic                                                                            p1_cs_read_i,
       output logic [31:0]                                                                     p1_cs_readdata_o,
       output logic                                                                            p1_cs_readdatavalid_o,
       input  logic                                                                            p1_cs_write_i,
       input  logic [31:0]                                                                     p1_cs_writedata_i,
       output logic [1:0]                                                                      p1_cs_response_o, 
       output logic                                                                            p1_cs_writeresponsevalid_o,
       //MSI interface to user
       input  logic                                                                            p1_msi_req_i,
       input  logic [m1_pfnum_width_hwtcl-1:0]                                                 p1_msi_func_num_i,
       input  logic [4:0]                                                                      p1_msi_num_i,
       output logic                                                                            p1_msi_ack_o,
       output logic [1:0]                                                                      p1_msi_status_o,           
// Shoaib
//Shoaib

       //p0_pld ports
       input                                                                              p0_pld_warm_rst_rdy_i, 
       output                                                                             p0_pld_link_req_rst_o,
       output                                                                             p0_pld_core_warm_rst_n_o,
       output                                                                             p0_pld_core_cold_rst_n_o,
       output                                                                             p0_pld_in_use_o,
       output                                                                             p0_user_mode_to_pld_o,

	//p0 ptm ports
	input 										p0_ptm_manual_update_i,
	output										p0_ptm_clk_updated_o,  
	output  [63:0]									p0_ptm_local_clock_o,  
	output										p0_ptm_context_valid_o,

       //p0_int ports
       output                                                                             p0_irq_status_o,
       input  [7:0]                                                                       p0_app_int_i,
       output [7:0]                                                                       p0_app_int_ready_o,
       
       //p0_hip_status ports
       output                                                                             p0_link_up_o,
       output                                                                             p0_dl_up_o,
       output                                                                             p0_surprise_down_err_o,
       output                                                                             p0_dl_timer_update_o,
       output [5:0]                                                                       p0_ltssm_state_delay_o,
       output                                                                             p0_ltssm_st_hipfifo_ovrflw_o,
       
       //p0_power_mgnt ports
       output [7:0]                                                                       p0_pm_curnt_state_o,
       output [31:0]                                                                      p0_pm_dstate_o,
       input                                                                              p0_app_init_rst_i,
       input [7:0]                                                                        p0_app_req_retry_en_i,
       input                                                                              p0_app_xfer_pending_i,
       input                                                                              p0_sys_aux_pwr_det_i,
       input [7:0]                                                                        p0_apps_pm_xmt_pme_i,
       
       output                                                                             p0_app_slow_reset_status_n,

input	p0_prs_event_valid_i,
input  [2:0]	p0_prs_event_func_i,
input  [1:0]	p0_prs_event_i,


       input                                                                              pin_perst0_n,
       input                                                                              pin_perst1_n,

       input                                                                              p0_warm_perst_n_i,
       input                                                                              p1_warm_perst_n_i,
       input                                                                              p2_warm_perst_n_i,
       input                                                                              p3_warm_perst_n_i,
       input                                                                              p0_cold_perst_n_i,
       input                                                                              p1_cold_perst_n_i,
       input                                                                              p2_cold_perst_n_i,
       input                                                                              p3_cold_perst_n_i,
       output                                                                             p0_ip_rst_n_o,
       output                                                                             p1_ip_rst_n_o,
       output                                                                             p2_ip_rst_n_o,
       output                                                                             p3_ip_rst_n_o,
       
       //p1_pld ports
       input                                                                              p1_pld_warm_rst_rdy_i, 
       output                                                                             p1_pld_link_req_rst_o,
       output                                                                             p1_pld_core_warm_rst_n_o,
       output                                                                             p1_pld_core_cold_rst_n_o,
       output                                                                             p1_pld_in_use_o,
       output                                                                             p1_user_mode_to_pld_o,

	//p0 ptm ports
	input 										p1_ptm_manual_update_i,
	output										p1_ptm_clk_updated_o,  
	output  [63:0]									p1_ptm_local_clock_o,  
	output										p1_ptm_context_valid_o,

       //p1_int_ ports
       output                                                                             p1_irq_status_o,
       input [7:0]                                                                        p1_app_int_i,
       output [7:0]                                                                       p1_app_int_ready_o,

       //p1_hip_status_ports
       output                                                                             p1_link_up_o,
       output                                                                             p1_dl_up_o,
       output                                                                             p1_surprise_down_err_o,
       output                                                                             p1_dl_timer_update_o,
       output [5:0]                                                                       p1_ltssm_state_delay_o,
       output                                                                             p1_ltssm_st_hipfifo_ovrflw_o,

       //p1_power_mgnt ports
       output [7:0]                                                                       p1_pm_curnt_state_o,
       output [31:0]                                                                      p1_pm_dstate_o,
       input                                                                              p1_app_init_rst_i,
       input [7:0]                                                                        p1_app_req_retry_en_i,
       input                                                                              p1_app_xfer_pending_i,
       input                                                                              p1_sys_aux_pwr_det_i,
       input [7:0]                                                                        p1_apps_pm_xmt_pme_i,

       output                                                                             p1_app_slow_reset_status_n,

   input	p1_prs_event_valid_i,
   input  [2:0]	p1_prs_event_func_i,
   input  [1:0]	p1_prs_event_i,

//Shoaib
       //p2_pld ports
       input                                                                              p2_pld_warm_rst_rdy_i, 
       output                                                                             p2_pld_link_req_rst_o,
       output                                                                             p2_pld_core_warm_rst_n_o,
       output                                                                             p2_pld_core_cold_rst_n_o,
       output                                                                             p2_pld_in_use_o,
       output                                                                             p2_user_mode_to_pld_o,

       //p2_int_ ports
       output                                                                             p2_irq_status_o,
       input                                                                              p2_app_int_i,
       output                                                                             p2_app_int_ready_o,

       //p2_hip_status_ports
       output                                                                             p2_link_up_o,
       output                                                                             p2_dl_up_o,
       output                                                                             p2_surprise_down_err_o,
       output                                                                             p2_dl_timer_update_o,
       output [5:0]                                                                       p2_ltssm_state_delay_o,
       output                                                                             p2_ltssm_st_hipfifo_ovrflw_o,

       //p2_power_mgnt ports
       output [7:0]                                                                       p2_pm_curnt_state_o,
       output [31:0]                                                                      p2_pm_dstate_o,
       input                                                                              p2_app_init_rst_i,
       input [7:0]                                                                        p2_app_req_retry_en_i,
       input                                                                              p2_app_xfer_pending_i,
       input                                                                              p2_sys_aux_pwr_det_i,
       input [7:0]                                                                        p2_apps_pm_xmt_pme_i,

       output                                                                             p2_app_slow_reset_status_n,

   input	p2_prs_event_valid_i,
   input  [2:0]	p2_prs_event_func_i,
   input  [1:0]	p2_prs_event_i,
//Shoaib
       //p3_pld ports
       input                                                                              p3_pld_warm_rst_rdy_i, 
       output                                                                             p3_pld_link_req_rst_o,
       output                                                                             p3_pld_core_warm_rst_n_o,
       output                                                                             p3_pld_core_cold_rst_n_o,
       output                                                                             p3_pld_in_use_o,
       output                                                                             p3_user_mode_to_pld_o,

       //p3_int_ ports
       output                                                                             p3_irq_status_o,
       input                                                                              p3_app_int_i,
       output                                                                             p3_app_int_ready_o,

       //p3_hip_status_ports
       output                                                                             p3_link_up_o,
       output                                                                             p3_dl_up_o,
       output                                                                             p3_surprise_down_err_o,
       output                                                                             p3_dl_timer_update_o,
       output [5:0]                                                                       p3_ltssm_state_delay_o,
       output                                                                             p3_ltssm_st_hipfifo_ovrflw_o,

       //p3_power_mgnt ports
       output [7:0]                                                                       p3_pm_curnt_state_o,
       output [31:0]                                                                      p3_pm_dstate_o,
       input                                                                              p3_app_init_rst_i,
       input [7:0]                                                                        p3_app_req_retry_en_i,
       input                                                                              p3_app_xfer_pending_i,
       input                                                                              p3_sys_aux_pwr_det_i,
       input [7:0]                                                                        p3_apps_pm_xmt_pme_i,

       output                                                                             p3_app_slow_reset_status_n,

   input	p3_prs_event_valid_i,
   input  [2:0]	p3_prs_event_func_i,
   input  [1:0]	p3_prs_event_i,
//Shoaib
       //  PHY Reconfig Interface
       //shared among all cores
       input                                                                              reconfig_clk,
       input                                                                              reconfig_write,
       input                                                                              reconfig_read,
       input [20:0]                                                                       reconfig_address,
       input [7:0]                                                                        reconfig_writedata,
       output [7:0]                                                                       reconfig_readdata,
       output                                                                             reconfig_readdatavalid,
       output                                                                             reconfig_waitrequest,
       output [4:0]                                                                       reconfig_reserved_out,
      // // Link Inspector Interface
      // input                                                                            pli_avmm_master_write,
      // input                                                                            pli_avmm_master_read,
      // input [23:0]                                                                     pli_avmm_master_address,
      // input [31:0]                                                                     pli_avmm_master_writedata,
      // output [31:0]                                                                    pli_avmm_master_readdata,
      // output                                                                           pli_avmm_master_readdatavalid,
      // output                                                                           pli_avmm_master_waitrequest, 

       input                                                                              pin_perst_n
       );
   
   logic                                                                                  pin_perst_n_o;
   logic                                                                                  coreclkout_hip;                     
   logic                                                                                  slow_clk;

   //p0_slow_reset_status_n ports
   logic                                                                                  p0_reset_status_n;

   //p0_slow_reset_status_n ports
   logic                                                                                  p0_slow_reset_status_n;
       
   // R-Tile HIP avst interface
   logic [2:0]                                                                            p0_rx_st0_bar_o;      // 
   logic [2:0]                                                                            p0_rx_st1_bar_o;      //
   logic [2:0]                                                                            p0_rx_st2_bar_o;      //
   logic [2:0]                                                                            p0_rx_st3_bar_o;      //
   logic [2:0]                                                                            p0_rx_st0_pfnum_o;      // 
   logic [2:0]                                                                            p0_rx_st1_pfnum_o;      //
   logic [2:0]                                                                            p0_rx_st2_pfnum_o;      //
   logic [2:0]                                                                            p0_rx_st3_pfnum_o;      //
   logic                                                                                  p0_rx_st0_vfactive_o;      // 
   logic                                                                                  p0_rx_st1_vfactive_o;      //
   logic                                                                                  p0_rx_st2_vfactive_o;      //
   logic                                                                                  p0_rx_st3_vfactive_o;      //
   logic [10:0]                                                                           p0_rx_st0_vfnum_o;      // 
   logic [10:0]                                                                           p0_rx_st1_vfnum_o;      //
   logic [10:0]                                                                           p0_rx_st2_vfnum_o;      //
   logic [10:0]                                                                           p0_rx_st3_vfnum_o;      //
   logic                                                                                  p0_rx_st0_eop_o;      // 
   logic                                                                                  p0_rx_st1_eop_o;      //
   logic                                                                                  p0_rx_st2_eop_o;      //
   logic                                                                                  p0_rx_st3_eop_o;      //
   logic [127:0]                                                                          p0_rx_st0_hdr_o;   // 
   logic [127:0]                                                                          p0_rx_st1_hdr_o;   //
   logic [127:0]                                                                          p0_rx_st2_hdr_o;   //
   logic [127:0]                                                                          p0_rx_st3_hdr_o;   //
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st0_data_o;  // Parameterizing width of data signal to complience with x16/x8/x4
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st1_data_o;  //
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st2_data_o;  //
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st3_data_o;  //
   logic                                                                                  p0_rx_st0_sop_o;      // 
   logic                                                                                  p0_rx_st1_sop_o;      //
   logic                                                                                  p0_rx_st2_sop_o;      //
   logic                                                                                  p0_rx_st3_sop_o;      //
   logic                                                                                  p0_rx_st0_hvalid_o;    //
   logic                                                                                  p0_rx_st1_hvalid_o;    //
   logic                                                                                  p0_rx_st2_hvalid_o;    //
   logic                                                                                  p0_rx_st3_hvalid_o;    //
   logic                                                                                  p0_rx_st0_dvalid_o;    //
   logic                                                                                  p0_rx_st1_dvalid_o;    //
   logic                                                                                  p0_rx_st2_dvalid_o;    //
   logic                                                                                  p0_rx_st3_dvalid_o;    //
   logic                                                                                  p0_rx_st0_pvalid_o;    //
   logic                                                                                  p0_rx_st1_pvalid_o;    //
   logic                                                                                  p0_rx_st2_pvalid_o;    //
   logic                                                                                  p0_rx_st3_pvalid_o;    //
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st0_empty_o;    // Parameterizing width of empty (per DW) signal to complience with x16/x8/x4
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st1_empty_o;    //
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st2_empty_o;    //
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st3_empty_o;    //
   logic [31:0]                                                                           p0_rx_st0_prefix_o; // 
   logic [31:0]                                                                           p0_rx_st1_prefix_o; //
   logic [31:0]                                                                           p0_rx_st2_prefix_o; //
   logic [31:0]                                                                           p0_rx_st3_prefix_o; //
   logic                                                                                  p0_rx_st_ready_i;    // 
   logic                                                                                  p0_rx_st0_pt_parity_o;
   logic                                                                                  p0_rx_st1_pt_parity_o;
   logic                                                                                  p0_rx_st2_pt_parity_o;
   logic                                                                                  p0_rx_st3_pt_parity_o;
   logic                                                                                  p0_rx_st_par_err_o;

   logic                                                                                  p0_tx_st_par_err_o;
   logic                                                                                  p0_tx_st0_eop_i;  // 
   logic                                                                                  p0_tx_st1_eop_i;  //
   logic                                                                                  p0_tx_st2_eop_i;  //
   logic                                                                                  p0_tx_st3_eop_i;  //
   logic [127:0]                                                                          p0_tx_st0_hdr_i;      // 
   logic [127:0]                                                                          p0_tx_st1_hdr_i;      //
   logic [127:0]                                                                          p0_tx_st2_hdr_i;      //
   logic [127:0]                                                                          p0_tx_st3_hdr_i;      //
   logic [31:0]                                                                           p0_tx_st0_prefix_i;      // 
   logic [31:0]                                                                           p0_tx_st1_prefix_i;      //
   logic [31:0]                                                                           p0_tx_st2_prefix_i;      //
   logic [31:0]                                                                           p0_tx_st3_prefix_i;      //    
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st0_data_i;     // Parameterizing width of data signal to complience with x16/x8/x4
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st1_data_i;     //
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st2_data_i;     //
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st3_data_i;     //
   logic                                                                                  p0_tx_st0_sop_i;  // 
   logic                                                                                  p0_tx_st1_sop_i;  //
   logic                                                                                  p0_tx_st2_sop_i;  //
   logic                                                                                  p0_tx_st3_sop_i;  //
   logic                                                                                  p0_tx_st0_dvalid_i;// 
   logic                                                                                  p0_tx_st1_dvalid_i;//
   logic                                                                                  p0_tx_st2_dvalid_i;//
   logic                                                                                  p0_tx_st3_dvalid_i;//
   logic                                                                                  p0_tx_st0_pvalid_i;//
   logic                                                                                  p0_tx_st1_pvalid_i;//
   logic                                                                                  p0_tx_st2_pvalid_i;//
   logic                                                                                  p0_tx_st3_pvalid_i;//
   logic                                                                                  p0_tx_st0_hvalid_i;//
   logic                                                                                  p0_tx_st1_hvalid_i;//
   logic                                                                                  p0_tx_st2_hvalid_i;//
   logic                                                                                  p0_tx_st3_hvalid_i;//
   logic                                                                                  p0_tx_st_ready_o;       // 

   //rx hcrdt                                                                             
   logic [2:0]                                                                            p0_rx_st_hcrdt_update_i;
   logic [5:0]                                                                            p0_rx_st_hcrdt_update_cnt_i;
   logic [2:0]                                                                            p0_rx_st_hcrdt_init_i;
   logic [2:0]                                                                            p0_rx_st_hcrdt_init_ack_o;
                                                                                          
   //rx dcrdt                                                                                    
   logic [2:0]                                                                            p0_rx_st_dcrdt_update_i;
   logic [11:0]                                                                           p0_rx_st_dcrdt_update_cnt_i;
   logic [2:0]                                                                            p0_rx_st_dcrdt_init_i;
   logic [2:0]                                                                            p0_rx_st_dcrdt_init_ack_o;
                                                                                          
   //tx hcrdt                                                                                    
   logic [2:0]                                                                            p0_tx_st_hcrdt_update_o;
   logic [5:0]                                                                            p0_tx_st_hcrdt_update_cnt_o;
   logic [2:0]                                                                            p0_tx_st_hcrdt_init_o;
   logic [2:0]                                                                            p0_tx_st_hcrdt_init_ack_i;
                                                                                          
   //tx dcrdt                                                                                    
   logic [2:0]                                                                            p0_tx_st_dcrdt_update_o;
   logic [11:0]                                                                           p0_tx_st_dcrdt_update_cnt_o;
   logic [2:0]                                                                            p0_tx_st_dcrdt_init_o;
   logic [2:0]                                                                            p0_tx_st_dcrdt_init_ack_i;
   //logic                                                                                  p0_dl_timer_update_o ; 
   
   // HIP Reconfig interface
   logic                                                                                  p0_hip_reconfig_read_i;
   logic [31:0]                                                                           p0_hip_reconfig_address_i;
   logic                                                                                  p0_hip_reconfig_write_i;
   logic [7:0]                                                                            p0_hip_reconfig_writedata_i;
   logic                                                                                  p0_hip_reconfig_readdatavalid_o;
   logic [7:0]                                                                            p0_hip_reconfig_readdata_o;
   logic                                                                                  p0_hip_reconfig_waitrequest_o;

   // FLR interface from HIP
   logic [7:0]                                                                            p0_flr_rcvd_pf_o       ;   //"(core16_flr_cap_user_hwtcl==0)"
   logic                                                                                  p0_flr_rcvd_vf_o       ;   //"enable_sriov_hwtcl" 
   logic [2:0]                                                                            p0_flr_rcvd_pf_num_o   ;  //" core16_flr_cap_user_hwtcl==0)"
   logic [10:0]                                                                           p0_flr_rcvd_vf_num_o   ;   //"enable_sriov_hwtcl"
   logic [7:0]                                                                            p0_flr_completed_pf_i  ;   //"(core16_flr_cap_user_hwtcl==0)"
   logic                                                                                  p0_flr_completed_vf_i  ;   //"!enable_sriov_hwtcl"
   logic [2:0]                                                                            p0_flr_completed_pf_num_i ; //"(core16_flr_cap_user_hwtcl==0)"
   logic [10:0]                                                                           p0_flr_completed_vf_num_i ; //"!enable_sriov_hwtcl" 
   logic                                                                                  p0_flr_completed_ready_o;

   //  Completion Timeout Interface (only in R-tile)
   logic                                                                                  p0_cpl_timeout_o;                     
   logic [2:0]                                                                            p0_cpl_timeout_func_num_o;            
   logic [10:0]                                                                           p0_cpl_timeout_vfunc_num_o;           
   logic                                                                                  p0_cpl_timeout_vfunc_active_o;        
   logic [2:0]                                                                            p0_cpl_timeout_cpl_tc_o;              
   logic [1:0]                                                                            p0_cpl_timeout_cpl_attr_o;            
   logic [11:0]                                                                           p0_cpl_timeout_cpl_len_o;             
   logic [9:0]                                                                            p0_cpl_timeout_cpl_tag_o;             

   //p0_cii ports
   logic                                                                                  p0_cii_req_o;
   logic                                                                                  p0_cii_hdr_poisoned_o;
   logic [3:0]                                                                            p0_cii_hdr_first_be_o;
   logic [2:0]                                                                            p0_cii_func_num_o;
   logic                                                                                  p0_cii_wr_o;
   logic [9:0]                                                                            p0_cii_addr_o;
   logic [31:0]                                                                           p0_cii_dout_o;
   logic                                                                                  p0_cii_override_en_i;
   logic [31:0]                                                                           p0_cii_override_din_i;
   logic                                                                                  p0_cii_halt_i;
   logic                                                                                  p0_cii_wr_vf_active_o;
   logic [10:0]                                                                           p0_cii_vf_num_o;

   // Error interface to HIP
   logic                                                                                  p0_app_err_valid_i    ;   
   logic [31:0]                                                                           p0_app_err_hdr_i      ;   
   logic [13:0]                                                                           p0_app_err_info_i     ;   
   logic [pfnum_width_hwtcl-1:0]                                                          p0_app_err_func_num_i ;   //"(enable_multi_func_hwtcl == 0)"
   logic                                                                                  p0_serr_out_o         ;
   logic                                                                                  p0_app_err_ready_o    ;   
   
   //MSI pending bits interface
   logic [2:0]                                                                            p0_msi_pnd_func_i;
   logic [7:0]                                                                            p0_msi_pnd_byte_i;
   logic [1:0]                                                                            p0_msi_pnd_addr_i;
   logic                                                                                  p0_msi_pnd_ready_o;
   
   //p0_tx_ehp ports
   logic                                                                                  p0_tx_ehp_deallocate_empty_o;

   //p0_pld_gp ports
   logic [7:0]                                                                            p0_pld_gp_status_i;
   logic [7:0]                                                                            p0_pld_gp_ctrl_o;
   logic                                                                                  p0_pld_gp_status_ready_o;

   //p0 vf_err_ ports
   logic                                                                                  p0_vf_err_ur_posted_s0_o;
   logic                                                                                  p0_vf_err_ur_posted_s1_o;
   logic [2:0]                                                                            p0_vf_err_func_num_s0_o;
   logic [2:0]                                                                            p0_vf_err_func_num_s1_o;
   logic                                                                                  p0_vf_err_ca_postedreq_s0_o;
   logic                                                                                  p0_vf_err_ca_postedreq_s1_o;
   logic [10:0]                                                                           p0_vf_err_vf_num_s0_o;
   logic [10:0]                                                                           p0_vf_err_vf_num_s1_o;
   logic                                                                                  p0_vf_err_poisonedwrreq_s0_o;
   logic                                                                                  p0_vf_err_poisonedwrreq_s1_o;
   logic                                                                                  p0_vf_err_poisonedcompl_s0_o;
   logic                                                                                  p0_vf_err_poisonedcompl_s1_o;
   logic [2:0]                                                                            p0_user_vfnonfatalmsg_func_num_i;
   logic [10:0]                                                                           p0_user_vfnonfatalmsg_vfnum_i;
   logic                                                                                  p0_user_sent_vfnonfatalmsg_i;
   logic                                                                                  p0_vf_err_overflow_o;
   logic                                                                                  p0_user_vfnonfatalmsg_ready_o;


// //LLTAN_FAST_PIP
//   logic    fastp_pcie_pipe_p0_lane_rst_n;
//   logic    fastp_pcie_pipe_p1_lane_rst_n;
//   logic    fastp_pcie_pipe_p2_lane_rst_n;
//   logic    fastp_pcie_pipe_p3_lane_rst_n;
//   logic 	fastp_pcie_l0_pipe_clk;
//   logic 	fastp_pcie_l1_pipe_clk;
//   logic 	fastp_pcie_l2_pipe_clk;
//   logic 	fastp_pcie_l3_pipe_clk;
//   logic 	fastp_pcie_l4_pipe_clk;
//   logic 	fastp_pcie_l5_pipe_clk;
//   logic 	fastp_pcie_l6_pipe_clk;
//   logic 	fastp_pcie_l7_pipe_clk;
//   logic 	fastp_pcie_l8_pipe_clk;
//   logic 	fastp_pcie_l9_pipe_clk;
//   logic 	fastp_pcie_l10_pipe_clk;
//   logic 	fastp_pcie_l11_pipe_clk;
//   logic 	fastp_pcie_l12_pipe_clk;
//   logic 	fastp_pcie_l13_pipe_clk;
//   logic 	fastp_pcie_l14_pipe_clk;
//   logic 	fastp_pcie_l15_pipe_clk;
//   logic  [7:0]	fastp_pcie_mac_phy_ch0_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch0_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch0_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch0_rate_o;
//   logic 	fastp_pcie_mac_phy_ch0_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch0_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch0_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch0_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch0_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch0_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch0_width_o;
//   logic 	fastp_pcie_mac_phy_ch0_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch0_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch0_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch0_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch0_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch0_messagebus_i;
//   logic fastp_pcie_phy_mac_ch0_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch0_rxdata_i;
//   logic fastp_pcie_phy_mac_ch0_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch0_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch0_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch0_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch0_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch1_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch1_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch1_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch1_rate_o;
//   logic 	fastp_pcie_mac_phy_ch1_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch1_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch1_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch1_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch1_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch1_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch1_width_o;
//   logic 	fastp_pcie_mac_phy_ch1_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch1_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch1_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch1_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch1_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch1_messagebus_i;
//   logic fastp_pcie_phy_mac_ch1_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch1_rxdata_i;
//   logic fastp_pcie_phy_mac_ch1_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch1_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch1_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch1_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch1_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch2_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch2_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch2_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch2_rate_o;
//   logic 	fastp_pcie_mac_phy_ch2_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch2_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch2_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch2_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch2_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch2_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch2_width_o;
//   logic 	fastp_pcie_mac_phy_ch2_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch2_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch2_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch2_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch2_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch2_messagebus_i;
//   logic fastp_pcie_phy_mac_ch2_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch2_rxdata_i;
//   logic fastp_pcie_phy_mac_ch2_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch2_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch2_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch2_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch2_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch3_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch3_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch3_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch3_rate_o;
//   logic 	fastp_pcie_mac_phy_ch3_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch3_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch3_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch3_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch3_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch3_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch3_width_o;
//   logic 	fastp_pcie_mac_phy_ch3_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch3_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch3_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch3_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch3_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch3_messagebus_i;
//   logic fastp_pcie_phy_mac_ch3_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch3_rxdata_i;
//   logic fastp_pcie_phy_mac_ch3_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch3_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch3_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch3_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch3_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch4_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch4_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch4_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch4_rate_o;
//   logic 	fastp_pcie_mac_phy_ch4_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch4_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch4_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch4_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch4_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch4_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch4_width_o;
//   logic 	fastp_pcie_mac_phy_ch4_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch4_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch4_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch4_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch4_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch4_messagebus_i;
//   logic fastp_pcie_phy_mac_ch4_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch4_rxdata_i;
//   logic fastp_pcie_phy_mac_ch4_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch4_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch4_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch4_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch4_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch5_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch5_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch5_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch5_rate_o;
//   logic 	fastp_pcie_mac_phy_ch5_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch5_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch5_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch5_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch5_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch5_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch5_width_o;
//   logic 	fastp_pcie_mac_phy_ch5_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch5_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch5_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch5_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch5_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch5_messagebus_i;
//   logic fastp_pcie_phy_mac_ch5_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch5_rxdata_i;
//   logic fastp_pcie_phy_mac_ch5_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch5_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch5_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch5_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch5_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch6_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch6_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch6_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch6_rate_o;
//   logic 	fastp_pcie_mac_phy_ch6_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch6_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch6_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch6_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch6_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch6_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch6_width_o;
//   logic 	fastp_pcie_mac_phy_ch6_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch6_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch6_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch6_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch6_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch6_messagebus_i;
//   logic fastp_pcie_phy_mac_ch6_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch6_rxdata_i;
//   logic fastp_pcie_phy_mac_ch6_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch6_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch6_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch6_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch6_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch7_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch7_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch7_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch7_rate_o;
//   logic 	fastp_pcie_mac_phy_ch7_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch7_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch7_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch7_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch7_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch7_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch7_width_o;
//   logic 	fastp_pcie_mac_phy_ch7_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch7_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch7_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch7_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch7_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch7_messagebus_i;
//   logic fastp_pcie_phy_mac_ch7_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch7_rxdata_i;
//   logic fastp_pcie_phy_mac_ch7_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch7_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch7_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch7_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch7_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch8_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch8_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch8_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch8_rate_o;
//   logic 	fastp_pcie_mac_phy_ch8_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch8_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch8_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch8_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch8_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch8_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch8_width_o;
//   logic 	fastp_pcie_mac_phy_ch8_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch8_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch8_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch8_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch8_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch8_messagebus_i;
//   logic fastp_pcie_phy_mac_ch8_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch8_rxdata_i;
//   logic fastp_pcie_phy_mac_ch8_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch8_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch8_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch8_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch8_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch9_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch9_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch9_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch9_rate_o;
//   logic 	fastp_pcie_mac_phy_ch9_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch9_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch9_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch9_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch9_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch9_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch9_width_o;
//   logic 	fastp_pcie_mac_phy_ch9_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch9_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch9_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch9_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch9_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch9_messagebus_i;
//   logic fastp_pcie_phy_mac_ch9_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch9_rxdata_i;
//   logic fastp_pcie_phy_mac_ch9_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch9_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch9_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch9_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch9_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch10_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch10_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch10_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch10_rate_o;
//   logic 	fastp_pcie_mac_phy_ch10_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch10_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch10_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch10_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch10_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch10_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch10_width_o;
//   logic 	fastp_pcie_mac_phy_ch10_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch10_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch10_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch10_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch10_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch10_messagebus_i;
//   logic fastp_pcie_phy_mac_ch10_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch10_rxdata_i;
//   logic fastp_pcie_phy_mac_ch10_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch10_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch10_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch10_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch10_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch11_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch11_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch11_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch11_rate_o;
//   logic 	fastp_pcie_mac_phy_ch11_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch11_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch11_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch11_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch11_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch11_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch11_width_o;
//   logic 	fastp_pcie_mac_phy_ch11_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch11_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch11_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch11_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch11_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch11_messagebus_i;
//   logic fastp_pcie_phy_mac_ch11_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch11_rxdata_i;
//   logic fastp_pcie_phy_mac_ch11_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch11_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch11_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch11_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch11_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch12_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch12_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch12_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch12_rate_o;
//   logic 	fastp_pcie_mac_phy_ch12_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch12_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch12_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch12_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch12_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch12_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch12_width_o;
//   logic 	fastp_pcie_mac_phy_ch12_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch12_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch12_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch12_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch12_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch12_messagebus_i;
//   logic fastp_pcie_phy_mac_ch12_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch12_rxdata_i;
//   logic fastp_pcie_phy_mac_ch12_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch12_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch12_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch12_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch12_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch13_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch13_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch13_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch13_rate_o;
//   logic 	fastp_pcie_mac_phy_ch13_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch13_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch13_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch13_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch13_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch13_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch13_width_o;
//   logic 	fastp_pcie_mac_phy_ch13_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch13_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch13_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch13_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch13_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch13_messagebus_i;
//   logic fastp_pcie_phy_mac_ch13_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch13_rxdata_i;
//   logic fastp_pcie_phy_mac_ch13_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch13_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch13_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch13_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch13_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch14_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch14_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch14_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch14_rate_o;
//   logic 	fastp_pcie_mac_phy_ch14_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch14_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch14_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch14_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch14_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch14_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch14_width_o;
//   logic 	fastp_pcie_mac_phy_ch14_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch14_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch14_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch14_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch14_pclkchangeack_o;
//   logic  [7:0]	fastp_pcie_phy_mac_ch14_messagebus_i;
//   logic fastp_pcie_phy_mac_ch14_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch14_rxdata_i;
//   logic fastp_pcie_phy_mac_ch14_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch14_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch14_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch14_rxvalid_i;
//   logic fastp_pcie_phy_mac_ch14_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_mac_phy_ch15_messagebus_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch15_pclk_rate_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch15_powerdown_o;
//   logic  [2:0]	fastp_pcie_mac_phy_ch15_rate_o;
//   logic 	fastp_pcie_mac_phy_ch15_rxstandby_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch15_rxwidth_o;
//   logic  [39:0]	fastp_pcie_mac_phy_ch15_txdata_o;
//   logic 	fastp_pcie_mac_phy_ch15_txdatavalid_o;
//   logic 	fastp_pcie_mac_phy_ch15_txdetectrx_loopback_o;
//   logic  [3:0]	fastp_pcie_mac_phy_ch15_txelecidle_o;
//   logic  [1:0]	fastp_pcie_mac_phy_ch15_width_o;
//   logic 	fastp_pcie_mac_phy_ch15_rxelecidle_disable_o;
//   logic 	fastp_pcie_mac_phy_ch15_txcmnmode_disable_o;
//   logic 	fastp_pcie_mac_phy_ch15_rxtermination_o;
//   logic 	fastp_pcie_mac_phy_ch15_srisenable_o;
//   logic 	fastp_pcie_mac_phy_ch15_pclkchangeack_o;
//   logic fastp_pcie_phy_mac_ch15_pclkchangeok_i;
//   logic  [7:0]	fastp_pcie_phy_mac_ch15_messagebus_i;
//   logic fastp_pcie_phy_mac_ch15_phystatus_i;
//   logic  [39:0]	fastp_pcie_phy_mac_ch15_rxdata_i;
//   logic fastp_pcie_phy_mac_ch15_rxelecidle_i;
//   logic fastp_pcie_phy_mac_ch15_rxstandbystatus_i;
//   logic  [2:0]	fastp_pcie_phy_mac_ch15_rxstatus_i;
//   logic fastp_pcie_phy_mac_ch15_rxvalid_i;
//   logic fastp_pcie_phy_mac_rx0_clk_i;
//   logic fastp_pcie_phy_mac_rx1_clk_i;
//   logic fastp_pcie_phy_mac_rx2_clk_i;
//   logic fastp_pcie_phy_mac_rx3_clk_i;
//   logic fastp_pcie_phy_mac_rx4_clk_i;
//   logic fastp_pcie_phy_mac_rx5_clk_i;
//   logic fastp_pcie_phy_mac_rx6_clk_i;
//   logic fastp_pcie_phy_mac_rx7_clk_i;
//   logic fastp_pcie_phy_mac_rx8_clk_i;
//   logic fastp_pcie_phy_mac_rx9_clk_i;
//   logic fastp_pcie_phy_mac_rx10_clk_i;
//   logic fastp_pcie_phy_mac_rx11_clk_i;
//   logic fastp_pcie_phy_mac_rx12_clk_i;
//   logic fastp_pcie_phy_mac_rx13_clk_i;
//   logic fastp_pcie_phy_mac_rx14_clk_i;
//   logic fastp_pcie_phy_mac_rx15_clk_i;
// //LLTAN_FAST_PIP





   assign p0_user_vfnonfatalmsg_func_num_i   = 3'b000;
   assign p0_user_vfnonfatalmsg_vfnum_i      = 11'b00000000000;
   assign p0_user_sent_vfnonfatalmsg_i       = 1'b0;

   assign p0_cii_override_en_i   = enable_user_cii_hwtcl ? usr_cii_override_en_i : '0;
   assign p0_cii_override_din_i  = enable_user_cii_hwtcl ? usr_cii_override_din_i : '0;
   assign p0_cii_halt_i          = enable_user_cii_hwtcl ? usr_cii_halt_i : '0;

   // General Purpose VSEC Interface
   assign p0_pld_gp_status_i                 = 8'd0;

       
       //p1_slow_reset_status_n ports
       logic                                                                             p1_reset_status_n;
       
       //p1_slow_reset_status_n ports
       logic                                                                             p1_slow_reset_status_n;
       
       //MSI pending bits interface
       logic [2:0]                                                                       p1_msi_pnd_func_i;
       logic [1:0]                                                                       p1_msi_pnd_addr_i;
       logic [7:0]                                                                       p1_msi_pnd_byte_i;
       logic                                                                             p1_msi_pnd_ready_o;
       
       //p1_hot_plug ports
       logic                                                                             p1_sys_eml_interlock_engaged_i;
       logic                                                                             p1_sys_cmd_cpled_int_i;
       logic                                                                             p1_sys_pwr_fault_det_i;
       logic                                                                             p1_sys_mrl_sensor_state_i;
       logic                                                                             p1_sys_pre_det_state_i;
       logic                                                                             p1_sys_atten_button_pressed_i;
       
       //p1_csb_intf ports
       logic                                                                             p1_mnpput_o;
       logic                                                                             p1_mpcput_o;
       logic                                                                             p1_mnpcup_i;
       logic                                                                             p1_mpccup_i;
       logic                                                                             p1_meom_o;
       logic [15:0]                                                                      p1_mpayload_o;
       logic                                                                             p1_mparity_o;
       logic [2:0]                                                                       p1_side_ism_fabric_i;
       logic                                                                             p1_tnpput_i;
       logic                                                                             p1_tpcput_i;
       logic                                                                             p1_tnpcup_o;
       logic                                                                             p1_tpccup_o;
       logic                                                                             p1_teom_i;
       logic [15:0]                                                                      p1_tpayload_i;
       logic                                                                             p1_tparity_i;
       logic [2:0]                                                                       p1_side_ism_agent_o;
       
       //p1_pld_gp ports
       logic [7:0]                                                                       p1_pld_gp_status_i;
       logic [7:0]                                                                       p1_pld_gp_ctrl_o;
       logic                                                                             p1_pld_gp_status_ready_o;
       
       //p1_error ports
       logic                                                                             p1_app_err_valid_i;
       logic [31:0]                                                                      p1_app_err_hdr_i;
       logic [13:0]                                                                      p1_app_err_info_i;
       logic [2:0]                                                                       p1_app_err_func_num_i;
       logic                                                                             p1_app_err_ready_o;
       logic                                                                             p1_serr_out_o;
       
       //p1_flr_ctrl ports
       logic [7:0]                                                                       p1_flr_rcvd_pf_o;
       logic                                                                             p1_flr_rcvd_vf_o;
       logic [2:0]                                                                       p1_flr_rcvd_pf_num_o;
       logic [10:0]                                                                      p1_flr_rcvd_vf_num_o;
       logic [7:0]                                                                       p1_flr_completed_pf_i;
       logic                                                                             p1_flr_completed_vf_i;
       logic [2:0]                                                                       p1_flr_completed_pf_num_i;
       logic [10:0]                                                                      p1_flr_completed_vf_num_i;
       logic                                                                             p1_flr_completed_ready_o;
       
       //p1_cpl_to ports
       logic                                                                             p1_cpl_timeout_o;
       logic [2:0]                                                                       p1_cpl_timeout_func_num_o;
       logic [10:0]                                                                      p1_cpl_timeout_vfunc_num_o;
       logic                                                                             p1_cpl_timeout_vfunc_active_o;
       logic [2:0]                                                                       p1_cpl_timeout_cpl_tc_o;
       logic [1:0]                                                                       p1_cpl_timeout_cpl_attr_o;
       logic [11:0]                                                                      p1_cpl_timeout_cpl_len_o;
       logic [9:0]                                                                       p1_cpl_timeout_cpl_tag_o;

       //p1_cii ports
       logic                                                                             p1_cii_req_o;
       logic                                                                             p1_cii_hdr_poisoned_o;
       logic [3:0]                                                                       p1_cii_hdr_first_be_o;
       logic [2:0]                                                                       p1_cii_func_num_o;
       logic                                                                             p1_cii_wr_o;
       logic [9:0]                                                                       p1_cii_addr_o;
       logic [31:0]                                                                      p1_cii_dout_o;
       logic                                                                             p1_cii_override_en_i;
       logic [31:0]                                                                      p1_cii_override_din_i;
       logic                                                                             p1_cii_halt_i;
       logic                                                                             p1_cii_wr_vf_active_o;
       logic [10:0]                                                                      p1_cii_vf_num_o;

       //p1_virtio ports
       logic [2:0]                                                                       p1_virtio_pcicfg_pfnum_o;
       logic [31:0]                                                                      p1_virtio_pcicfg_length_o;
       logic [7:0]                                                                       p1_virtio_pcicfg_bar_o;
       logic [31:0]                                                                      p1_virtio_pcicfg_baroffset_o;
       logic                                                                             p1_virtio_pcicfg_cfgwr_o;
       logic [31:0]                                                                      p1_virtio_pcicfg_cfgdata_o;
       logic [31:0]                                                                      p1_virtio_pcicfg_data_i;
       logic                                                                             p1_virtio_pcicfg_rdack_i;
       logic                                                                             p1_virtio_pcicfg_cfgrd_o;
       logic                                                                             p1_virtio_pcicfg_vfaccess_o;
       logic [10:0]                                                                      p1_virtio_pcicfg_vfnum_o;
       logic [3:0]                                                                       p1_virtio_pcicfg_rdbe_i;
       logic [10:0]                                                                      p1_virtio_pcicfg_appvfnum_i;
       logic [2:0]                                                                       p1_virtio_pcicfg_apppfnum_i;
       
       //p1_hip_reconfig ports
       logic [7:0]                                                                       p1_hip_reconfig_readdata_o;
       logic                                                                             p1_hip_reconfig_readdatavalid_o;
       logic                                                                             p1_hip_reconfig_waitrequest_o;
       logic [31:0]                                                                      p1_hip_reconfig_address_i;
       logic                                                                             p1_hip_reconfig_write_i;
       logic [7:0]                                                                       p1_hip_reconfig_writedata_i;
       logic                                                                             p1_hip_reconfig_read_i;
       
       //p1_l1sub ports
       logic                                                                             p1_local_ref_clk_req_n_o;
       logic                                                                             p1_cfg_l1sub_en_o;
       logic                                                                             p1_pm_linkst_in_l1sub_o;
       logic [7:0]                                                                       p1_pm_l1sub_state_o;
       logic                                                                             p1_clkreq_in_n_i;
       logic                                                                             p1_app_clk_req_n_i;
       
       //p1_rx_st0 ports
       logic                                                                             p1_rx_st_ready_i;
       logic [m1_seg_width_hwtcl-1:0]                                                    p1_rx_st0_data_o;    // Parameterizing width of data signal to complience with x16/x8/x4
       logic                                                                             p1_rx_st0_sop_o;
       logic                                                                             p1_rx_st0_eop_o;
       logic                                                                             p1_rx_st0_dvalid_o;
       logic [$clog2(m1_seg_width_hwtcl/32)-1:0]                                        p1_rx_st0_empty_o;   // Parameterizing width of empty (per DW) signal to complience with x16/x8/x4
       
       //p1_rx_st_misc ports (p1_rx_st0_misc ports)
       logic [127:0]                                                                     p1_rx_st0_hdr_o;
       logic [31:0]                                                                      p1_rx_st0_prefix_o;
       logic                                                                             p1_rx_st0_hvalid_o;
       logic                                                                             p1_rx_st0_pvalid_o;
       logic [7:0]                                                                       p1_rx_st0_data_par_o;
       logic [3:0]                                                                       p1_rx_st0_hdr_par_o;
       logic                                                                             p1_rx_st0_prefix_par_o;
       logic [2:0]                                                                       p1_rx_st0_bar_o;
       logic                                                                             p1_rx_st0_vfactive_o;
       logic [10:0]                                                                      p1_rx_st0_vfnum_o;
       logic [2:0]                                                                       p1_rx_st0_pfnum_o;
       logic                                                                             p1_rx_st0_pt_parity_o;
       
       //p1_rx_st1 ports
       logic [m1_seg_width_hwtcl-1:0]                                                    p1_rx_st1_data_o;    // Parameterizing width of data signal to complience with x16/x8/x4
       logic                                                                             p1_rx_st1_sop_o;
       logic                                                                             p1_rx_st1_eop_o;
       logic                                                                             p1_rx_st1_dvalid_o;
       logic [$clog2(m1_seg_width_hwtcl/32)-1:0]                                        p1_rx_st1_empty_o;   // Parameterizing width of empty (per DW) signal to complience with x16/x8/x4
       
       //p1_rx_st_misc ports (p1_rx_st1_misc ports)
       logic [127:0]                                                                     p1_rx_st1_hdr_o;
       logic [31:0]                                                                      p1_rx_st1_prefix_o;
       logic                                                                             p1_rx_st1_hvalid_o;
       logic                                                                             p1_rx_st1_pvalid_o;
       logic [7:0]                                                                       p1_rx_st1_data_par_o;
       logic [3:0]                                                                       p1_rx_st1_hdr_par_o;
       logic                                                                             p1_rx_st1_prefix_par_o;
       logic [2:0]                                                                       p1_rx_st1_bar_o;
       logic                                                                             p1_rx_st1_vfactive_o;
       logic [10:0]                                                                      p1_rx_st1_vfnum_o;
       logic [2:0]                                                                       p1_rx_st1_pfnum_o;
       logic                                                                             p1_rx_st1_pt_parity_o;
       logic                                                                             p1_rx_st_par_err_o;
       
       //p1_rx_st_dsk ports
       logic                                                                             p1_rx_dsk_valid_o;
       logic                                                                             p1_rx_dsk_eval_done_o;
       logic                                                                             p1_rx_dsk_lock_err_o;
       logic [511:0]                                                                     p1_rx_dsk_monitor_err_o;
       
       //p1_rx_st_misc ports (p1_rx_st_hcrdt/dcrdt ports)
       logic [2:0]                                                                       p1_rx_st_hcrdt_init_i;
       logic [2:0]                                                                       p1_rx_st_hcrdt_update_i;
       logic [5:0]                                                                       p1_rx_st_hcrdt_update_cnt_i;
       logic [2:0]                                                                       p1_rx_st_hcrdt_init_ack_o;
       logic [2:0]                                                                       p1_rx_st_dcrdt_init_i;
       logic [2:0]                                                                       p1_rx_st_dcrdt_update_i;
       logic [11:0]                                                                      p1_rx_st_dcrdt_update_cnt_i;
       logic [2:0]                                                                       p1_rx_st_dcrdt_init_ack_o;
       
       //p1_tx_st_misc ports (p1_tx_st_hcrdt/dcrdt ports)
       logic [2:0]                                                                       p1_tx_st_hcrdt_init_o;
       logic [2:0]                                                                       p1_tx_st_hcrdt_update_o;
       logic [5:0]                                                                       p1_tx_st_hcrdt_update_cnt_o;
       logic [2:0]                                                                       p1_tx_st_hcrdt_init_ack_i;
       logic [2:0]                                                                       p1_tx_st_dcrdt_init_o;
       logic [2:0]                                                                       p1_tx_st_dcrdt_update_o;
       logic [11:0]                                                                      p1_tx_st_dcrdt_update_cnt_o;
       logic [2:0]                                                                       p1_tx_st_dcrdt_init_ack_i;
       
       //p1_tx_st0 ports
       logic                                                                             p1_tx_st_ready_o;
       logic [m1_seg_width_hwtcl-1:0]                                                    p1_tx_st0_data_i;    // Parameterizing width of data signal to complience with x16/x8/x4
       logic                                                                             p1_tx_st0_sop_i;
       logic                                                                             p1_tx_st0_eop_i;
       logic                                                                             p1_tx_st0_dvalid_i;
       
       //p1_tx_st_misc ports (p1_tx_st0_misc ports)
       logic [127:0]                                                                     p1_tx_st0_hdr_i;
       logic [31:0]                                                                      p1_tx_st0_prefix_i;
       logic                                                                             p1_tx_st0_hvalid_i;
       logic                                                                             p1_tx_st0_pvalid_i;
       logic [7:0]                                                                       p1_tx_st0_data_par_i;
       logic [3:0]                                                                       p1_tx_st0_hdr_par_i;
       logic                                                                             p1_tx_st0_prefix_par_i;
       
       //p1_tx_st1 ports
       logic [m1_seg_width_hwtcl-1:0]                                                    p1_tx_st1_data_i;    // Parameterizing width of data signal to complience with x16/x8/x4
       logic                                                                             p1_tx_st1_sop_i;
       logic                                                                             p1_tx_st1_eop_i;
       logic                                                                             p1_tx_st1_dvalid_i;
       
       //p1_tx_st_misc ports (p1_tx_st1_misc ports)
       logic [127:0]                                                                     p1_tx_st1_hdr_i;
       logic [31:0]                                                                      p1_tx_st1_prefix_i;
       logic                                                                             p1_tx_st1_hvalid_i;
       logic                                                                             p1_tx_st1_pvalid_i;
       logic [7:0]                                                                       p1_tx_st1_data_par_i;
       logic [3:0]                                                                       p1_tx_st1_hdr_par_i;
       logic                                                                             p1_tx_st1_prefix_par_i;
       logic                                                                             p1_tx_st_par_err_o;


       
       //p1_tx_ehp ports
       logic                                                                             p1_tx_ehp_deallocate_empty_o;

   //p0 vf_err_ ports
   logic                                                                                  p1_vf_err_ur_posted_s0_o;
   logic                                                                                  p1_vf_err_ur_posted_s1_o;
   logic [2:0]                                                                            p1_vf_err_func_num_s0_o;
   logic [2:0]                                                                            p1_vf_err_func_num_s1_o;
   logic                                                                                  p1_vf_err_ca_postedreq_s0_o;
   logic                                                                                  p1_vf_err_ca_postedreq_s1_o;
   logic [10:0]                                                                           p1_vf_err_vf_num_s0_o;
   logic [10:0]                                                                           p1_vf_err_vf_num_s1_o;
   logic                                                                                  p1_vf_err_poisonedwrreq_s0_o;
   logic                                                                                  p1_vf_err_poisonedwrreq_s1_o;
   logic                                                                                  p1_vf_err_poisonedcompl_s0_o;
   logic                                                                                  p1_vf_err_poisonedcompl_s1_o;
   logic [2:0]                                                                            p1_user_vfnonfatalmsg_func_num_i;
   logic [10:0]                                                                           p1_user_vfnonfatalmsg_vfnum_i;
   logic                                                                                  p1_user_sent_vfnonfatalmsg_i;
   logic                                                                                  p1_vf_err_overflow_o;
   logic                                                                                  p1_user_vfnonfatalmsg_ready_o;

   assign p1_user_vfnonfatalmsg_func_num_i   = 3'b000;
   assign p1_user_vfnonfatalmsg_vfnum_i      = 11'b00000000000;
   assign p1_user_sent_vfnonfatalmsg_i       = 1'b0;

   assign p1_cii_override_en_i   = m1_enable_user_cii_hwtcl ? p1_usr_cii_override_en_i : '0;
   assign p1_cii_override_din_i  = m1_enable_user_cii_hwtcl ? p1_usr_cii_override_din_i : '0;
   assign p1_cii_halt_i          = m1_enable_user_cii_hwtcl ? p1_usr_cii_halt_i : '0;

   // General Purpose VSEC Interface
   assign p1_pld_gp_status_i                 = 8'd0;

//Shoaib
//Shoaib
//Shoaib
   assign p0_app_slow_reset_status_n = p0_slow_reset_status_n;

   intel_pcie_mcdma_rtile_wrapper #(
                                    .total_pf_count_width_hwtcl                     (total_pf_count_width_hwtcl                   ),    
                                    .total_vf_count_width_hwtcl                     (total_vf_count_width_hwtcl                   ),
                                    .total_vf_count_hwtcl                           (total_vf_count_hwtcl                         ),
                                    .total_pf_count_hwtcl                           (total_pf_count_hwtcl                         ),
                                    .payload_width_integer_hwtcl                    (payload_width_integer_hwtcl                  ),
                                    .hdr_width_integer_hwtcl                        (hdr_width_integer_hwtcl                      ),
                                    .pfx_width_integer_hwtcl                        (pfx_width_integer_hwtcl                      ),
                                    .device_family                                  (device_family                                ),
                                    .maxpayload_size_hwtcl                          (maxpayload_size_hwtcl                        ),
                                    .seg_num_hwtcl                                  (seg_num_hwtcl                                ),
                                    .seg_width_hwtcl                                (seg_width_hwtcl                              ),
                                    .single_width_integer_hwtcl                     (single_width_integer_hwtcl                   ),
                                    .data_width_hwtcl                               (data_width_hwtcl                             ),
                                    .address_width_hwtcl                            (address_width_hwtcl                          ),
                                    .empty_width_hwtcl                              (empty_width_hwtcl                            ),
                                    .burst_width_hwtcl                              (burst_width_hwtcl                            ),
                                    .pfnum_hwtcl                                    (pfnum_hwtcl                                  ),
                                    .pfnum_width_hwtcl                              (pfnum_width_hwtcl                            ),
                                    .vfnum_width_hwtcl                              (vfnum_width_hwtcl                            ),
                                    .pio_address_width_hwtcl                        (pio_address_width_hwtcl                      ),
                                    .cs_address_width_hwtcl                         (cs_address_width_hwtcl                       ),
                                    .att_en_for_bas_cs_hwtcl                        (att_en_for_bas_cs_hwtcl                      ),  
                                    .mapping_table_address_width_hwtcl              (mapping_table_address_width_hwtcl            ), 
                                    .mapping_window_address_width_hwtcl             (mapping_window_address_width_hwtcl           ), 
                                    .msi_enable_hwtcl                               ( msi_enable_hwtcl                            ),
                                    .per_vec_mask_capable_hwtcl                     ( per_vec_mask_capable_hwtcl                  ),
                                    .addr_64bit_capable_hwtcl                       ( addr_64bit_capable_hwtcl                    ),
                                    .multi_msg_capable_hwtcl                        ( multi_msg_capable_hwtcl                     ), 
                                    .ext_msg_data_capable_hwtcl                     ( ext_msg_data_capable_hwtcl                  ),
                                    .pio_data_width_hwtcl                           (pio_data_width_hwtcl                         ),
                                    .uport_type_h2d_hwtcl                           (uport_type_h2d_hwtcl                         ),
                                    .uport_type_d2h_hwtcl                           (uport_type_d2h_hwtcl                         ),
                                    .tile_hwtcl                                     (tile_hwtcl                                   ),
                                    .core_index_hwtcl                               (0                                            ),
                                    .enable_cpl_timeout_hwtcl                       (core16_enable_cpl_timeout_hwtcl              ),
                                    .pf0_enable_sriov_hwtcl                         (pf0_enable_sriov_hwtcl                       ),
                                    .pf1_enable_sriov_hwtcl                         (pf1_enable_sriov_hwtcl                       ),
                                    .pf2_enable_sriov_hwtcl                         (pf2_enable_sriov_hwtcl                       ),
                                    .pf3_enable_sriov_hwtcl                         (pf3_enable_sriov_hwtcl                       ),
                                    .pf4_enable_sriov_hwtcl                         (pf4_enable_sriov_hwtcl                       ),
                                    .pf5_enable_sriov_hwtcl                         (pf5_enable_sriov_hwtcl                       ),
                                    .pf6_enable_sriov_hwtcl                         (pf6_enable_sriov_hwtcl                       ),
                                    .pf7_enable_sriov_hwtcl                         (pf7_enable_sriov_hwtcl                       ),
                                    .pf0_num_vf_per_pf_hwtcl                        (pf0_num_vf_per_pf_hwtcl                      ),
                                    .pf1_num_vf_per_pf_hwtcl                        (pf1_num_vf_per_pf_hwtcl                      ),
                                    .pf2_num_vf_per_pf_hwtcl                        (pf2_num_vf_per_pf_hwtcl                      ),
                                    .pf3_num_vf_per_pf_hwtcl                        (pf3_num_vf_per_pf_hwtcl                      ),
                                    .pf4_num_vf_per_pf_hwtcl                        (pf4_num_vf_per_pf_hwtcl                      ),
                                    .pf5_num_vf_per_pf_hwtcl                        (pf5_num_vf_per_pf_hwtcl                      ),
                                    .pf6_num_vf_per_pf_hwtcl                        (pf6_num_vf_per_pf_hwtcl                      ),
                                    .pf7_num_vf_per_pf_hwtcl                        (pf7_num_vf_per_pf_hwtcl                      ),
                                    .pf0_num_dma_chan_pf_hwtcl                      (pf0_num_dma_chan_pf_hwtcl                    ),
                                    .pf1_num_dma_chan_pf_hwtcl                      (pf1_num_dma_chan_pf_hwtcl                    ),
                                    .pf2_num_dma_chan_pf_hwtcl                      (pf2_num_dma_chan_pf_hwtcl                    ),
                                    .pf3_num_dma_chan_pf_hwtcl                      (pf3_num_dma_chan_pf_hwtcl                    ),
                                    .pf4_num_dma_chan_pf_hwtcl                      (pf4_num_dma_chan_pf_hwtcl                    ),
                                    .pf5_num_dma_chan_pf_hwtcl                      (pf5_num_dma_chan_pf_hwtcl                    ),
                                    .pf6_num_dma_chan_pf_hwtcl                      (pf6_num_dma_chan_pf_hwtcl                    ),
                                    .pf7_num_dma_chan_pf_hwtcl                      (pf7_num_dma_chan_pf_hwtcl                    ),
                                    .pf0_num_dma_chan_per_vf_hwtcl                  (pf0_num_dma_chan_per_vf_hwtcl                ),
                                    .pf1_num_dma_chan_per_vf_hwtcl                  (pf1_num_dma_chan_per_vf_hwtcl                ),
                                    .pf2_num_dma_chan_per_vf_hwtcl                  (pf2_num_dma_chan_per_vf_hwtcl                ),
                                    .pf3_num_dma_chan_per_vf_hwtcl                  (pf3_num_dma_chan_per_vf_hwtcl                ),
                                    .pf4_num_dma_chan_per_vf_hwtcl                  (pf4_num_dma_chan_per_vf_hwtcl                ),
                                    .pf5_num_dma_chan_per_vf_hwtcl                  (pf5_num_dma_chan_per_vf_hwtcl                ),
                                    .pf6_num_dma_chan_per_vf_hwtcl                  (pf6_num_dma_chan_per_vf_hwtcl                ),
                                    .pf7_num_dma_chan_per_vf_hwtcl                  (pf7_num_dma_chan_per_vf_hwtcl                ),
                                    .enable_user_msix_hwtcl                         (enable_user_msix_hwtcl                       ),
                                    .enable_user_flr_hwtcl                          (enable_user_flr_hwtcl                        ),
                                    .num_h2d_uport_hwtcl                            (num_h2d_uport_hwtcl                          ),
                                    .num_d2h_uport_hwtcl                            (num_d2h_uport_hwtcl                          ),
                                    .d2h_num_active_channel_hwtcl                   (d2h_num_active_channel_hwtcl                 ),
                                    .d2h_max_num_desc_fetch_hwtcl                   (d2h_max_num_desc_fetch_hwtcl                 ),
                                    .en_metadata_8_hwtcl                            (en_metadata_8_hwtcl                          ),
                                    .en_10bit_tag_hwtcl                             (1), // 10-bit Tag Support (Maximum of 768 outstanding tags (x16) at any given time, for all functions combined)
                                    .enable_32bit_address_hwtcl                     (enable_32bit_address_hwtcl                   ),
                                    .pio_bar2_size_per_f_hwtcl                      (pio_bar2_size_per_f_hwtcl                    ),
                                    .enable_bursting_master_hwtcl                   (enable_bursting_master_hwtcl                 ),
                                    .enable_bursting_slave_hwtcl                    (enable_bursting_slave_hwtcl                  ),
                                    .enable_mcdma_hwtcl                             (enable_mcdma_hwtcl                           ),
                                    .enable_byte_aligned_txfr_hwtcl                 (enable_byte_aligned_txfr_hwtcl               ),
                                    .enable_data_mover_hwtcl                        (enable_data_mover_hwtcl                      ),
                                    .pfcnt_w_hwtcl                                  (pfcnt_w_hwtcl                                ),
                                    .vfcnt_w_hwtcl                                  (vfcnt_w_hwtcl                                ),
                                    .bas_address_width_hwtcl                        (bas_address_width_hwtcl                      ),
                                    .max_bar_address_width_hwtcl                    (max_bar_address_width_hwtcl                  ),
                                    .enable_cs_hwtcl                                (enable_cs_hwtcl                              ),
                                    .enable_cii_hwtcl                               (core16_enable_cii_hwtcl                      ),
                                    .core16_pf0_bar0_address_width_hwtcl            (pf0_bar0_address_width_hwtcl          ),
                                    .core16_pf0_bar1_address_width_hwtcl            (pf0_bar1_address_width_hwtcl          ),
                                    .core16_pf0_bar2_address_width_hwtcl            (pf0_bar2_address_width_hwtcl          ),
                                    .core16_pf0_bar3_address_width_hwtcl            (pf0_bar3_address_width_hwtcl          ),
                                    .core16_pf0_bar4_address_width_hwtcl            (pf0_bar4_address_width_hwtcl          ),
                                    .core16_pf0_bar5_address_width_hwtcl            (pf0_bar5_address_width_hwtcl          ),
                                    .core16_pf1_bar0_address_width_hwtcl            (pf1_bar0_address_width_hwtcl          ),
                                    .core16_pf1_bar1_address_width_hwtcl            (pf1_bar1_address_width_hwtcl          ),
                                    .core16_pf1_bar2_address_width_hwtcl            (pf1_bar2_address_width_hwtcl          ),
                                    .core16_pf1_bar3_address_width_hwtcl            (pf1_bar3_address_width_hwtcl          ),
                                    .core16_pf1_bar4_address_width_hwtcl            (pf1_bar4_address_width_hwtcl          ),
                                    .core16_pf1_bar5_address_width_hwtcl            (pf1_bar5_address_width_hwtcl          ),
                                    .core16_pf2_bar0_address_width_hwtcl            (pf2_bar0_address_width_hwtcl          ),
                                    .core16_pf2_bar1_address_width_hwtcl            (pf2_bar1_address_width_hwtcl          ),
                                    .core16_pf2_bar2_address_width_hwtcl            (pf2_bar2_address_width_hwtcl          ),
                                    .core16_pf2_bar3_address_width_hwtcl            (pf2_bar3_address_width_hwtcl          ),
                                    .core16_pf2_bar4_address_width_hwtcl            (pf2_bar4_address_width_hwtcl          ),
                                    .core16_pf2_bar5_address_width_hwtcl            (pf2_bar5_address_width_hwtcl          ),
                                    .core16_pf3_bar0_address_width_hwtcl            (pf3_bar0_address_width_hwtcl          ),
                                    .core16_pf3_bar1_address_width_hwtcl            (pf3_bar1_address_width_hwtcl          ),
                                    .core16_pf3_bar2_address_width_hwtcl            (pf3_bar2_address_width_hwtcl          ),
                                    .core16_pf3_bar3_address_width_hwtcl            (pf3_bar3_address_width_hwtcl          ),
                                    .core16_pf3_bar4_address_width_hwtcl            (pf3_bar4_address_width_hwtcl          ),
                                    .core16_pf3_bar5_address_width_hwtcl            (pf3_bar5_address_width_hwtcl          ),
                                    .core16_pf4_bar0_address_width_hwtcl            (pf4_bar0_address_width_hwtcl          ),
                                    .core16_pf4_bar1_address_width_hwtcl            (pf4_bar1_address_width_hwtcl          ),
                                    .core16_pf4_bar2_address_width_hwtcl            (pf4_bar2_address_width_hwtcl          ),
                                    .core16_pf4_bar3_address_width_hwtcl            (pf4_bar3_address_width_hwtcl          ),
                                    .core16_pf4_bar4_address_width_hwtcl            (pf4_bar4_address_width_hwtcl          ),
                                    .core16_pf4_bar5_address_width_hwtcl            (pf4_bar5_address_width_hwtcl          ),
                                    .core16_pf5_bar0_address_width_hwtcl            (pf5_bar0_address_width_hwtcl          ),
                                    .core16_pf5_bar1_address_width_hwtcl            (pf5_bar1_address_width_hwtcl          ),
                                    .core16_pf5_bar2_address_width_hwtcl            (pf5_bar2_address_width_hwtcl          ),
                                    .core16_pf5_bar3_address_width_hwtcl            (pf5_bar3_address_width_hwtcl          ),
                                    .core16_pf5_bar4_address_width_hwtcl            (pf5_bar4_address_width_hwtcl          ),
                                    .core16_pf5_bar5_address_width_hwtcl            (pf5_bar5_address_width_hwtcl          ),
                                    .core16_pf6_bar0_address_width_hwtcl            (pf6_bar0_address_width_hwtcl          ),
                                    .core16_pf6_bar1_address_width_hwtcl            (pf6_bar1_address_width_hwtcl          ),
                                    .core16_pf6_bar2_address_width_hwtcl            (pf6_bar2_address_width_hwtcl          ),
                                    .core16_pf6_bar3_address_width_hwtcl            (pf6_bar3_address_width_hwtcl          ),
                                    .core16_pf6_bar4_address_width_hwtcl            (pf6_bar4_address_width_hwtcl          ),
                                    .core16_pf6_bar5_address_width_hwtcl            (pf6_bar5_address_width_hwtcl          ),
                                    .core16_pf7_bar0_address_width_hwtcl            (pf7_bar0_address_width_hwtcl          ),
                                    .core16_pf7_bar2_address_width_hwtcl            (pf7_bar2_address_width_hwtcl          ),
                                    .core16_pf7_bar3_address_width_hwtcl            (pf7_bar3_address_width_hwtcl          ),
                                    .core16_pf7_bar4_address_width_hwtcl            (pf7_bar4_address_width_hwtcl          ),
                                    .core16_pf7_bar5_address_width_hwtcl            (pf7_bar5_address_width_hwtcl          ),
                                    .core16_pf7_bar1_address_width_hwtcl            (pf7_bar1_address_width_hwtcl          ),
                                    .core16_pf0_sriov_vf_bar0_address_width_hwtcl   (pf0_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar1_address_width_hwtcl   (pf0_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar2_address_width_hwtcl   (pf0_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar3_address_width_hwtcl   (pf0_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar4_address_width_hwtcl   (pf0_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar5_address_width_hwtcl   (pf0_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar0_address_width_hwtcl   (pf1_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar1_address_width_hwtcl   (pf1_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar2_address_width_hwtcl   (pf1_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar3_address_width_hwtcl   (pf1_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar4_address_width_hwtcl   (pf1_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar5_address_width_hwtcl   (pf1_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar0_address_width_hwtcl   (pf2_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar1_address_width_hwtcl   (pf2_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar2_address_width_hwtcl   (pf2_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar3_address_width_hwtcl   (pf2_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar4_address_width_hwtcl   (pf2_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar5_address_width_hwtcl   (pf2_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar0_address_width_hwtcl   (pf3_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar1_address_width_hwtcl   (pf3_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar2_address_width_hwtcl   (pf3_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar3_address_width_hwtcl   (pf3_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar4_address_width_hwtcl   (pf3_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar5_address_width_hwtcl   (pf3_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar0_address_width_hwtcl   (pf4_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar1_address_width_hwtcl   (pf4_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar2_address_width_hwtcl   (pf4_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar3_address_width_hwtcl   (pf4_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar4_address_width_hwtcl   (pf4_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar5_address_width_hwtcl   (pf4_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar0_address_width_hwtcl   (pf5_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar1_address_width_hwtcl   (pf5_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar2_address_width_hwtcl   (pf5_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar3_address_width_hwtcl   (pf5_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar4_address_width_hwtcl   (pf5_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar5_address_width_hwtcl   (pf5_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar0_address_width_hwtcl   (pf6_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar1_address_width_hwtcl   (pf6_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar2_address_width_hwtcl   (pf6_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar3_address_width_hwtcl   (pf6_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar4_address_width_hwtcl   (pf6_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar5_address_width_hwtcl   (pf6_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar0_address_width_hwtcl   (pf7_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar1_address_width_hwtcl   (pf7_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar2_address_width_hwtcl   (pf7_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar3_address_width_hwtcl   (pf7_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar4_address_width_hwtcl   (pf7_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar5_address_width_hwtcl   (pf7_sriov_vf_bar5_address_width_hwtcl )
      
                                    ) 
   mcdma (
          .clk                                            (coreclkout_hip        ),
          .rst_n                                          (p0_reset_status_n     ),

          .rx_st_ready_o                                  (p0_rx_st_ready_i),               //   input,    width = 1,              p0_rx_st0.ready
          .rx_st0_payload_i                               (p0_rx_st0_data_o),               //  output,  width = 256,                       .data
          .rx_st0_sop_i                                   (p0_rx_st0_sop_o),                //  output,    width = 1,                       .startofpacket
          .rx_st0_eop_i                                   (p0_rx_st0_eop_o),                //  output,    width = 1,                       .endofpacket
          .rx_st0_dvalid_i                                (p0_rx_st0_dvalid_o),             //  output,    width = 1,                       .valid
          .rx_st0_empty_i                                 (p0_rx_st0_empty_o),              //  output,    width = 3,                       .empty
          .rx_st0_header_i                                (p0_rx_st0_hdr_o),                //  output,  width = 128,          p0_rx_st_misc.rx_st0_hdr
          .rx_st0_tlp_prfx_i                              (p0_rx_st0_prefix_o),             //  output,   width = 32,                       .rx_st0_prefix
          .rx_st0_hvalid_i                                (p0_rx_st0_hvalid_o),             //  output,    width = 1,                       .rx_st0_hvalid
          .rx_st0_pvalid_i                                (p0_rx_st0_pvalid_o),             //  output,    width = 1,                       .rx_st0_pvalid
          .rx_st0_bar_i                                   (p0_rx_st0_bar_o),                //  output,    width = 3,                       .rx_st0_bar
          .rx_st1_header_i                                (p0_rx_st1_hdr_o),                //  output,  width = 128,                       .rx_st1_hdr
          .rx_st1_tlp_prfx_i                              (p0_rx_st1_prefix_o),             //  output,   width = 32,                       .rx_st1_prefix
          .rx_st1_hvalid_i                                (p0_rx_st1_hvalid_o),             //  output,    width = 1,                       .rx_st1_hvalid
          .rx_st1_pvalid_i                                (p0_rx_st1_pvalid_o),             //  output,    width = 1,                       .rx_st1_pvalid
          .rx_st1_bar_i                                   (p0_rx_st1_bar_o),                //  output,    width = 3,                       .rx_st1_bar
          .rx_st2_header_i                                (p0_rx_st2_hdr_o),                //  output,  width = 128,                       .rx_st2_hdr
          .rx_st2_tlp_prfx_i                              (p0_rx_st2_prefix_o),             //  output,   width = 32,                       .rx_st2_prefix
          .rx_st2_hvalid_i                                (p0_rx_st2_hvalid_o),             //  output,    width = 1,                       .rx_st2_hvalid
          .rx_st2_pvalid_i                                (p0_rx_st2_pvalid_o),             //  output,    width = 1,                       .rx_st2_pvalid
          .rx_st2_bar_i                                   (p0_rx_st2_bar_o),                //  output,    width = 3,                       .rx_st2_bar
          .rx_st3_header_i                                (p0_rx_st3_hdr_o),                //  output,  width = 128,                       .rx_st3_hdr
          .rx_st3_tlp_prfx_i                              (p0_rx_st3_prefix_o),             //  output,   width = 32,                       .rx_st3_prefix
          .rx_st3_hvalid_i                                (p0_rx_st3_hvalid_o),             //  output,    width = 1,                       .rx_st3_hvalid
          .rx_st3_pvalid_i                                (p0_rx_st3_pvalid_o),             //  output,    width = 1,                       .rx_st3_pvalid
          .rx_st3_bar_i                                   (p0_rx_st3_bar_o),                //  output,    width = 3,                       .rx_st3_bar
          .rx_st_hcrdt_init_o                             (p0_rx_st_hcrdt_init_i),          //   input,    width = 3,                       .rx_st_Hcrdt_init
          .rx_st_hcrdt_update_o                           (p0_rx_st_hcrdt_update_i),        //   input,    width = 3,                       .rx_st_Hcrdt_update
          .rx_st_hcrdt_update_cnt_o                       (p0_rx_st_hcrdt_update_cnt_i),    //   input,    width = 6,                       .rx_st_Hcrdt_update_cnt
          .rx_st_hcrdt_init_ack_i                         (p0_rx_st_hcrdt_init_ack_o),      //  output,    width = 3,                       .rx_st_Hcrdt_init_ack
          .rx_st_dcrdt_init_o                             (p0_rx_st_dcrdt_init_i),          //   input,    width = 3,                       .rx_st_Dcrdt_init
          .rx_st_dcrdt_update_o                           (p0_rx_st_dcrdt_update_i),        //   input,    width = 3,                       .rx_st_Dcrdt_update
          .rx_st_dcrdt_update_cnt_o                       (p0_rx_st_dcrdt_update_cnt_i),    //   input,   width = 12,                       .rx_st_Dcrdt_update_cnt
          .rx_st_dcrdt_init_ack_i                         (p0_rx_st_dcrdt_init_ack_o),      //  output,    width = 3,                       .rx_st_Dcrdt_init_ack
          .rx_st1_payload_i                               (p0_rx_st1_data_o),               //  output,  width = 256,              p0_rx_st1.data
          .rx_st1_sop_i                                   (p0_rx_st1_sop_o),                //  output,    width = 1,                       .startofpacket
          .rx_st1_eop_i                                   (p0_rx_st1_eop_o),                //  output,    width = 1,                       .endofpacket
          .rx_st1_dvalid_i                                (p0_rx_st1_dvalid_o),             //  output,    width = 1,                       .valid
          .rx_st1_empty_i                                 (p0_rx_st1_empty_o),              //  output,    width = 3,                       .empty
          .rx_st2_payload_i                               (p0_rx_st2_data_o),               //  output,  width = 256,              p0_rx_st2.data
          .rx_st2_sop_i                                   (p0_rx_st2_sop_o),                //  output,    width = 1,                       .startofpacket
          .rx_st2_eop_i                                   (p0_rx_st2_eop_o),                //  output,    width = 1,                       .endofpacket
          .rx_st2_dvalid_i                                (p0_rx_st2_dvalid_o),             //  output,    width = 1,                       .valid
          .rx_st2_empty_i                                 (p0_rx_st2_empty_o),              //  output,    width = 3,                       .empty
          .rx_st3_payload_i                               (p0_rx_st3_data_o),               //  output,  width = 256,              p0_rx_st3.data
          .rx_st3_sop_i                                   (p0_rx_st3_sop_o),                //  output,    width = 1,                       .startofpacket
          .rx_st3_eop_i                                   (p0_rx_st3_eop_o),                //  output,    width = 1,                       .endofpacket
          .rx_st3_dvalid_i                                (p0_rx_st3_dvalid_o),             //  output,    width = 1,                       .valid
          .rx_st3_empty_i                                 (p0_rx_st3_empty_o),              //  output,    width = 3,                       .empty
          .tx_st_hcrdt_init_i                             (p0_tx_st_hcrdt_init_o),          //  output,    width = 3,          p0_tx_st_misc.tx_st_Hcrdt_init
          .tx_st_hcrdt_update_i                           (p0_tx_st_hcrdt_update_o),        //  output,    width = 3,                       .tx_st_Hcrdt_update
          .tx_st_hcrdt_update_cnt_i                       (p0_tx_st_hcrdt_update_cnt_o),    //  output,    width = 6,                       .tx_st_Hcrdt_update_cnt
          .tx_st_hcrdt_init_ack_o                         (p0_tx_st_hcrdt_init_ack_i),      //   input,    width = 3,                       .tx_st_Hcrdtt_init_ack
          .tx_st_dcrdt_init_i                             (p0_tx_st_dcrdt_init_o),          //  output,    width = 3,                       .tx_st_Dcrdt_init
          .tx_st_dcrdt_update_i                           (p0_tx_st_dcrdt_update_o),        //  output,    width = 3,                       .tx_st_Dcrdt_update
          .tx_st_dcrdt_update_cnt_i                       (p0_tx_st_dcrdt_update_cnt_o),    //  output,   width = 12,                       .tx_st_Dcrdt_update_cnt
          .tx_st_dcrdt_init_ack_o                         (p0_tx_st_dcrdt_init_ack_i),      //   input,    width = 3,                       .tx_st_Dcrdt_init_ack
          .tx_st0_header_o                                (p0_tx_st0_hdr_i),                //   input,  width = 128,                       .tx_st0_hdr
          .tx_st0_prefix_o                                (p0_tx_st0_prefix_i),             //   input,   width = 32,                       .tx_st0_prefix
          .tx_st0_hvalid_o                                (p0_tx_st0_hvalid_i),             //   input,    width = 1,                       .tx_st0_hvalid
          .tx_st0_pvalid_o                                (p0_tx_st0_pvalid_i),             //   input,    width = 1,                       .tx_st0_pvalid
          .tx_st1_header_o                                (p0_tx_st1_hdr_i),                //   input,  width = 128,                       .tx_st1_hdr
          .tx_st1_prefix_o                                (p0_tx_st1_prefix_i),             //   input,   width = 32,                       .tx_st1_prefix
          .tx_st1_hvalid_o                                (p0_tx_st1_hvalid_i),             //   input,    width = 1,                       .tx_st1_hvalid
          .tx_st1_pvalid_o                                (p0_tx_st1_pvalid_i),             //   input,    width = 1,                       .tx_st1_pvalid
          .tx_st2_header_o                                (p0_tx_st2_hdr_i),                //   input,  width = 128,                       .tx_st2_hdr
          .tx_st2_prefix_o                                (p0_tx_st2_prefix_i),             //   input,   width = 32,                       .tx_st2_prefix
          .tx_st2_hvalid_o                                (p0_tx_st2_hvalid_i),             //   input,    width = 1,                       .tx_st2_hvalid
          .tx_st2_pvalid_o                                (p0_tx_st2_pvalid_i),             //   input,    width = 1,                       .tx_st2_pvalid
          .tx_st3_header_o                                (p0_tx_st3_hdr_i),                //   input,  width = 128,                       .tx_st3_hdr
          .tx_st3_prefix_o                                (p0_tx_st3_prefix_i),             //   input,   width = 32,                       .tx_st3_prefix
          .tx_st3_hvalid_o                                (p0_tx_st3_hvalid_i),             //   input,    width = 1,                       .tx_st3_hvalid
          .tx_st3_pvalid_o                                (p0_tx_st3_pvalid_i),             //   input,    width = 1,                       .tx_st3_pvalid
          .tx_st_ready_i                                  (p0_tx_st_ready_o),               //  output,    width = 1,              p0_tx_st0.ready
          .tx_st0_payload_o                               (p0_tx_st0_data_i),               //   input,  width = 256,                       .data
          .tx_st0_sop_o                                   (p0_tx_st0_sop_i),                //   input,    width = 1,                       .startofpacket
          .tx_st0_eop_o                                   (p0_tx_st0_eop_i),                //   input,    width = 1,                       .endofpacket
          .tx_st0_dvalid_o                                (p0_tx_st0_dvalid_i),             //   input,    width = 1,                       .valid
          .tx_st1_payload_o                               (p0_tx_st1_data_i),               //   input,  width = 256,              p0_tx_st1.data
          .tx_st1_sop_o                                   (p0_tx_st1_sop_i),                //   input,    width = 1,                       .startofpacket
          .tx_st1_eop_o                                   (p0_tx_st1_eop_i),                //   input,    width = 1,                       .endofpacket
          .tx_st1_dvalid_o                                (p0_tx_st1_dvalid_i),             //   input,    width = 1,                       .valid
          .tx_st2_payload_o                               (p0_tx_st2_data_i),               //   input,  width = 256,              p0_tx_st2.data
          .tx_st2_sop_o                                   (p0_tx_st2_sop_i),                //   input,    width = 1,                       .startofpacket
          .tx_st2_eop_o                                   (p0_tx_st2_eop_i),                //   input,    width = 1,                       .endofpacket
          .tx_st2_dvalid_o                                (p0_tx_st2_dvalid_i),             //   input,    width = 1,                       .valid
          .tx_st3_payload_o                               (p0_tx_st3_data_i),               //   input,  width = 256,              p0_tx_st3.data
          .tx_st3_sop_o                                   (p0_tx_st3_sop_i),                //   input,    width = 1,                       .startofpacket
          .tx_st3_eop_o                                   (p0_tx_st3_eop_i),                //   input,    width = 1,                       .endofpacket
          .tx_st3_dvalid_o                                (p0_tx_st3_dvalid_i),             //   input,    width = 1,                       .valid

          // Note: Ports 0 and 1 can support eight PFs and 2048 VFs. Ports 2 and 3 do not support SR-IOV, and only support one PF.
          .rx_st0_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st0_pfnum_o     :  3'b0     ),
          .rx_st0_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st0_vfactive_o  :  '0     ),
          .rx_st0_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st0_vfnum_o     :  11'b0     ),
          .rx_st1_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st1_pfnum_o     :  3'b0     ),
          .rx_st1_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st1_vfactive_o  :  '0     ),
          .rx_st1_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st1_vfnum_o     :  11'b0     ),
          .rx_st2_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st2_pfnum_o     :  3'b0     ),
          .rx_st2_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st2_vfactive_o  :  '0     ),
          .rx_st2_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st2_vfnum_o     :  11'b0     ),
          .rx_st3_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st3_pfnum_o     :  3'b0     ),
          .rx_st3_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st3_vfactive_o  :  '0     ),
          .rx_st3_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st3_vfnum_o     :  11'b0     ),

          .rx_par_err_i                         (  p0_rx_st_par_err_o              ),
          .tx_par_err_i                         (  p0_tx_st_par_err_o              ),

          .dl_timer_update_i                    ( p0_dl_timer_update_o              ),
          .dl_up_i                              ( p0_dl_up_o                        ), // signal indicates the Data Link (DL) Layer is active
          .link_up_i                            ( p0_link_up_o                      ), // signal indicates the link is up

          .hip_reconfig_read_o                  ( p0_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p0_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p0_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p0_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p0_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p0_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p0_hip_reconfig_waitrequest_o        ),
          // Slow clock and reset for core16
          .slow_clk                             ( slow_clk                       ),
          .slow_rst_n                           ( p0_slow_reset_status_n         ),
      
          // Note: Only Ports 0 and 1 support FLR.
          .flr_rcvd_pf_i                        (  core16_flr_cap_hwtcl ? p0_flr_rcvd_pf_o : '0                                                ),
          .flr_rcvd_vf_i                        ( (core16_flr_cap_hwtcl & core16_enable_sriov_hwtcl) ? p0_flr_rcvd_vf_o : '0                   ),
          .flr_rcvd_pf_num_i                    ( (core16_flr_cap_hwtcl & core16_enable_sriov_hwtcl) ? 3'(p0_flr_rcvd_pf_num_o) : 3'b0                ),
          .flr_rcvd_vf_num_i                    ( (core16_flr_cap_hwtcl & core16_enable_sriov_hwtcl) ? 11'(p0_flr_rcvd_vf_num_o) : 11'b0               ),
          .flr_completed_pf_o                   ( p0_flr_completed_pf_i                 ),
          .flr_completed_vf_o                   ( p0_flr_completed_vf_i                 ),
          .flr_completed_pf_num_o               ( p0_flr_completed_pf_num_i             ),
          .flr_completed_vf_num_o               ( p0_flr_completed_vf_num_i             ),
          .flr_completed_ready_i                ( core16_flr_cap_hwtcl ? p0_flr_completed_ready_o : '0 ),
          .cpl_timeout_i                        ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_tag_o       : '0  ),

          // Note: Ports 0 and 1 can support eight PFs and 2048 VFs. Ports 2 and 3 do not support SR-IOV, and only support one PF.
          .cii_req_i                            ( p0_cii_req_o                         ),
          .cii_hdr_poisoned_i                   ( p0_cii_hdr_poisoned_o                ),
          .cii_hdr_first_be_i                   ( p0_cii_hdr_first_be_o                ),
          .cii_func_num_i                       ( (core16_total_pf_count_hwtcl != 1) ? p0_cii_func_num_o : 3'b0 ),
          .cii_wr_i                             ( p0_cii_wr_o                          ),
          .cii_addr_i                           ( p0_cii_addr_o                        ),
          .cii_dout_i                           ( p0_cii_dout_o                        ),
          .cii_override_en_o                    (  ), //( p0_cii_override_en_i                 ),
          .cii_override_din_o                   (  ), //( p0_cii_override_din_i                ),
          .cii_halt_o                           (  ), //( p0_cii_halt_i                        ),
          .cii_wr_vf_active_i                   ( core16_enable_sriov_hwtcl ? p0_cii_wr_vf_active_o : '0 ),
          .cii_vf_num_i                         ( core16_enable_sriov_hwtcl ? p0_cii_vf_num_o       : 11'b0 ),

          .usr_cii_req_o                        ( usr_cii_req_o                ),
          .usr_cii_hdr_poisoned_o               ( usr_cii_hdr_poisoned_o       ),
          .usr_cii_hdr_first_be_o               ( usr_cii_hdr_first_be_o       ),
          .usr_cii_func_num_o                   ( usr_cii_func_num_o           ),
          .usr_cii_wr_o                         ( usr_cii_wr_o                 ),
          .usr_cii_addr_o                       ( usr_cii_addr_o               ),
          .usr_cii_dout_o                       ( usr_cii_dout_o               ),
          .usr_cii_wr_vf_active_o               ( usr_cii_wr_vf_active_o       ),
          .usr_cii_vf_num_o                     ( usr_cii_vf_num_o             ),

          .app_err_valid_o                      ( p0_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p0_app_err_hdr_i                       ),
          .app_err_info_o                       ( p0_app_err_info_i                      ),
          .app_err_func_num_o                   ( p0_app_err_func_num_i                  ),
          .serr_i                               ( p0_serr_out_o                          ),
          .app_err_ready_i                      ( p0_app_err_ready_o                     ),

          .app_clk                              ( app_clk                         ),
          .app_rst_n                            ( app_rst_n                       ),
          .pin_perst_n                          ( pin_perst_n_o                   ),

          .hip_msi_pnd_func_o                   ( p0_msi_pnd_func_i ),
          .hip_msi_pnd_addr_o                   ( p0_msi_pnd_addr_i ),
          .hip_msi_pnd_byte_o                   ( p0_msi_pnd_byte_i ),

          .msi_req_i                        ( msi_req_i                        ),
          .msi_func_num_i                   ( msi_func_num_i                   ),
          .msi_num_i                        ( msi_num_i                        ),
          .msi_ack_o                        ( msi_ack_o                        ),
          .msi_status_o                     ( msi_status_o                     ), 

          .bam_waitrequest_i                (bam_waitrequest_i),   
          .bam_address_o                    (bam_address_o),       
          .bam_byteenable_o                 (bam_byteenable_o),    
          .bam_read_o                       (bam_read_o),          
          .bam_readdata_i                   (bam_readdata_i),      
          .bam_readdatavalid_i              (bam_readdatavalid_i), 
          .bam_write_o                      (bam_write_o),         
          .bam_writedata_o                  (bam_writedata_o),     
          .bam_burstcount_o                 (bam_burstcount_o),

          .rx_pio_address_o                 (     rx_pio_address_o             ),  
          .rx_pio_byteenable_o              (     rx_pio_byteenable_o          ),  
          .rx_pio_read_o                    (     rx_pio_read_o                ), 
          .rx_pio_write_o                   (     rx_pio_write_o               ), 
          .rx_pio_writedata_o               (     rx_pio_writedata_o           ), 
          .rx_pio_burstcount_o              (     rx_pio_burstcount_o          ), 
          .rx_pio_waitrequest_i             (     rx_pio_waitrequest_i         ), 
          .rx_pio_readdata_i                (     rx_pio_readdata_i            ), 
          .rx_pio_readdatavalid_i           (     rx_pio_readdatavalid_i       ), 
          .rx_pio_response_i                (     rx_pio_response_i            ), 
          .rx_pio_writeresponsevalid_i      (     rx_pio_writeresponsevalid_i   ), 
      
          .h2d_st_sof_0_o                   (    h2d_st_sof_0_o                ), 
          .h2d_st_eof_0_o                   (    h2d_st_eof_0_o                ), 
          .h2d_st_empty_0_o                 (    h2d_st_empty_0_o              ), 
          .h2d_st_ready_0_i                 (    h2d_st_ready_0_i              ), 
          .h2d_st_valid_0_o                 (    h2d_st_valid_0_o              ), 
          .h2d_st_data_0_o                  (    h2d_st_data_0_o               ), 
          .h2d_st_channel_0_o               (    h2d_st_channel_0_o            ), 
      
          .h2d_st_sof_1_o                   (    h2d_st_sof_1_o                ), 
          .h2d_st_eof_1_o                   (    h2d_st_eof_1_o                ), 
          .h2d_st_empty_1_o                 (    h2d_st_empty_1_o              ), 
          .h2d_st_ready_1_i                 (    h2d_st_ready_1_i              ), 
          .h2d_st_valid_1_o                 (    h2d_st_valid_1_o              ), 
          .h2d_st_data_1_o                  (    h2d_st_data_1_o               ), 
          .h2d_st_channel_1_o               (    h2d_st_channel_1_o            ), 

          .h2d_st_sof_2_o                   (    h2d_st_sof_2_o                ), 
          .h2d_st_eof_2_o                   (    h2d_st_eof_2_o                ), 
          .h2d_st_empty_2_o                 (    h2d_st_empty_2_o              ), 
          .h2d_st_ready_2_i                 (    h2d_st_ready_2_i              ), 
          .h2d_st_valid_2_o                 (    h2d_st_valid_2_o              ), 
          .h2d_st_data_2_o                  (    h2d_st_data_2_o               ), 
          .h2d_st_channel_2_o               (    h2d_st_channel_2_o            ), 

          .h2d_st_sof_3_o                   (    h2d_st_sof_3_o                ), 
          .h2d_st_eof_3_o                   (    h2d_st_eof_3_o                ), 
          .h2d_st_empty_3_o                 (    h2d_st_empty_3_o              ), 
          .h2d_st_ready_3_i                 (    h2d_st_ready_3_i              ), 
          .h2d_st_valid_3_o                 (    h2d_st_valid_3_o              ), 
          .h2d_st_data_3_o                  (    h2d_st_data_3_o               ), 
          .h2d_st_channel_3_o               (    h2d_st_channel_3_o            ), 
      
          .h2ddm_waitrequest_i              (    h2ddm_waitrequest_i           ), 
          .h2ddm_writeresponsevalid_i       (    h2ddm_writeresponsevalid_i    ), 
          .h2ddm_write_o                    (    h2ddm_write_o                 ), 
          .h2ddm_address_o                  (    h2ddm_address_o               ), 
          .h2ddm_burstcount_o               (    h2ddm_burstcount_o            ), 
          .h2ddm_byteenable_o               (    h2ddm_byteenable_o            ), 
          .h2ddm_writedata_o                (    h2ddm_writedata_o             ), 
      
          .d2h_st_sof_0_i                   (    d2h_st_sof_0_i                ), 
          .d2h_st_eof_0_i                   (    d2h_st_eof_0_i                ), 
          .d2h_st_empty_0_i                 (    d2h_st_empty_0_i              ), 
          .d2h_st_channel_0_i               (    d2h_st_channel_0_i            ), 
          .d2h_st_valid_0_i                 (    d2h_st_valid_0_i              ), 
          .d2h_st_data_0_i                  (    d2h_st_data_0_i               ), 
          .d2h_st_ready_0_o                 (    d2h_st_ready_0_o              ), 
      
          .d2h_st_sof_1_i                   (    d2h_st_sof_1_i                ), 
          .d2h_st_eof_1_i                   (    d2h_st_eof_1_i                ), 
          .d2h_st_empty_1_i                 (    d2h_st_empty_1_i              ), 
          .d2h_st_channel_1_i               (    d2h_st_channel_1_i            ), 
          .d2h_st_valid_1_i                 (    d2h_st_valid_1_i              ), 
          .d2h_st_data_1_i                  (    d2h_st_data_1_i               ), 
          .d2h_st_ready_1_o                 (    d2h_st_ready_1_o              ), 
      
          .d2h_st_sof_2_i                   (    d2h_st_sof_2_i                ), 
          .d2h_st_eof_2_i                   (    d2h_st_eof_2_i                ), 
          .d2h_st_empty_2_i                 (    d2h_st_empty_2_i              ), 
          .d2h_st_channel_2_i               (    d2h_st_channel_2_i            ), 
          .d2h_st_valid_2_i                 (    d2h_st_valid_2_i              ), 
          .d2h_st_data_2_i                  (    d2h_st_data_2_i               ), 
          .d2h_st_ready_2_o                 (    d2h_st_ready_2_o              ), 
      
          .d2h_st_sof_3_i                   (    d2h_st_sof_3_i                ), 
          .d2h_st_eof_3_i                   (    d2h_st_eof_3_i                ), 
          .d2h_st_empty_3_i                 (    d2h_st_empty_3_i              ), 
          .d2h_st_channel_3_i               (    d2h_st_channel_3_i            ), 
          .d2h_st_valid_3_i                 (    d2h_st_valid_3_i              ), 
          .d2h_st_data_3_i                  (    d2h_st_data_3_i               ), 
          .d2h_st_ready_3_o                 (    d2h_st_ready_3_o              ), 
      
          .d2hdm_address_o                  (    d2hdm_address_o               ), 
          .d2hdm_byteenable_o               (    d2hdm_byteenable_o            ), 
          .d2hdm_read_o                     (    d2hdm_read_o                  ), 
          .d2hdm_burstcount_o               (    d2hdm_burstcount_o            ), 
          .d2hdm_waitrequest_i              (    d2hdm_waitrequest_i           ), 
          .d2hdm_readdata_i                 (    d2hdm_readdata_i              ), 
          .d2hdm_readdatavalid_i            (    d2hdm_readdatavalid_i         ), 
          .d2hdm_response_i                 (    d2hdm_response_i              ), 

          .h2ddm_desc_ready_o               ( h2ddm_desc_ready_o                ),
          .h2ddm_desc_valid_i               ( h2ddm_desc_valid_i                ), 
          .h2ddm_desc_data_i                ( h2ddm_desc_data_i                 ), // h2d_desc_bypass_t

          .h2ddm_desc_status_data_o         ( h2ddm_desc_status_data_o          ), // h2d_desc_status_t
          .h2ddm_desc_status_valid_o        ( h2ddm_desc_status_valid_o         ),

          .h2ddm_desc_cmpl_data_o           ( h2ddm_desc_cmpl_data_o            ), // h2d_desc_cmpl_t
          .h2ddm_desc_cmpl_empty_o          ( h2ddm_desc_cmpl_empty_o           ), 
          .h2ddm_desc_cmpl_sop_o            ( h2ddm_desc_cmpl_sop_o             ), 
          .h2ddm_desc_cmpl_eop_o            ( h2ddm_desc_cmpl_eop_o             ), 
          .h2ddm_desc_cmpl_valid_o          ( h2ddm_desc_cmpl_valid_o           ), 
          .h2ddm_desc_cmpl_ready_i          ( h2ddm_desc_cmpl_ready_i           ),

          .d2hdm_desc_ready_o               ( d2hdm_desc_ready_o                ), 
          .d2hdm_desc_valid_i               ( d2hdm_desc_valid_i                ), 
          .d2hdm_desc_data_i                ( d2hdm_desc_data_i                 ), // d2h_desc_bypass_t

          .d2hdm_desc_status_data_o         ( d2hdm_desc_status_data_o          ), // d2h_desc_status_t
          .d2hdm_desc_status_valid_o        ( d2hdm_desc_status_valid_o         ),

          .usr_event_msix_valid_i           (    usr_event_msix_valid_i        ), 
          .usr_event_msix_ready_o           (    usr_event_msix_ready_o        ), 
          .usr_event_msix_data_i            (    usr_event_msix_data_i         ), 
      
          .usr_flr_rcvd_val_o               (    usr_flr_rcvd_val_o            ), 
          .usr_flr_rcvd_chan_num_o          (    usr_flr_rcvd_chan_num_o       ), 
          .usr_flr_completed_i              (    usr_flr_completed_i           ), 
      
          .bas_vfactive_i                   (    bas_vfactive_i                ), 
          .bas_pfnum_i                      (    bas_pfnum_i                   ), 
          .bas_vfnum_i                      (    bas_vfnum_i                   ), 
          .bas_address_i                    (    bas_address_i                 ), 
          .bas_byteenable_i                 (    bas_byteenable_i              ), 
          .bas_read_i                       (    bas_read_i                    ), 
          .bas_write_i                      (    bas_write_i                   ), 
          .bas_writedata_i                  (    bas_writedata_i               ), 
          .bas_burstcount_i                 (    bas_burstcount_i              ), 
          .bas_waitrequest_o                (    bas_waitrequest_o             ), 
          .bas_readdata_o                   (    bas_readdata_o                ), 
          .bas_readdatavalid_o              (    bas_readdatavalid_o           ), 
          .bas_response_o                   (    bas_response_o                ), 

      
          .usr_hip_reconfig_address_i       (    usr_hip_reconfig_address_i    ), 
          .usr_hip_reconfig_read_i          (    usr_hip_reconfig_read_i       ), 
          .usr_hip_reconfig_write_i         (    usr_hip_reconfig_write_i      ), 
          .usr_hip_reconfig_writedata_i     (    usr_hip_reconfig_writedata_i  ), 
          .usr_hip_reconfig_readdata_o      (    usr_hip_reconfig_readdata_o   ), 
          .usr_hip_reconfig_readdatavalid_o ( usr_hip_reconfig_readdatavalid_o ), 
          .usr_hip_reconfig_waitrequest_o   ( usr_hip_reconfig_waitrequest_o   ), 
      
          .cs_waitrequest_o                 (    cs_waitrequest_o              ), 
          .cs_address_i                     (    cs_address_i                  ), 
          .cs_byteenable_i                  (    cs_byteenable_i               ), 
          .cs_read_i                        (    cs_read_i                     ), 
          .cs_readdata_o                    (    cs_readdata_o                 ), 
          .cs_readdatavalid_o               (    cs_readdatavalid_o            ), 
          .cs_write_i                       (    cs_write_i                    ), 
          .cs_writedata_i                   (    cs_writedata_i                ), 
          .cs_response_o                    (    cs_response_o                 ), 
          .cs_writeresponsevalid_o          (    cs_writeresponsevalid_o       ) 
          );
     assign usr_hip_reconfig_rst_n_o   = p0_slow_reset_status_n;
     assign usr_hip_reconfig_clk_o     = slow_clk;


   // R-Tile HIP avst interface
   assign p0_rx_st_par_err_o = '0;      //
   assign p0_tx_st_par_err_o = '0;      //
   assign p1_rx_st_par_err_o = '0;      //
   assign p1_tx_st_par_err_o = '0;      //
   assign p0_rx_st2_bar_o = '0;      //
   assign p0_rx_st2_pfnum_o = '0;      //
   assign p0_rx_st2_vfactive_o = '0;      //
   assign p0_rx_st2_vfnum_o = '0;      //
   assign p0_rx_st2_eop_o = '0;      // 
   assign p0_rx_st2_hdr_o = '0;   // 
   assign p0_rx_st2_data_o = '0;  // 
   assign p0_rx_st2_sop_o = '0;      // 
   assign p0_rx_st2_hvalid_o = '0;    //
   assign p0_rx_st2_dvalid_o = '0;    //
   assign p0_rx_st2_pvalid_o = '0;    //
   assign p0_rx_st2_empty_o = '0;    // 
   assign p0_rx_st2_prefix_o = '0; // 
   assign p0_rx_st2_pt_parity_o = '0;
   // R-Tile HIP avst interface
   assign p0_rx_st3_bar_o = '0;      //
   assign p0_rx_st3_pfnum_o = '0;      //
   assign p0_rx_st3_vfactive_o = '0;      //
   assign p0_rx_st3_vfnum_o = '0;      //
   assign p0_rx_st3_eop_o = '0;      // 
   assign p0_rx_st3_hdr_o = '0;   // 
   assign p0_rx_st3_data_o = '0;  // 
   assign p0_rx_st3_sop_o = '0;      // 
   assign p0_rx_st3_hvalid_o = '0;    //
   assign p0_rx_st3_dvalid_o = '0;    //
   assign p0_rx_st3_pvalid_o = '0;    //
   assign p0_rx_st3_empty_o = '0;    // 
   assign p0_rx_st3_prefix_o = '0; // 
   assign p0_rx_st3_pt_parity_o = '0;


   assign p1_app_slow_reset_status_n = p1_slow_reset_status_n;

   intel_pcie_mcdma_rtile_wrapper #(
                                    .total_pf_count_width_hwtcl                     (m1_total_pf_count_width_hwtcl                   ),    
                                    .total_vf_count_width_hwtcl                     (m1_total_vf_count_width_hwtcl                   ),
                                    .total_vf_count_hwtcl                           (m1_total_vf_count_hwtcl                         ),
                                    .total_pf_count_hwtcl                           (m1_total_pf_count_hwtcl                         ),
                                    .payload_width_integer_hwtcl                    (m1_payload_width_integer_hwtcl                  ),
                                    .hdr_width_integer_hwtcl                        (m1_hdr_width_integer_hwtcl                      ),
                                    .pfx_width_integer_hwtcl                        (m1_pfx_width_integer_hwtcl                      ),
                                    .device_family                                  (device_family                                ),
                                    .maxpayload_size_hwtcl                          (m1_maxpayload_size_hwtcl                        ),
                                    .seg_num_hwtcl                                  (m1_seg_num_hwtcl                                ),
                                    .seg_width_hwtcl                                (m1_seg_width_hwtcl                              ),
                                    .single_width_integer_hwtcl                     (m1_single_width_integer_hwtcl                   ),
                                    .data_width_hwtcl                               (data_width_hwtcl                             ),
                                    .address_width_hwtcl                            (m1_address_width_hwtcl                          ),
                                    .empty_width_hwtcl                              (m1_empty_width_hwtcl                            ),
                                    .burst_width_hwtcl                              (m1_burst_width_hwtcl                            ),
                                    .pfnum_hwtcl                                    (m1_pfnum_hwtcl                                  ),
                                    .pfnum_width_hwtcl                              (m1_pfnum_width_hwtcl                            ),
                                    .vfnum_width_hwtcl                              (m1_vfnum_width_hwtcl                            ),
                                    .pio_address_width_hwtcl                        (m1_pio_address_width_hwtcl                      ),
                                    .cs_address_width_hwtcl                         (m1_cs_address_width_hwtcl                       ),
                                    .att_en_for_bas_cs_hwtcl                        (m1_att_en_for_bas_cs_hwtcl                      ),  
                                    .mapping_table_address_width_hwtcl              (m1_mapping_table_address_width_hwtcl            ), 
                                    .mapping_window_address_width_hwtcl             (m1_mapping_window_address_width_hwtcl           ),
                                    .msi_enable_hwtcl                               (m1_msi_enable_hwtcl                             ),
                                    .per_vec_mask_capable_hwtcl                     (m1_per_vec_mask_capable_hwtcl                   ),
                                    .addr_64bit_capable_hwtcl                       (m1_addr_64bit_capable_hwtcl                     ),
                                    .multi_msg_capable_hwtcl                        (m1_multi_msg_capable_hwtcl                      ),
                                    .ext_msg_data_capable_hwtcl                     (m1_ext_msg_data_capable_hwtcl                   ), 
                                    .pio_data_width_hwtcl                           (m1_pio_data_width_hwtcl                         ),
                                    .uport_type_h2d_hwtcl                           (m1_uport_type_h2d_hwtcl                         ),
                                    .uport_type_d2h_hwtcl                           (m1_uport_type_d2h_hwtcl                         ),
                                    .tile_hwtcl                                     (tile_hwtcl                                      ),
                                    .core_index_hwtcl                               (1                                               ),
                                    .enable_cpl_timeout_hwtcl                       (core8_enable_cpl_timeout_hwtcl                  ),
                                    .pf0_enable_sriov_hwtcl                         (m1_pf0_enable_sriov_hwtcl                       ),
                                    .pf1_enable_sriov_hwtcl                         (m1_pf1_enable_sriov_hwtcl                       ),
                                    .pf2_enable_sriov_hwtcl                         (m1_pf2_enable_sriov_hwtcl                       ),
                                    .pf3_enable_sriov_hwtcl                         (m1_pf3_enable_sriov_hwtcl                       ),
                                    .pf4_enable_sriov_hwtcl                         (m1_pf4_enable_sriov_hwtcl                       ),
                                    .pf5_enable_sriov_hwtcl                         (m1_pf5_enable_sriov_hwtcl                       ),
                                    .pf6_enable_sriov_hwtcl                         (m1_pf6_enable_sriov_hwtcl                       ),
                                    .pf7_enable_sriov_hwtcl                         (m1_pf7_enable_sriov_hwtcl                       ),
                                    .pf0_num_vf_per_pf_hwtcl                        (m1_pf0_num_vf_per_pf_hwtcl                      ),
                                    .pf1_num_vf_per_pf_hwtcl                        (m1_pf1_num_vf_per_pf_hwtcl                      ),
                                    .pf2_num_vf_per_pf_hwtcl                        (m1_pf2_num_vf_per_pf_hwtcl                      ),
                                    .pf3_num_vf_per_pf_hwtcl                        (m1_pf3_num_vf_per_pf_hwtcl                      ),
                                    .pf4_num_vf_per_pf_hwtcl                        (m1_pf4_num_vf_per_pf_hwtcl                      ),
                                    .pf5_num_vf_per_pf_hwtcl                        (m1_pf5_num_vf_per_pf_hwtcl                      ),
                                    .pf6_num_vf_per_pf_hwtcl                        (m1_pf6_num_vf_per_pf_hwtcl                      ),
                                    .pf7_num_vf_per_pf_hwtcl                        (m1_pf7_num_vf_per_pf_hwtcl                      ),
                                    .pf0_num_dma_chan_pf_hwtcl                      (m1_pf0_num_dma_chan_pf_hwtcl                    ),
                                    .pf1_num_dma_chan_pf_hwtcl                      (m1_pf1_num_dma_chan_pf_hwtcl                    ),
                                    .pf2_num_dma_chan_pf_hwtcl                      (m1_pf2_num_dma_chan_pf_hwtcl                    ),
                                    .pf3_num_dma_chan_pf_hwtcl                      (m1_pf3_num_dma_chan_pf_hwtcl                    ),
                                    .pf4_num_dma_chan_pf_hwtcl                      (m1_pf4_num_dma_chan_pf_hwtcl                    ),
                                    .pf5_num_dma_chan_pf_hwtcl                      (m1_pf5_num_dma_chan_pf_hwtcl                    ),
                                    .pf6_num_dma_chan_pf_hwtcl                      (m1_pf6_num_dma_chan_pf_hwtcl                    ),
                                    .pf7_num_dma_chan_pf_hwtcl                      (m1_pf7_num_dma_chan_pf_hwtcl                    ),
                                    .pf0_num_dma_chan_per_vf_hwtcl                  (m1_pf0_num_dma_chan_per_vf_hwtcl                ),
                                    .pf1_num_dma_chan_per_vf_hwtcl                  (m1_pf1_num_dma_chan_per_vf_hwtcl                ),
                                    .pf2_num_dma_chan_per_vf_hwtcl                  (m1_pf2_num_dma_chan_per_vf_hwtcl                ),
                                    .pf3_num_dma_chan_per_vf_hwtcl                  (m1_pf3_num_dma_chan_per_vf_hwtcl                ),
                                    .pf4_num_dma_chan_per_vf_hwtcl                  (m1_pf4_num_dma_chan_per_vf_hwtcl                ),
                                    .pf5_num_dma_chan_per_vf_hwtcl                  (m1_pf5_num_dma_chan_per_vf_hwtcl                ),
                                    .pf6_num_dma_chan_per_vf_hwtcl                  (m1_pf6_num_dma_chan_per_vf_hwtcl                ),
                                    .pf7_num_dma_chan_per_vf_hwtcl                  (m1_pf7_num_dma_chan_per_vf_hwtcl                ),
                                    .enable_user_msix_hwtcl                         (m1_enable_user_msix_hwtcl                       ),
                                    .enable_user_flr_hwtcl                          (m1_enable_user_flr_hwtcl                        ),
                                    .num_h2d_uport_hwtcl                            (m1_num_h2d_uport_hwtcl                          ),
                                    .num_d2h_uport_hwtcl                            (m1_num_d2h_uport_hwtcl                          ),
                                    .d2h_num_active_channel_hwtcl                   (m1_d2h_num_active_channel_hwtcl                 ),
                                    .d2h_max_num_desc_fetch_hwtcl                   (m1_d2h_max_num_desc_fetch_hwtcl                 ),
                                    .en_metadata_8_hwtcl                            (m1_en_metadata_8_hwtcl                          ),
                                    .en_10bit_tag_hwtcl                             (1), // 10-bit Tag Support (Maximum of 512 outstanding tags (x8/x4) at any given time, for all functions combined)
                                    .enable_32bit_address_hwtcl                     (m1_enable_32bit_address_hwtcl                   ),
                                    .pio_bar2_size_per_f_hwtcl                      (m1_pio_bar2_size_per_f_hwtcl                    ),
                                    .enable_bursting_master_hwtcl                   (m1_enable_bursting_master_hwtcl                 ),
                                    .enable_bursting_slave_hwtcl                    (m1_enable_bursting_slave_hwtcl                  ),
                                    .enable_mcdma_hwtcl                             (m1_enable_mcdma_hwtcl                           ),
                                    .enable_byte_aligned_txfr_hwtcl                 (m1_enable_byte_aligned_txfr_hwtcl               ),
                                    .enable_data_mover_hwtcl                        (m1_enable_data_mover_hwtcl                      ),
                                    .pfcnt_w_hwtcl                                  (m1_pfcnt_w_hwtcl                                ),
                                    .vfcnt_w_hwtcl                                  (m1_vfcnt_w_hwtcl                                ),
                                    .bas_address_width_hwtcl                        (m1_bas_address_width_hwtcl                      ),
                                    .max_bar_address_width_hwtcl                    (m1_max_bar_address_width_hwtcl                  ),
                                    .enable_cs_hwtcl                                (m1_enable_cs_hwtcl                              ),
                                    .enable_cii_hwtcl                               (core8_enable_cii_hwtcl                          ),
                                    .core16_pf0_bar0_address_width_hwtcl            (m1_pf0_bar0_address_width_hwtcl          ),
                                    .core16_pf0_bar1_address_width_hwtcl            (m1_pf0_bar1_address_width_hwtcl          ),
                                    .core16_pf0_bar2_address_width_hwtcl            (m1_pf0_bar2_address_width_hwtcl          ),
                                    .core16_pf0_bar3_address_width_hwtcl            (m1_pf0_bar3_address_width_hwtcl          ),
                                    .core16_pf0_bar4_address_width_hwtcl            (m1_pf0_bar4_address_width_hwtcl          ),
                                    .core16_pf0_bar5_address_width_hwtcl            (m1_pf0_bar5_address_width_hwtcl          ),
                                    .core16_pf1_bar0_address_width_hwtcl            (m1_pf1_bar0_address_width_hwtcl          ),
                                    .core16_pf1_bar1_address_width_hwtcl            (m1_pf1_bar1_address_width_hwtcl          ),
                                    .core16_pf1_bar2_address_width_hwtcl            (m1_pf1_bar2_address_width_hwtcl          ),
                                    .core16_pf1_bar3_address_width_hwtcl            (m1_pf1_bar3_address_width_hwtcl          ),
                                    .core16_pf1_bar4_address_width_hwtcl            (m1_pf1_bar4_address_width_hwtcl          ),
                                    .core16_pf1_bar5_address_width_hwtcl            (m1_pf1_bar5_address_width_hwtcl          ),
                                    .core16_pf2_bar0_address_width_hwtcl            (m1_pf2_bar0_address_width_hwtcl          ),
                                    .core16_pf2_bar1_address_width_hwtcl            (m1_pf2_bar1_address_width_hwtcl          ),
                                    .core16_pf2_bar2_address_width_hwtcl            (m1_pf2_bar2_address_width_hwtcl          ),
                                    .core16_pf2_bar3_address_width_hwtcl            (m1_pf2_bar3_address_width_hwtcl          ),
                                    .core16_pf2_bar4_address_width_hwtcl            (m1_pf2_bar4_address_width_hwtcl          ),
                                    .core16_pf2_bar5_address_width_hwtcl            (m1_pf2_bar5_address_width_hwtcl          ),
                                    .core16_pf3_bar0_address_width_hwtcl            (m1_pf3_bar0_address_width_hwtcl          ),
                                    .core16_pf3_bar1_address_width_hwtcl            (m1_pf3_bar1_address_width_hwtcl          ),
                                    .core16_pf3_bar2_address_width_hwtcl            (m1_pf3_bar2_address_width_hwtcl          ),
                                    .core16_pf3_bar3_address_width_hwtcl            (m1_pf3_bar3_address_width_hwtcl          ),
                                    .core16_pf3_bar4_address_width_hwtcl            (m1_pf3_bar4_address_width_hwtcl          ),
                                    .core16_pf3_bar5_address_width_hwtcl            (m1_pf3_bar5_address_width_hwtcl          ),
                                    .core16_pf4_bar0_address_width_hwtcl            (m1_pf4_bar0_address_width_hwtcl          ),
                                    .core16_pf4_bar1_address_width_hwtcl            (m1_pf4_bar1_address_width_hwtcl          ),
                                    .core16_pf4_bar2_address_width_hwtcl            (m1_pf4_bar2_address_width_hwtcl          ),
                                    .core16_pf4_bar3_address_width_hwtcl            (m1_pf4_bar3_address_width_hwtcl          ),
                                    .core16_pf4_bar4_address_width_hwtcl            (m1_pf4_bar4_address_width_hwtcl          ),
                                    .core16_pf4_bar5_address_width_hwtcl            (m1_pf4_bar5_address_width_hwtcl          ),
                                    .core16_pf5_bar0_address_width_hwtcl            (m1_pf5_bar0_address_width_hwtcl          ),
                                    .core16_pf5_bar1_address_width_hwtcl            (m1_pf5_bar1_address_width_hwtcl          ),
                                    .core16_pf5_bar2_address_width_hwtcl            (m1_pf5_bar2_address_width_hwtcl          ),
                                    .core16_pf5_bar3_address_width_hwtcl            (m1_pf5_bar3_address_width_hwtcl          ),
                                    .core16_pf5_bar4_address_width_hwtcl            (m1_pf5_bar4_address_width_hwtcl          ),
                                    .core16_pf5_bar5_address_width_hwtcl            (m1_pf5_bar5_address_width_hwtcl          ),
                                    .core16_pf6_bar0_address_width_hwtcl            (m1_pf6_bar0_address_width_hwtcl          ),
                                    .core16_pf6_bar1_address_width_hwtcl            (m1_pf6_bar1_address_width_hwtcl          ),
                                    .core16_pf6_bar2_address_width_hwtcl            (m1_pf6_bar2_address_width_hwtcl          ),
                                    .core16_pf6_bar3_address_width_hwtcl            (m1_pf6_bar3_address_width_hwtcl          ),
                                    .core16_pf6_bar4_address_width_hwtcl            (m1_pf6_bar4_address_width_hwtcl          ),
                                    .core16_pf6_bar5_address_width_hwtcl            (m1_pf6_bar5_address_width_hwtcl          ),
                                    .core16_pf7_bar0_address_width_hwtcl            (m1_pf7_bar0_address_width_hwtcl          ),
                                    .core16_pf7_bar2_address_width_hwtcl            (m1_pf7_bar2_address_width_hwtcl          ),
                                    .core16_pf7_bar3_address_width_hwtcl            (m1_pf7_bar3_address_width_hwtcl          ),
                                    .core16_pf7_bar4_address_width_hwtcl            (m1_pf7_bar4_address_width_hwtcl          ),
                                    .core16_pf7_bar5_address_width_hwtcl            (m1_pf7_bar5_address_width_hwtcl          ),
                                    .core16_pf7_bar1_address_width_hwtcl            (m1_pf7_bar1_address_width_hwtcl          ),
                                    .core16_pf0_sriov_vf_bar0_address_width_hwtcl   (m1_pf0_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar1_address_width_hwtcl   (m1_pf0_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar2_address_width_hwtcl   (m1_pf0_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar3_address_width_hwtcl   (m1_pf0_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar4_address_width_hwtcl   (m1_pf0_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf0_sriov_vf_bar5_address_width_hwtcl   (m1_pf0_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar0_address_width_hwtcl   (m1_pf1_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar1_address_width_hwtcl   (m1_pf1_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar2_address_width_hwtcl   (m1_pf1_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar3_address_width_hwtcl   (m1_pf1_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar4_address_width_hwtcl   (m1_pf1_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf1_sriov_vf_bar5_address_width_hwtcl   (m1_pf1_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar0_address_width_hwtcl   (m1_pf2_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar1_address_width_hwtcl   (m1_pf2_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar2_address_width_hwtcl   (m1_pf2_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar3_address_width_hwtcl   (m1_pf2_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar4_address_width_hwtcl   (m1_pf2_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf2_sriov_vf_bar5_address_width_hwtcl   (m1_pf2_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar0_address_width_hwtcl   (m1_pf3_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar1_address_width_hwtcl   (m1_pf3_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar2_address_width_hwtcl   (m1_pf3_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar3_address_width_hwtcl   (m1_pf3_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar4_address_width_hwtcl   (m1_pf3_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf3_sriov_vf_bar5_address_width_hwtcl   (m1_pf3_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar0_address_width_hwtcl   (m1_pf4_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar1_address_width_hwtcl   (m1_pf4_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar2_address_width_hwtcl   (m1_pf4_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar3_address_width_hwtcl   (m1_pf4_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar4_address_width_hwtcl   (m1_pf4_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf4_sriov_vf_bar5_address_width_hwtcl   (m1_pf4_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar0_address_width_hwtcl   (m1_pf5_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar1_address_width_hwtcl   (m1_pf5_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar2_address_width_hwtcl   (m1_pf5_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar3_address_width_hwtcl   (m1_pf5_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar4_address_width_hwtcl   (m1_pf5_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf5_sriov_vf_bar5_address_width_hwtcl   (m1_pf5_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar0_address_width_hwtcl   (m1_pf6_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar1_address_width_hwtcl   (m1_pf6_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar2_address_width_hwtcl   (m1_pf6_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar3_address_width_hwtcl   (m1_pf6_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar4_address_width_hwtcl   (m1_pf6_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf6_sriov_vf_bar5_address_width_hwtcl   (m1_pf6_sriov_vf_bar5_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar0_address_width_hwtcl   (m1_pf7_sriov_vf_bar0_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar1_address_width_hwtcl   (m1_pf7_sriov_vf_bar1_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar2_address_width_hwtcl   (m1_pf7_sriov_vf_bar2_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar3_address_width_hwtcl   (m1_pf7_sriov_vf_bar3_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar4_address_width_hwtcl   (m1_pf7_sriov_vf_bar4_address_width_hwtcl ),
                                    .core16_pf7_sriov_vf_bar5_address_width_hwtcl   (m1_pf7_sriov_vf_bar5_address_width_hwtcl )
      
                                    ) 
   mcdma1 (
          .clk                                            (coreclkout_hip        ),
          .rst_n                                          (p1_reset_status_n     ),

          .rx_st_ready_o                                  (p1_rx_st_ready_i),               //   input,    width = 1,              p0_rx_st0.ready
          .rx_st0_payload_i                               (p1_rx_st0_data_o),               //  output,  width = 256,                       .data
          .rx_st0_sop_i                                   (p1_rx_st0_sop_o),                //  output,    width = 1,                       .startofpacket
          .rx_st0_eop_i                                   (p1_rx_st0_eop_o),                //  output,    width = 1,                       .endofpacket
          .rx_st0_dvalid_i                                (p1_rx_st0_dvalid_o),             //  output,    width = 1,                       .valid
          .rx_st0_empty_i                                 (p1_rx_st0_empty_o),              //  output,    width = 3,                       .empty
          .rx_st0_header_i                                (p1_rx_st0_hdr_o),                //  output,  width = 128,          p0_rx_st_misc.rx_st0_hdr
          .rx_st0_tlp_prfx_i                              (p1_rx_st0_prefix_o),             //  output,   width = 32,                       .rx_st0_prefix
          .rx_st0_hvalid_i                                (p1_rx_st0_hvalid_o),             //  output,    width = 1,                       .rx_st0_hvalid
          .rx_st0_pvalid_i                                (p1_rx_st0_pvalid_o),             //  output,    width = 1,                       .rx_st0_pvalid
          .rx_st0_bar_i                                   (p1_rx_st0_bar_o),                //  output,    width = 3,                       .rx_st0_bar
          .rx_st1_header_i                                (p1_rx_st1_hdr_o),                //  output,  width = 128,                       .rx_st1_hdr
          .rx_st1_tlp_prfx_i                              (p1_rx_st1_prefix_o),             //  output,   width = 32,                       .rx_st1_prefix
          .rx_st1_hvalid_i                                (p1_rx_st1_hvalid_o),             //  output,    width = 1,                       .rx_st1_hvalid
          .rx_st1_pvalid_i                                (p1_rx_st1_pvalid_o),             //  output,    width = 1,                       .rx_st1_pvalid
          .rx_st1_bar_i                                   (p1_rx_st1_bar_o),                //  output,    width = 3,                       .rx_st1_bar
          .rx_st2_header_i                                ('0   ),                          //  output,  width = 128,                       .rx_st2_hdr
          .rx_st2_tlp_prfx_i                              ('0   ),                          //  output,   width = 32,                       .rx_st2_prefix
          .rx_st2_hvalid_i                                ('0   ),                          //  output,    width = 1,                       .rx_st2_hvalid
          .rx_st2_pvalid_i                                ('0   ),                          //  output,    width = 1,                       .rx_st2_pvalid
          .rx_st2_bar_i                                   ('0   ),                          //  output,    width = 3,                       .rx_st2_bar
          .rx_st3_header_i                                ('0   ),                          //  output,  width = 128,                       .rx_st3_hdr
          .rx_st3_tlp_prfx_i                              ('0   ),                          //  output,   width = 32,                       .rx_st3_prefix
          .rx_st3_hvalid_i                                ('0   ),                          //  output,    width = 1,                       .rx_st3_hvalid
          .rx_st3_pvalid_i                                ('0   ),                          //  output,    width = 1,                       .rx_st3_pvalid
          .rx_st3_bar_i                                   ('0   ),                          //  output,    width = 3,                       .rx_st3_bar
          .rx_st_hcrdt_init_o                             (p1_rx_st_hcrdt_init_i),          //   input,    width = 3,                       .rx_st_Hcrdt_init
          .rx_st_hcrdt_update_o                           (p1_rx_st_hcrdt_update_i),        //   input,    width = 3,                       .rx_st_Hcrdt_update
          .rx_st_hcrdt_update_cnt_o                       (p1_rx_st_hcrdt_update_cnt_i),    //   input,    width = 6,                       .rx_st_Hcrdt_update_cnt
          .rx_st_hcrdt_init_ack_i                         (p1_rx_st_hcrdt_init_ack_o),      //  output,    width = 3,                       .rx_st_Hcrdt_init_ack
          .rx_st_dcrdt_init_o                             (p1_rx_st_dcrdt_init_i),          //   input,    width = 3,                       .rx_st_Dcrdt_init
          .rx_st_dcrdt_update_o                           (p1_rx_st_dcrdt_update_i),        //   input,    width = 3,                       .rx_st_Dcrdt_update
          .rx_st_dcrdt_update_cnt_o                       (p1_rx_st_dcrdt_update_cnt_i),    //   input,   width = 12,                       .rx_st_Dcrdt_update_cnt
          .rx_st_dcrdt_init_ack_i                         (p1_rx_st_dcrdt_init_ack_o),      //  output,    width = 3,                       .rx_st_Dcrdt_init_ack
          .rx_st1_payload_i                               (p1_rx_st1_data_o),               //  output,  width = 256,              p0_rx_st1.data
          .rx_st1_sop_i                                   (p1_rx_st1_sop_o),                //  output,    width = 1,                       .startofpacket
          .rx_st1_eop_i                                   (p1_rx_st1_eop_o),                //  output,    width = 1,                       .endofpacket
          .rx_st1_dvalid_i                                (p1_rx_st1_dvalid_o),             //  output,    width = 1,                       .valid
          .rx_st1_empty_i                                 (p1_rx_st1_empty_o),              //  output,    width = 3,                       .empty
          .rx_st2_payload_i                               ('0  ),                           //  output,  width = 256,              p0_rx_st2.data
          .rx_st2_sop_i                                   ('0  ),                           //  output,    width = 1,                       .startofpacket
          .rx_st2_eop_i                                   ('0  ),                           //  output,    width = 1,                       .endofpacket
          .rx_st2_dvalid_i                                ('0  ),                           //  output,    width = 1,                       .valid
          .rx_st2_empty_i                                 ('0  ),                           //  output,    width = 3,                       .empty
          .rx_st3_payload_i                               ('0  ),                           //  output,  width = 256,              p0_rx_st3.data
          .rx_st3_sop_i                                   ('0  ),                           //  output,    width = 1,                       .startofpacket
          .rx_st3_eop_i                                   ('0  ),                           //  output,    width = 1,                       .endofpacket
          .rx_st3_dvalid_i                                ('0  ),                           //  output,    width = 1,                       .valid
          .rx_st3_empty_i                                 ('0  ),                           //  output,    width = 3,                       .empty
          .tx_st_hcrdt_init_i                             (p1_tx_st_hcrdt_init_o),          //  output,    width = 3,          p0_tx_st_misc.tx_st_Hcrdt_init
          .tx_st_hcrdt_update_i                           (p1_tx_st_hcrdt_update_o),        //  output,    width = 3,                       .tx_st_Hcrdt_update
          .tx_st_hcrdt_update_cnt_i                       (p1_tx_st_hcrdt_update_cnt_o),    //  output,    width = 6,                       .tx_st_Hcrdt_update_cnt
          .tx_st_hcrdt_init_ack_o                         (p1_tx_st_hcrdt_init_ack_i),      //   input,    width = 3,                       .tx_st_Hcrdtt_init_ack
          .tx_st_dcrdt_init_i                             (p1_tx_st_dcrdt_init_o),          //  output,    width = 3,                       .tx_st_Dcrdt_init
          .tx_st_dcrdt_update_i                           (p1_tx_st_dcrdt_update_o),        //  output,    width = 3,                       .tx_st_Dcrdt_update
          .tx_st_dcrdt_update_cnt_i                       (p1_tx_st_dcrdt_update_cnt_o),    //  output,   width = 12,                       .tx_st_Dcrdt_update_cnt
          .tx_st_dcrdt_init_ack_o                         (p1_tx_st_dcrdt_init_ack_i),      //   input,    width = 3,                       .tx_st_Dcrdt_init_ack
          .tx_st0_header_o                                (p1_tx_st0_hdr_i),                //   input,  width = 128,                       .tx_st0_hdr
          .tx_st0_prefix_o                                (p1_tx_st0_prefix_i),             //   input,   width = 32,                       .tx_st0_prefix
          .tx_st0_hvalid_o                                (p1_tx_st0_hvalid_i),             //   input,    width = 1,                       .tx_st0_hvalid
          .tx_st0_pvalid_o                                (p1_tx_st0_pvalid_i),             //   input,    width = 1,                       .tx_st0_pvalid
          .tx_st1_header_o                                (p1_tx_st1_hdr_i),                //   input,  width = 128,                       .tx_st1_hdr
          .tx_st1_prefix_o                                (p1_tx_st1_prefix_i),             //   input,   width = 32,                       .tx_st1_prefix
          .tx_st1_hvalid_o                                (p1_tx_st1_hvalid_i),             //   input,    width = 1,                       .tx_st1_hvalid
          .tx_st1_pvalid_o                                (p1_tx_st1_pvalid_i),             //   input,    width = 1,                       .tx_st1_pvalid
          .tx_st2_header_o                                (    ),                           //   input,  width = 128,                       .tx_st2_hdr
          .tx_st2_prefix_o                                (    ),                           //   input,   width = 32,                       .tx_st2_prefix
          .tx_st2_hvalid_o                                (    ),                           //   input,    width = 1,                       .tx_st2_hvalid
          .tx_st2_pvalid_o                                (    ),                           //   input,    width = 1,                       .tx_st2_pvalid
          .tx_st3_header_o                                (    ),                           //   input,  width = 128,                       .tx_st3_hdr
          .tx_st3_prefix_o                                (    ),                           //   input,   width = 32,                       .tx_st3_prefix
          .tx_st3_hvalid_o                                (    ),                           //   input,    width = 1,                       .tx_st3_hvalid
          .tx_st3_pvalid_o                                (    ),                           //   input,    width = 1,                       .tx_st3_pvalid
          .tx_st_ready_i                                  (p1_tx_st_ready_o),               //  output,    width = 1,              p0_tx_st0.ready
          .tx_st0_payload_o                               (p1_tx_st0_data_i),               //   input,  width = 256,                       .data
          .tx_st0_sop_o                                   (p1_tx_st0_sop_i),                //   input,    width = 1,                       .startofpacket
          .tx_st0_eop_o                                   (p1_tx_st0_eop_i),                //   input,    width = 1,                       .endofpacket
          .tx_st0_dvalid_o                                (p1_tx_st0_dvalid_i),             //   input,    width = 1,                       .valid
          .tx_st1_payload_o                               (p1_tx_st1_data_i),               //   input,  width = 256,              p0_tx_st1.data
          .tx_st1_sop_o                                   (p1_tx_st1_sop_i),                //   input,    width = 1,                       .startofpacket
          .tx_st1_eop_o                                   (p1_tx_st1_eop_i),                //   input,    width = 1,                       .endofpacket
          .tx_st1_dvalid_o                                (p1_tx_st1_dvalid_i),             //   input,    width = 1,                       .valid
          .tx_st2_payload_o                               (    ),                           //   input,  width = 256,              p0_tx_st2.data
          .tx_st2_sop_o                                   (    ),                           //   input,    width = 1,                       .startofpacket
          .tx_st2_eop_o                                   (    ),                           //   input,    width = 1,                       .endofpacket
          .tx_st2_dvalid_o                                (    ),                           //   input,    width = 1,                       .valid
          .tx_st3_payload_o                               (    ),                           //   input,  width = 256,              p0_tx_st3.data
          .tx_st3_sop_o                                   (    ),                           //   input,    width = 1,                       .startofpacket
          .tx_st3_eop_o                                   (    ),                           //   input,    width = 1,                       .endofpacket
          .tx_st3_dvalid_o                                (    ),                           //   input,    width = 1,                       .valid

          // Note: Ports 0 and 1 can support eight PFs and 2048 VFs. Ports 2 and 3 do not support SR-IOV, and only support one PF.
          .rx_st0_pfnum_i                       (  (core8_total_pf_count_hwtcl != 1)   ? p1_rx_st0_pfnum_o     : 3'b0  ),
          .rx_st0_vfactive_i                    (  core8_enable_sriov_hwtcl            ? p1_rx_st0_vfactive_o  : '0  ),
          .rx_st0_vfnum_i                       (  core8_enable_sriov_hwtcl            ? p1_rx_st0_vfnum_o     : 11'b0  ),
          .rx_st1_pfnum_i                       (  (core8_total_pf_count_hwtcl != 1)   ? p1_rx_st1_pfnum_o     : 3'b0  ),
          .rx_st1_vfactive_i                    (  core8_enable_sriov_hwtcl            ? p1_rx_st1_vfactive_o  : '0  ),
          .rx_st1_vfnum_i                       (  core8_enable_sriov_hwtcl            ? p1_rx_st1_vfnum_o     : 11'b0  ),
          .rx_st2_pfnum_i                       (  '0          ),
          .rx_st2_vfactive_i                    (  '0          ),
          .rx_st2_vfnum_i                       (  '0          ),
          .rx_st3_pfnum_i                       (  '0          ),
          .rx_st3_vfactive_i                    (  '0          ),
          .rx_st3_vfnum_i                       (  '0          ),

          .rx_par_err_i                         (  p1_rx_st_par_err_o          ),
          .tx_par_err_i                         (  p1_tx_st_par_err_o          ),

          .dl_timer_update_i                    ( p1_dl_timer_update_o              ),
          .dl_up_i                              ( p1_dl_up_o                        ), // signal indicates the Data Link (DL) Layer is active
          .link_up_i                            ( p1_link_up_o                      ), // signal indicates the link is up

          .hip_reconfig_read_o                  ( p1_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p1_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p1_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p1_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p1_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p1_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p1_hip_reconfig_waitrequest_o        ),
          // Slow clock and reset for core8
          .slow_clk                             ( slow_clk                       ),
          .slow_rst_n                           ( p1_slow_reset_status_n         ),
      
          // Note: Only Ports 0 and 1 support FLR.
          .flr_rcvd_pf_i                        (  core8_flr_cap_hwtcl ? p1_flr_rcvd_pf_o : '0                                               ),
          .flr_rcvd_vf_i                        ( (core8_flr_cap_hwtcl & core8_enable_sriov_hwtcl) ? p1_flr_rcvd_vf_o : '0                   ),
          .flr_rcvd_pf_num_i                    ( (core8_flr_cap_hwtcl & core8_enable_sriov_hwtcl) ? 3'(p1_flr_rcvd_pf_num_o) : 3'b0              ),
          .flr_rcvd_vf_num_i                    ( (core8_flr_cap_hwtcl & core8_enable_sriov_hwtcl) ? 11'(p1_flr_rcvd_vf_num_o) : 11'b0               ),
          .flr_completed_pf_o                   ( p1_flr_completed_pf_i                 ),
          .flr_completed_vf_o                   ( p1_flr_completed_vf_i                 ),
          .flr_completed_pf_num_o               ( p1_flr_completed_pf_num_i             ),
          .flr_completed_vf_num_o               ( p1_flr_completed_vf_num_i             ),
          .flr_completed_ready_i                ( core8_flr_cap_hwtcl ? p1_flr_completed_ready_o : '0 ),
          .cpl_timeout_i                        ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_tag_o       : '0  ),

          // Note: Ports 0 and 1 can support eight PFs and 2048 VFs. Ports 2 and 3 do not support SR-IOV, and only support one PF.
          .cii_req_i                            ( p1_cii_req_o                         ),
          .cii_hdr_poisoned_i                   ( p1_cii_hdr_poisoned_o                ),
          .cii_hdr_first_be_i                   ( p1_cii_hdr_first_be_o                ),
          .cii_func_num_i                       ( (core8_total_pf_count_hwtcl != 1) ? p1_cii_func_num_o : 3'b0 ),
          .cii_wr_i                             ( p1_cii_wr_o                          ),
          .cii_addr_i                           ( p1_cii_addr_o                        ),
          .cii_dout_i                           ( p1_cii_dout_o                        ),
          .cii_override_en_o                    (  ), //( p1_cii_override_en_i                 ),
          .cii_override_din_o                   (  ), //( p1_cii_override_din_i                ),
          .cii_halt_o                           (  ), //( p1_cii_halt_i                        ),
          .cii_wr_vf_active_i                   ( core8_enable_sriov_hwtcl ? p1_cii_wr_vf_active_o : '0 ),
          .cii_vf_num_i                         ( core8_enable_sriov_hwtcl ? p1_cii_vf_num_o       : 11'b0 ),

          .usr_cii_req_o                        ( p1_usr_cii_req_o                ),
          .usr_cii_hdr_poisoned_o               ( p1_usr_cii_hdr_poisoned_o       ),
          .usr_cii_hdr_first_be_o               ( p1_usr_cii_hdr_first_be_o       ),
          .usr_cii_func_num_o                   ( p1_usr_cii_func_num_o           ),
          .usr_cii_wr_o                         ( p1_usr_cii_wr_o                 ),
          .usr_cii_addr_o                       ( p1_usr_cii_addr_o               ),
          .usr_cii_dout_o                       ( p1_usr_cii_dout_o               ),
          .usr_cii_wr_vf_active_o               ( p1_usr_cii_wr_vf_active_o       ),
          .usr_cii_vf_num_o                     ( p1_usr_cii_vf_num_o             ),

          .app_err_valid_o                      ( p1_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p1_app_err_hdr_i                       ),
          .app_err_info_o                       ( p1_app_err_info_i                      ),
          .app_err_func_num_o                   ( p1_app_err_func_num_i                  ),
          .serr_i                               ( p1_serr_out_o                          ),
          .app_err_ready_i                      ( p1_app_err_ready_o                     ),
    
          .app_clk                              (                          ),
          .app_rst_n                            (                          ),
          .pin_perst_n                          ( pin_perst_n_o            ),

         .hip_msi_pnd_func_o                   ( p1_msi_pnd_func_i ),
         .hip_msi_pnd_addr_o                   ( p1_msi_pnd_addr_i ),
         .hip_msi_pnd_byte_o                   ( p1_msi_pnd_byte_i ),
 
         .msi_req_i                        ( p1_msi_req_i                        ),
         .msi_func_num_i                   ( p1_msi_func_num_i                   ),
         .msi_num_i                        ( p1_msi_num_i                        ),
         .msi_ack_o                        ( p1_msi_ack_o                        ),
         .msi_status_o                     ( p1_msi_status_o                     ), 

          .bam_waitrequest_i                (p1_bam_waitrequest_i),   
          .bam_address_o                    (p1_bam_address_o),       
          .bam_byteenable_o                 (p1_bam_byteenable_o),    
          .bam_read_o                       (p1_bam_read_o),          
          .bam_readdata_i                   (p1_bam_readdata_i),      
          .bam_readdatavalid_i              (p1_bam_readdatavalid_i), 
          .bam_write_o                      (p1_bam_write_o),         
          .bam_writedata_o                  (p1_bam_writedata_o),     
          .bam_burstcount_o                 (p1_bam_burstcount_o),

          .rx_pio_address_o                 (     p1_rx_pio_address_o             ),  
          .rx_pio_byteenable_o              (     p1_rx_pio_byteenable_o          ),  
          .rx_pio_read_o                    (     p1_rx_pio_read_o                ), 
          .rx_pio_write_o                   (     p1_rx_pio_write_o               ), 
          .rx_pio_writedata_o               (     p1_rx_pio_writedata_o           ), 
          .rx_pio_burstcount_o              (     p1_rx_pio_burstcount_o          ), 
          .rx_pio_waitrequest_i             (     p1_rx_pio_waitrequest_i         ), 
          .rx_pio_readdata_i                (     p1_rx_pio_readdata_i            ), 
          .rx_pio_readdatavalid_i           (     p1_rx_pio_readdatavalid_i       ), 
          .rx_pio_response_i                (     p1_rx_pio_response_i            ), 
          .rx_pio_writeresponsevalid_i      (     p1_rx_pio_writeresponsevalid_i   ), 
      
          .h2d_st_sof_0_o                   (    p1_h2d_st_sof_0_o                ), 
          .h2d_st_eof_0_o                   (    p1_h2d_st_eof_0_o                ), 
          .h2d_st_empty_0_o                 (    p1_h2d_st_empty_0_o              ), 
          .h2d_st_ready_0_i                 (    p1_h2d_st_ready_0_i              ), 
          .h2d_st_valid_0_o                 (    p1_h2d_st_valid_0_o              ), 
          .h2d_st_data_0_o                  (    p1_h2d_st_data_0_o               ), 
          .h2d_st_channel_0_o               (    p1_h2d_st_channel_0_o            ), 
      
          .h2d_st_sof_1_o                   (    p1_h2d_st_sof_1_o                ), 
          .h2d_st_eof_1_o                   (    p1_h2d_st_eof_1_o                ), 
          .h2d_st_empty_1_o                 (    p1_h2d_st_empty_1_o              ), 
          .h2d_st_ready_1_i                 (    p1_h2d_st_ready_1_i              ), 
          .h2d_st_valid_1_o                 (    p1_h2d_st_valid_1_o              ), 
          .h2d_st_data_1_o                  (    p1_h2d_st_data_1_o               ), 
          .h2d_st_channel_1_o               (    p1_h2d_st_channel_1_o            ), 

          .h2d_st_sof_2_o                   (    p1_h2d_st_sof_2_o                ), 
          .h2d_st_eof_2_o                   (    p1_h2d_st_eof_2_o                ), 
          .h2d_st_empty_2_o                 (    p1_h2d_st_empty_2_o              ), 
          .h2d_st_ready_2_i                 (    p1_h2d_st_ready_2_i              ), 
          .h2d_st_valid_2_o                 (    p1_h2d_st_valid_2_o              ), 
          .h2d_st_data_2_o                  (    p1_h2d_st_data_2_o               ), 
          .h2d_st_channel_2_o               (    p1_h2d_st_channel_2_o            ), 

          .h2d_st_sof_3_o                   (    p1_h2d_st_sof_3_o                ), 
          .h2d_st_eof_3_o                   (    p1_h2d_st_eof_3_o                ), 
          .h2d_st_empty_3_o                 (    p1_h2d_st_empty_3_o              ), 
          .h2d_st_ready_3_i                 (    p1_h2d_st_ready_3_i              ), 
          .h2d_st_valid_3_o                 (    p1_h2d_st_valid_3_o              ), 
          .h2d_st_data_3_o                  (    p1_h2d_st_data_3_o               ), 
          .h2d_st_channel_3_o               (    p1_h2d_st_channel_3_o            ), 
      
          .h2ddm_waitrequest_i              (    p1_h2ddm_waitrequest_i           ), 
          .h2ddm_writeresponsevalid_i       (    p1_h2ddm_writeresponsevalid_i    ), 
          .h2ddm_write_o                    (    p1_h2ddm_write_o                 ), 
          .h2ddm_address_o                  (    p1_h2ddm_address_o               ), 
          .h2ddm_burstcount_o               (    p1_h2ddm_burstcount_o            ), 
          .h2ddm_byteenable_o               (    p1_h2ddm_byteenable_o            ), 
          .h2ddm_writedata_o                (    p1_h2ddm_writedata_o             ), 
      
          .d2h_st_sof_0_i                   (    p1_d2h_st_sof_0_i                ), 
          .d2h_st_eof_0_i                   (    p1_d2h_st_eof_0_i                ), 
          .d2h_st_empty_0_i                 (    p1_d2h_st_empty_0_i              ), 
          .d2h_st_channel_0_i               (    p1_d2h_st_channel_0_i            ), 
          .d2h_st_valid_0_i                 (    p1_d2h_st_valid_0_i              ), 
          .d2h_st_data_0_i                  (    p1_d2h_st_data_0_i               ), 
          .d2h_st_ready_0_o                 (    p1_d2h_st_ready_0_o              ), 
      
          .d2h_st_sof_1_i                   (    p1_d2h_st_sof_1_i                ), 
          .d2h_st_eof_1_i                   (    p1_d2h_st_eof_1_i                ), 
          .d2h_st_empty_1_i                 (    p1_d2h_st_empty_1_i              ), 
          .d2h_st_channel_1_i               (    p1_d2h_st_channel_1_i            ), 
          .d2h_st_valid_1_i                 (    p1_d2h_st_valid_1_i              ), 
          .d2h_st_data_1_i                  (    p1_d2h_st_data_1_i               ), 
          .d2h_st_ready_1_o                 (    p1_d2h_st_ready_1_o              ), 
      
          .d2h_st_sof_2_i                   (    p1_d2h_st_sof_2_i                ), 
          .d2h_st_eof_2_i                   (    p1_d2h_st_eof_2_i                ), 
          .d2h_st_empty_2_i                 (    p1_d2h_st_empty_2_i              ), 
          .d2h_st_channel_2_i               (    p1_d2h_st_channel_2_i            ), 
          .d2h_st_valid_2_i                 (    p1_d2h_st_valid_2_i              ), 
          .d2h_st_data_2_i                  (    p1_d2h_st_data_2_i               ), 
          .d2h_st_ready_2_o                 (    p1_d2h_st_ready_2_o              ), 
      
          .d2h_st_sof_3_i                   (    p1_d2h_st_sof_3_i                ), 
          .d2h_st_eof_3_i                   (    p1_d2h_st_eof_3_i                ), 
          .d2h_st_empty_3_i                 (    p1_d2h_st_empty_3_i              ), 
          .d2h_st_channel_3_i               (    p1_d2h_st_channel_3_i            ), 
          .d2h_st_valid_3_i                 (    p1_d2h_st_valid_3_i              ), 
          .d2h_st_data_3_i                  (    p1_d2h_st_data_3_i               ), 
          .d2h_st_ready_3_o                 (    p1_d2h_st_ready_3_o              ), 
      
          .d2hdm_address_o                  (    p1_d2hdm_address_o               ), 
          .d2hdm_byteenable_o               (    p1_d2hdm_byteenable_o            ), 
          .d2hdm_read_o                     (    p1_d2hdm_read_o                  ), 
          .d2hdm_burstcount_o               (    p1_d2hdm_burstcount_o            ), 
          .d2hdm_waitrequest_i              (    p1_d2hdm_waitrequest_i           ), 
          .d2hdm_readdata_i                 (    p1_d2hdm_readdata_i              ), 
          .d2hdm_readdatavalid_i            (    p1_d2hdm_readdatavalid_i         ), 
          .d2hdm_response_i                 (    p1_d2hdm_response_i              ), 

          .h2ddm_desc_ready_o               ( p1_h2ddm_desc_ready_o                ),
          .h2ddm_desc_valid_i               ( p1_h2ddm_desc_valid_i                ), 
          .h2ddm_desc_data_i                ( p1_h2ddm_desc_data_i                 ), // h2d_desc_bypass_t

          .h2ddm_desc_status_data_o         ( p1_h2ddm_desc_status_data_o          ), // h2d_desc_status_t
          .h2ddm_desc_status_valid_o        ( p1_h2ddm_desc_status_valid_o         ),

          .h2ddm_desc_cmpl_data_o           ( p1_h2ddm_desc_cmpl_data_o            ), // h2d_desc_cmpl_t
          .h2ddm_desc_cmpl_empty_o          ( p1_h2ddm_desc_cmpl_empty_o           ), 
          .h2ddm_desc_cmpl_sop_o            ( p1_h2ddm_desc_cmpl_sop_o             ), 
          .h2ddm_desc_cmpl_eop_o            ( p1_h2ddm_desc_cmpl_eop_o             ), 
          .h2ddm_desc_cmpl_valid_o          ( p1_h2ddm_desc_cmpl_valid_o           ), 
          .h2ddm_desc_cmpl_ready_i          ( p1_h2ddm_desc_cmpl_ready_i           ),

          .d2hdm_desc_ready_o               ( p1_d2hdm_desc_ready_o                ), 
          .d2hdm_desc_valid_i               ( p1_d2hdm_desc_valid_i                ), 
          .d2hdm_desc_data_i                ( p1_d2hdm_desc_data_i                 ), // d2h_desc_bypass_t

          .d2hdm_desc_status_data_o         ( p1_d2hdm_desc_status_data_o          ), // d2h_desc_status_t
          .d2hdm_desc_status_valid_o        ( p1_d2hdm_desc_status_valid_o         ),

          .usr_event_msix_valid_i           (    p1_usr_event_msix_valid_i        ), 
          .usr_event_msix_ready_o           (    p1_usr_event_msix_ready_o        ), 
          .usr_event_msix_data_i            (    p1_usr_event_msix_data_i         ), 
      
          .usr_flr_rcvd_val_o               (    p1_usr_flr_rcvd_val_o            ), 
          .usr_flr_rcvd_chan_num_o          (    p1_usr_flr_rcvd_chan_num_o       ), 
          .usr_flr_completed_i              (    p1_usr_flr_completed_i           ), 
      
          .bas_vfactive_i                   (    p1_bas_vfactive_i                ), 
          .bas_pfnum_i                      (    p1_bas_pfnum_i                   ), 
          .bas_vfnum_i                      (    p1_bas_vfnum_i                   ), 
          .bas_address_i                    (    p1_bas_address_i                 ), 
          .bas_byteenable_i                 (    p1_bas_byteenable_i              ), 
          .bas_read_i                       (    p1_bas_read_i                    ), 
          .bas_write_i                      (    p1_bas_write_i                   ), 
          .bas_writedata_i                  (    p1_bas_writedata_i               ), 
          .bas_burstcount_i                 (    p1_bas_burstcount_i              ), 
          .bas_waitrequest_o                (    p1_bas_waitrequest_o             ), 
          .bas_readdata_o                   (    p1_bas_readdata_o                ), 
          .bas_readdatavalid_o              (    p1_bas_readdatavalid_o           ), 
          .bas_response_o                   (    p1_bas_response_o                ), 

      
          .usr_hip_reconfig_address_i       (    p1_usr_hip_reconfig_address_i    ), 
          .usr_hip_reconfig_read_i          (    p1_usr_hip_reconfig_read_i       ), 
          .usr_hip_reconfig_write_i         (    p1_usr_hip_reconfig_write_i      ), 
          .usr_hip_reconfig_writedata_i     (    p1_usr_hip_reconfig_writedata_i  ), 
          .usr_hip_reconfig_readdata_o      (    p1_usr_hip_reconfig_readdata_o   ), 
          .usr_hip_reconfig_readdatavalid_o ( p1_usr_hip_reconfig_readdatavalid_o ), 
          .usr_hip_reconfig_waitrequest_o   ( p1_usr_hip_reconfig_waitrequest_o   ), 
      
          .cs_waitrequest_o                 (    p1_cs_waitrequest_o              ), 
          .cs_address_i                     (    p1_cs_address_i                  ), 
          .cs_byteenable_i                  (    p1_cs_byteenable_i               ), 
          .cs_read_i                        (    p1_cs_read_i                     ), 
          .cs_readdata_o                    (    p1_cs_readdata_o                 ), 
          .cs_readdatavalid_o               (    p1_cs_readdatavalid_o            ), 
          .cs_write_i                       (    p1_cs_write_i                    ), 
          .cs_writedata_i                   (    p1_cs_writedata_i                ), 
          .cs_response_o                    (    p1_cs_response_o                 ), 
          .cs_writeresponsevalid_o          (    p1_cs_writeresponsevalid_o       ) 
          );
     assign p1_usr_hip_reconfig_rst_n_o   = p1_slow_reset_status_n;
     assign p1_usr_hip_reconfig_clk_o     = slow_clk;



//Shoaib


//Shoaib


//Shoaib
  assign app_slow_clk = slow_clk;

  platform_intel_pcie_rtile_mcdma_0_intel_pcie_rtile_mcdma_intel_rtile_pcie_ast_531_dd33nhi 
     ast_hip (
              .*
              );

endmodule



