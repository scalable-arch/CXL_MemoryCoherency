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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

//`default_nettype none

module intel_pcie_mcdma_rtile_wrapper
#(
  parameter device_family                          = "Agilex 7",
  parameter payload_width_integer_hwtcl            = 256,
  parameter hdr_width_integer_hwtcl                = 256,
  parameter pfx_width_integer_hwtcl                = 64,
  parameter total_pf_count_hwtcl                   = 4,
  parameter total_pf_count_width_hwtcl             = 2,
  parameter total_vf_count_hwtcl                   = 0,
  parameter total_vf_count_width_hwtcl             = 1,
  parameter tile_hwtcl                             = "R",
  parameter core_index_hwtcl                       = 0,
  parameter sim_speedup                            = 0,
  parameter lite_scheduler                         = 0,
  parameter avst_endianness_big                    = 1,
  parameter enable_user_flr_hwtcl                  = 1,
  parameter enable_user_msix_hwtcl                 = 1,
  parameter en_metadata_8_hwtcl                    = 0,
  parameter en_10bit_tag_hwtcl                     = 0,
  parameter enable_32bit_address_hwtcl             = 0,
  parameter enable_mcdma_hwtcl                     = 1,
  parameter enable_data_mover_hwtcl                = 0,
  parameter enable_bursting_master_hwtcl           = 0,
  parameter enable_bursting_slave_hwtcl            = 0,
  parameter enable_cpl_timeout_hwtcl               = 0,
  parameter enable_byte_aligned_txfr_hwtcl         = 1, // 0 = Cache-line aligned txfr, 1 = Byte aligned txfr
  parameter enable_cii_hwtcl                       = 0,
  parameter enable_cs_hwtcl                        = 0,
  parameter ST_CHANNEL_WIDTH                       = 11,
  parameter maxpayload_size_hwtcl                  = 512,
  parameter seg_num_hwtcl                          = 2, // 4-seg (OR) 2-seg
  parameter seg_width_hwtcl                        = 256, // 256 (OR) 128
  parameter single_width_integer_hwtcl             = 0, // 0 = DoubleWidth, 1 = SingleWidth mode
  parameter address_width_hwtcl                    = 64,
  parameter data_width_hwtcl                       = (seg_width_hwtcl*seg_num_hwtcl),
  parameter burst_width_hwtcl                      = (data_width_hwtcl == 512) ? 4 : 5,
  parameter empty_width_hwtcl                      = $clog2(data_width_hwtcl/8),
  parameter einfo_width_hwtcl                      = 14,
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
  parameter cr_en_hwtcl                            = 1,
  parameter num_h2d_uport_hwtcl                    = 4,
  parameter num_d2h_uport_hwtcl                    = 4,
  parameter uport_type_h2d_hwtcl                   = 4'hF,
  parameter uport_type_d2h_hwtcl                   = 4'hF,
  parameter d2h_num_active_channel_hwtcl           = 1,
  parameter d2h_max_num_desc_fetch_hwtcl           = 16,
  parameter cs_address_width_hwtcl                 = 29,
  parameter att_en_for_bas_cs_hwtcl                = 0,
  parameter mapping_table_address_width_hwtcl      = 3,
  parameter mapping_window_address_width_hwtcl     = 16,
  parameter msi_enable_hwtcl                       = 0,
  parameter per_vec_mask_capable_hwtcl             = 0,
  parameter addr_64bit_capable_hwtcl               = 0,
  parameter multi_msg_capable_hwtcl                = 1,
  parameter ext_msg_data_capable_hwtcl             = 0,

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

  parameter core16_pf0_bar0_address_width_hwtcl           = 20,
  parameter core16_pf0_bar1_address_width_hwtcl           = 20,
  parameter core16_pf0_bar2_address_width_hwtcl           = 20,
  parameter core16_pf0_bar3_address_width_hwtcl           = 20,
  parameter core16_pf0_bar4_address_width_hwtcl           = 20,
  parameter core16_pf0_bar5_address_width_hwtcl           = 20,
  parameter core16_pf1_bar0_address_width_hwtcl           = 20,
  parameter core16_pf1_bar1_address_width_hwtcl           = 20,
  parameter core16_pf1_bar2_address_width_hwtcl           = 20,
  parameter core16_pf1_bar3_address_width_hwtcl           = 20,
  parameter core16_pf1_bar4_address_width_hwtcl           = 20,
  parameter core16_pf1_bar5_address_width_hwtcl           = 20,
  parameter core16_pf2_bar0_address_width_hwtcl           = 20,
  parameter core16_pf2_bar1_address_width_hwtcl           = 20,
  parameter core16_pf2_bar2_address_width_hwtcl           = 20,
  parameter core16_pf2_bar3_address_width_hwtcl           = 20,
  parameter core16_pf2_bar4_address_width_hwtcl           = 20,
  parameter core16_pf2_bar5_address_width_hwtcl           = 20,
  parameter core16_pf3_bar0_address_width_hwtcl           = 20,
  parameter core16_pf3_bar1_address_width_hwtcl           = 20,
  parameter core16_pf3_bar2_address_width_hwtcl           = 20,
  parameter core16_pf3_bar3_address_width_hwtcl           = 20,
  parameter core16_pf3_bar4_address_width_hwtcl           = 20,
  parameter core16_pf3_bar5_address_width_hwtcl           = 20,
  parameter core16_pf4_bar0_address_width_hwtcl           = 20,
  parameter core16_pf4_bar1_address_width_hwtcl           = 20,
  parameter core16_pf4_bar2_address_width_hwtcl           = 20,
  parameter core16_pf4_bar3_address_width_hwtcl           = 20,
  parameter core16_pf4_bar4_address_width_hwtcl           = 20,
  parameter core16_pf4_bar5_address_width_hwtcl           = 20,
  parameter core16_pf5_bar0_address_width_hwtcl           = 20,
  parameter core16_pf5_bar1_address_width_hwtcl           = 20,
  parameter core16_pf5_bar2_address_width_hwtcl           = 20,
  parameter core16_pf5_bar3_address_width_hwtcl           = 20,
  parameter core16_pf5_bar4_address_width_hwtcl           = 20,
  parameter core16_pf5_bar5_address_width_hwtcl           = 20,
  parameter core16_pf6_bar0_address_width_hwtcl           = 20,
  parameter core16_pf6_bar1_address_width_hwtcl           = 20,
  parameter core16_pf6_bar2_address_width_hwtcl           = 20,
  parameter core16_pf6_bar3_address_width_hwtcl           = 20,
  parameter core16_pf6_bar4_address_width_hwtcl           = 20,
  parameter core16_pf6_bar5_address_width_hwtcl           = 20,
  parameter core16_pf7_bar0_address_width_hwtcl           = 20,
  parameter core16_pf7_bar1_address_width_hwtcl           = 20,
  parameter core16_pf7_bar2_address_width_hwtcl           = 20,
  parameter core16_pf7_bar3_address_width_hwtcl           = 20,
  parameter core16_pf7_bar4_address_width_hwtcl           = 20,
  parameter core16_pf7_bar5_address_width_hwtcl           = 20,

  parameter core16_pf0_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf0_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf0_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf0_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf0_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf0_sriov_vf_bar5_address_width_hwtcl        = 20,
  parameter core16_pf1_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf1_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf1_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf1_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf1_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf1_sriov_vf_bar5_address_width_hwtcl        = 20,
  parameter core16_pf2_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf2_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf2_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf2_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf2_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf2_sriov_vf_bar5_address_width_hwtcl        = 20,
  parameter core16_pf3_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf3_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf3_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf3_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf3_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf3_sriov_vf_bar5_address_width_hwtcl        = 20,
  parameter core16_pf4_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf4_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf4_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf4_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf4_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf4_sriov_vf_bar5_address_width_hwtcl        = 20,
  parameter core16_pf5_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf5_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf5_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf5_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf5_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf5_sriov_vf_bar5_address_width_hwtcl        = 20,
  parameter core16_pf6_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf6_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf6_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf6_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf6_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf6_sriov_vf_bar5_address_width_hwtcl        = 20,
  parameter core16_pf7_sriov_vf_bar0_address_width_hwtcl        = 20,
  parameter core16_pf7_sriov_vf_bar1_address_width_hwtcl        = 20,
  parameter core16_pf7_sriov_vf_bar2_address_width_hwtcl        = 20,
  parameter core16_pf7_sriov_vf_bar3_address_width_hwtcl        = 20,
  parameter core16_pf7_sriov_vf_bar4_address_width_hwtcl        = 20,
  parameter core16_pf7_sriov_vf_bar5_address_width_hwtcl        = 20
) (
   // PCIe clock and reset from HIP
   input                           clk,
   input                           rst_n, // might make a multi-bit signal to generate a reset tree
   // Slow clock and reset from HIP
   input                           slow_clk,
   input                           slow_rst_n,
   // R-Tile HIP avst interface
   input [2:0]                     rx_st0_bar_i,      //
   input [2:0]                     rx_st1_bar_i,      //
   input [2:0]                     rx_st2_bar_i,      //
   input [2:0]                     rx_st3_bar_i,      //
   input [2:0]                     rx_st0_pfnum_i,      //
   input [2:0]                     rx_st1_pfnum_i,      //
   input [2:0]                     rx_st2_pfnum_i,      //
   input [2:0]                     rx_st3_pfnum_i,      //
   input                           rx_st0_vfactive_i,      //
   input                           rx_st1_vfactive_i,      //
   input                           rx_st2_vfactive_i,      //
   input                           rx_st3_vfactive_i,      //
   input [10:0]                    rx_st0_vfnum_i,      //
   input [10:0]                    rx_st1_vfnum_i,      //
   input [10:0]                    rx_st2_vfnum_i,      //
   input [10:0]                    rx_st3_vfnum_i,      //
   input                           rx_st0_eop_i,      //
   input                           rx_st1_eop_i,      //
   input                           rx_st2_eop_i,      //
   input                           rx_st3_eop_i,      //
   input [127:0]                   rx_st0_header_i,   //
   input [127:0]                   rx_st1_header_i,   //
   input [127:0]                   rx_st2_header_i,   //
   input [127:0]                   rx_st3_header_i,   //
   input [seg_width_hwtcl-1:0]     rx_st0_payload_i,  // Parameterizing width of data signal to complience with x16/x8/x4
   input [seg_width_hwtcl-1:0]     rx_st1_payload_i,  //
   input [seg_width_hwtcl-1:0]     rx_st2_payload_i,  //
   input [seg_width_hwtcl-1:0]     rx_st3_payload_i,  //
   input                           rx_st0_sop_i,      //
   input                           rx_st1_sop_i,      //
   input                           rx_st2_sop_i,      //
   input                           rx_st3_sop_i,      //
   input                           rx_st0_hvalid_i,    //
   input                           rx_st1_hvalid_i,    //
   input                           rx_st2_hvalid_i,    //
   input                           rx_st3_hvalid_i,    //
   input                           rx_st0_dvalid_i,    //
   input                           rx_st1_dvalid_i,    //
   input                           rx_st2_dvalid_i,    //
   input                           rx_st3_dvalid_i,    //
   input                           rx_st0_pvalid_i,    //
   input                           rx_st1_pvalid_i,    //
   input                           rx_st2_pvalid_i,    //
   input                           rx_st3_pvalid_i,    //
   input [$clog2(seg_width_hwtcl/32)-1:0] rx_st0_empty_i,    // Parameterizing width of empty (per DW) signal to complience with x16/x8/x4
   input [$clog2(seg_width_hwtcl/32)-1:0] rx_st1_empty_i,    //
   input [$clog2(seg_width_hwtcl/32)-1:0] rx_st2_empty_i,    //
   input [$clog2(seg_width_hwtcl/32)-1:0] rx_st3_empty_i,    //
   input [31:0]                    rx_st0_tlp_prfx_i, //
   input [31:0]                    rx_st1_tlp_prfx_i, //
   input [31:0]                    rx_st2_tlp_prfx_i, //
   input [31:0]                    rx_st3_tlp_prfx_i, //
   input                           rx_par_err_i,
   output                          rx_st_ready_o,    //

   output                          tx_st0_eop_o,  //
   output                          tx_st1_eop_o,  //
   output                          tx_st2_eop_o,  //
   output                          tx_st3_eop_o,  //
   output [127:0]                  tx_st0_header_o,      //
   output [127:0]                  tx_st1_header_o,      //
   output [127:0]                  tx_st2_header_o,      //
   output [127:0]                  tx_st3_header_o,      //
   output [31:0]                   tx_st0_prefix_o,      //
   output [31:0]                   tx_st1_prefix_o,      //
   output [31:0]                   tx_st2_prefix_o,      //
   output [31:0]                   tx_st3_prefix_o,      //
   output [seg_width_hwtcl-1:0]    tx_st0_payload_o,     //  Parameterizing width of data signal to complience with x16/x8/x4
   output [seg_width_hwtcl-1:0]    tx_st1_payload_o,     //
   output [seg_width_hwtcl-1:0]    tx_st2_payload_o,     //
   output [seg_width_hwtcl-1:0]    tx_st3_payload_o,     //
   output                          tx_st0_sop_o,  //
   output                          tx_st1_sop_o,  //
   output                          tx_st2_sop_o,  //
   output                          tx_st3_sop_o,  //
   output                          tx_st0_dvalid_o,//
   output                          tx_st1_dvalid_o,//
   output                          tx_st2_dvalid_o,//
   output                          tx_st3_dvalid_o,//
   output                          tx_st0_pvalid_o,//
   output                          tx_st1_pvalid_o,//
   output                          tx_st2_pvalid_o,//
   output                          tx_st3_pvalid_o,//
   output                          tx_st0_hvalid_o,//
   output                          tx_st1_hvalid_o,//
   output                          tx_st2_hvalid_o,//
   output                          tx_st3_hvalid_o,//
   input                           tx_par_err_i,
   input                           tx_st_ready_i,       //

   input                           dl_timer_update_i,
   input                           dl_up_i, //  signal indicates the Data Link (DL) Layer is active
   input                           link_up_i, // signal indicates the link is up

   output logic                    app_rst_n,
   input  logic                    pin_perst_n,
   output logic                    app_clk,

   //rx hcrdt
   output logic [2:0]              rx_st_hcrdt_update_o,
   output logic [5:0]              rx_st_hcrdt_update_cnt_o,
   output logic [2:0]              rx_st_hcrdt_init_o,
   input  logic [2:0]              rx_st_hcrdt_init_ack_i,

   //rx dcrdt
   output logic [2:0]              rx_st_dcrdt_update_o,
   output logic [11:0]             rx_st_dcrdt_update_cnt_o,
   output logic [2:0]              rx_st_dcrdt_init_o,
   input  logic [2:0]              rx_st_dcrdt_init_ack_i,

   //tx hcrdt
   input  logic [2:0]              tx_st_hcrdt_update_i,
   input  logic [5:0]              tx_st_hcrdt_update_cnt_i,
   input  logic [2:0]              tx_st_hcrdt_init_i,
   output logic [2:0]              tx_st_hcrdt_init_ack_o,

   //tx dcrdt
   input  logic [2:0]              tx_st_dcrdt_update_i,
   input  logic [11:0]             tx_st_dcrdt_update_cnt_i,
   input  logic [2:0]              tx_st_dcrdt_init_i,
   output logic [2:0]              tx_st_dcrdt_init_ack_o,


   // HIP REconfig interface
  output logic                                    hip_reconfig_read_o,
  output logic [31:0]                             hip_reconfig_address_o,
  output logic                                    hip_reconfig_write_o,
  output logic [7:0]                              hip_reconfig_writedata_o,
  input  logic                                    hip_reconfig_readdatavalid_i,
  input  logic [7:0]                              hip_reconfig_readdata_i,
  input  logic                                    hip_reconfig_waitrequest_i,

  // Usr Reconfig interface
  input logic [31:0]                              usr_hip_reconfig_address_i,
  input logic                                     usr_hip_reconfig_read_i,
  input logic                                     usr_hip_reconfig_write_i,
  input logic [7:0]                               usr_hip_reconfig_writedata_i,
  output logic [7:0]                              usr_hip_reconfig_readdata_o,
  output logic                                    usr_hip_reconfig_readdatavalid_o,
  output logic                                    usr_hip_reconfig_waitrequest_o,

  // CII interface
  input logic                                     cii_req_i,
  input logic                                     cii_hdr_poisoned_i,
  input logic  [3:0]                              cii_hdr_first_be_i,
  input logic  [2:0]                              cii_func_num_i,
  input logic                                     cii_wr_i,
  input logic  [9:0]                              cii_addr_i,
  input logic  [31:0]                             cii_dout_i,
  output logic                                    cii_override_en_o,
  output logic [31:0]                             cii_override_din_o,
  output logic                                    cii_halt_o,
  input logic                                     cii_wr_vf_active_i,
  input logic  [10:0]                             cii_vf_num_i,

  // Configuration Intercept Interface (CII) to User
  output logic                                    usr_cii_req_o,
  output logic                                    usr_cii_hdr_poisoned_o,
  output logic [3:0]                              usr_cii_hdr_first_be_o,
  output logic [2:0]                              usr_cii_func_num_o,
  output logic                                    usr_cii_wr_o,
  output logic [9:0]                              usr_cii_addr_o,
  output logic [31:0]                             usr_cii_dout_o,
  output logic                                    usr_cii_wr_vf_active_o,
  output logic [10:0]                             usr_cii_vf_num_o,

  // H2D AVST Master Interface
  output logic                                    h2d_st_sof_0_o,
  output logic                                    h2d_st_eof_0_o,
  output logic [empty_width_hwtcl-1:0]            h2d_st_empty_0_o,
  input logic                                     h2d_st_ready_0_i,
  output logic                                    h2d_st_valid_0_o,
  output logic [data_width_hwtcl-1:0]             h2d_st_data_0_o,
  output logic [ST_CHANNEL_WIDTH-1:0]             h2d_st_channel_0_o,
  // H2D AVST Master Interface
  output logic                                    h2d_st_sof_1_o,
  output logic                                    h2d_st_eof_1_o,
  output logic [empty_width_hwtcl-1:0]            h2d_st_empty_1_o,
  input logic                                     h2d_st_ready_1_i,
  output logic                                    h2d_st_valid_1_o,
  output logic [data_width_hwtcl-1:0]             h2d_st_data_1_o,
  output logic [ST_CHANNEL_WIDTH-1:0]             h2d_st_channel_1_o,
  // H2D AVST Master Interface
  output logic                                    h2d_st_sof_2_o,
  output logic                                    h2d_st_eof_2_o,
  output logic [empty_width_hwtcl-1:0]            h2d_st_empty_2_o,
  input logic                                     h2d_st_ready_2_i,
  output logic                                    h2d_st_valid_2_o,
  output logic [data_width_hwtcl-1:0]             h2d_st_data_2_o,
  output logic [ST_CHANNEL_WIDTH-1:0]             h2d_st_channel_2_o,
  // H2D AVST Master Interface
  output logic                                    h2d_st_sof_3_o,
  output logic                                    h2d_st_eof_3_o,
  output logic [empty_width_hwtcl-1:0]            h2d_st_empty_3_o,
  input logic                                     h2d_st_ready_3_i,
  output logic                                    h2d_st_valid_3_o,
  output logic [data_width_hwtcl-1:0]             h2d_st_data_3_o,
  output logic [ST_CHANNEL_WIDTH-1:0]             h2d_st_channel_3_o,
  // H2D AVMM Master Interface
  input logic                                     h2ddm_waitrequest_i,
  input logic                                     h2ddm_writeresponsevalid_i,
  output logic                                    h2ddm_write_o,
  output logic [address_width_hwtcl-1:0]          h2ddm_address_o,
  output logic [burst_width_hwtcl-1:0]            h2ddm_burstcount_o,
  output logic [data_width_hwtcl/8-1:0]           h2ddm_byteenable_o,
  output logic [data_width_hwtcl-1:0]             h2ddm_writedata_o,
  // D2H AVST interface
  input logic                                     d2h_st_sof_0_i,
  input logic                                     d2h_st_eof_0_i,
  input logic [empty_width_hwtcl-1:0]             d2h_st_empty_0_i,
  input logic [ST_CHANNEL_WIDTH-1:0]              d2h_st_channel_0_i,
  input logic                                     d2h_st_valid_0_i,
  input logic [data_width_hwtcl-1:0]              d2h_st_data_0_i,
  output logic                                    d2h_st_ready_0_o,
  // D2H AVST interface
  input logic                                     d2h_st_sof_1_i,
  input logic                                     d2h_st_eof_1_i,
  input logic [empty_width_hwtcl-1:0]             d2h_st_empty_1_i,
  input logic [ST_CHANNEL_WIDTH-1:0]              d2h_st_channel_1_i,
  input logic                                     d2h_st_valid_1_i,
  input logic [data_width_hwtcl-1:0]              d2h_st_data_1_i,
  output logic                                    d2h_st_ready_1_o,
  // D2H AVST interface
  input logic                                     d2h_st_sof_2_i,
  input logic                                     d2h_st_eof_2_i,
  input logic [empty_width_hwtcl-1:0]             d2h_st_empty_2_i,
  input logic [ST_CHANNEL_WIDTH-1:0]              d2h_st_channel_2_i,
  input logic                                     d2h_st_valid_2_i,
  input logic [data_width_hwtcl-1:0]              d2h_st_data_2_i,
  output logic                                    d2h_st_ready_2_o,
  // D2H AVST interface
  input logic                                     d2h_st_sof_3_i,
  input logic                                     d2h_st_eof_3_i,
  input logic [empty_width_hwtcl-1:0]             d2h_st_empty_3_i,
  input logic [ST_CHANNEL_WIDTH-1:0]              d2h_st_channel_3_i,
  input logic                                     d2h_st_valid_3_i,
  input logic [data_width_hwtcl-1:0]              d2h_st_data_3_i,
  output logic                                    d2h_st_ready_3_o,
  //D2H AVMM Read Master Interface
  output logic [address_width_hwtcl-1:0]          d2hdm_address_o,
  output logic [data_width_hwtcl/8-1:0]           d2hdm_byteenable_o,
  output logic                                    d2hdm_read_o,
  output logic [burst_width_hwtcl-1:0]            d2hdm_burstcount_o,
  input logic                                     d2hdm_waitrequest_i,
  input logic [data_width_hwtcl-1:0]              d2hdm_readdata_i,
  input logic                                     d2hdm_readdatavalid_i,
  input logic [1:0]                               d2hdm_response_i,
  //AVST interface
  //H2D descriptor input on AVST sink interface
  output logic                                    h2ddm_desc_ready_o,
  input logic                                     h2ddm_desc_valid_i,
  input logic [255:0]                             h2ddm_desc_data_i, // h2d_desc_bypass_t
  //H2D AVST Status source interface
  output logic [31:0]                             h2ddm_desc_status_data_o, // h2d_desc_status_t
  output logic                                    h2ddm_desc_status_valid_o,
  //H2D AVST Source completion interface
  output logic [data_width_hwtcl-1:0]             h2ddm_desc_cmpl_data_o, // h2d_desc_cmpl_t
  output logic [empty_width_hwtcl-1:0]            h2ddm_desc_cmpl_empty_o,
  output logic                                    h2ddm_desc_cmpl_sop_o,
  output logic                                    h2ddm_desc_cmpl_eop_o,
  output logic                                    h2ddm_desc_cmpl_valid_o,
  input logic                                     h2ddm_desc_cmpl_ready_i,
  //D2H descriptor input on AVST sink interface
  output logic                                    d2hdm_desc_ready_o,
  input logic                                     d2hdm_desc_valid_i,
  input logic [255:0]                             d2hdm_desc_data_i, // d2h_desc_bypass_t
  //D2H AVST Status source interface
  output logic [31:0]                             d2hdm_desc_status_data_o, // d2h_desc_status_t
  output logic                                    d2hdm_desc_status_valid_o,
  // AVMM Master PIO interface
  output logic [pio_address_width_hwtcl-1:0]      rx_pio_address_o,
  output logic [pio_data_width_hwtcl/8-1:0]       rx_pio_byteenable_o,
  output logic                                    rx_pio_read_o,
  output logic                                    rx_pio_write_o,
  output logic [pio_data_width_hwtcl-1:0]         rx_pio_writedata_o,
  output logic [3:0]                              rx_pio_burstcount_o,
  input logic                                     rx_pio_waitrequest_i,
  input logic [pio_data_width_hwtcl-1:0]          rx_pio_readdata_i,
  input logic                                     rx_pio_readdatavalid_i,
  input logic [1:0]                               rx_pio_response_i,
  input logic                                     rx_pio_writeresponsevalid_i,

  // FLR interface from HIP
  input logic [7:0]                               flr_rcvd_pf_i,
  input logic                                     flr_rcvd_vf_i,
  input logic [2:0]                               flr_rcvd_pf_num_i,
  input logic [10:0]                              flr_rcvd_vf_num_i,
  output logic [7:0]                              flr_completed_pf_o,
  output logic                                    flr_completed_vf_o,
  output logic [2:0]                              flr_completed_pf_num_o,
  output logic [10:0]                             flr_completed_vf_num_o,
  input logic                                     flr_completed_ready_i,

  //FLR interface to application/user side
  output logic                                    usr_flr_rcvd_val_o,
  output logic [10:0]                             usr_flr_rcvd_chan_num_o,
  input  logic                                    usr_flr_completed_i,

  //  Completion Timeout Interface (only in R-tile)
  input logic                                     cpl_timeout_i,
  input logic [2:0]                               cpl_timeout_func_num_i,
  input logic [10:0]                              cpl_timeout_vfunc_num_i,
  input logic                                     cpl_timeout_vfunc_active_i,
  input logic [2:0]                               cpl_timeout_cpl_tc_i,
  input logic [1:0]                               cpl_timeout_cpl_attr_i,
  input logic [11:0]                              cpl_timeout_cpl_len_i,
  input logic [9:0]                               cpl_timeout_cpl_tag_i,


  // Error interface to HIP
  output logic                                    app_err_valid_o,
  output logic [31:0]                             app_err_hdr_o,
  output logic [einfo_width_hwtcl-1:0]            app_err_info_o, //S10:app_err_info[10:0]
  output logic [pfnum_width_hwtcl-1:0]            app_err_func_num_o, //S10: app_err_func_num[1:0]
  input  logic                                    serr_i,
  input  logic                                    app_err_ready_i,

  // MSI-X Request interface from application/user side
  input  logic                                    usr_event_msix_valid_i,
  output logic                                    usr_event_msix_ready_o,
  input  logic [15:0]                             usr_event_msix_data_i,

  // BAS interface
  input logic                                     bas_vfactive_i,
  input logic [pfnum_width_hwtcl-1:0]             bas_pfnum_i,
  input logic [vfnum_width_hwtcl-1:0]             bas_vfnum_i,
  input logic [bas_address_width_hwtcl-1:0]       bas_address_i,
  input logic [data_width_hwtcl/8-1:0]            bas_byteenable_i,
  input logic                                     bas_read_i,
  input logic                                     bas_write_i,
  input logic [data_width_hwtcl-1:0]              bas_writedata_i,
  input logic [burst_width_hwtcl-1:0]             bas_burstcount_i,
  output logic                                    bas_waitrequest_o,
  output logic [data_width_hwtcl-1:0]             bas_readdata_o,
  output logic                                    bas_readdatavalid_o,
  output logic [1:0]                              bas_response_o,

  // BAM interface
  input logic                                     bam_readdatavalid_i,
  input logic [data_width_hwtcl-1:0]              bam_readdata_i,
  input logic                                     bam_waitrequest_i,
//output logic                                    bam_vfactive_o,
//output logic [pfcnt_w_hwtcl-1:0]                bam_pfnum_o,
//output logic [pfcnt_w_hwtcl-1:0]                bam_vfnum_o,
//output logic [2:0]                              bam_bar_o,
  output logic [enable_cs_hwtcl ==1 ? address_width_hwtcl-1: 1+pfcnt_w_hwtcl+vfcnt_w_hwtcl+3+max_bar_address_width_hwtcl-1:0] bam_address_o,
  output logic [burst_width_hwtcl-1:0]            bam_burstcount_o,
  output logic [data_width_hwtcl/8-1:0]           bam_byteenable_o,
  output logic                                    bam_read_o,
  output logic                                    bam_write_o,
  output logic [data_width_hwtcl-1:0]             bam_writedata_o,

//CS AVMM slave interface
  output logic                                    cs_waitrequest_o,
  input  logic [cs_address_width_hwtcl-1 :0]      cs_address_i,
  input  logic [3:0]                              cs_byteenable_i,
  input  logic                                    cs_read_i,
  output logic [31:0]                             cs_readdata_o,
  output logic                                    cs_readdatavalid_o,
  input  logic                                    cs_write_i,
  input  logic [31:0]                             cs_writedata_i,
  output logic [1:0]                              cs_response_o,
  output logic                                    cs_writeresponsevalid_o,

//MSI interface to user
  input  logic                                    msi_req_i,
  input  logic [pfnum_width_hwtcl-1:0]            msi_func_num_i,
  input  logic [4:0]                              msi_num_i,
  output logic                                    msi_ack_o,
  output logic [1:0]                              msi_status_o,

// MSI pending bits interface
  output logic [2:0]                          hip_msi_pnd_func_o,
  output logic [1:0]                          hip_msi_pnd_addr_o,
  output logic [7:0]                          hip_msi_pnd_byte_o
);

// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Configuration| Link Rate|  Width Mode   | Header                                      | Data                                       | Application Clock Frequency (MHz)
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
// x16          |    Gen5  |  Double-Width |  H3[127:0], H2[127:0], H1[127:0], H0[127:0] | D3[255:0], D2[255:0], D1[255:0], D0[255:0] | 400 - 500
//              |    Gen4  |  Double-Width |  H3[127:0], H2[127:0], H1[127:0], H0[127:0] | D3[255:0], D2[255:0], D1[255:0], D0[255:0] | 250 - 300
//              |    Gen3  |  Double-Width |  H3[127:0], H2[127:0], H1[127:0], H0[127:0] | D3[255:0], D2[255:0], D1[255:0], D0[255:0] | 250 - 300
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
// x8x8         |    Gen5  |  Double-Width |  H1[127:0], H0[127:0]                       | D1[255:0], D0[255:0]                       | 400 - 500
//              |    Gen4  |  Double-Width |  H1[127:0], H0[127:0]                       | D1[255:0], D0[255:0]                       | 250 - 300
//              |    Gen3  |  Double-Width |  H1[127:0], H0[127:0]                       | D1[255:0], D0[255:0]                       | 250 - 300
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
// x4x4x4x4     |    Gen5  |  Double-width |  H1[127:0], H0[127:0]                       | D1[127:0], D0[127:0]                       | 400 - 500
//              |    Gen4  |  Double-width |  H1[127:0], H0[127:0]                       | D1[127:0], D0[127:0]                       | 250 - 300
//              |    Gen3  |  Double-width |  H1[127:0], H0[127:0]                       | D1[127:0], D0[127:0]                       | 250 - 300
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------

// MSI pending bits interface
  logic [2:0]                          hip_msi_pnd_func_wire;
  logic [1:0]                          hip_msi_pnd_addr_wire;
  logic [7:0]                          hip_msi_pnd_byte_wire;

  logic                                      rx_st_ready_wire;
  logic [seg_num_hwtcl-1:0]                  rx_st_valid_wire;
  logic [seg_num_hwtcl-1:0]                  rx_st_eop_wire;
  logic [seg_num_hwtcl-1:0]                  rx_st_sop_wire;
  logic [seg_num_hwtcl*128-1:0]              rx_st_hdr_wire;
  logic [seg_num_hwtcl*seg_width_hwtcl-1:0]  rx_st_data_wire;
  logic [seg_num_hwtcl*3-1:0]                rx_st_empty_wire;
  logic [seg_num_hwtcl*32-1:0]               rx_st_prefix_wire;
  logic [seg_num_hwtcl-1:0]                  rx_st_vf_active_wire;
  logic [seg_num_hwtcl*3-1:0]                rx_st_func_num_wire;
  logic [seg_num_hwtcl*11-1:0]               rx_st_vf_num_wire;
  logic [seg_num_hwtcl*3-1:0]                rx_st_bar_range_wire;
  logic                                      rx_par_err_wire;

// This is the header to be transmitted, which follows the TLP header format of the PCIe specifications except for the requester ID/completer ID fields (tx_stN_hdr_i[95:80]):
//    tx_stN_hdr_i[95:84]  : tx_st_vf_num[11:0]
//    tx_stN_hdr_i[83]     : tx_st_vf_active
//    tx_stN_hdr_i[82:80]  : tx_st_func_num[2:0]

  logic                                      tx_st_ready_wire;
  logic                                      tx_par_err_wire;
  logic [seg_num_hwtcl-1:0]                  tx_st_valid_wire;
  logic [seg_num_hwtcl-1:0]                  tx_st_sop_wire;
  logic [seg_num_hwtcl-1:0]                  tx_st_eop_wire;
  logic [seg_num_hwtcl-1:0]                  tx_st_err_wire;
  logic [seg_num_hwtcl*128-1:0]              tx_st_hdr_wire;
  logic [seg_num_hwtcl*seg_width_hwtcl-1:0]  tx_st_data_wire;
  logic [seg_num_hwtcl*32-1:0]               tx_st_prefix_wire;
  logic [seg_num_hwtcl-1:0]                  tx_st_vf_active_wire;

  logic [15:0]                               tx_cdts_limit_wire;
  logic [2:0]                                tx_cdts_limit_tdm_idx_wire;
  logic [15:0]                               rx_buffer_limit_wire;
  logic [2:0]                                rx_buffer_limit_tdm_idx_wire;

  logic                                      clk_wire;
  logic                                      rst_n_wire;

  //  Completion Timeout Interface (only in P-tile)
  logic                                      cpl_timeout_wire;
  logic                                      cpl_timeout_avmm_waitrequest_wire;
  logic                                      cpl_timeout_avmm_read_wire;
  logic [20:0]                               cpl_timeout_avmm_address_wire; // [20:3] : Reserved. Tie them to 0.
  logic                                      cpl_timeout_avmm_write_wire;
  logic [7:0]                                cpl_timeout_avmm_writedata_wire;
  logic [7:0]                                cpl_timeout_avmm_readdata_wire;
  logic                                      cpl_timeout_avmm_readdatavalid_wire;

  // FLR interface from Dcore
  logic [7:0]                                flr_rcvd_pf_wire;
  logic                                      flr_rcvd_vf_wire;
  logic [2:0]                                flr_rcvd_pf_num_wire;
  logic [10:0]                               flr_rcvd_vf_num_wire;
  logic [7:0]                                flr_completed_pf_wire;
  logic                                      flr_completed_vf_wire;
  logic [2:0]                                flr_completed_pf_num_wire;
  logic [10:0]                               flr_completed_vf_num_wire;
  logic                                      flr_completed_ready_wire;

  logic                                      app_err_valid_wire     ;
  logic [31:0]                               app_err_hdr_wire       ;
  logic [13:0]                               app_err_info_wire      ;
  logic [2:0]                                app_err_func_num_wire  ;
  logic                                      app_err_ready_wire     ;

  // H2D AVST Master Interface
  logic                                      h2d_st_sof_o      [4];
  logic                                      h2d_st_eof_o      [4];
  logic [empty_width_hwtcl-1:0]              h2d_st_empty_o    [4];
  logic                                      h2d_st_ready_i    [4];
  logic                                      h2d_st_valid_o    [4];
  logic [data_width_hwtcl-1:0]               h2d_st_data_o     [4];
  logic [ST_CHANNEL_WIDTH-1:0]               h2d_st_channel_o  [4];

  // D2H AVST interface
  logic                                      d2h_st_sof_i      [4];
  logic                                      d2h_st_eof_i      [4];
  logic [empty_width_hwtcl-1:0]              d2h_st_empty_i    [4];
  logic [ST_CHANNEL_WIDTH-1:0]               d2h_st_channel_i  [4];
  logic                                      d2h_st_valid_i    [4];
  logic [data_width_hwtcl-1:0]               d2h_st_data_i     [4];
  logic                                      d2h_st_ready_o    [4];

  //From H2D_Port
  assign h2d_st_ready_i[0] = h2d_st_ready_0_i;
  assign h2d_st_sof_0_o     = h2d_st_sof_o[0];
  assign h2d_st_eof_0_o     = h2d_st_eof_o[0];
  assign h2d_st_empty_0_o   = h2d_st_empty_o[0];
  assign h2d_st_valid_0_o   = h2d_st_valid_o[0];
  assign h2d_st_data_0_o    = h2d_st_data_o[0];
  assign h2d_st_channel_0_o = h2d_st_channel_o[0];

  assign h2d_st_ready_i[1] = h2d_st_ready_1_i;
  assign h2d_st_sof_1_o     = h2d_st_sof_o[1];
  assign h2d_st_eof_1_o     = h2d_st_eof_o[1];
  assign h2d_st_empty_1_o   = h2d_st_empty_o[1];
  assign h2d_st_valid_1_o   = h2d_st_valid_o[1];
  assign h2d_st_data_1_o    = h2d_st_data_o[1];
  assign h2d_st_channel_1_o = h2d_st_channel_o[1];

  assign h2d_st_ready_i[2] = h2d_st_ready_2_i;
  assign h2d_st_sof_2_o     = h2d_st_sof_o[2];
  assign h2d_st_eof_2_o     = h2d_st_eof_o[2];
  assign h2d_st_empty_2_o   = h2d_st_empty_o[2];
  assign h2d_st_valid_2_o   = h2d_st_valid_o[2];
  assign h2d_st_data_2_o    = h2d_st_data_o[2];
  assign h2d_st_channel_2_o = h2d_st_channel_o[2];

  assign h2d_st_ready_i[3] = h2d_st_ready_3_i;
  assign h2d_st_sof_3_o     = h2d_st_sof_o[3];
  assign h2d_st_eof_3_o     = h2d_st_eof_o[3];
  assign h2d_st_empty_3_o   = h2d_st_empty_o[3];
  assign h2d_st_valid_3_o   = h2d_st_valid_o[3];
  assign h2d_st_data_3_o    = h2d_st_data_o[3];
  assign h2d_st_channel_3_o = h2d_st_channel_o[3];

  // To D2H_port
  assign d2h_st_ready_0_o     = d2h_st_ready_o[0];
  assign d2h_st_sof_i[0]     = d2h_st_sof_0_i;
  assign d2h_st_eof_i[0]     = d2h_st_eof_0_i;
  assign d2h_st_empty_i[0]   = d2h_st_empty_0_i;
  assign d2h_st_valid_i[0]   = d2h_st_valid_0_i;
  assign d2h_st_data_i[0]    = d2h_st_data_0_i;
  assign d2h_st_channel_i[0] = d2h_st_channel_0_i;

  assign d2h_st_ready_1_o     = d2h_st_ready_o[1];
  assign d2h_st_sof_i[1]     = d2h_st_sof_1_i;
  assign d2h_st_eof_i[1]     = d2h_st_eof_1_i;
  assign d2h_st_empty_i[1]   = d2h_st_empty_1_i;
  assign d2h_st_valid_i[1]   = d2h_st_valid_1_i;
  assign d2h_st_data_i[1]    = d2h_st_data_1_i;
  assign d2h_st_channel_i[1] = d2h_st_channel_1_i;

  assign d2h_st_ready_2_o     = d2h_st_ready_o[2];
  assign d2h_st_sof_i[2]     = d2h_st_sof_2_i;
  assign d2h_st_eof_i[2]     = d2h_st_eof_2_i;
  assign d2h_st_empty_i[2]   = d2h_st_empty_2_i;
  assign d2h_st_valid_i[2]   = d2h_st_valid_2_i;
  assign d2h_st_data_i[2]    = d2h_st_data_2_i;
  assign d2h_st_channel_i[2] = d2h_st_channel_2_i;

  assign d2h_st_ready_3_o     = d2h_st_ready_o[3];
  assign d2h_st_sof_i[3]     = d2h_st_sof_3_i;
  assign d2h_st_eof_i[3]     = d2h_st_eof_3_i;
  assign d2h_st_empty_i[3]   = d2h_st_empty_3_i;
  assign d2h_st_valid_i[3]   = d2h_st_valid_3_i;
  assign d2h_st_data_i[3]    = d2h_st_data_3_i;
  assign d2h_st_channel_i[3] = d2h_st_channel_3_i;

  assign clk_wire                     = clk;
  assign rst_n_wire                   = rst_n;

  assign app_clk                      = clk_wire;
  assign reset_status_n               = rst_n_wire;

  intel_pcie_rtile_adapter #(
     .PFNUM_WIDTH       (pfnum_width_hwtcl  ),
     .VFNUM_WIDTH       (vfnum_width_hwtcl  ),
     .CDC_ENABLE        (0),
     .SEG_NUM           (seg_num_hwtcl      ),
     .SEG_WIDTH         (seg_width_hwtcl    ),
     .DEVICE_FAMILY     (device_family      )
  ) rtile_adapter (
     .hip_clk           (clk_wire),
     .hip_rst_n         (rst_n_wire),
     .rx_st0_bar_i      (rx_st0_bar_i   ),
     .rx_st1_bar_i      (rx_st1_bar_i   ),
     .rx_st2_bar_i      (rx_st2_bar_i   ),
     .rx_st3_bar_i      (rx_st3_bar_i   ),
     .rx_st0_pfnum_i    (rx_st0_pfnum_i   ),
     .rx_st1_pfnum_i    (rx_st1_pfnum_i   ),
     .rx_st2_pfnum_i    (rx_st2_pfnum_i   ),
     .rx_st3_pfnum_i    (rx_st3_pfnum_i   ),
     .rx_st0_vfactive_i (rx_st0_vfactive_i),
     .rx_st1_vfactive_i (rx_st1_vfactive_i),
     .rx_st2_vfactive_i (rx_st2_vfactive_i),
     .rx_st3_vfactive_i (rx_st3_vfactive_i),
     .rx_st0_vfnum_i    (rx_st0_vfnum_i   ),
     .rx_st1_vfnum_i    (rx_st1_vfnum_i   ),
     .rx_st2_vfnum_i    (rx_st2_vfnum_i   ),
     .rx_st3_vfnum_i    (rx_st3_vfnum_i   ),
     .rx_st0_eop_i      (rx_st0_eop_i   ),
     .rx_st1_eop_i      (rx_st1_eop_i   ),
     .rx_st2_eop_i      (rx_st2_eop_i   ),
     .rx_st3_eop_i      (rx_st3_eop_i   ),
     // Header[127:0] - Big Endian -> Header[127:0] - Little Endian
     .rx_st0_header_i   ({rx_st0_header_i[31:0],rx_st0_header_i[63:32],rx_st0_header_i[95:64],rx_st0_header_i[127:96]}),
     .rx_st1_header_i   ({rx_st1_header_i[31:0],rx_st1_header_i[63:32],rx_st1_header_i[95:64],rx_st1_header_i[127:96]}),
     .rx_st2_header_i   ({rx_st2_header_i[31:0],rx_st2_header_i[63:32],rx_st2_header_i[95:64],rx_st2_header_i[127:96]}),
     .rx_st3_header_i   ({rx_st3_header_i[31:0],rx_st3_header_i[63:32],rx_st3_header_i[95:64],rx_st3_header_i[127:96]}),
     .rx_st0_payload_i  (rx_st0_payload_i),
     .rx_st1_payload_i  (rx_st1_payload_i),
     .rx_st2_payload_i  (rx_st2_payload_i),
     .rx_st3_payload_i  (rx_st3_payload_i),
     .rx_st0_sop_i      (rx_st0_sop_i),
     .rx_st1_sop_i      (rx_st1_sop_i),
     .rx_st2_sop_i      (rx_st2_sop_i),
     .rx_st3_sop_i      (rx_st3_sop_i),
     .rx_st0_hvalid_i   (rx_st0_hvalid_i),
     .rx_st1_hvalid_i   (rx_st1_hvalid_i),
     .rx_st2_hvalid_i   (rx_st2_hvalid_i),
     .rx_st3_hvalid_i   (rx_st3_hvalid_i),
     .rx_st0_dvalid_i   (rx_st0_dvalid_i),
     .rx_st1_dvalid_i   (rx_st1_dvalid_i),
     .rx_st2_dvalid_i   (rx_st2_dvalid_i),
     .rx_st3_dvalid_i   (rx_st3_dvalid_i),
     .rx_st0_pvalid_i   (rx_st0_pvalid_i),
     .rx_st1_pvalid_i   (rx_st1_pvalid_i),
     .rx_st2_pvalid_i   (rx_st2_pvalid_i),
     .rx_st3_pvalid_i   (rx_st3_pvalid_i),
     .rx_st0_empty_i    (rx_st0_empty_i),
     .rx_st1_empty_i    (rx_st1_empty_i),
     .rx_st2_empty_i    (rx_st2_empty_i),
     .rx_st3_empty_i    (rx_st3_empty_i),
     .rx_st0_tlp_prfx_i (rx_st0_tlp_prfx_i),
     .rx_st1_tlp_prfx_i (rx_st1_tlp_prfx_i),
     .rx_st2_tlp_prfx_i (rx_st2_tlp_prfx_i),
     .rx_st3_tlp_prfx_i (rx_st3_tlp_prfx_i),
     .rx_par_err_i      (rx_par_err_i),
     .rx_st_ready_o     (rx_st_ready_o),
     .tx_st0_eop_o      (tx_st0_eop_o),
     .tx_st1_eop_o      (tx_st1_eop_o),
     .tx_st2_eop_o      (tx_st2_eop_o),
     .tx_st3_eop_o      (tx_st3_eop_o),
     // Header[127:0] - Big Endian -> Header[127:0] - Little Endian
     .tx_st0_header_o   ({tx_st0_header_o[31:0],tx_st0_header_o[63:32],tx_st0_header_o[95:64],tx_st0_header_o[127:96]}),
     .tx_st1_header_o   ({tx_st1_header_o[31:0],tx_st1_header_o[63:32],tx_st1_header_o[95:64],tx_st1_header_o[127:96]}),
     .tx_st2_header_o   ({tx_st2_header_o[31:0],tx_st2_header_o[63:32],tx_st2_header_o[95:64],tx_st2_header_o[127:96]}),
     .tx_st3_header_o   ({tx_st3_header_o[31:0],tx_st3_header_o[63:32],tx_st3_header_o[95:64],tx_st3_header_o[127:96]}),
     .tx_st0_prefix_o   (tx_st0_prefix_o),
     .tx_st1_prefix_o   (tx_st1_prefix_o),
     .tx_st2_prefix_o   (tx_st2_prefix_o),
     .tx_st3_prefix_o   (tx_st3_prefix_o),
     .tx_st0_payload_o  (tx_st0_payload_o),
     .tx_st1_payload_o  (tx_st1_payload_o),
     .tx_st2_payload_o  (tx_st2_payload_o),
     .tx_st3_payload_o  (tx_st3_payload_o),
     .tx_st0_sop_o      (tx_st0_sop_o),
     .tx_st1_sop_o      (tx_st1_sop_o),
     .tx_st2_sop_o      (tx_st2_sop_o),
     .tx_st3_sop_o      (tx_st3_sop_o),
     .tx_st0_dvalid_o   (tx_st0_dvalid_o),
     .tx_st1_dvalid_o   (tx_st1_dvalid_o),
     .tx_st2_dvalid_o   (tx_st2_dvalid_o),
     .tx_st3_dvalid_o   (tx_st3_dvalid_o),
     .tx_st0_hvalid_o   (tx_st0_hvalid_o),
     .tx_st1_hvalid_o   (tx_st1_hvalid_o),
     .tx_st2_hvalid_o   (tx_st2_hvalid_o),
     .tx_st3_hvalid_o   (tx_st3_hvalid_o),
     .tx_st0_pvalid_o   (tx_st0_pvalid_o),
     .tx_st1_pvalid_o   (tx_st1_pvalid_o),
     .tx_st2_pvalid_o   (tx_st2_pvalid_o),
     .tx_st3_pvalid_o   (tx_st3_pvalid_o),
     .tx_par_err_i      (tx_par_err_i),
     .tx_st_ready_i     (tx_st_ready_i),
     // Interface to the Streaming ports of HIP.
     .dcore_clk         (clk_wire),
     .dcore_rst_n       (rst_n_wire),
     //RX Ports
     .rx_st_ready_i     (rx_st_ready_wire),
     .rx_st_valid_o     (rx_st_valid_wire),
     .rx_st_sop_o       (rx_st_sop_wire),
     .rx_st_eop_o       (rx_st_eop_wire),
     .rx_st_prefix_o    (rx_st_prefix_wire),
     .rx_st_hdr_o       (rx_st_hdr_wire),
     .rx_st_data_o      (rx_st_data_wire),
     .rx_st_empty_o     (rx_st_empty_wire),
     .rx_st_vf_active_o (rx_st_vf_active_wire),
     .rx_st_func_num_o  (rx_st_func_num_wire),
     .rx_st_vf_num_o    (rx_st_vf_num_wire),
     .rx_st_bar_range_o (rx_st_bar_range_wire),
     .rx_par_err_o      (rx_par_err_wire),

     //TX Ports
     .tx_st_ready_o     (tx_st_ready_wire),
     .tx_st_valid_i     (tx_st_valid_wire),
     .tx_st_sop_i       (tx_st_sop_wire),
     .tx_st_eop_i       (tx_st_eop_wire),
     .tx_st_err_i       (tx_st_err_wire),
     .tx_st_prefix_i    (tx_st_prefix_wire),
     .tx_st_hdr_i       (tx_st_hdr_wire),
     .tx_st_data_i      (tx_st_data_wire),
     .tx_st_vf_active_i (tx_st_vf_active_wire),
     .tx_par_err_o      (tx_par_err_wire),

     .rx_st_hcrdt_update_o(rx_st_hcrdt_update_o),
     .rx_st_hcrdt_update_cnt_o(rx_st_hcrdt_update_cnt_o),
     .rx_st_hcrdt_init_o(rx_st_hcrdt_init_o),
     .rx_st_hcrdt_init_ack_i(rx_st_hcrdt_init_ack_i),
     .rx_st_dcrdt_update_o(rx_st_dcrdt_update_o),
     .rx_st_dcrdt_update_cnt_o(rx_st_dcrdt_update_cnt_o),
     .rx_st_dcrdt_init_o(rx_st_dcrdt_init_o),
     .rx_st_dcrdt_init_ack_i(rx_st_dcrdt_init_ack_i),
     .tx_st_hcrdt_update_i(tx_st_hcrdt_update_i),
     .tx_st_hcrdt_update_cnt_i(tx_st_hcrdt_update_cnt_i),
     .tx_st_hcrdt_init_i(tx_st_hcrdt_init_i),
     .tx_st_hcrdt_init_ack_o(tx_st_hcrdt_init_ack_o),
     .tx_st_dcrdt_update_i(tx_st_dcrdt_update_i),
     .tx_st_dcrdt_update_cnt_i(tx_st_dcrdt_update_cnt_i),
     .tx_st_dcrdt_init_i(tx_st_dcrdt_init_i),
     .tx_st_dcrdt_init_ack_o(tx_st_dcrdt_init_ack_o),

     .tx_cdts_limit_o(tx_cdts_limit_wire),
     .tx_cdts_limit_tdm_idx_o(tx_cdts_limit_tdm_idx_wire),
     .rx_buffer_limit_i(rx_buffer_limit_wire),
     .rx_buffer_limit_tdm_idx_i(rx_buffer_limit_tdm_idx_wire)
  );

  assign tx_st_prefix_wire = '0;

  generate if (enable_cpl_timeout_hwtcl) begin : gen_enable_cpl_timeout
     intel_pcie_rtile_cmplto_intf #(
        .DEVICE_FAMILY  (device_family),
        .FIFO_DEPTH     (en_10bit_tag_hwtcl ? 1024 : 256) // Number of TAG supported
     ) rtile_cmplto_intf (
        // Completion Timeout Interface (only in P-tile)
        .cpl_timeout_o                    (cpl_timeout_wire                   ),
        .cpl_timeout_avmm_waitrequest_o   (cpl_timeout_avmm_waitrequest_wire  ),
        .cpl_timeout_avmm_read_i          (cpl_timeout_avmm_read_wire         ),
        .cpl_timeout_avmm_address_i       (cpl_timeout_avmm_address_wire      ), // [20:3] : Reserved. Tie them to 0.
        .cpl_timeout_avmm_write_i         (cpl_timeout_avmm_write_wire        ),
        .cpl_timeout_avmm_writedata_i     (cpl_timeout_avmm_writedata_wire    ),
        .cpl_timeout_avmm_readdata_o      (cpl_timeout_avmm_readdata_wire     ),
        .cpl_timeout_avmm_readdatavalid_o (cpl_timeout_avmm_readdatavalid_wire),
        // Completion Timeout Interface (only in R-tile)
        .cpl_timeout_i                    (cpl_timeout_i             ),
        .cpl_timeout_func_num_i           (cpl_timeout_func_num_i    ),
        .cpl_timeout_vfunc_num_i          (cpl_timeout_vfunc_num_i   ),
        .cpl_timeout_vfunc_active_i       (cpl_timeout_vfunc_active_i),
        .cpl_timeout_cpl_tc_i             (cpl_timeout_cpl_tc_i      ),
        .cpl_timeout_cpl_attr_i           (cpl_timeout_cpl_attr_i    ),
        .cpl_timeout_cpl_len_i            (cpl_timeout_cpl_len_i     ),
        .cpl_timeout_cpl_tag_i            (cpl_timeout_cpl_tag_i     ),

        .slow_clk                         (slow_clk  ),
        .slow_rst_n                       (slow_rst_n)
     );
  end else begin : gen_disable_cpl_timeout
     assign cpl_timeout_wire                    = '0;
     assign cpl_timeout_avmm_waitrequest_wire   = '0;
     assign cpl_timeout_avmm_readdata_wire      = '0;
     assign cpl_timeout_avmm_readdatavalid_wire = '0;
  end endgenerate

  intel_pcie_rtile_flr_intf #(
     .DEVICE_FAMILY  (device_family)
  ) rtile_flr_intf (
     // FLR interface from Dcore
     .flr_rcvd_pf_o                    (flr_rcvd_pf_wire          ),
     .flr_rcvd_vf_o                    (flr_rcvd_vf_wire          ),
     .flr_rcvd_pf_num_o                (flr_rcvd_pf_num_wire      ),
     .flr_rcvd_vf_num_o                (flr_rcvd_vf_num_wire      ),
     .flr_completed_pf_i               (flr_completed_pf_wire     ),
     .flr_completed_vf_i               (flr_completed_vf_wire     ),
     .flr_completed_pf_num_i           (flr_completed_pf_num_wire ),
     .flr_completed_vf_num_i           (flr_completed_vf_num_wire ),
     .flr_completed_ready_o            (flr_completed_ready_wire  ),

     .dcore_clk                        (clk  ),
     .dcore_rst_n                      (rst_n),

     // FLR interface from HIP
     .flr_rcvd_pf_i                    (flr_rcvd_pf_i          ),
     .flr_rcvd_vf_i                    (flr_rcvd_vf_i          ),
     .flr_rcvd_pf_num_i                (flr_rcvd_pf_num_i      ),
     .flr_rcvd_vf_num_i                (flr_rcvd_vf_num_i      ),
     .flr_completed_pf_o               (flr_completed_pf_o     ),
     .flr_completed_vf_o               (flr_completed_vf_o     ),
     .flr_completed_pf_num_o           (flr_completed_pf_num_o ),
     .flr_completed_vf_num_o           (flr_completed_vf_num_o ),
     .flr_completed_ready_i            (flr_completed_ready_i  ),

     .slow_clk                         (slow_clk  ),
     .slow_rst_n                       (slow_rst_n)
  );

  intel_pcie_rtile_error_intf #(
     .DEVICE_FAMILY  (device_family)
  ) rtile_error_intf (
     .dcore_app_err_valid_i            (app_err_valid_wire    ),
     .dcore_app_err_hdr_i              (app_err_hdr_wire      ),
     .dcore_app_err_info_i             (app_err_info_wire     ),
     .dcore_app_err_func_num_i         (app_err_func_num_wire ),
     .dcore_app_err_ready_o            (app_err_ready_wire    ),
     .dcore_clk                        (clk                   ),
     .dcore_rst_n                      (rst_n                 ),

     .app_err_valid_o                  (app_err_valid_o    ),
     .app_err_hdr_o                    (app_err_hdr_o      ),
     .app_err_info_o                   (app_err_info_o     ),
     .app_err_func_num_o               (app_err_func_num_o ),
     .serr_i                           (serr_i             ),
     .app_err_ready_i                  (app_err_ready_i    ),

     .slow_clk                         (slow_clk  ),
     .slow_rst_n                       (slow_rst_n)
  );


   assign hip_msi_pnd_func_o           = msi_enable_hwtcl ? hip_msi_pnd_func_wire : 3'd0;
   assign hip_msi_pnd_addr_o           = msi_enable_hwtcl ? hip_msi_pnd_addr_wire : 2'd0;
   assign hip_msi_pnd_byte_o           = msi_enable_hwtcl ? hip_msi_pnd_byte_wire : 8'd0;

  generate if (enable_data_mover_hwtcl) begin : dm_mode

      for (genvar i=0; i<4; i++) begin : h2d_avst_port
         assign h2d_st_sof_o      [i] = '0;
         assign h2d_st_eof_o      [i] = '0;
         assign h2d_st_empty_o    [i] = '0;
         assign h2d_st_valid_o    [i] = '0;
         assign h2d_st_data_o     [i] = '0;
         assign h2d_st_channel_o  [i] = '0;
      end

      for (genvar i=0; i<4; i++) begin : d2h_avst_port
         assign d2h_st_ready_o    [i] = '0;
      end

      assign usr_event_msix_ready_o    = '0;
      assign usr_flr_rcvd_val_o        = '0;
      assign usr_flr_rcvd_chan_num_o   = '0;

      assign cs_readdata_o             = '0;
      assign cs_readdatavalid_o        = '0;
      assign cs_response_o             = '0;
      assign cs_waitrequest_o          = '0;
      assign cs_writeresponsevalid_o   = '0;

  // Data Mover for External Descriptor controller IP instantiation
   intel_pcie_mcdma_dm
      #(
      // The value type (integer/string) will change based on hw_tcl development.
       .device_family_hwtcl                        (device_family                ),
       .tile_hwtcl                                 (tile_hwtcl                   ),
       .avst_endianness_big                        (avst_endianness_big          ),
       .enable_user_flr_hwtcl                      (enable_user_flr_hwtcl        ),
       .en_metadata_8_hwtcl                        (en_metadata_8_hwtcl          ),
       .maxpayload_size_hwtcl                      (maxpayload_size_hwtcl        ),
       .enable_bursting_master_hwtcl               (enable_bursting_master_hwtcl ),
       .enable_bursting_slave_hwtcl                (enable_bursting_slave_hwtcl  ),
       .enable_cii_hwtcl                           (enable_cii_hwtcl             ),
       .enable_cs_hwtcl                            (enable_cs_hwtcl              ),
       .seg_num                                    (seg_num_hwtcl                ),
       .seg_width                                  (seg_width_hwtcl              ),
       .single_width_integer_hwtcl                 (single_width_integer_hwtcl   ),
       .data_width_hwtcl                           (data_width_hwtcl             ),
       .burst_width_hwtcl                          (burst_width_hwtcl            ),
       .empty_width_hwtcl                          (empty_width_hwtcl            ),
       .einfo_width_hwtcl                          (einfo_width_hwtcl            ),
       .pfnum_hwtcl                                (pfnum_hwtcl                  ),
       .pfcnt_w_hwtcl                              (pfcnt_w_hwtcl                ),
       .vfcnt_w_hwtcl                              (vfcnt_w_hwtcl                ),
       .max_bar_address_width_hwtcl                (max_bar_address_width_hwtcl  ),
       .pfnum_width_hwtcl                          (pfnum_width_hwtcl            ),
       .vfnum_width_hwtcl                          (vfnum_width_hwtcl            ),
       .pio_address_width_hwtcl                    (pio_address_width_hwtcl      ),
       .pio_data_width_hwtcl                       (pio_data_width_hwtcl         ),
       .pio_bar2_size_per_f_hwtcl                  (pio_bar2_size_per_f_hwtcl    ),
       .pf0_enable_sriov_hwtcl                     (pf0_enable_sriov_hwtcl       ),
       .pf0_num_vf_per_pf_hwtcl                    (pf0_num_vf_per_pf_hwtcl      ),
       .pf1_enable_sriov_hwtcl                     (pf1_enable_sriov_hwtcl       ),
       .pf1_num_vf_per_pf_hwtcl                    (pf1_num_vf_per_pf_hwtcl      ),
       .pf2_enable_sriov_hwtcl                     (pf2_enable_sriov_hwtcl       ),
       .pf2_num_vf_per_pf_hwtcl                    (pf2_num_vf_per_pf_hwtcl      ),
       .pf3_enable_sriov_hwtcl                     (pf3_enable_sriov_hwtcl       ),
       .pf3_num_vf_per_pf_hwtcl                    (pf3_num_vf_per_pf_hwtcl      ),
       .pf4_enable_sriov_hwtcl                     (pf4_enable_sriov_hwtcl       ),
       .pf4_num_vf_per_pf_hwtcl                    (pf4_num_vf_per_pf_hwtcl      ),
       .pf5_enable_sriov_hwtcl                     (pf5_enable_sriov_hwtcl       ),
       .pf5_num_vf_per_pf_hwtcl                    (pf5_num_vf_per_pf_hwtcl      ),
       .pf6_enable_sriov_hwtcl                     (pf6_enable_sriov_hwtcl       ),
       .pf6_num_vf_per_pf_hwtcl                    (pf6_num_vf_per_pf_hwtcl      ),
       .pf7_enable_sriov_hwtcl                     (pf7_enable_sriov_hwtcl       ),
       .pf7_num_vf_per_pf_hwtcl                    (pf7_num_vf_per_pf_hwtcl      ),
       .cs_address_width_hwtcl                     (cs_address_width_hwtcl       ),

       .pf0_bar0_address_width_hwtcl               (core16_pf0_bar0_address_width_hwtcl),
       .pf0_bar1_address_width_hwtcl               (core16_pf0_bar1_address_width_hwtcl),
       .pf0_bar2_address_width_hwtcl               (core16_pf0_bar2_address_width_hwtcl),
       .pf0_bar3_address_width_hwtcl               (core16_pf0_bar3_address_width_hwtcl),
       .pf0_bar4_address_width_hwtcl               (core16_pf0_bar4_address_width_hwtcl),
       .pf0_bar5_address_width_hwtcl               (core16_pf0_bar5_address_width_hwtcl),
       .pf1_bar0_address_width_hwtcl               (core16_pf1_bar0_address_width_hwtcl),
       .pf1_bar1_address_width_hwtcl               (core16_pf1_bar1_address_width_hwtcl),
       .pf1_bar2_address_width_hwtcl               (core16_pf1_bar2_address_width_hwtcl),
       .pf1_bar3_address_width_hwtcl               (core16_pf1_bar3_address_width_hwtcl),
       .pf1_bar4_address_width_hwtcl               (core16_pf1_bar4_address_width_hwtcl),
       .pf1_bar5_address_width_hwtcl               (core16_pf1_bar5_address_width_hwtcl),
       .pf2_bar0_address_width_hwtcl               (core16_pf2_bar0_address_width_hwtcl),
       .pf2_bar1_address_width_hwtcl               (core16_pf2_bar1_address_width_hwtcl),
       .pf2_bar2_address_width_hwtcl               (core16_pf2_bar2_address_width_hwtcl),
       .pf2_bar3_address_width_hwtcl               (core16_pf2_bar3_address_width_hwtcl),
       .pf2_bar4_address_width_hwtcl               (core16_pf2_bar4_address_width_hwtcl),
       .pf2_bar5_address_width_hwtcl               (core16_pf2_bar5_address_width_hwtcl),
       .pf3_bar0_address_width_hwtcl               (core16_pf3_bar0_address_width_hwtcl),
       .pf3_bar1_address_width_hwtcl               (core16_pf3_bar1_address_width_hwtcl),
       .pf3_bar2_address_width_hwtcl               (core16_pf3_bar2_address_width_hwtcl),
       .pf3_bar3_address_width_hwtcl               (core16_pf3_bar3_address_width_hwtcl),
       .pf3_bar4_address_width_hwtcl               (core16_pf3_bar4_address_width_hwtcl),
       .pf3_bar5_address_width_hwtcl               (core16_pf3_bar5_address_width_hwtcl),
       .pf4_bar0_address_width_hwtcl               (core16_pf4_bar0_address_width_hwtcl),
       .pf4_bar1_address_width_hwtcl               (core16_pf4_bar1_address_width_hwtcl),
       .pf4_bar2_address_width_hwtcl               (core16_pf4_bar2_address_width_hwtcl),
       .pf4_bar3_address_width_hwtcl               (core16_pf4_bar3_address_width_hwtcl),
       .pf4_bar4_address_width_hwtcl               (core16_pf4_bar4_address_width_hwtcl),
       .pf4_bar5_address_width_hwtcl               (core16_pf4_bar5_address_width_hwtcl),
       .pf5_bar0_address_width_hwtcl               (core16_pf5_bar0_address_width_hwtcl),
       .pf5_bar1_address_width_hwtcl               (core16_pf5_bar1_address_width_hwtcl),
       .pf5_bar2_address_width_hwtcl               (core16_pf5_bar2_address_width_hwtcl),
       .pf5_bar3_address_width_hwtcl               (core16_pf5_bar3_address_width_hwtcl),
       .pf5_bar4_address_width_hwtcl               (core16_pf5_bar4_address_width_hwtcl),
       .pf5_bar5_address_width_hwtcl               (core16_pf5_bar5_address_width_hwtcl),
       .pf6_bar0_address_width_hwtcl               (core16_pf6_bar0_address_width_hwtcl),
       .pf6_bar1_address_width_hwtcl               (core16_pf6_bar1_address_width_hwtcl),
       .pf6_bar2_address_width_hwtcl               (core16_pf6_bar2_address_width_hwtcl),
       .pf6_bar3_address_width_hwtcl               (core16_pf6_bar3_address_width_hwtcl),
       .pf6_bar4_address_width_hwtcl               (core16_pf6_bar4_address_width_hwtcl),
       .pf6_bar5_address_width_hwtcl               (core16_pf6_bar5_address_width_hwtcl),
       .pf7_bar0_address_width_hwtcl               (core16_pf7_bar0_address_width_hwtcl),
       .pf7_bar1_address_width_hwtcl               (core16_pf7_bar1_address_width_hwtcl),
       .pf7_bar2_address_width_hwtcl               (core16_pf7_bar2_address_width_hwtcl),
       .pf7_bar3_address_width_hwtcl               (core16_pf7_bar3_address_width_hwtcl),
       .pf7_bar4_address_width_hwtcl               (core16_pf7_bar4_address_width_hwtcl),
       .pf7_bar5_address_width_hwtcl               (core16_pf7_bar5_address_width_hwtcl),

       .pf0_vf_bar0_address_width_hwtcl            (core16_pf0_sriov_vf_bar0_address_width_hwtcl),
       .pf0_vf_bar1_address_width_hwtcl            (core16_pf0_sriov_vf_bar1_address_width_hwtcl),
       .pf0_vf_bar2_address_width_hwtcl            (core16_pf0_sriov_vf_bar2_address_width_hwtcl),
       .pf0_vf_bar3_address_width_hwtcl            (core16_pf0_sriov_vf_bar3_address_width_hwtcl),
       .pf0_vf_bar4_address_width_hwtcl            (core16_pf0_sriov_vf_bar4_address_width_hwtcl),
       .pf0_vf_bar5_address_width_hwtcl            (core16_pf0_sriov_vf_bar5_address_width_hwtcl),
       .pf1_vf_bar0_address_width_hwtcl            (core16_pf1_sriov_vf_bar0_address_width_hwtcl),
       .pf1_vf_bar1_address_width_hwtcl            (core16_pf1_sriov_vf_bar1_address_width_hwtcl),
       .pf1_vf_bar2_address_width_hwtcl            (core16_pf1_sriov_vf_bar2_address_width_hwtcl),
       .pf1_vf_bar3_address_width_hwtcl            (core16_pf1_sriov_vf_bar3_address_width_hwtcl),
       .pf1_vf_bar4_address_width_hwtcl            (core16_pf1_sriov_vf_bar4_address_width_hwtcl),
       .pf1_vf_bar5_address_width_hwtcl            (core16_pf1_sriov_vf_bar5_address_width_hwtcl),
       .pf2_vf_bar0_address_width_hwtcl            (core16_pf2_sriov_vf_bar0_address_width_hwtcl),
       .pf2_vf_bar1_address_width_hwtcl            (core16_pf2_sriov_vf_bar1_address_width_hwtcl),
       .pf2_vf_bar2_address_width_hwtcl            (core16_pf2_sriov_vf_bar2_address_width_hwtcl),
       .pf2_vf_bar3_address_width_hwtcl            (core16_pf2_sriov_vf_bar3_address_width_hwtcl),
       .pf2_vf_bar4_address_width_hwtcl            (core16_pf2_sriov_vf_bar4_address_width_hwtcl),
       .pf2_vf_bar5_address_width_hwtcl            (core16_pf2_sriov_vf_bar5_address_width_hwtcl),
       .pf3_vf_bar0_address_width_hwtcl            (core16_pf3_sriov_vf_bar0_address_width_hwtcl),
       .pf3_vf_bar1_address_width_hwtcl            (core16_pf3_sriov_vf_bar1_address_width_hwtcl),
       .pf3_vf_bar2_address_width_hwtcl            (core16_pf3_sriov_vf_bar2_address_width_hwtcl),
       .pf3_vf_bar3_address_width_hwtcl            (core16_pf3_sriov_vf_bar3_address_width_hwtcl),
       .pf3_vf_bar4_address_width_hwtcl            (core16_pf3_sriov_vf_bar4_address_width_hwtcl),
       .pf3_vf_bar5_address_width_hwtcl            (core16_pf3_sriov_vf_bar5_address_width_hwtcl),
       .pf4_vf_bar0_address_width_hwtcl            (core16_pf4_sriov_vf_bar0_address_width_hwtcl),
       .pf4_vf_bar1_address_width_hwtcl            (core16_pf4_sriov_vf_bar1_address_width_hwtcl),
       .pf4_vf_bar2_address_width_hwtcl            (core16_pf4_sriov_vf_bar2_address_width_hwtcl),
       .pf4_vf_bar3_address_width_hwtcl            (core16_pf4_sriov_vf_bar3_address_width_hwtcl),
       .pf4_vf_bar4_address_width_hwtcl            (core16_pf4_sriov_vf_bar4_address_width_hwtcl),
       .pf4_vf_bar5_address_width_hwtcl            (core16_pf4_sriov_vf_bar5_address_width_hwtcl),
       .pf5_vf_bar0_address_width_hwtcl            (core16_pf5_sriov_vf_bar0_address_width_hwtcl),
       .pf5_vf_bar1_address_width_hwtcl            (core16_pf5_sriov_vf_bar1_address_width_hwtcl),
       .pf5_vf_bar2_address_width_hwtcl            (core16_pf5_sriov_vf_bar2_address_width_hwtcl),
       .pf5_vf_bar3_address_width_hwtcl            (core16_pf5_sriov_vf_bar3_address_width_hwtcl),
       .pf5_vf_bar4_address_width_hwtcl            (core16_pf5_sriov_vf_bar4_address_width_hwtcl),
       .pf5_vf_bar5_address_width_hwtcl            (core16_pf5_sriov_vf_bar5_address_width_hwtcl),
       .pf6_vf_bar0_address_width_hwtcl            (core16_pf6_sriov_vf_bar0_address_width_hwtcl),
       .pf6_vf_bar1_address_width_hwtcl            (core16_pf6_sriov_vf_bar1_address_width_hwtcl),
       .pf6_vf_bar2_address_width_hwtcl            (core16_pf6_sriov_vf_bar2_address_width_hwtcl),
       .pf6_vf_bar3_address_width_hwtcl            (core16_pf6_sriov_vf_bar3_address_width_hwtcl),
       .pf6_vf_bar4_address_width_hwtcl            (core16_pf6_sriov_vf_bar4_address_width_hwtcl),
       .pf6_vf_bar5_address_width_hwtcl            (core16_pf6_sriov_vf_bar5_address_width_hwtcl),
       .pf7_vf_bar0_address_width_hwtcl            (core16_pf7_sriov_vf_bar0_address_width_hwtcl),
       .pf7_vf_bar1_address_width_hwtcl            (core16_pf7_sriov_vf_bar1_address_width_hwtcl),
       .pf7_vf_bar2_address_width_hwtcl            (core16_pf7_sriov_vf_bar2_address_width_hwtcl),
       .pf7_vf_bar3_address_width_hwtcl            (core16_pf7_sriov_vf_bar3_address_width_hwtcl),
       .pf7_vf_bar4_address_width_hwtcl            (core16_pf7_sriov_vf_bar4_address_width_hwtcl),
       .pf7_vf_bar5_address_width_hwtcl            (core16_pf7_sriov_vf_bar5_address_width_hwtcl)

    ) data_mover_inst  (
        // clock and reset
        .clk                                   (clk),
        .rst_n                                 (rst_n),
        // Slow clock and reset from HIP
        .slow_clk                              (slow_clk),
        .slow_rst_n                            (slow_rst_n),

        .app_rst_n                             (app_rst_n),

        // Interface to the Streaming ports of HIP.
        //RX Ports
        .rx_st_ready_o                         (rx_st_ready_wire),
        .rx_st_valid_i                         (rx_st_valid_wire),
        .rx_st_sop_i                           (rx_st_sop_wire),
        .rx_st_eop_i                           (rx_st_eop_wire),
        .rx_st_hdr_i                           (rx_st_hdr_wire),
        .rx_st_data_i                          (rx_st_data_wire),
        .rx_st_vf_active_i                     (rx_st_vf_active_wire),
        .rx_st_func_num_i                      (rx_st_func_num_wire),
        .rx_st_vf_num_i                        (rx_st_vf_num_wire),
        .rx_st_bar_range_i                     (rx_st_bar_range_wire),
        .rx_par_err_i                          (rx_par_err_wire),

        //TX Ports
        .tx_st_ready_i                         (tx_st_ready_wire),
        .tx_par_err_i                          (tx_par_err_wire),
        .tx_st_valid_o                         (tx_st_valid_wire),
        .tx_st_sop_o                           (tx_st_sop_wire),
        .tx_st_eop_o                           (tx_st_eop_wire),
        .tx_st_err_o                           (tx_st_err_wire),
        .tx_st_hdr_o                           (tx_st_hdr_wire),
        .tx_st_data_o                          (tx_st_data_wire),
        .tx_st_vf_active_o                     (tx_st_vf_active_wire),

        // Streaming Packets HIP Credit Interface.
        .tx_cdts_limit_i                       (tx_cdts_limit_wire            ),
        .tx_cdts_limit_tdm_idx_i               (tx_cdts_limit_tdm_idx_wire    ),
        .rx_buffer_limit_o                     (rx_buffer_limit_wire          ),
        .rx_buffer_limit_tdm_idx_o             (rx_buffer_limit_tdm_idx_wire  ),

        .dl_timer_update_i                     (dl_timer_update_i),
        .dl_up_i                               (dl_up_i), //  signal indicates the Data Link (DL) Layer is active
        .link_up_i                             (link_up_i), // signal indicates the link is up

        // HIP Misc interface
        // Config Interface
        .hip_tl_cfg_func_i                     ('0),
        .hip_tl_cfg_add_i                      ('0),
        .hip_tl_cfg_ctl_i                      ('0),

        .hip_10bits_tag_req_en_i               ('0),

        // HIP REconfig interface
        .hip_reconfig_address_o                ( hip_reconfig_address_o       ) ,
        .hip_reconfig_read_o                   ( hip_reconfig_read_o          ) ,
        .hip_reconfig_readdata_i               ( hip_reconfig_readdata_i      ) ,
        .hip_reconfig_readdatavalid_i          ( hip_reconfig_readdatavalid_i ) ,
        .hip_reconfig_waitrequest_i            ( hip_reconfig_waitrequest_i   ) ,
        .hip_reconfig_write_o                  ( hip_reconfig_write_o         ),
        .hip_reconfig_writedata_o              ( hip_reconfig_writedata_o     ),

        .hip_cii_req_i                         ( cii_req_i                    ),
        .hip_cii_hdr_poisoned_i                ( cii_hdr_poisoned_i           ),
        .hip_cii_hdr_first_be_i                ( cii_hdr_first_be_i           ),
        .hip_cii_func_num_i                    ( cii_func_num_i               ),
        .hip_cii_wr_i                          ( cii_wr_i                     ),
        .hip_cii_addr_i                        ( cii_addr_i                   ),
        .hip_cii_dout_i                        ( cii_dout_i                   ),
        .hip_cii_override_en_o                 ( cii_override_en_o            ),
        .hip_cii_override_din_o                ( cii_override_din_o           ),
        .hip_cii_halt_o                        ( cii_halt_o                   ),
        .hip_cii_wr_vf_active_i                ( cii_wr_vf_active_i           ),
        .hip_cii_vf_num_i                      ( cii_vf_num_i                 ),

        .usr_cii_req_o                         ( usr_cii_req_o                ),
        .usr_cii_hdr_poisoned_o                ( usr_cii_hdr_poisoned_o       ),
        .usr_cii_hdr_first_be_o                ( usr_cii_hdr_first_be_o       ),
        .usr_cii_func_num_o                    ( usr_cii_func_num_o           ),
        .usr_cii_wr_o                          ( usr_cii_wr_o                 ),
        .usr_cii_addr_o                        ( usr_cii_addr_o               ),
        .usr_cii_dout_o                        ( usr_cii_dout_o               ),
        .usr_cii_wr_vf_active_o                ( usr_cii_wr_vf_active_o       ),
        .usr_cii_vf_num_o                      ( usr_cii_vf_num_o             ),

        .usr_hip_reconfig_address_i      (usr_hip_reconfig_address_i        ),
        .usr_hip_reconfig_read_i         (usr_hip_reconfig_read_i           ),
        .usr_hip_reconfig_write_i        (usr_hip_reconfig_write_i          ),
        .usr_hip_reconfig_writedata_i    (usr_hip_reconfig_writedata_i      ),
        .usr_hip_reconfig_readdata_o     (usr_hip_reconfig_readdata_o       ),
        .usr_hip_reconfig_readdatavalid_o(usr_hip_reconfig_readdatavalid_o  ),
        .usr_hip_reconfig_waitrequest_o  (usr_hip_reconfig_waitrequest_o    ),

        .usr_hip_tl_cfg_ctl_o (),
        .usr_hip_tl_cfg_add_o (),
        .usr_hip_tl_cfg_func_o(),

        // H2D AVMM Master Interface
        .h2ddm_waitrequest_i                   ( h2ddm_waitrequest_i          ) ,
        .h2ddm_writeresponsevalid_i            ( h2ddm_writeresponsevalid_i   ) ,
        .h2ddm_write_o                         ( h2ddm_write_o                ) ,
        .h2ddm_address_o                       ( h2ddm_address_o              ) ,
        .h2ddm_burstcount_o                    ( h2ddm_burstcount_o           ) ,
        .h2ddm_byteenable_o                    ( h2ddm_byteenable_o           ) ,
        .h2ddm_writedata_o                     ( h2ddm_writedata_o            ) ,

        // D2H AVMM Read Master Interface
        .d2hdm_address_o                       ( d2hdm_address_o              ) ,
        .d2hdm_byteenable_o                    ( d2hdm_byteenable_o           ) ,
        .d2hdm_read_o                          ( d2hdm_read_o                 ) ,
        .d2hdm_burstcount_o                    ( d2hdm_burstcount_o           ) ,
        .d2hdm_waitrequest_i                   ( d2hdm_waitrequest_i          ) ,
        .d2hdm_readdata_i                      ( d2hdm_readdata_i             ) ,
        .d2hdm_readdatavalid_i                 ( d2hdm_readdatavalid_i        ) ,
        .d2hdm_response_i                      ( d2hdm_response_i             ) ,

        .h2ddm_desc_ready_o                    ( h2ddm_desc_ready_o                ),
        .h2ddm_desc_valid_i                    ( h2ddm_desc_valid_i                ),
        .h2ddm_desc_data_i                     ( h2ddm_desc_data_i                 ), // h2d_desc_bypass_t

        .h2ddm_desc_status_data_o              ( h2ddm_desc_status_data_o          ), // h2d_desc_status_t
        .h2ddm_desc_status_valid_o             ( h2ddm_desc_status_valid_o         ),

        .h2ddm_desc_cmpl_data_o                ( h2ddm_desc_cmpl_data_o            ), // h2d_desc_cmpl_t
        .h2ddm_desc_cmpl_empty_o               ( h2ddm_desc_cmpl_empty_o           ),
        .h2ddm_desc_cmpl_sop_o                 ( h2ddm_desc_cmpl_sop_o             ),
        .h2ddm_desc_cmpl_eop_o                 ( h2ddm_desc_cmpl_eop_o             ),
        .h2ddm_desc_cmpl_valid_o               ( h2ddm_desc_cmpl_valid_o           ),
        .h2ddm_desc_cmpl_ready_i               ( h2ddm_desc_cmpl_ready_i           ),

        .d2hdm_desc_ready_o                    ( d2hdm_desc_ready_o                ),
        .d2hdm_desc_valid_i                    ( d2hdm_desc_valid_i                ),
        .d2hdm_desc_data_i                     ( d2hdm_desc_data_i                 ), // d2h_desc_bypass_t

        .d2hdm_desc_status_data_o              ( d2hdm_desc_status_data_o          ), // d2h_desc_status_t
        .d2hdm_desc_status_valid_o             ( d2hdm_desc_status_valid_o         ),

        // AVMM Master PIO interface
        .rx_pio_address_o                      ( rx_pio_address_o             ) ,
        .rx_pio_byteenable_o                   ( rx_pio_byteenable_o          ) ,
        .rx_pio_read_o                         ( rx_pio_read_o                ) ,
        .rx_pio_write_o                        ( rx_pio_write_o               ) ,
        .rx_pio_writedata_o                    ( rx_pio_writedata_o           ) ,
        .rx_pio_burstcount_o                   ( rx_pio_burstcount_o          ) ,
        .rx_pio_waitrequest_i                  ( rx_pio_waitrequest_i         ) ,
        .rx_pio_readdata_i                     ( rx_pio_readdata_i            ) ,
        .rx_pio_readdatavalid_i                ( rx_pio_readdatavalid_i       ) ,
        .rx_pio_response_i                     ( rx_pio_response_i            ) ,
        .rx_pio_writeresponsevalid_i           ( rx_pio_writeresponsevalid_i  ) ,

        // FLR interface from HIP
        .flr_rcvd_pf_i                         ( flr_rcvd_pf_wire                ) ,
        .flr_rcvd_vf_i                         ( flr_rcvd_vf_wire                ) ,
        .flr_rcvd_pf_num_i                     ( flr_rcvd_pf_num_wire            ) ,
        .flr_rcvd_vf_num_i                     ( flr_rcvd_vf_num_wire            ) ,
        .flr_completed_pf_o                    ( flr_completed_pf_wire           ) ,
        .flr_completed_vf_o                    ( flr_completed_vf_wire           ) ,
        .flr_completed_pf_num_o                ( flr_completed_pf_num_wire       ) ,
        .flr_completed_vf_num_o                ( flr_completed_vf_num_wire       ) ,
        .flr_completed_ready_i                 ( flr_completed_ready_wire        ) ,
        //  Completion Timeout Interface (only in P-tile)
        .cpl_timeout_i                         ( cpl_timeout_wire                    ),
        .cpl_timeout_avmm_waitrequest_i        ( cpl_timeout_avmm_waitrequest_wire   ),
        .cpl_timeout_avmm_read_o               ( cpl_timeout_avmm_read_wire          ),
        .cpl_timeout_avmm_address_o            ( cpl_timeout_avmm_address_wire       ), // [20:3] : Reserved. Tie them to 0.
        .cpl_timeout_avmm_write_o              ( cpl_timeout_avmm_write_wire         ),
        .cpl_timeout_avmm_writedata_o          ( cpl_timeout_avmm_writedata_wire     ),
        .cpl_timeout_avmm_readdata_i           ( cpl_timeout_avmm_readdata_wire      ),
        .cpl_timeout_avmm_readdatavalid_i      ( cpl_timeout_avmm_readdatavalid_wire ),
        // Error interface to HIP
        .app_err_ready_i                       ( app_err_ready_wire              ) , // Backpreasure ready from R-Tile
        .app_err_valid_o                       ( app_err_valid_wire              ) ,
        .app_err_hdr_o                         ( app_err_hdr_wire                ) ,
        .app_err_info_o                        ( app_err_info_wire               ) , //S10:app_err_info[10:0]
        .app_err_func_num_o                    ( app_err_func_num_wire           ) , //S10: app_err_func_num[1:0]

        //BAS
        .bas_vfactive_i                        ( (enable_bursting_slave_hwtcl) ? bas_vfactive_i    : '0 ),
        .bas_pfnum_i                           ( (enable_bursting_slave_hwtcl) ? bas_pfnum_i       : '0 ),
        .bas_vfnum_i                           ( (enable_bursting_slave_hwtcl) ? bas_vfnum_i       : '0 ),
        .bas_address_i                         ( (enable_bursting_slave_hwtcl) ? 64'(bas_address_i): '0 ),
        .bas_byteenable_i                      ( (enable_bursting_slave_hwtcl) ? bas_byteenable_i  : '0 ),
        .bas_read_i                            ( (enable_bursting_slave_hwtcl) ? bas_read_i        : '0 ),
        .bas_write_i                           ( (enable_bursting_slave_hwtcl) ? bas_write_i       : '0 ),
        .bas_writedata_i                       ( (enable_bursting_slave_hwtcl) ? bas_writedata_i   : '0 ),
        .bas_burstcount_i                      ( (enable_bursting_slave_hwtcl) ? bas_burstcount_i  : '0 ),
        .bas_waitrequest_o                     (  bas_waitrequest_o   ),
        .bas_readdata_o                        (  bas_readdata_o      ),
        .bas_readdatavalid_o                   (  bas_readdatavalid_o ),
        .bas_response_o                        (  bas_response_o      ),

        // BAM interface
        .bam_readdatavalid_i                   ( (enable_bursting_master_hwtcl) ? bam_readdatavalid_i : '0 ),
        .bam_readdata_i                        ( (enable_bursting_master_hwtcl) ? bam_readdata_i      : '0 ),
        .bam_waitrequest_i                     ( (enable_bursting_master_hwtcl) ? bam_waitrequest_i   : '0 ),
      //.bam_vfactive_o                        ( bam_vfactive_o   ),
      //.bam_pfnum_o                           ( bam_pfnum_o      ),
      //.bam_vfnum_o                           ( bam_vfnum_o      ),
      //.bam_bar_o                             ( bam_bar_o        ),
        .bam_address_o                         ( bam_address_o    ),
        .bam_burstcount_o                      ( bam_burstcount_o ),
        .bam_byteenable_o                      ( bam_byteenable_o ),
        .bam_read_o                            ( bam_read_o       ),
        .bam_write_o                           ( bam_write_o      ),
        .bam_writedata_o                       ( bam_writedata_o  )
      );

   end else begin : dma_mode

      if (num_h2d_uport_hwtcl <= 1) begin : h2d_avst_port
         for (genvar i=1; i<4; i++) begin : port_loop
            assign h2d_st_sof_o      [i] = '0;
            assign h2d_st_eof_o      [i] = '0;
            assign h2d_st_empty_o    [i] = '0;
            assign h2d_st_valid_o    [i] = '0;
            assign h2d_st_data_o     [i] = '0;
            assign h2d_st_channel_o  [i] = '0;
         end
      end

      if (num_d2h_uport_hwtcl <= 1) begin : d2h_avst_port
         for (genvar i=1; i<4; i++) begin : port_loop
            assign d2h_st_ready_o    [i] = '0;
         end
      end

      assign d2hdm_desc_ready_o           = '0;
      assign d2hdm_desc_status_data_o     = '0;
      assign d2hdm_desc_status_valid_o    = '0;
      assign h2ddm_desc_cmpl_data_o       = '0;
      assign h2ddm_desc_cmpl_empty_o      = '0;
      assign h2ddm_desc_cmpl_eop_o        = '0;
      assign h2ddm_desc_cmpl_sop_o        = '0;
      assign h2ddm_desc_cmpl_valid_o      = '0;
      assign h2ddm_desc_ready_o           = '0;
      assign h2ddm_desc_status_data_o     = '0;
      assign h2ddm_desc_status_valid_o    = '0;

  // Multi Channel DMA IP instantiation
   intel_pcie_mcdma
      #(
      // The value type (integer/string) will change based on hw_tcl development.
       .device_family_hwtcl                        (device_family                ),
       .tile_hwtcl                                 (tile_hwtcl                   ),
       .core_index_hwtcl                           (core_index_hwtcl             ),
       .avst_endianness_big                        (avst_endianness_big          ),
       .enable_user_flr_hwtcl                      (enable_user_flr_hwtcl        ),
       .en_metadata_8_hwtcl                        (en_metadata_8_hwtcl          ),
       .en_10bit_tag_hwtcl                         (en_10bit_tag_hwtcl           ),
       .enable_32bit_address_hwtcl                 (enable_32bit_address_hwtcl   ),
       .maxpayload_size_hwtcl                      (maxpayload_size_hwtcl        ),
       .enable_bursting_master_hwtcl               (enable_bursting_master_hwtcl ),
       .enable_bursting_slave_hwtcl                (enable_bursting_slave_hwtcl  ),
       .enable_cpl_timeout_hwtcl                   (enable_cpl_timeout_hwtcl     ),
       .enable_mcdma_hwtcl                         (enable_mcdma_hwtcl           ),
       .enable_byte_aligned_txfr_hwtcl             (enable_byte_aligned_txfr_hwtcl),
       .enable_cii_hwtcl                           (enable_cii_hwtcl             ),
       .enable_cs_hwtcl                            (enable_cs_hwtcl              ),
       .seg_num                                    (seg_num_hwtcl                ),
       .seg_width                                  (seg_width_hwtcl              ),
       .single_width_integer_hwtcl                 (single_width_integer_hwtcl   ),
       .data_width_hwtcl                           (data_width_hwtcl             ),
       .address_width_hwtcl                        (address_width_hwtcl          ),
       .einfo_width_hwtcl                          (einfo_width_hwtcl            ),
       .pfnum_hwtcl                                (pfnum_hwtcl                  ),
       .pfcnt_w_hwtcl                              (pfcnt_w_hwtcl                ),
       .vfcnt_w_hwtcl                              (vfcnt_w_hwtcl                ),
       .max_bar_address_width_hwtcl                (max_bar_address_width_hwtcl  ),
       .pfnum_width_hwtcl                          (pfnum_width_hwtcl            ),
       .vfnum_width_hwtcl                          (vfnum_width_hwtcl            ),
       .pio_address_width_hwtcl                    (pio_address_width_hwtcl      ),
       .pio_data_width_hwtcl                       (pio_data_width_hwtcl         ),
       .pio_bar2_size_per_f_hwtcl                  (pio_bar2_size_per_f_hwtcl    ),
       .num_h2d_uport_hwtcl                        (num_h2d_uport_hwtcl          ),
       .num_d2h_uport_hwtcl                        (num_d2h_uport_hwtcl          ),
       .uport_type_h2d_hwtcl                       (uport_type_h2d_hwtcl         ),
       .uport_type_d2h_hwtcl                       (uport_type_d2h_hwtcl         ),
       .d2h_num_active_channel_hwtcl               (d2h_num_active_channel_hwtcl ),
       .d2h_max_num_desc_fetch_hwtcl               (d2h_max_num_desc_fetch_hwtcl ),
       .pf0_enable_sriov_hwtcl                     (pf0_enable_sriov_hwtcl       ),
       .pf0_num_vf_per_pf_hwtcl                    (pf0_num_vf_per_pf_hwtcl      ),
       .pf0_num_dma_chan_pf_hwtcl                  (pf0_num_dma_chan_pf_hwtcl    ),
       .pf0_num_dma_chan_per_vf_hwtcl              (pf0_num_dma_chan_per_vf_hwtcl),
       .pf1_enable_sriov_hwtcl                     (pf1_enable_sriov_hwtcl       ),
       .pf1_num_vf_per_pf_hwtcl                    (pf1_num_vf_per_pf_hwtcl      ),
       .pf1_num_dma_chan_pf_hwtcl                  (pf1_num_dma_chan_pf_hwtcl    ),
       .pf1_num_dma_chan_per_vf_hwtcl              (pf1_num_dma_chan_per_vf_hwtcl),
       .pf2_enable_sriov_hwtcl                     (pf2_enable_sriov_hwtcl       ),
       .pf2_num_vf_per_pf_hwtcl                    (pf2_num_vf_per_pf_hwtcl      ),
       .pf2_num_dma_chan_pf_hwtcl                  (pf2_num_dma_chan_pf_hwtcl    ),
       .pf2_num_dma_chan_per_vf_hwtcl              (pf2_num_dma_chan_per_vf_hwtcl),
       .pf3_enable_sriov_hwtcl                     (pf3_enable_sriov_hwtcl       ),
       .pf3_num_vf_per_pf_hwtcl                    (pf3_num_vf_per_pf_hwtcl      ),
       .pf3_num_dma_chan_pf_hwtcl                  (pf3_num_dma_chan_pf_hwtcl    ),
       .pf3_num_dma_chan_per_vf_hwtcl              (pf3_num_dma_chan_per_vf_hwtcl),
       .pf4_enable_sriov_hwtcl                     (pf4_enable_sriov_hwtcl       ),
       .pf4_num_vf_per_pf_hwtcl                    (pf4_num_vf_per_pf_hwtcl      ),
       .pf4_num_dma_chan_pf_hwtcl                  (pf4_num_dma_chan_pf_hwtcl    ),
       .pf4_num_dma_chan_per_vf_hwtcl              (pf4_num_dma_chan_per_vf_hwtcl),
       .pf5_enable_sriov_hwtcl                     (pf5_enable_sriov_hwtcl       ),
       .pf5_num_vf_per_pf_hwtcl                    (pf5_num_vf_per_pf_hwtcl      ),
       .pf5_num_dma_chan_pf_hwtcl                  (pf5_num_dma_chan_pf_hwtcl    ),
       .pf5_num_dma_chan_per_vf_hwtcl              (pf5_num_dma_chan_per_vf_hwtcl),
       .pf6_enable_sriov_hwtcl                     (pf6_enable_sriov_hwtcl       ),
       .pf6_num_vf_per_pf_hwtcl                    (pf6_num_vf_per_pf_hwtcl      ),
       .pf6_num_dma_chan_pf_hwtcl                  (pf6_num_dma_chan_pf_hwtcl    ),
       .pf6_num_dma_chan_per_vf_hwtcl              (pf6_num_dma_chan_per_vf_hwtcl),
       .pf7_enable_sriov_hwtcl                     (pf7_enable_sriov_hwtcl       ),
       .pf7_num_vf_per_pf_hwtcl                    (pf7_num_vf_per_pf_hwtcl      ),
       .pf7_num_dma_chan_pf_hwtcl                  (pf7_num_dma_chan_pf_hwtcl    ),
       .pf7_num_dma_chan_per_vf_hwtcl              (pf7_num_dma_chan_per_vf_hwtcl),
       .cs_address_width_hwtcl                     (cs_address_width_hwtcl       ),
       .att_en_for_bas_cs_hwtcl                    (att_en_for_bas_cs_hwtcl                      ),
       .mapping_table_address_width_hwtcl          (mapping_table_address_width_hwtcl            ),
       .mapping_window_address_width_hwtcl         (mapping_window_address_width_hwtcl           ),
       .msi_enable_hwtcl                           ( msi_enable_hwtcl                            ),
       .per_vec_mask_capable_hwtcl                 ( per_vec_mask_capable_hwtcl                  ),
       .addr_64bit_capable_hwtcl                   ( addr_64bit_capable_hwtcl                    ),
       .multi_msg_capable_hwtcl                    ( multi_msg_capable_hwtcl                     ),
       .ext_msg_data_capable_hwtcl                 ( ext_msg_data_capable_hwtcl                  ),

       .pf0_bar0_address_width_hwtcl               (core16_pf0_bar0_address_width_hwtcl),
       .pf0_bar1_address_width_hwtcl               (core16_pf0_bar1_address_width_hwtcl),
       .pf0_bar2_address_width_hwtcl               (core16_pf0_bar2_address_width_hwtcl),
       .pf0_bar3_address_width_hwtcl               (core16_pf0_bar3_address_width_hwtcl),
       .pf0_bar4_address_width_hwtcl               (core16_pf0_bar4_address_width_hwtcl),
       .pf0_bar5_address_width_hwtcl               (core16_pf0_bar5_address_width_hwtcl),
       .pf1_bar0_address_width_hwtcl               (core16_pf1_bar0_address_width_hwtcl),
       .pf1_bar1_address_width_hwtcl               (core16_pf1_bar1_address_width_hwtcl),
       .pf1_bar2_address_width_hwtcl               (core16_pf1_bar2_address_width_hwtcl),
       .pf1_bar3_address_width_hwtcl               (core16_pf1_bar3_address_width_hwtcl),
       .pf1_bar4_address_width_hwtcl               (core16_pf1_bar4_address_width_hwtcl),
       .pf1_bar5_address_width_hwtcl               (core16_pf1_bar5_address_width_hwtcl),
       .pf2_bar0_address_width_hwtcl               (core16_pf2_bar0_address_width_hwtcl),
       .pf2_bar1_address_width_hwtcl               (core16_pf2_bar1_address_width_hwtcl),
       .pf2_bar2_address_width_hwtcl               (core16_pf2_bar2_address_width_hwtcl),
       .pf2_bar3_address_width_hwtcl               (core16_pf2_bar3_address_width_hwtcl),
       .pf2_bar4_address_width_hwtcl               (core16_pf2_bar4_address_width_hwtcl),
       .pf2_bar5_address_width_hwtcl               (core16_pf2_bar5_address_width_hwtcl),
       .pf3_bar0_address_width_hwtcl               (core16_pf3_bar0_address_width_hwtcl),
       .pf3_bar1_address_width_hwtcl               (core16_pf3_bar1_address_width_hwtcl),
       .pf3_bar2_address_width_hwtcl               (core16_pf3_bar2_address_width_hwtcl),
       .pf3_bar3_address_width_hwtcl               (core16_pf3_bar3_address_width_hwtcl),
       .pf3_bar4_address_width_hwtcl               (core16_pf3_bar4_address_width_hwtcl),
       .pf3_bar5_address_width_hwtcl               (core16_pf3_bar5_address_width_hwtcl),
       .pf4_bar0_address_width_hwtcl               (core16_pf4_bar0_address_width_hwtcl),
       .pf4_bar1_address_width_hwtcl               (core16_pf4_bar1_address_width_hwtcl),
       .pf4_bar2_address_width_hwtcl               (core16_pf4_bar2_address_width_hwtcl),
       .pf4_bar3_address_width_hwtcl               (core16_pf4_bar3_address_width_hwtcl),
       .pf4_bar4_address_width_hwtcl               (core16_pf4_bar4_address_width_hwtcl),
       .pf4_bar5_address_width_hwtcl               (core16_pf4_bar5_address_width_hwtcl),
       .pf5_bar0_address_width_hwtcl               (core16_pf5_bar0_address_width_hwtcl),
       .pf5_bar1_address_width_hwtcl               (core16_pf5_bar1_address_width_hwtcl),
       .pf5_bar2_address_width_hwtcl               (core16_pf5_bar2_address_width_hwtcl),
       .pf5_bar3_address_width_hwtcl               (core16_pf5_bar3_address_width_hwtcl),
       .pf5_bar4_address_width_hwtcl               (core16_pf5_bar4_address_width_hwtcl),
       .pf5_bar5_address_width_hwtcl               (core16_pf5_bar5_address_width_hwtcl),
       .pf6_bar0_address_width_hwtcl               (core16_pf6_bar0_address_width_hwtcl),
       .pf6_bar1_address_width_hwtcl               (core16_pf6_bar1_address_width_hwtcl),
       .pf6_bar2_address_width_hwtcl               (core16_pf6_bar2_address_width_hwtcl),
       .pf6_bar3_address_width_hwtcl               (core16_pf6_bar3_address_width_hwtcl),
       .pf6_bar4_address_width_hwtcl               (core16_pf6_bar4_address_width_hwtcl),
       .pf6_bar5_address_width_hwtcl               (core16_pf6_bar5_address_width_hwtcl),
       .pf7_bar0_address_width_hwtcl               (core16_pf7_bar0_address_width_hwtcl),
       .pf7_bar1_address_width_hwtcl               (core16_pf7_bar1_address_width_hwtcl),
       .pf7_bar2_address_width_hwtcl               (core16_pf7_bar2_address_width_hwtcl),
       .pf7_bar3_address_width_hwtcl               (core16_pf7_bar3_address_width_hwtcl),
       .pf7_bar4_address_width_hwtcl               (core16_pf7_bar4_address_width_hwtcl),
       .pf7_bar5_address_width_hwtcl               (core16_pf7_bar5_address_width_hwtcl),

       .pf0_vf_bar0_address_width_hwtcl            (core16_pf0_sriov_vf_bar0_address_width_hwtcl),
       .pf0_vf_bar1_address_width_hwtcl            (core16_pf0_sriov_vf_bar1_address_width_hwtcl),
       .pf0_vf_bar2_address_width_hwtcl            (core16_pf0_sriov_vf_bar2_address_width_hwtcl),
       .pf0_vf_bar3_address_width_hwtcl            (core16_pf0_sriov_vf_bar3_address_width_hwtcl),
       .pf0_vf_bar4_address_width_hwtcl            (core16_pf0_sriov_vf_bar4_address_width_hwtcl),
       .pf0_vf_bar5_address_width_hwtcl            (core16_pf0_sriov_vf_bar5_address_width_hwtcl),
       .pf1_vf_bar0_address_width_hwtcl            (core16_pf1_sriov_vf_bar0_address_width_hwtcl),
       .pf1_vf_bar1_address_width_hwtcl            (core16_pf1_sriov_vf_bar1_address_width_hwtcl),
       .pf1_vf_bar2_address_width_hwtcl            (core16_pf1_sriov_vf_bar2_address_width_hwtcl),
       .pf1_vf_bar3_address_width_hwtcl            (core16_pf1_sriov_vf_bar3_address_width_hwtcl),
       .pf1_vf_bar4_address_width_hwtcl            (core16_pf1_sriov_vf_bar4_address_width_hwtcl),
       .pf1_vf_bar5_address_width_hwtcl            (core16_pf1_sriov_vf_bar5_address_width_hwtcl),
       .pf2_vf_bar0_address_width_hwtcl            (core16_pf2_sriov_vf_bar0_address_width_hwtcl),
       .pf2_vf_bar1_address_width_hwtcl            (core16_pf2_sriov_vf_bar1_address_width_hwtcl),
       .pf2_vf_bar2_address_width_hwtcl            (core16_pf2_sriov_vf_bar2_address_width_hwtcl),
       .pf2_vf_bar3_address_width_hwtcl            (core16_pf2_sriov_vf_bar3_address_width_hwtcl),
       .pf2_vf_bar4_address_width_hwtcl            (core16_pf2_sriov_vf_bar4_address_width_hwtcl),
       .pf2_vf_bar5_address_width_hwtcl            (core16_pf2_sriov_vf_bar5_address_width_hwtcl),
       .pf3_vf_bar0_address_width_hwtcl            (core16_pf3_sriov_vf_bar0_address_width_hwtcl),
       .pf3_vf_bar1_address_width_hwtcl            (core16_pf3_sriov_vf_bar1_address_width_hwtcl),
       .pf3_vf_bar2_address_width_hwtcl            (core16_pf3_sriov_vf_bar2_address_width_hwtcl),
       .pf3_vf_bar3_address_width_hwtcl            (core16_pf3_sriov_vf_bar3_address_width_hwtcl),
       .pf3_vf_bar4_address_width_hwtcl            (core16_pf3_sriov_vf_bar4_address_width_hwtcl),
       .pf3_vf_bar5_address_width_hwtcl            (core16_pf3_sriov_vf_bar5_address_width_hwtcl),
       .pf4_vf_bar0_address_width_hwtcl            (core16_pf4_sriov_vf_bar0_address_width_hwtcl),
       .pf4_vf_bar1_address_width_hwtcl            (core16_pf4_sriov_vf_bar1_address_width_hwtcl),
       .pf4_vf_bar2_address_width_hwtcl            (core16_pf4_sriov_vf_bar2_address_width_hwtcl),
       .pf4_vf_bar3_address_width_hwtcl            (core16_pf4_sriov_vf_bar3_address_width_hwtcl),
       .pf4_vf_bar4_address_width_hwtcl            (core16_pf4_sriov_vf_bar4_address_width_hwtcl),
       .pf4_vf_bar5_address_width_hwtcl            (core16_pf4_sriov_vf_bar5_address_width_hwtcl),
       .pf5_vf_bar0_address_width_hwtcl            (core16_pf5_sriov_vf_bar0_address_width_hwtcl),
       .pf5_vf_bar1_address_width_hwtcl            (core16_pf5_sriov_vf_bar1_address_width_hwtcl),
       .pf5_vf_bar2_address_width_hwtcl            (core16_pf5_sriov_vf_bar2_address_width_hwtcl),
       .pf5_vf_bar3_address_width_hwtcl            (core16_pf5_sriov_vf_bar3_address_width_hwtcl),
       .pf5_vf_bar4_address_width_hwtcl            (core16_pf5_sriov_vf_bar4_address_width_hwtcl),
       .pf5_vf_bar5_address_width_hwtcl            (core16_pf5_sriov_vf_bar5_address_width_hwtcl),
       .pf6_vf_bar0_address_width_hwtcl            (core16_pf6_sriov_vf_bar0_address_width_hwtcl),
       .pf6_vf_bar1_address_width_hwtcl            (core16_pf6_sriov_vf_bar1_address_width_hwtcl),
       .pf6_vf_bar2_address_width_hwtcl            (core16_pf6_sriov_vf_bar2_address_width_hwtcl),
       .pf6_vf_bar3_address_width_hwtcl            (core16_pf6_sriov_vf_bar3_address_width_hwtcl),
       .pf6_vf_bar4_address_width_hwtcl            (core16_pf6_sriov_vf_bar4_address_width_hwtcl),
       .pf6_vf_bar5_address_width_hwtcl            (core16_pf6_sriov_vf_bar5_address_width_hwtcl),
       .pf7_vf_bar0_address_width_hwtcl            (core16_pf7_sriov_vf_bar0_address_width_hwtcl),
       .pf7_vf_bar1_address_width_hwtcl            (core16_pf7_sriov_vf_bar1_address_width_hwtcl),
       .pf7_vf_bar2_address_width_hwtcl            (core16_pf7_sriov_vf_bar2_address_width_hwtcl),
       .pf7_vf_bar3_address_width_hwtcl            (core16_pf7_sriov_vf_bar3_address_width_hwtcl),
       .pf7_vf_bar4_address_width_hwtcl            (core16_pf7_sriov_vf_bar4_address_width_hwtcl),
       .pf7_vf_bar5_address_width_hwtcl            (core16_pf7_sriov_vf_bar5_address_width_hwtcl)

    ) mcdma_inst  (
        // clock and reset
        .clk                                   (clk),
        .rst_n                                 (rst_n),
        // Slow clock and reset from HIP
        .slow_clk                              (slow_clk),
        .slow_rst_n                            (slow_rst_n),

        .app_rst_n                             (app_rst_n),

        // Interface to the Streaming ports of HIP.
        //RX Ports
        .rx_st_ready_o                         (rx_st_ready_wire),
        .rx_st_valid_i                         (rx_st_valid_wire),
        .rx_st_sop_i                           (rx_st_sop_wire),
        .rx_st_eop_i                           (rx_st_eop_wire),
        .rx_st_hdr_i                           (rx_st_hdr_wire),
        .rx_st_data_i                          (rx_st_data_wire),
        .rx_st_vf_active_i                     (rx_st_vf_active_wire),
        .rx_st_func_num_i                      (rx_st_func_num_wire),
        .rx_st_vf_num_i                        (rx_st_vf_num_wire),
        .rx_st_bar_range_i                     (rx_st_bar_range_wire),
        .rx_par_err_i                          (rx_par_err_wire),

        //TX Ports
        .tx_st_ready_i                         (tx_st_ready_wire),
        .tx_par_err_i                          (tx_par_err_wire),
        .tx_st_valid_o                         (tx_st_valid_wire),
        .tx_st_sop_o                           (tx_st_sop_wire),
        .tx_st_eop_o                           (tx_st_eop_wire),
        .tx_st_err_o                           (tx_st_err_wire),
        .tx_st_hdr_o                           (tx_st_hdr_wire),
        .tx_st_data_o                          (tx_st_data_wire),
        .tx_st_vf_active_o                     (tx_st_vf_active_wire),

        // Streaming Packets HIP Credit Interface.
        .tx_cdts_limit_i                       (tx_cdts_limit_wire            ),
        .tx_cdts_limit_tdm_idx_i               (tx_cdts_limit_tdm_idx_wire    ),
        .rx_buffer_limit_o                     (rx_buffer_limit_wire          ),
        .rx_buffer_limit_tdm_idx_o             (rx_buffer_limit_tdm_idx_wire  ),

        .dl_timer_update_i                     (dl_timer_update_i),
        .dl_up_i                               (dl_up_i), //  signal indicates the Data Link (DL) Layer is active
        .link_up_i                             (link_up_i), // signal indicates the link is up

        // HIP Misc interface
        // Config Interface
        .hip_tl_cfg_func_i                     ('0),
        .hip_tl_cfg_add_i                      ('0),
        .hip_tl_cfg_ctl_i                      ('0),

        // HIP REconfig interface
        .hip_reconfig_address_o                ( hip_reconfig_address_o       ) ,
        .hip_reconfig_read_o                   ( hip_reconfig_read_o          ) ,
        .hip_reconfig_readdata_i               ( hip_reconfig_readdata_i      ) ,
        .hip_reconfig_readdatavalid_i          ( hip_reconfig_readdatavalid_i ) ,
        .hip_reconfig_waitrequest_i            ( hip_reconfig_waitrequest_i   ) ,
        .hip_reconfig_write_o                  ( hip_reconfig_write_o         ),
        .hip_reconfig_writedata_o              ( hip_reconfig_writedata_o     ),

        .hip_cii_req_i                         ( cii_req_i                    ),
        .hip_cii_hdr_poisoned_i                ( cii_hdr_poisoned_i           ),
        .hip_cii_hdr_first_be_i                ( cii_hdr_first_be_i           ),
        .hip_cii_func_num_i                    ( cii_func_num_i               ),
        .hip_cii_wr_i                          ( cii_wr_i                     ),
        .hip_cii_addr_i                        ( cii_addr_i                   ),
        .hip_cii_dout_i                        ( cii_dout_i                   ),
        .hip_cii_override_en_o                 ( cii_override_en_o            ),
        .hip_cii_override_din_o                ( cii_override_din_o           ),
        .hip_cii_halt_o                        ( cii_halt_o                   ),
        .hip_cii_wr_vf_active_i                ( cii_wr_vf_active_i           ),
        .hip_cii_vf_num_i                      ( cii_vf_num_i                 ),

        .usr_cii_req_o                         ( usr_cii_req_o                ),
        .usr_cii_hdr_poisoned_o                ( usr_cii_hdr_poisoned_o       ),
        .usr_cii_hdr_first_be_o                ( usr_cii_hdr_first_be_o       ),
        .usr_cii_func_num_o                    ( usr_cii_func_num_o           ),
        .usr_cii_wr_o                          ( usr_cii_wr_o                 ),
        .usr_cii_addr_o                        ( usr_cii_addr_o               ),
        .usr_cii_dout_o                        ( usr_cii_dout_o               ),
        .usr_cii_wr_vf_active_o                ( usr_cii_wr_vf_active_o       ),
        .usr_cii_vf_num_o                      ( usr_cii_vf_num_o             ),

        .usr_hip_reconfig_address_i      (usr_hip_reconfig_address_i        ),
        .usr_hip_reconfig_read_i         (usr_hip_reconfig_read_i           ),
        .usr_hip_reconfig_write_i        (usr_hip_reconfig_write_i          ),
        .usr_hip_reconfig_writedata_i    (usr_hip_reconfig_writedata_i      ),
        .usr_hip_reconfig_readdata_o     (usr_hip_reconfig_readdata_o       ),
        .usr_hip_reconfig_readdatavalid_o(usr_hip_reconfig_readdatavalid_o  ),
        .usr_hip_reconfig_waitrequest_o  (usr_hip_reconfig_waitrequest_o    ),

        .usr_hip_tl_cfg_ctl_o (),
        .usr_hip_tl_cfg_add_o (),
        .usr_hip_tl_cfg_func_o(),



        // H2D AVST Master Interface
        .h2d_st_sof_o                          ( h2d_st_sof_o     [0:num_h2d_uport_hwtcl-1] ) ,
        .h2d_st_eof_o                          ( h2d_st_eof_o     [0:num_h2d_uport_hwtcl-1] ) ,
        .h2d_st_empty_o                        ( h2d_st_empty_o   [0:num_h2d_uport_hwtcl-1] ) ,
        .h2d_st_ready_i                        ( h2d_st_ready_i   [0:num_h2d_uport_hwtcl-1] ) ,
        .h2d_st_valid_o                        ( h2d_st_valid_o   [0:num_h2d_uport_hwtcl-1] ) ,
        .h2d_st_data_o                         ( h2d_st_data_o    [0:num_h2d_uport_hwtcl-1] ) ,
        .h2d_st_channel_o                      ( h2d_st_channel_o [0:num_h2d_uport_hwtcl-1] ) ,

        // H2D AVMM Master Interface
        .h2ddm_waitrequest_i                   ( h2ddm_waitrequest_i          ) ,
        .h2ddm_writeresponsevalid_i            ( h2ddm_writeresponsevalid_i   ) ,
        .h2ddm_write_o                         ( h2ddm_write_o                ) ,
        .h2ddm_address_o                       ( h2ddm_address_o              ) ,
        .h2ddm_burstcount_o                    ( h2ddm_burstcount_o           ) ,
        .h2ddm_byteenable_o                    ( h2ddm_byteenable_o           ) ,
        .h2ddm_writedata_o                     ( h2ddm_writedata_o            ) ,

        // D2H AVST Slave Interface
        .d2h_st_sof_i                          ( d2h_st_sof_i     [0:num_d2h_uport_hwtcl-1] ) ,
        .d2h_st_eof_i                          ( d2h_st_eof_i     [0:num_d2h_uport_hwtcl-1] ) ,
        .d2h_st_empty_i                        ( d2h_st_empty_i   [0:num_d2h_uport_hwtcl-1] ) ,
        .d2h_st_channel_i                      ( d2h_st_channel_i [0:num_d2h_uport_hwtcl-1] ) ,
        .d2h_st_valid_i                        ( d2h_st_valid_i   [0:num_d2h_uport_hwtcl-1] ) ,
        .d2h_st_data_i                         ( d2h_st_data_i    [0:num_d2h_uport_hwtcl-1] ) ,
        .d2h_st_ready_o                        ( d2h_st_ready_o   [0:num_d2h_uport_hwtcl-1] ) ,

        // D2H AVMM Read Master Interface
        .d2hdm_address_o                       ( d2hdm_address_o              ) ,
        .d2hdm_byteenable_o                    ( d2hdm_byteenable_o           ) ,
        .d2hdm_read_o                          ( d2hdm_read_o                 ) ,
        .d2hdm_burstcount_o                    ( d2hdm_burstcount_o           ) ,
        .d2hdm_waitrequest_i                   ( d2hdm_waitrequest_i          ) ,
        .d2hdm_readdata_i                      ( d2hdm_readdata_i             ) ,
        .d2hdm_readdatavalid_i                 ( d2hdm_readdatavalid_i        ) ,
        .d2hdm_response_i                      ( d2hdm_response_i             ) ,
        // AVMM Master PIO interface
        .rx_pio_address_o                      ( rx_pio_address_o             ) ,
        .rx_pio_byteenable_o                   ( rx_pio_byteenable_o          ) ,
        .rx_pio_read_o                         ( rx_pio_read_o                ) ,
        .rx_pio_write_o                        ( rx_pio_write_o               ) ,
        .rx_pio_writedata_o                    ( rx_pio_writedata_o           ) ,
        .rx_pio_burstcount_o                   ( rx_pio_burstcount_o          ) ,
        .rx_pio_waitrequest_i                  ( rx_pio_waitrequest_i         ) ,
        .rx_pio_readdata_i                     ( rx_pio_readdata_i            ) ,
        .rx_pio_readdatavalid_i                ( rx_pio_readdatavalid_i       ) ,
        .rx_pio_response_i                     ( rx_pio_response_i            ) ,
        .rx_pio_writeresponsevalid_i           ( rx_pio_writeresponsevalid_i  ) ,

        // FLR interface from HIP
        .flr_rcvd_pf_i                         ( flr_rcvd_pf_wire                ) ,
        .flr_rcvd_vf_i                         ( flr_rcvd_vf_wire                ) ,
        .flr_rcvd_pf_num_i                     ( flr_rcvd_pf_num_wire            ) ,
        .flr_rcvd_vf_num_i                     ( flr_rcvd_vf_num_wire            ) ,
        .flr_completed_pf_o                    ( flr_completed_pf_wire           ) ,
        .flr_completed_vf_o                    ( flr_completed_vf_wire           ) ,
        .flr_completed_pf_num_o                ( flr_completed_pf_num_wire       ) ,
        .flr_completed_vf_num_o                ( flr_completed_vf_num_wire       ) ,
        .flr_completed_ready_i                 ( flr_completed_ready_wire        ) ,
        // FLR interface to application/user side
        .usr_flr_rcvd_val_o                    ( usr_flr_rcvd_val_o           ) ,
        .usr_flr_rcvd_chan_num_o               ( usr_flr_rcvd_chan_num_o      ) ,
        .usr_flr_completed_i                   ( usr_flr_completed_i          ) ,
        //  Completion Timeout Interface (only in P-tile)
        .cpl_timeout_i                         ( cpl_timeout_wire                    ),
        .cpl_timeout_avmm_waitrequest_i        ( cpl_timeout_avmm_waitrequest_wire   ),
        .cpl_timeout_avmm_read_o               ( cpl_timeout_avmm_read_wire          ),
        .cpl_timeout_avmm_address_o            ( cpl_timeout_avmm_address_wire       ), // [20:3] : Reserved. Tie them to 0.
        .cpl_timeout_avmm_write_o              ( cpl_timeout_avmm_write_wire         ),
        .cpl_timeout_avmm_writedata_o          ( cpl_timeout_avmm_writedata_wire     ),
        .cpl_timeout_avmm_readdata_i           ( cpl_timeout_avmm_readdata_wire      ),
        .cpl_timeout_avmm_readdatavalid_i      ( cpl_timeout_avmm_readdatavalid_wire ),
        // Error interface to HIP
        .app_err_ready_i                       ( app_err_ready_wire              ) , // Backpreasure ready from R-Tile
        .app_err_valid_o                       ( app_err_valid_wire              ) ,
        .app_err_hdr_o                         ( app_err_hdr_wire                ) ,
        .app_err_info_o                        ( app_err_info_wire               ) , //S10:app_err_info[10:0]
        .app_err_func_num_o                    ( app_err_func_num_wire           ) , //S10: app_err_func_num[1:0]
        // MSI-X Request interface from application/user side
        .usr_event_msix_valid_i                ( (enable_user_msix_hwtcl) ? usr_event_msix_valid_i  : '0     ) ,
        .usr_event_msix_ready_o                ( usr_event_msix_ready_o       ) ,
        .usr_event_msix_data_i                 ( (enable_user_msix_hwtcl) ? usr_event_msix_data_i   : 16'b0     ) ,
        //BAS
        .bas_vfactive_i                        ( (enable_bursting_slave_hwtcl) ? bas_vfactive_i    : '0 ),
        .bas_pfnum_i                           ( (enable_bursting_slave_hwtcl) ? bas_pfnum_i       : '0 ),
        .bas_vfnum_i                           ( (enable_bursting_slave_hwtcl) ? bas_vfnum_i       : '0 ),
        .bas_address_i                         ( (enable_bursting_slave_hwtcl) ? bas_address_i     : '0 ),
        .bas_byteenable_i                      ( (enable_bursting_slave_hwtcl) ? bas_byteenable_i  : '0 ),
        .bas_read_i                            ( (enable_bursting_slave_hwtcl) ? bas_read_i        : '0 ),
        .bas_write_i                           ( (enable_bursting_slave_hwtcl) ? bas_write_i       : '0 ),
        .bas_writedata_i                       ( (enable_bursting_slave_hwtcl) ? bas_writedata_i   : '0 ),
        .bas_burstcount_i                      ( (enable_bursting_slave_hwtcl) ? bas_burstcount_i  : '0 ),
        .bas_waitrequest_o                     (  bas_waitrequest_o   ),
        .bas_readdata_o                        (  bas_readdata_o      ),
        .bas_readdatavalid_o                   (  bas_readdatavalid_o ),
        .bas_response_o                        (  bas_response_o      ),

        // BAM interface
        .bam_readdatavalid_i                   ( (enable_bursting_master_hwtcl) ? bam_readdatavalid_i : '0 ),
        .bam_readdata_i                        ( (enable_bursting_master_hwtcl) ? bam_readdata_i      : '0 ),
        .bam_waitrequest_i                     ( (enable_bursting_master_hwtcl) ? bam_waitrequest_i   : '0 ),
      //.bam_vfactive_o                        ( bam_vfactive_o   ),
      //.bam_pfnum_o                           ( bam_pfnum_o      ),
      //.bam_vfnum_o                           ( bam_vfnum_o      ),
      //.bam_bar_o                             ( bam_bar_o        ),
        .bam_address_o                         ( bam_address_o    ),
        .bam_burstcount_o                      ( bam_burstcount_o ),
        .bam_byteenable_o                      ( bam_byteenable_o ),
        .bam_read_o                            ( bam_read_o       ),
        .bam_write_o                           ( bam_write_o      ),
        .bam_writedata_o                       ( bam_writedata_o  ),

        // CS AVMM slave interface
        .cs_waitrequest_o                      ( cs_waitrequest_o ),
        .cs_address_i                          ( (enable_cs_hwtcl) ? cs_address_i : '0 ),
        .cs_byteenable_i                       ( (enable_cs_hwtcl) ? cs_byteenable_i : '0 ),
        .cs_read_i                             ( (enable_cs_hwtcl) ? cs_read_i : '0 ),
        .cs_readdata_o                         ( cs_readdata_o ),
        .cs_readdatavalid_o                    ( cs_readdatavalid_o ),
        .cs_write_i                            ( (enable_cs_hwtcl) ? cs_write_i : '0 ),
        .cs_writedata_i                        ( (enable_cs_hwtcl) ? cs_writedata_i : '0 ),
        .cs_response_o                         ( cs_response_o ),
        .cs_writeresponsevalid_o               ( cs_writeresponsevalid_o ),

        .msi_req_i                             ( msi_req_i                        ),
        .msi_func_num_i                        ( msi_func_num_i                   ),
        .msi_num_i                             ( msi_num_i                        ),
        .msi_ack_o                             ( msi_ack_o                        ),
        .msi_status_o                          ( msi_status_o                     ),

        .hip_10bits_tag_req_en_i              ( '0 ),

        .hip_msi_pnd_func_o                   ( hip_msi_pnd_func_wire ),
        .hip_msi_pnd_addr_o                   ( hip_msi_pnd_addr_wire ),
        .hip_msi_pnd_byte_o                   ( hip_msi_pnd_byte_wire )

      );

   end endgenerate
endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "aqU+IUkqKYP9VhhBcWfo00r5XNnAwNI17V77/Bju3Kq5ZZapPP0U3pRolguGWjtvBl0FRYc4E8aMXf0qAdUPRARhnpJK4Hf3qO5XuUs75UWSfqB3T6V+ZNmwUbOe/UsMusZe8id+XX9UaCPNkAlWEKaquhPb8dxBop99dmYWc0dKcxnUvmpPxyz6OHy3CG5MRs8IOVf/RyLswjHpQpDPXzNOQZAEleN6DtapWPYtUDxQ1QI31MHoLA06fUTSUGnkwKndB4ylJ15uQQkXWd/YbZuCoXKgUxMJKCRaHFuo1+zciBroiUBquPTVrwGfHE3CLuJLRfVOFQd6P0mfY2uxl7cCsidgq8K+FGBq4y6+ac6pMSHf/zcZXay4qnAo2gjjQaaCDDpSYMXMZw7YbcDj34veeWlEFajxUS/yXNyKRs5Om1a8BOEflrezWWQcebOX+gBx0p1eMLwTVdCPhnlLY82RQedrfSzxu6HYfXvbzR8DlmsiOIO7BNvHBWM/JfzLSgSShp/s/2LsAcq/kxwa822Vk40SzqDKyyVbiDZwgaWCcjlzNZ63iP0hWocG/lQY/xK8aG38M+mnACt2DH0Sc6UML7S87TkLIHHjhvjGmz6BAFMlhCIhr6/c0yFpSbu8Q+MHPG08W/cx6c1PWl1mWOKerh/Ubx0jrQSRHhsOzUkMl5oIFQBJzmbvaoNfeEX+rlw+pmUd6wcgKv1AKfshIWC4aQoHBKc3LCJgr3qdmhfeN0qbpm2JWheUDXmbbL8p4A70/BX43mXXEHDicyY06VQxE0n35ySvjCGZdkw4qEB5Mhet9ZLBGxpnqj/NlWyA/Zq5pRPxg8UighxnVZz3FKoQdTHv5JoiVxnbObD43VJMq6qq9v3EWRGQgpxM8NVTQurkvAAHusU1GAuX/JoPBKyuMuR/XCmi8yasw0XE9BgFniamrv4ClIwRvJz6qgZcnkstagAc9JbV9J4jp10TVBnYQtfb6Vl12IsPc1vC7DrA/wegKxCIbvfvR36+RBtN"
`endif