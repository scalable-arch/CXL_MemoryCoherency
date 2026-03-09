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

module platform_intel_pcie_axi_mcdma_0_intel_pcie_axi_mcdma_300_xnmrdqa 
  #(
    // The value type (integer/string) will change based on hw_tcl development.

    parameter device_family_hwtcl                    =  "Agilex 7",  
    parameter device_family_int_hwtcl                =  0,  
 
    parameter header_packing_scheme_hwtcl            = "Simple",      // Simple, Variable, Compact
    parameter dma_top_topology_hwtcl                 = "Gen5 1x16",   // "Gen5 1x16" "Gen5 2x8" "Gen4 1x16" "Gen4 2x8" "Gen3 1x16" "Gen3 2x8"   
    parameter dwidth_hwtcl                           = 512,           // 256,512,1024
    parameter num_of_seg_hwtcl                       = ((dwidth_hwtcl==1024) ? 4 : (dwidth_hwtcl==512) ? 2 : 1), // derived param of dwidth_hwtcl -> 1 or 2 or 4
    parameter seg_width_hwtcl                        = 256, // hardcode to 256
    parameter single_width_integer_hwtcl             = 0, // 0 = DoubleWidth, 1 = SingleWidth mode (Only for R-Tile PCIe-SS)
    parameter st_readylatency_hwtcl                  = 0,             // 0-4
 
    parameter csr_liteslvawd_hwtcl                   = 20,
    parameter csr_liteslvdwd_hwtcl                   = 32,
 
    parameter pio_litemstrawd_hwtcl                  = 32,
    parameter pio_litemstrdwd_hwtcl                  = 32,
    parameter pio_litemstr_readylatency_hwtcl        = 0,
 
    parameter cs_litemstrawd_hwtcl                   = 32,
    parameter cs_litemstrdwd_hwtcl                   = 32,
    parameter cs_litemstr_readylatency_hwtcl         = 0,
 
    parameter dma_mm_mode_hwtcl                      = 0, // AXI-MM (or) AXIS User Interface
    parameter dma_mmidwd_hwtcl                       = 4,
    parameter dma_mmawd_hwtcl                        = 64,
    parameter dma_mmblwd_hwtcl                       = 8,
    parameter dma_mmdwd_hwtcl                        = 512, // derived of dwidth_hwtcl (same)
    parameter dma_mm_readylatency_hwtcl              = 0,
 
    parameter bam_mmidwd_hwtcl                       = 4,
    parameter bam_mmawd_hwtcl                        = 64,
    parameter bam_mmblwd_hwtcl                       = 8,
    parameter bam_mmdwd_hwtcl                        = 512, // derived of dwidth_hwtcl (same)
    parameter bam_mm_readylatency_hwtcl              = 0,
 
    parameter bas_mmidwd_hwtcl                       = 4,
    parameter bas_mmawd_hwtcl                        = 64,
    parameter bas_mmuwd_hwtcl                        = 15, // awuser/aruser = {vf_num[10:0],vf_active,pf_num[2:0]}
    parameter bas_mmblwd_hwtcl                       = 8,
    parameter bas_mmdwd_hwtcl                        = 512, // derived of dwidth_hwtcl (same)
    parameter bas_mm_readylatency_hwtcl              = 0,

    parameter enable_mcdma_hwtcl                     = 1,
    parameter enable_bursting_master_hwtcl           = 0,
    parameter enable_bursting_slave_hwtcl            = 0,
    parameter enable_config_slave_hwtcl              = 0,
    parameter enable_byte_aligned_txfr_hwtcl         = 0, // 0 = Cache-line aligned txfr, 1 = Byte aligned txfr
    parameter enable_10bit_tag_hwtcl                 = 0, // 10-bit Tag Support (Maximum of 512 outstanding tags at any given time, for all functions combined)
    parameter enable_user_msix_hwtcl                 = 0,    
    parameter enable_user_flr_hwtcl                  = 0,
    parameter enable_user_cii_hwtcl                  = 0,
    parameter enable_metadata_8_hwtcl                = 0,
    parameter enable_cpl_reorder_hwtcl               = 1, // Completion re-ordering is enabled
    parameter enable_cpl_timeout_hwtcl               = 1, // Completion timeout
 
    parameter d2h_num_active_channel_hwtcl           = 64,
    parameter d2h_max_num_desc_fetch_hwtcl           = 16,
 
    parameter enable_msi_hwtcl                       = 1,
    parameter msi_pvm_capable_hwtcl                  = 0,
    parameter msi_addr_64bit_capable_hwtcl           = 0,
    parameter msi_ext_msg_data_capable_hwtcl         = 0,
    parameter msi_multi_msg_capable_hwtcl            = 0,
 
    parameter enable_device_att_hwtcl                = 1, // Address transilation table for BAS
    parameter att_table_address_hwtcl                = 9, // depth of ATT RAM, range of 1 to 9
    parameter att_window_address_hwtcl               = 16, // Passthrough BAS LSB address bits, range of 10 to 63
 
    parameter enable_dca_hwtcl                       = 0, // Dynamic channel allocation using Mailbox
    parameter dca_num_chn_supported_hwtcl            = 2048, // Number of channel supported for DCA with Mailbox
    parameter dca_num_log_ch_func_hwtcl              = 32, // Number of Logical channel per Functions (1 to 256) 
    parameter dca_enable_pf_ch_hwtcl                 = 1, // Enable channels in Physical Functions
 
    parameter pf2int_funct_init_file_hwtcl           = "../pf2int_funct.mif",
    parameter int_funct2dma_chan_pf_init_file_hwtcl  = "../int_funct2dma_chan_pf.mif",
    parameter int_funct2dma_chan_vf_init_file_hwtcl  = "../int_funct2dma_chan_vf.mif",
    parameter dma_chan2funct_init_file_hwtcl         = "../dma_chan2funct.mif",
 
    parameter pfnum_hwtcl                            = 1, // Allowed Range (1 to 8)
    parameter pfnum_width_hwtcl                      = 1,
    parameter vfnum_width_hwtcl                      = 1,
    
    parameter total_pf_count_hwtcl                   = 1,
    parameter total_vf_count_hwtcl                   = 0,

    parameter bam_address_width_hwtcl                = 64,
    parameter max_bar_address_width_hwtcl            = 22, 

    parameter pf0_enable_sriov_hwtcl                 = 1,
    parameter pf0_num_vf_per_pf_hwtcl                = 2,
    parameter pf0_num_dma_chan_pf_hwtcl              = 1,
    parameter pf0_num_dma_chan_per_vf_hwtcl          = 1,
    parameter pf1_enable_sriov_hwtcl                 = 1,
    parameter pf1_num_vf_per_pf_hwtcl                = 2,
    parameter pf1_num_dma_chan_pf_hwtcl              = 1,
    parameter pf1_num_dma_chan_per_vf_hwtcl          = 1,
    parameter pf2_enable_sriov_hwtcl                 = 1,
    parameter pf2_num_vf_per_pf_hwtcl                = 2,
    parameter pf2_num_dma_chan_pf_hwtcl              = 1,
    parameter pf2_num_dma_chan_per_vf_hwtcl          = 1,
    parameter pf3_enable_sriov_hwtcl                 = 1,
    parameter pf3_num_vf_per_pf_hwtcl                = 2,
    parameter pf3_num_dma_chan_pf_hwtcl              = 1,
    parameter pf3_num_dma_chan_per_vf_hwtcl          = 1,
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
 
    parameter pf0_bar0_address_width_hwtcl           = 22,
    parameter pf0_bar1_address_width_hwtcl           = 22,
    parameter pf0_bar2_address_width_hwtcl           = 22,
    parameter pf0_bar3_address_width_hwtcl           = 22,
    parameter pf0_bar4_address_width_hwtcl           = 22,
    parameter pf0_bar5_address_width_hwtcl           = 22,
    parameter pf1_bar0_address_width_hwtcl           = 22,
    parameter pf1_bar1_address_width_hwtcl           = 22,
    parameter pf1_bar2_address_width_hwtcl           = 22,
    parameter pf1_bar3_address_width_hwtcl           = 22,
    parameter pf1_bar4_address_width_hwtcl           = 22,
    parameter pf1_bar5_address_width_hwtcl           = 22,
    parameter pf2_bar0_address_width_hwtcl           = 22,
    parameter pf2_bar1_address_width_hwtcl           = 22,
    parameter pf2_bar2_address_width_hwtcl           = 22,
    parameter pf2_bar3_address_width_hwtcl           = 22,
    parameter pf2_bar4_address_width_hwtcl           = 22,
    parameter pf2_bar5_address_width_hwtcl           = 22,
    parameter pf3_bar0_address_width_hwtcl           = 22,
    parameter pf3_bar1_address_width_hwtcl           = 22,
    parameter pf3_bar2_address_width_hwtcl           = 22,
    parameter pf3_bar3_address_width_hwtcl           = 22,
    parameter pf3_bar4_address_width_hwtcl           = 22,
    parameter pf3_bar5_address_width_hwtcl           = 22,
    parameter pf4_bar0_address_width_hwtcl           = 22,
    parameter pf4_bar1_address_width_hwtcl           = 22,
    parameter pf4_bar2_address_width_hwtcl           = 22,
    parameter pf4_bar3_address_width_hwtcl           = 22,
    parameter pf4_bar4_address_width_hwtcl           = 22,
    parameter pf4_bar5_address_width_hwtcl           = 22,
    parameter pf5_bar0_address_width_hwtcl           = 22,
    parameter pf5_bar1_address_width_hwtcl           = 22,
    parameter pf5_bar2_address_width_hwtcl           = 22,
    parameter pf5_bar3_address_width_hwtcl           = 22,
    parameter pf5_bar4_address_width_hwtcl           = 22,
    parameter pf5_bar5_address_width_hwtcl           = 22,
    parameter pf6_bar0_address_width_hwtcl           = 22,
    parameter pf6_bar1_address_width_hwtcl           = 22,
    parameter pf6_bar2_address_width_hwtcl           = 22,
    parameter pf6_bar3_address_width_hwtcl           = 22,
    parameter pf6_bar4_address_width_hwtcl           = 22,
    parameter pf6_bar5_address_width_hwtcl           = 22,
    parameter pf7_bar0_address_width_hwtcl           = 22,
    parameter pf7_bar1_address_width_hwtcl           = 22,
    parameter pf7_bar2_address_width_hwtcl           = 22,
    parameter pf7_bar3_address_width_hwtcl           = 22,
    parameter pf7_bar4_address_width_hwtcl           = 22,
    parameter pf7_bar5_address_width_hwtcl           = 22,
 
    parameter pf0_vf_bar0_address_width_hwtcl        = 22,
    parameter pf0_vf_bar1_address_width_hwtcl        = 22,
    parameter pf0_vf_bar2_address_width_hwtcl        = 22,
    parameter pf0_vf_bar3_address_width_hwtcl        = 22,
    parameter pf0_vf_bar4_address_width_hwtcl        = 22,
    parameter pf0_vf_bar5_address_width_hwtcl        = 22,
    parameter pf1_vf_bar0_address_width_hwtcl        = 22,
    parameter pf1_vf_bar1_address_width_hwtcl        = 22,
    parameter pf1_vf_bar2_address_width_hwtcl        = 22,
    parameter pf1_vf_bar3_address_width_hwtcl        = 22,
    parameter pf1_vf_bar4_address_width_hwtcl        = 22,
    parameter pf1_vf_bar5_address_width_hwtcl        = 22,
    parameter pf2_vf_bar0_address_width_hwtcl        = 22,
    parameter pf2_vf_bar1_address_width_hwtcl        = 22,
    parameter pf2_vf_bar2_address_width_hwtcl        = 22,
    parameter pf2_vf_bar3_address_width_hwtcl        = 22,
    parameter pf2_vf_bar4_address_width_hwtcl        = 22,
    parameter pf2_vf_bar5_address_width_hwtcl        = 22,
    parameter pf3_vf_bar0_address_width_hwtcl        = 22,
    parameter pf3_vf_bar1_address_width_hwtcl        = 22,
    parameter pf3_vf_bar2_address_width_hwtcl        = 22,
    parameter pf3_vf_bar3_address_width_hwtcl        = 22,
    parameter pf3_vf_bar4_address_width_hwtcl        = 22,
    parameter pf3_vf_bar5_address_width_hwtcl        = 22,
    parameter pf4_vf_bar0_address_width_hwtcl        = 22,
    parameter pf4_vf_bar1_address_width_hwtcl        = 22,
    parameter pf4_vf_bar2_address_width_hwtcl        = 22,
    parameter pf4_vf_bar3_address_width_hwtcl        = 22,
    parameter pf4_vf_bar4_address_width_hwtcl        = 22,
    parameter pf4_vf_bar5_address_width_hwtcl        = 22,
    parameter pf5_vf_bar0_address_width_hwtcl        = 22,
    parameter pf5_vf_bar1_address_width_hwtcl        = 22,
    parameter pf5_vf_bar2_address_width_hwtcl        = 22,
    parameter pf5_vf_bar3_address_width_hwtcl        = 22,
    parameter pf5_vf_bar4_address_width_hwtcl        = 22,
    parameter pf5_vf_bar5_address_width_hwtcl        = 22,
    parameter pf6_vf_bar0_address_width_hwtcl        = 22,
    parameter pf6_vf_bar1_address_width_hwtcl        = 22,
    parameter pf6_vf_bar2_address_width_hwtcl        = 22,
    parameter pf6_vf_bar3_address_width_hwtcl        = 22,
    parameter pf6_vf_bar4_address_width_hwtcl        = 22,
    parameter pf6_vf_bar5_address_width_hwtcl        = 22,
    parameter pf7_vf_bar0_address_width_hwtcl        = 22,
    parameter pf7_vf_bar1_address_width_hwtcl        = 22,
    parameter pf7_vf_bar2_address_width_hwtcl        = 22,
    parameter pf7_vf_bar3_address_width_hwtcl        = 22,
    parameter pf7_vf_bar4_address_width_hwtcl        = 22,
    parameter pf7_vf_bar5_address_width_hwtcl        = 22


    )
   (

    // Application Packet Receive Interface (axi_st_clk)
    input  logic                                                 ss_app_st_rx_tvalid,
    output logic                                                 app_ss_st_rx_tready,
    input  logic [num_of_seg_hwtcl-1:0][seg_width_hwtcl-1:0]     ss_app_st_rx_tdata,
    input  logic [num_of_seg_hwtcl-1:0][(seg_width_hwtcl/8)-1:0] ss_app_st_rx_tkeep,
    input  logic                                                 ss_app_st_rx_tlast,
    input  logic [num_of_seg_hwtcl-1:0][2:0]                     ss_app_st_rx_tuser_vendor,
    input  logic [num_of_seg_hwtcl-1:0]                          ss_app_st_rx_tuser_last_segment,
    input  logic [num_of_seg_hwtcl-1:0]                          ss_app_st_rx_tuser_hvalid,
    input  logic [num_of_seg_hwtcl-1:0][255:0]                   ss_app_st_rx_tuser_hdr,
    
    // Application Packet Transmit Interface (axi_st_clk)
    output logic                                                 app_ss_st_tx_tvalid,
    input  logic                                                 ss_app_st_tx_tready,
    output logic [num_of_seg_hwtcl-1:0][seg_width_hwtcl-1:0]     app_ss_st_tx_tdata,
    output logic [num_of_seg_hwtcl-1:0][(seg_width_hwtcl/8)-1:0] app_ss_st_tx_tkeep,
    output logic                                                 app_ss_st_tx_tlast,
    output logic [num_of_seg_hwtcl-1:0][1:0]                     app_ss_st_tx_tuser_vendor,
    output logic [num_of_seg_hwtcl-1:0]                          app_ss_st_tx_tuser_last_segment,
    output logic [num_of_seg_hwtcl-1:0]                          app_ss_st_tx_tuser_hvalid,
    output logic [num_of_seg_hwtcl-1:0][255:0]                   app_ss_st_tx_tuser_hdr,

    // Transmit Flow Control Credit Interface (axi_st_clk)
    input  logic                                ss_app_st_txcrdt_tvalid,
    input  logic [18:0]                         ss_app_st_txcrdt_tdata,

    // Receive Flow Control Credit Interface (axi_st_clk)
    output logic                                app_ss_st_rxcrdt_tvalid,
    output logic [18:0]                         app_ss_st_rxcrdt_tdata,
    output logic [2:0]                          app_ss_st_rx_tuser_halt,

    // Control Shadow Interface (axi_lite_clk)
    input  logic                                ss_app_st_ctrlshadow_tvalid,
    input  logic [39:0]                         ss_app_st_ctrlshadow_tdata,

    // Function Level Reset Received Interface (axi_lite_clk)
    input  logic                                ss_app_st_flrrcvd_tvalid,
    input  logic [19:0]                         ss_app_st_flrrcvd_tdata,
   
    // Function Level Reset Completion Interface (axi_lite_clk)
    input  logic                                ss_app_st_flrcmpl_tready,
    output logic                                app_ss_st_flrcmpl_tvalid,
    output logic [19:0]                         app_ss_st_flrcmpl_tdata,
   
    // Completion Timeout Interface (axi_lite_clk)
    input  logic                                ss_app_st_cplto_tvalid,
    input  logic [31:0]                         ss_app_st_cplto_tdata, 

    // App Error Interface (axi_lite_clk)
    output logic                                app_ss_st_err_tvalid,
    output logic [31:0]                         app_ss_st_err_tdata,
    output logic                                app_ss_st_err_tlast,
    output logic [13:0]                         app_ss_st_err_tuser_error_type,
    input  logic                                ss_app_st_err_tready,
 
    // Control and Status Register Initiator Interface (axi_lite_clk)
    output logic                                app_ss_lite_csr_awvalid,
    input  logic                                ss_app_lite_csr_awready,
    output logic [csr_liteslvawd_hwtcl-1:0]     app_ss_lite_csr_awaddr,
    output logic [2:0]                          ss_app_lite_csr_awprot,
    output logic                                app_ss_lite_csr_wvalid,
    input  logic                                ss_app_lite_csr_wready,
    output logic [csr_liteslvdwd_hwtcl-1:0]     app_ss_lite_csr_wdata,
    output logic [csr_liteslvdwd_hwtcl/8 -1:0]  app_ss_lite_csr_wstrb,
    input  logic                                ss_app_lite_csr_bvalid,
    output logic                                app_ss_lite_csr_bready,
    input  logic [1:0]                          ss_app_lite_csr_bresp,
    output logic                                app_ss_lite_csr_arvalid,
    input  logic                                ss_app_lite_csr_arready,
    output logic [csr_liteslvawd_hwtcl-1:0]     app_ss_lite_csr_araddr,
    output logic [2:0]                          ss_app_lite_csr_arprot,
    input  logic                                ss_app_lite_csr_rvalid,
    output logic                                app_ss_lite_csr_rready,
    input  logic [csr_liteslvdwd_hwtcl-1:0]     ss_app_lite_csr_rdata,
    input  logic [1:0]                          ss_app_lite_csr_rresp,

    // Control and Status Register Responder Interface (axi_lite_clk)
    input  logic                                usr_hip_reconfig_awvalid,
    output logic                                usr_hip_reconfig_awready,
    input  logic [csr_liteslvawd_hwtcl-1:0]     usr_hip_reconfig_awaddr,
    input  logic                                usr_hip_reconfig_wvalid,
    output logic                                usr_hip_reconfig_wready,
    input  logic [csr_liteslvdwd_hwtcl-1:0]     usr_hip_reconfig_wdata,
    input  logic [csr_liteslvdwd_hwtcl/8 -1:0]  usr_hip_reconfig_wstrb,
    output logic                                usr_hip_reconfig_bvalid,
    input  logic                                usr_hip_reconfig_bready,
    output logic [1:0]                          usr_hip_reconfig_bresp,
    input  logic                                usr_hip_reconfig_arvalid,
    output logic                                usr_hip_reconfig_arready,
    input  logic [csr_liteslvawd_hwtcl-1:0]     usr_hip_reconfig_araddr,
    output logic                                usr_hip_reconfig_rvalid,
    input  logic                                usr_hip_reconfig_rready,
    output logic [csr_liteslvdwd_hwtcl-1:0]     usr_hip_reconfig_rdata,
    output logic [1:0]                          usr_hip_reconfig_rresp,

    // Configuration intercept interface (axi_lite_clk)
    input  logic                                ss_app_st_ciireq_tvalid,
    output logic                                app_ss_st_ciireq_tready,
    input  logic [71:0]                         ss_app_st_ciireq_tdata,
    output logic                                app_ss_st_ciiresp_tvalid,
    output logic [32:0]                         app_ss_st_ciiresp_tdata,

    // Configuration intercept interface (axi_lite_clk)
    output logic                                dma_user_st_ciireq_tvalid,
    input  logic                                user_dma_st_ciireq_tready,
    output logic [71:0]                         dma_user_st_ciireq_tdata,
    input  logic                                user_dma_st_ciiresp_tvalid,
    input  logic [32:0]                         user_dma_st_ciiresp_tdata,

 
    // User Side AXI-MM DMA Interface (axi_mm_clk)
    output logic                                dma_axi_mm_awvalid,
    input  logic                                dma_axi_mm_awready,
    output logic [dma_mmidwd_hwtcl-1:0]         dma_axi_mm_awid,
    output logic [dma_mmawd_hwtcl-1:0]          dma_axi_mm_awaddr,
    output logic [dma_mmblwd_hwtcl-1:0]         dma_axi_mm_awlen,
    output logic [2:0]                          dma_axi_mm_awsize,
    output logic [1:0]                          dma_axi_mm_awburst,
    output logic [2:0]                          dma_axi_mm_awprot,
    output logic                                dma_axi_mm_awlock,
    output logic                                dma_axi_mm_wvalid,
    output logic                                dma_axi_mm_wlast,
    input  logic                                dma_axi_mm_wready,
    output logic [dma_mmdwd_hwtcl-1:0]          dma_axi_mm_wdata,
    output logic [dma_mmdwd_hwtcl/8 -1:0]       dma_axi_mm_wstrb,
    input  logic                                dma_axi_mm_bvalid,
    output logic                                dma_axi_mm_bready,
    input  logic [dma_mmidwd_hwtcl-1:0]         dma_axi_mm_bid,
    input  logic [1:0]                          dma_axi_mm_bresp,
    output logic                                dma_axi_mm_arvalid,
    input  logic                                dma_axi_mm_arready,
    output logic [dma_mmidwd_hwtcl-1:0]         dma_axi_mm_arid,
    output logic [dma_mmawd_hwtcl-1:0]          dma_axi_mm_araddr,
    output logic [dma_mmblwd_hwtcl-1:0]         dma_axi_mm_arlen,
    output logic [2:0]                          dma_axi_mm_arsize,
    output logic [1:0]                          dma_axi_mm_arburst,
    output logic [2:0]                          dma_axi_mm_arprot,
    output logic                                dma_axi_mm_arlock,
    input  logic                                dma_axi_mm_rvalid,
    input  logic                                dma_axi_mm_rlast,
    output logic                                dma_axi_mm_rready,
    input  logic [dma_mmidwd_hwtcl-1:0]         dma_axi_mm_rid,
    input  logic [dma_mmdwd_hwtcl-1:0]          dma_axi_mm_rdata,
    input  logic [1:0]                          dma_axi_mm_rresp,
 
    // User Side AXI-stream Master (H2D) Interface (axi_st_clk)
    output logic                                h2d_axi_st_tvalid,
    input  logic                                h2d_axi_st_tready,
    output logic [dwidth_hwtcl-1:0]             h2d_axi_st_tdata,
    output logic [(dwidth_hwtcl/8)-1:0]         h2d_axi_st_tkeep,
    output logic                                h2d_axi_st_tlast,
    output logic                                h2d_axi_st_tuser_error, // error during data fetch
    output logic [63:0]                         h2d_axi_st_tuser_metadata,
    output logic [11:0]                         h2d_axi_st_tid,
 
    // User Side AXI-stream Slave (D2H) Interface (axi_st_clk)
    input  logic                                d2h_axi_st_tvalid,
    output logic                                d2h_axi_st_tready,
    input  logic [dwidth_hwtcl-1:0]             d2h_axi_st_tdata,
    input  logic [(dwidth_hwtcl/8)-1:0]         d2h_axi_st_tkeep,
    input  logic                                d2h_axi_st_tlast,
    input  logic                                d2h_axi_st_tuser_error, // reserved
    input  logic [63:0]                         d2h_axi_st_tuser_metadata,
    input  logic [11:0]                         d2h_axi_st_tid,

    // User Side PIO AXI Lite Initiator Interface (axi_lite_clk)
    output logic                                rx_pio_axi_lite_awvalid,
    input  logic                                rx_pio_axi_lite_awready,
    output logic [pio_litemstrawd_hwtcl-1:0]    rx_pio_axi_lite_awaddr,
    output logic [2:0]                          rx_pio_axi_lite_awprot,
    output logic                                rx_pio_axi_lite_wvalid,
    input  logic                                rx_pio_axi_lite_wready,
    output logic [pio_litemstrdwd_hwtcl-1:0]    rx_pio_axi_lite_wdata,
    output logic [pio_litemstrdwd_hwtcl/8 -1:0] rx_pio_axi_lite_wstrb,
    input  logic                                rx_pio_axi_lite_bvalid,
    output logic                                rx_pio_axi_lite_bready,
    input  logic [1:0]                          rx_pio_axi_lite_bresp,
    output logic                                rx_pio_axi_lite_arvalid,
    input  logic                                rx_pio_axi_lite_arready,
    output logic [pio_litemstrawd_hwtcl-1:0]    rx_pio_axi_lite_araddr,
    output logic [2:0]                          rx_pio_axi_lite_arprot,
    input  logic                                rx_pio_axi_lite_rvalid,
    output logic                                rx_pio_axi_lite_rready,
    input  logic [pio_litemstrdwd_hwtcl-1:0]    rx_pio_axi_lite_rdata,
    input  logic [1:0]                          rx_pio_axi_lite_rresp,

    // User Side AXI-MM BAM Interface (axi_mm_clk)
    output logic                                bam_axi_mm_awvalid,
    input  logic                                bam_axi_mm_awready,
    output logic [bam_mmidwd_hwtcl-1:0]         bam_axi_mm_awid,
    output logic [bam_mmawd_hwtcl-1:0]          bam_axi_mm_awaddr,
    output logic [bam_mmblwd_hwtcl-1:0]         bam_axi_mm_awlen,
    output logic [2:0]                          bam_axi_mm_awsize,
    output logic [1:0]                          bam_axi_mm_awburst,
    output logic [2:0]                          bam_axi_mm_awprot,
    output logic                                bam_axi_mm_awlock,
    output logic                                bam_axi_mm_wvalid,
    output logic                                bam_axi_mm_wlast,
    input  logic                                bam_axi_mm_wready,
    output logic [bam_mmdwd_hwtcl-1:0]          bam_axi_mm_wdata,
    output logic [bam_mmdwd_hwtcl/8 -1:0]       bam_axi_mm_wstrb,
    input  logic                                bam_axi_mm_bvalid,
    output logic                                bam_axi_mm_bready,
    input  logic [bam_mmidwd_hwtcl-1:0]         bam_axi_mm_bid,
    input  logic [1:0]                          bam_axi_mm_bresp,
    output logic                                bam_axi_mm_arvalid,
    input  logic                                bam_axi_mm_arready,
    output logic [bam_mmidwd_hwtcl-1:0]         bam_axi_mm_arid,
    output logic [bam_mmawd_hwtcl-1:0]          bam_axi_mm_araddr,
    output logic [bam_mmblwd_hwtcl-1:0]         bam_axi_mm_arlen,
    output logic [2:0]                          bam_axi_mm_arsize,
    output logic [1:0]                          bam_axi_mm_arburst,
    output logic [2:0]                          bam_axi_mm_arprot,
    output logic                                bam_axi_mm_arlock,
    input  logic                                bam_axi_mm_rvalid,
    input  logic                                bam_axi_mm_rlast,
    output logic                                bam_axi_mm_rready,
    input  logic [bam_mmidwd_hwtcl-1:0]         bam_axi_mm_rid,
    input  logic [bam_mmdwd_hwtcl-1:0]          bam_axi_mm_rdata,
    input  logic [1:0]                          bam_axi_mm_rresp,
 
    // User Side AXI-MM BAS Interface (axi_mm_clk)
    input  logic                                bas_axi_mm_awvalid,
    output logic                                bas_axi_mm_awready,
    input  logic [bas_mmidwd_hwtcl-1:0]         bas_axi_mm_awid,
    input  logic [bas_mmawd_hwtcl-1:0]          bas_axi_mm_awaddr,
    input  logic [bas_mmuwd_hwtcl-1:0]          bas_axi_mm_awuser,
    input  logic [bas_mmblwd_hwtcl-1:0]         bas_axi_mm_awlen,
    input  logic [2:0]                          bas_axi_mm_awsize,
    input  logic [1:0]                          bas_axi_mm_awburst,
    input  logic [2:0]                          bas_axi_mm_awprot,
    input  logic                                bas_axi_mm_awlock,
    input  logic                                bas_axi_mm_wvalid,
    input  logic                                bas_axi_mm_wlast,
    output logic                                bas_axi_mm_wready,
    input  logic [bas_mmdwd_hwtcl-1:0]          bas_axi_mm_wdata,
    input  logic [bas_mmdwd_hwtcl/8 -1:0]       bas_axi_mm_wstrb,
    output logic                                bas_axi_mm_bvalid,
    input  logic                                bas_axi_mm_bready,
    output logic [bas_mmidwd_hwtcl-1:0]         bas_axi_mm_bid,
    output logic [1:0]                          bas_axi_mm_bresp,
    input  logic                                bas_axi_mm_arvalid,
    output logic                                bas_axi_mm_arready,
    input  logic [bas_mmidwd_hwtcl-1:0]         bas_axi_mm_arid,
    input  logic [bas_mmawd_hwtcl-1:0]          bas_axi_mm_araddr,
    input  logic [bas_mmuwd_hwtcl-1:0]          bas_axi_mm_aruser,
    input  logic [bas_mmblwd_hwtcl-1:0]         bas_axi_mm_arlen,
    input  logic [2:0]                          bas_axi_mm_arsize,
    input  logic [1:0]                          bas_axi_mm_arburst,
    input  logic [2:0]                          bas_axi_mm_arprot,
    input  logic                                bas_axi_mm_arlock,
    output logic                                bas_axi_mm_rvalid,
    output logic                                bas_axi_mm_rlast,
    input  logic                                bas_axi_mm_rready,
    output logic [bas_mmidwd_hwtcl-1:0]         bas_axi_mm_rid,
    output logic [bas_mmdwd_hwtcl-1:0]          bas_axi_mm_rdata,
    output logic [1:0]                          bas_axi_mm_rresp,

    // User Side CS AXI Lite Responder Interface (axi_lite_clk)
    input  logic                                cs_axi_lite_awvalid,
    output logic                                cs_axi_lite_awready,
    input  logic [cs_litemstrawd_hwtcl-1:0]     cs_axi_lite_awaddr,
    input  logic                                cs_axi_lite_wvalid,
    output logic                                cs_axi_lite_wready,
    input  logic [cs_litemstrdwd_hwtcl-1:0]     cs_axi_lite_wdata,
    input  logic [cs_litemstrdwd_hwtcl/8 -1:0]  cs_axi_lite_wstrb,
    output logic                                cs_axi_lite_bvalid,
    input  logic                                cs_axi_lite_bready,
    output logic [1:0]                          cs_axi_lite_bresp,
    input  logic                                cs_axi_lite_arvalid,
    output logic                                cs_axi_lite_arready,
    input  logic [cs_litemstrawd_hwtcl-1:0]     cs_axi_lite_araddr,
    output logic                                cs_axi_lite_rvalid,
    input  logic                                cs_axi_lite_rready,
    output logic [cs_litemstrdwd_hwtcl-1:0]     cs_axi_lite_rdata,
    output logic [1:0]                          cs_axi_lite_rresp,

    // FLR interface to application/user side (axi_lite_clk)
    output logic                                user_flr_rcvd_val,
    output logic [11:0]                         user_flr_rcvd_chan_num,
    input  logic                                user_flr_completed,
 
    // MSI-X Request interface from application/user side (axi_lite_clk)
    output logic                                user_event_msix_tready,
    input  logic                                user_event_msix_tvalid,
    input  logic [15:0]                         user_event_msix_tdata,
 
    // MSI Request interface from application/user side (axi_lite_clk)
    input  logic                                user_msi_req,
    input  logic [pfnum_width_hwtcl-1:0]        user_msi_func_num,
    input  logic [4:0]                          user_msi_num,
    output logic                                user_msi_ack,
    output logic [1:0]                          user_msi_status, // 00 = MSI message sent, 
                                                              // 01 = Pending bit set(mask set) and no message sent, 
                                                              // 10 = error (msix not enabled or not alloted)
                                                              
    // Clock and reset
    input                                       axi_st_clk,
    input                                       axi_lite_clk,
    input                                       axi_st_areset_n,
    input                                       axi_lite_areset_n,
    input                                       axi_mm_clk,
    input                                       axi_mm_areset_n


  );

  // terminating the lite-CSR un-used port
  assign ss_app_lite_csr_awprot = '0;
  assign ss_app_lite_csr_arprot = '0;

  // terminating the RX-PIO-lite un-used port
  assign rx_pio_axi_lite_awprot = '0;
  assign rx_pio_axi_lite_arprot = '0;


  intel_pcie_axi_mcdma_top #(
    
     // The value type (integer/string) will change based on hw_tcl development.

      .device_family_hwtcl                   ( device_family_hwtcl                   ),
 
     .header_packing_scheme_hwtcl           ( header_packing_scheme_hwtcl           ),      // Simple, Variable, Compact
     .dma_top_topology_hwtcl                ( dma_top_topology_hwtcl                ),           // "Gen5 1x16" "Gen5 2x8" "Gen4 1x16" "Gen4 2x8" "Gen3 1x16" "Gen3 2x8"
     .dwidth_hwtcl                          ( dwidth_hwtcl                          ),           // 256,512,1024
     .num_of_seg_hwtcl                      ( num_of_seg_hwtcl                      ), // derived param of dwidth_hwtcl -> 1 or 2 or 4
     .seg_width_hwtcl                       ( seg_width_hwtcl                       ), // hardcode to 256
     .single_width_integer_hwtcl            ( single_width_integer_hwtcl            ), // 0 = DoubleWidth, 1 = SingleWidth mode (Only for R-Tile PCIe-SS)
     .st_readylatency_hwtcl                 ( st_readylatency_hwtcl                 ),             // 0-4
 
     .csr_liteslvawd_hwtcl                  ( csr_liteslvawd_hwtcl                  ),
     .csr_liteslvdwd_hwtcl                  ( csr_liteslvdwd_hwtcl                  ),
 
     .pio_litemstrawd_hwtcl                 ( pio_litemstrawd_hwtcl                 ),
     .pio_litemstrdwd_hwtcl                 ( pio_litemstrdwd_hwtcl                 ),
     .pio_litemstr_readylatency_hwtcl       ( pio_litemstr_readylatency_hwtcl       ),
 
     .cs_litemstrawd_hwtcl                  ( cs_litemstrawd_hwtcl                  ),
     .cs_litemstrdwd_hwtcl                  ( cs_litemstrdwd_hwtcl                  ),
     .cs_litemstr_readylatency_hwtcl        ( cs_litemstr_readylatency_hwtcl        ),
 
     .dma_mm_mode_hwtcl                     ( dma_mm_mode_hwtcl                     ), // AXI-MM (or) AXIS User Interface
     .dma_mmidwd_hwtcl                      ( dma_mmidwd_hwtcl                      ),
     .dma_mmawd_hwtcl                       ( dma_mmawd_hwtcl                       ),
     .dma_mmblwd_hwtcl                      ( dma_mmblwd_hwtcl                      ),
     .dma_mmdwd_hwtcl                       ( dma_mmdwd_hwtcl                       ), // derived of dwidth_hwtcl (same)
     .dma_mm_readylatency_hwtcl             ( dma_mm_readylatency_hwtcl             ),
 
     .bam_mmidwd_hwtcl                      ( bam_mmidwd_hwtcl                      ),
     .bam_mmawd_hwtcl                       ( bam_mmawd_hwtcl                       ),
     .bam_mmblwd_hwtcl                      ( bam_mmblwd_hwtcl                      ),
     .bam_mmdwd_hwtcl                       ( bam_mmdwd_hwtcl                       ), // derived of dwidth_hwtcl (same)
     .bam_mm_readylatency_hwtcl             ( bam_mm_readylatency_hwtcl             ),
 
     .bas_mmidwd_hwtcl                      ( bas_mmidwd_hwtcl                      ),
     .bas_mmawd_hwtcl                       ( bas_mmawd_hwtcl                       ),
     .bas_mmuwd_hwtcl                       ( bas_mmuwd_hwtcl                       ), // awuser/aruser = {vf_num[10:0],vf_active,pf_num[2:0]}
     .bas_mmblwd_hwtcl                      ( bas_mmblwd_hwtcl                      ),
     .bas_mmdwd_hwtcl                       ( bas_mmdwd_hwtcl                       ), // derived of dwidth_hwtcl (same)
     .bas_mm_readylatency_hwtcl             ( bas_mm_readylatency_hwtcl             ),
 
     .enable_mcdma_hwtcl                    ( enable_mcdma_hwtcl                    ),
     .enable_bursting_master_hwtcl          ( enable_bursting_master_hwtcl          ),
     .enable_bursting_slave_hwtcl           ( enable_bursting_slave_hwtcl           ),
     .enable_config_slave_hwtcl             ( enable_config_slave_hwtcl             ),
     .enable_byte_aligned_txfr_hwtcl        ( enable_byte_aligned_txfr_hwtcl        ), // 0 = Cache-line aligned txfr, 1 = Byte aligned txfr
     .enable_10bit_tag_hwtcl                ( enable_10bit_tag_hwtcl                ), // 10-bit Tag Support (Maximum of 512 outstanding tags at any given time, for all functions combined)
     .enable_user_msix_hwtcl                ( enable_user_msix_hwtcl                ),
     .enable_user_flr_hwtcl                 ( enable_user_flr_hwtcl                 ),
     .enable_metadata_8_hwtcl               ( enable_metadata_8_hwtcl               ),
     .enable_cpl_reorder_hwtcl              ( enable_cpl_reorder_hwtcl              ), // Completion re-ordering is enabled
     .enable_cpl_timeout_hwtcl              ( enable_cpl_timeout_hwtcl              ), // Completion timeout
 
     .d2h_num_active_channel_hwtcl          ( d2h_num_active_channel_hwtcl          ),
     .d2h_max_num_desc_fetch_hwtcl          ( d2h_max_num_desc_fetch_hwtcl          ),
 
     .enable_msi_hwtcl                      ( enable_msi_hwtcl                      ),
     .msi_pvm_capable_hwtcl                 ( msi_pvm_capable_hwtcl                 ),
     .msi_addr_64bit_capable_hwtcl          ( msi_addr_64bit_capable_hwtcl          ),
     .msi_ext_msg_data_capable_hwtcl        ( msi_ext_msg_data_capable_hwtcl        ),
     .msi_multi_msg_capable_hwtcl           ( msi_multi_msg_capable_hwtcl           ),
 
     .enable_device_att_hwtcl               ( enable_device_att_hwtcl               ), // Address transilation table for BAS
     .att_table_address_hwtcl               ( att_table_address_hwtcl               ), // depth of ATT RAM, range of 1 to 9
     .att_window_address_hwtcl              ( att_window_address_hwtcl              ), // Passthrough BAS LSB address bits, range of 10 to 63
 
     .enable_dca_hwtcl                      ( enable_dca_hwtcl                      ), // Dynamic channel allocation using Mailbox
     .dca_num_chn_supported_hwtcl           ( dca_num_chn_supported_hwtcl           ), // Number of channel supported for DCA with Mailbox
     .dca_num_log_ch_func_hwtcl             ( dca_num_log_ch_func_hwtcl             ), // Number of Logical channel per Functions (1 to 256) 
     .dca_enable_pf_ch_hwtcl                ( dca_enable_pf_ch_hwtcl                ), // Enable channels in Physical Functions
 
     .pf2int_funct_init_file_hwtcl          ( pf2int_funct_init_file_hwtcl          ),
     .int_funct2dma_chan_pf_init_file_hwtcl ( int_funct2dma_chan_pf_init_file_hwtcl ),
     .int_funct2dma_chan_vf_init_file_hwtcl ( int_funct2dma_chan_vf_init_file_hwtcl ),
     .dma_chan2funct_init_file_hwtcl        ( dma_chan2funct_init_file_hwtcl        ),
 
     .pfnum_hwtcl                           ( pfnum_hwtcl                           ), // Allowed Range (1 to 8)
     .pfnum_width_hwtcl                     ( pfnum_width_hwtcl                     ),
     .vfnum_width_hwtcl                     ( vfnum_width_hwtcl                     ),
 
     .max_bar_address_width_hwtcl           ( max_bar_address_width_hwtcl           ), 

     .pf0_enable_sriov_hwtcl                ( pf0_enable_sriov_hwtcl                ),
     .pf0_num_vf_per_pf_hwtcl               ( pf0_num_vf_per_pf_hwtcl               ),
     .pf0_num_dma_chan_pf_hwtcl             ( pf0_num_dma_chan_pf_hwtcl             ),
     .pf0_num_dma_chan_per_vf_hwtcl         ( pf0_num_dma_chan_per_vf_hwtcl         ),
     .pf1_enable_sriov_hwtcl                ( pf1_enable_sriov_hwtcl                ),
     .pf1_num_vf_per_pf_hwtcl               ( pf1_num_vf_per_pf_hwtcl               ),
     .pf1_num_dma_chan_pf_hwtcl             ( pf1_num_dma_chan_pf_hwtcl             ),
     .pf1_num_dma_chan_per_vf_hwtcl         ( pf1_num_dma_chan_per_vf_hwtcl         ),
     .pf2_enable_sriov_hwtcl                ( pf2_enable_sriov_hwtcl                ),
     .pf2_num_vf_per_pf_hwtcl               ( pf2_num_vf_per_pf_hwtcl               ),
     .pf2_num_dma_chan_pf_hwtcl             ( pf2_num_dma_chan_pf_hwtcl             ),
     .pf2_num_dma_chan_per_vf_hwtcl         ( pf2_num_dma_chan_per_vf_hwtcl         ),
     .pf3_enable_sriov_hwtcl                ( pf3_enable_sriov_hwtcl                ),
     .pf3_num_vf_per_pf_hwtcl               ( pf3_num_vf_per_pf_hwtcl               ),
     .pf3_num_dma_chan_pf_hwtcl             ( pf3_num_dma_chan_pf_hwtcl             ),
     .pf3_num_dma_chan_per_vf_hwtcl         ( pf3_num_dma_chan_per_vf_hwtcl         ),
     .pf4_enable_sriov_hwtcl                ( pf4_enable_sriov_hwtcl                ),
     .pf4_num_vf_per_pf_hwtcl               ( pf4_num_vf_per_pf_hwtcl               ),
     .pf4_num_dma_chan_pf_hwtcl             ( pf4_num_dma_chan_pf_hwtcl             ),
     .pf4_num_dma_chan_per_vf_hwtcl         ( pf4_num_dma_chan_per_vf_hwtcl         ),
     .pf5_enable_sriov_hwtcl                ( pf5_enable_sriov_hwtcl                ),
     .pf5_num_vf_per_pf_hwtcl               ( pf5_num_vf_per_pf_hwtcl               ),
     .pf5_num_dma_chan_pf_hwtcl             ( pf5_num_dma_chan_pf_hwtcl             ),
     .pf5_num_dma_chan_per_vf_hwtcl         ( pf5_num_dma_chan_per_vf_hwtcl         ),
     .pf6_enable_sriov_hwtcl                ( pf6_enable_sriov_hwtcl                ),
     .pf6_num_vf_per_pf_hwtcl               ( pf6_num_vf_per_pf_hwtcl               ),
     .pf6_num_dma_chan_pf_hwtcl             ( pf6_num_dma_chan_pf_hwtcl             ),
     .pf6_num_dma_chan_per_vf_hwtcl         ( pf6_num_dma_chan_per_vf_hwtcl         ),
     .pf7_enable_sriov_hwtcl                ( pf7_enable_sriov_hwtcl                ),
     .pf7_num_vf_per_pf_hwtcl               ( pf7_num_vf_per_pf_hwtcl               ),
     .pf7_num_dma_chan_pf_hwtcl             ( pf7_num_dma_chan_pf_hwtcl             ),
     .pf7_num_dma_chan_per_vf_hwtcl         ( pf7_num_dma_chan_per_vf_hwtcl         ),
 
     .pf0_bar0_address_width_hwtcl          ( pf0_bar0_address_width_hwtcl          ),
     .pf0_bar1_address_width_hwtcl          ( pf0_bar1_address_width_hwtcl          ),
     .pf0_bar2_address_width_hwtcl          ( pf0_bar2_address_width_hwtcl          ),
     .pf0_bar3_address_width_hwtcl          ( pf0_bar3_address_width_hwtcl          ),
     .pf0_bar4_address_width_hwtcl          ( pf0_bar4_address_width_hwtcl          ),
     .pf0_bar5_address_width_hwtcl          ( pf0_bar5_address_width_hwtcl          ),
     .pf1_bar0_address_width_hwtcl          ( pf1_bar0_address_width_hwtcl          ),
     .pf1_bar1_address_width_hwtcl          ( pf1_bar1_address_width_hwtcl          ),
     .pf1_bar2_address_width_hwtcl          ( pf1_bar2_address_width_hwtcl          ),
     .pf1_bar3_address_width_hwtcl          ( pf1_bar3_address_width_hwtcl          ),
     .pf1_bar4_address_width_hwtcl          ( pf1_bar4_address_width_hwtcl          ),
     .pf1_bar5_address_width_hwtcl          ( pf1_bar5_address_width_hwtcl          ),
     .pf2_bar0_address_width_hwtcl          ( pf2_bar0_address_width_hwtcl          ),
     .pf2_bar1_address_width_hwtcl          ( pf2_bar1_address_width_hwtcl          ),
     .pf2_bar2_address_width_hwtcl          ( pf2_bar2_address_width_hwtcl          ),
     .pf2_bar3_address_width_hwtcl          ( pf2_bar3_address_width_hwtcl          ),
     .pf2_bar4_address_width_hwtcl          ( pf2_bar4_address_width_hwtcl          ),
     .pf2_bar5_address_width_hwtcl          ( pf2_bar5_address_width_hwtcl          ),
     .pf3_bar0_address_width_hwtcl          ( pf3_bar0_address_width_hwtcl          ),
     .pf3_bar1_address_width_hwtcl          ( pf3_bar1_address_width_hwtcl          ),
     .pf3_bar2_address_width_hwtcl          ( pf3_bar2_address_width_hwtcl          ),
     .pf3_bar3_address_width_hwtcl          ( pf3_bar3_address_width_hwtcl          ),
     .pf3_bar4_address_width_hwtcl          ( pf3_bar4_address_width_hwtcl          ),
     .pf3_bar5_address_width_hwtcl          ( pf3_bar5_address_width_hwtcl          ),
     .pf4_bar0_address_width_hwtcl          ( pf4_bar0_address_width_hwtcl          ),
     .pf4_bar1_address_width_hwtcl          ( pf4_bar1_address_width_hwtcl          ),
     .pf4_bar2_address_width_hwtcl          ( pf4_bar2_address_width_hwtcl          ),
     .pf4_bar3_address_width_hwtcl          ( pf4_bar3_address_width_hwtcl          ),
     .pf4_bar4_address_width_hwtcl          ( pf4_bar4_address_width_hwtcl          ),
     .pf4_bar5_address_width_hwtcl          ( pf4_bar5_address_width_hwtcl          ),
     .pf5_bar0_address_width_hwtcl          ( pf5_bar0_address_width_hwtcl          ),
     .pf5_bar1_address_width_hwtcl          ( pf5_bar1_address_width_hwtcl          ),
     .pf5_bar2_address_width_hwtcl          ( pf5_bar2_address_width_hwtcl          ),
     .pf5_bar3_address_width_hwtcl          ( pf5_bar3_address_width_hwtcl          ),
     .pf5_bar4_address_width_hwtcl          ( pf5_bar4_address_width_hwtcl          ),
     .pf5_bar5_address_width_hwtcl          ( pf5_bar5_address_width_hwtcl          ),
     .pf6_bar0_address_width_hwtcl          ( pf6_bar0_address_width_hwtcl          ),
     .pf6_bar1_address_width_hwtcl          ( pf6_bar1_address_width_hwtcl          ),
     .pf6_bar2_address_width_hwtcl          ( pf6_bar2_address_width_hwtcl          ),
     .pf6_bar3_address_width_hwtcl          ( pf6_bar3_address_width_hwtcl          ),
     .pf6_bar4_address_width_hwtcl          ( pf6_bar4_address_width_hwtcl          ),
     .pf6_bar5_address_width_hwtcl          ( pf6_bar5_address_width_hwtcl          ),
     .pf7_bar0_address_width_hwtcl          ( pf7_bar0_address_width_hwtcl          ),
     .pf7_bar1_address_width_hwtcl          ( pf7_bar1_address_width_hwtcl          ),
     .pf7_bar2_address_width_hwtcl          ( pf7_bar2_address_width_hwtcl          ),
     .pf7_bar3_address_width_hwtcl          ( pf7_bar3_address_width_hwtcl          ),
     .pf7_bar4_address_width_hwtcl          ( pf7_bar4_address_width_hwtcl          ),
     .pf7_bar5_address_width_hwtcl          ( pf7_bar5_address_width_hwtcl          ),
 
     .pf0_vf_bar0_address_width_hwtcl       ( pf0_vf_bar0_address_width_hwtcl       ),
     .pf0_vf_bar1_address_width_hwtcl       ( pf0_vf_bar1_address_width_hwtcl       ),
     .pf0_vf_bar2_address_width_hwtcl       ( pf0_vf_bar2_address_width_hwtcl       ),
     .pf0_vf_bar3_address_width_hwtcl       ( pf0_vf_bar3_address_width_hwtcl       ),
     .pf0_vf_bar4_address_width_hwtcl       ( pf0_vf_bar4_address_width_hwtcl       ),
     .pf0_vf_bar5_address_width_hwtcl       ( pf0_vf_bar5_address_width_hwtcl       ),
     .pf1_vf_bar0_address_width_hwtcl       ( pf1_vf_bar0_address_width_hwtcl       ),
     .pf1_vf_bar1_address_width_hwtcl       ( pf1_vf_bar1_address_width_hwtcl       ),
     .pf1_vf_bar2_address_width_hwtcl       ( pf1_vf_bar2_address_width_hwtcl       ),
     .pf1_vf_bar3_address_width_hwtcl       ( pf1_vf_bar3_address_width_hwtcl       ),
     .pf1_vf_bar4_address_width_hwtcl       ( pf1_vf_bar4_address_width_hwtcl       ),
     .pf1_vf_bar5_address_width_hwtcl       ( pf1_vf_bar5_address_width_hwtcl       ),
     .pf2_vf_bar0_address_width_hwtcl       ( pf2_vf_bar0_address_width_hwtcl       ),
     .pf2_vf_bar1_address_width_hwtcl       ( pf2_vf_bar1_address_width_hwtcl       ),
     .pf2_vf_bar2_address_width_hwtcl       ( pf2_vf_bar2_address_width_hwtcl       ),
     .pf2_vf_bar3_address_width_hwtcl       ( pf2_vf_bar3_address_width_hwtcl       ),
     .pf2_vf_bar4_address_width_hwtcl       ( pf2_vf_bar4_address_width_hwtcl       ),
     .pf2_vf_bar5_address_width_hwtcl       ( pf2_vf_bar5_address_width_hwtcl       ),
     .pf3_vf_bar0_address_width_hwtcl       ( pf3_vf_bar0_address_width_hwtcl       ),
     .pf3_vf_bar1_address_width_hwtcl       ( pf3_vf_bar1_address_width_hwtcl       ),
     .pf3_vf_bar2_address_width_hwtcl       ( pf3_vf_bar2_address_width_hwtcl       ),
     .pf3_vf_bar3_address_width_hwtcl       ( pf3_vf_bar3_address_width_hwtcl       ),
     .pf3_vf_bar4_address_width_hwtcl       ( pf3_vf_bar4_address_width_hwtcl       ),
     .pf3_vf_bar5_address_width_hwtcl       ( pf3_vf_bar5_address_width_hwtcl       ),
     .pf4_vf_bar0_address_width_hwtcl       ( pf4_vf_bar0_address_width_hwtcl       ),
     .pf4_vf_bar1_address_width_hwtcl       ( pf4_vf_bar1_address_width_hwtcl       ),
     .pf4_vf_bar2_address_width_hwtcl       ( pf4_vf_bar2_address_width_hwtcl       ),
     .pf4_vf_bar3_address_width_hwtcl       ( pf4_vf_bar3_address_width_hwtcl       ),
     .pf4_vf_bar4_address_width_hwtcl       ( pf4_vf_bar4_address_width_hwtcl       ),
     .pf4_vf_bar5_address_width_hwtcl       ( pf4_vf_bar5_address_width_hwtcl       ),
     .pf5_vf_bar0_address_width_hwtcl       ( pf5_vf_bar0_address_width_hwtcl       ),
     .pf5_vf_bar1_address_width_hwtcl       ( pf5_vf_bar1_address_width_hwtcl       ),
     .pf5_vf_bar2_address_width_hwtcl       ( pf5_vf_bar2_address_width_hwtcl       ),
     .pf5_vf_bar3_address_width_hwtcl       ( pf5_vf_bar3_address_width_hwtcl       ),
     .pf5_vf_bar4_address_width_hwtcl       ( pf5_vf_bar4_address_width_hwtcl       ),
     .pf5_vf_bar5_address_width_hwtcl       ( pf5_vf_bar5_address_width_hwtcl       ),
     .pf6_vf_bar0_address_width_hwtcl       ( pf6_vf_bar0_address_width_hwtcl       ),
     .pf6_vf_bar1_address_width_hwtcl       ( pf6_vf_bar1_address_width_hwtcl       ),
     .pf6_vf_bar2_address_width_hwtcl       ( pf6_vf_bar2_address_width_hwtcl       ),
     .pf6_vf_bar3_address_width_hwtcl       ( pf6_vf_bar3_address_width_hwtcl       ),
     .pf6_vf_bar4_address_width_hwtcl       ( pf6_vf_bar4_address_width_hwtcl       ),
     .pf6_vf_bar5_address_width_hwtcl       ( pf6_vf_bar5_address_width_hwtcl       ),
     .pf7_vf_bar0_address_width_hwtcl       ( pf7_vf_bar0_address_width_hwtcl       ),
     .pf7_vf_bar1_address_width_hwtcl       ( pf7_vf_bar1_address_width_hwtcl       ),
     .pf7_vf_bar2_address_width_hwtcl       ( pf7_vf_bar2_address_width_hwtcl       ),
     .pf7_vf_bar3_address_width_hwtcl       ( pf7_vf_bar3_address_width_hwtcl       ),
     .pf7_vf_bar4_address_width_hwtcl       ( pf7_vf_bar4_address_width_hwtcl       ),
     .pf7_vf_bar5_address_width_hwtcl       ( pf7_vf_bar5_address_width_hwtcl       )
     
  ) mcdma_top_i (

     // Application Packet Receive Interface (axi_st_clk)
     .ss_app_st_rx_tvalid                       ( ss_app_st_rx_tvalid                     ),
     .app_ss_st_rx_tready                       ( app_ss_st_rx_tready                     ),
     .ss_app_st_rx_tdata                        ( ss_app_st_rx_tdata                      ),
     .ss_app_st_rx_tkeep                        ( ss_app_st_rx_tkeep                      ),
     .ss_app_st_rx_tlast                        ( ss_app_st_rx_tlast                      ),
     .ss_app_st_rx_tuser_vendor                 ( ss_app_st_rx_tuser_vendor               ),
     .ss_app_st_rx_tuser_last_segment           ( ss_app_st_rx_tuser_last_segment          ),
     .ss_app_st_rx_tuser_hvalid                 ( ss_app_st_rx_tuser_hvalid               ),
     .ss_app_st_rx_tuser_hdr                    ( ss_app_st_rx_tuser_hdr                  ),
 
     // Application Packet Transmit Interface (axi_st_clk)
     .app_ss_st_tx_tvalid                       ( app_ss_st_tx_tvalid                     ),
     .ss_app_st_tx_tready                       ( ss_app_st_tx_tready                     ),
     .app_ss_st_tx_tdata                        ( app_ss_st_tx_tdata                      ),
     .app_ss_st_tx_tkeep                        ( app_ss_st_tx_tkeep                      ),
     .app_ss_st_tx_tlast                        ( app_ss_st_tx_tlast                      ),
     .app_ss_st_tx_tuser_vendor                 ( app_ss_st_tx_tuser_vendor               ),
     .app_ss_st_tx_tuser_last_segment           ( app_ss_st_tx_tuser_last_segment         ),
     .app_ss_st_tx_tuser_hvalid                 ( app_ss_st_tx_tuser_hvalid               ),
     .app_ss_st_tx_tuser_hdr                    ( app_ss_st_tx_tuser_hdr                  ),
 
     // Transmit Flow Control Credit Interface (axi_st_clk)
     .ss_app_st_txcrdt_tvalid       ( ss_app_st_txcrdt_tvalid ),
     .ss_app_st_txcrdt_tdata        ( ss_app_st_txcrdt_tdata  ),
 
     // Receive Flow Control Credit Interface (axi_st_clk)
     .app_ss_st_rxcrdt_tvalid       ( app_ss_st_rxcrdt_tvalid ),
     .app_ss_st_rxcrdt_tdata        ( app_ss_st_rxcrdt_tdata  ),
     .app_ss_st_rx_tuser_halt          (app_ss_st_rx_tuser_halt ),
 
     // Control Shadow Interface (axi_lite_clk)
     .ss_app_st_ctrlshadow_tvalid   ( ss_app_st_ctrlshadow_tvalid ),
     .ss_app_st_ctrlshadow_tdata    ( ss_app_st_ctrlshadow_tdata  ),
 
     // Function Level Reset Received Interface (axi_lite_clk)
     .ss_app_st_flrrcvd_tvalid      ( ss_app_st_flrrcvd_tvalid ),
     .ss_app_st_flrrcvd_tdata       ( ss_app_st_flrrcvd_tdata  ),
 
     // Function Level Reset Completion Interface (axi_lite_clk)
     .app_ss_st_flrcmpl_tvalid      ( app_ss_st_flrcmpl_tvalid ),
     .app_ss_st_flrcmpl_tdata       ( app_ss_st_flrcmpl_tdata  ),
     .ss_app_st_flrcmpl_tready      ( ss_app_st_flrcmpl_tready ),
 
     // Completion Timeout Interface (axi_lite_clk)
     .ss_app_st_cplto_tvalid        ( ss_app_st_cplto_tvalid ),
     .ss_app_st_cplto_tdata         ( ss_app_st_cplto_tdata  ),

     // App Error Interface (axi_lite_clk)
     .app_ss_st_err_tvalid            ( app_ss_st_err_tvalid            ),
     .app_ss_st_err_tdata             ( app_ss_st_err_tdata             ),
     .app_ss_st_err_tlast             ( app_ss_st_err_tlast             ),
     .app_ss_st_err_tuser_error_type  ( app_ss_st_err_tuser_error_type  ),
     .ss_app_st_err_tready            ( ss_app_st_err_tready            ),
 
 
     // Configuration intercept interface (axi_lite_clk)
     .ss_app_st_ciireq_tvalid       ( ss_app_st_ciireq_tvalid  ),
     .app_ss_st_ciireq_tready       ( app_ss_st_ciireq_tready  ),
     .ss_app_st_ciireq_tdata        ( ss_app_st_ciireq_tdata   ),
     .app_ss_st_ciiresp_tvalid      ( app_ss_st_ciiresp_tvalid ),
     .app_ss_st_ciiresp_tdata       ( app_ss_st_ciiresp_tdata  ),

     // Configuration intercept interface (axi_lite_clk)
     .dma_user_st_ciireq_tvalid     ( dma_user_st_ciireq_tvalid  ),
     .user_dma_st_ciireq_tready     ( user_dma_st_ciireq_tready  ),
     .dma_user_st_ciireq_tdata      ( dma_user_st_ciireq_tdata   ),
     .user_dma_st_ciiresp_tvalid    ( user_dma_st_ciiresp_tvalid ),
     .user_dma_st_ciiresp_tdata     ( user_dma_st_ciiresp_tdata  ),
 
     // Control and Status Register Initiator Interface (axi_lite_clk)
     .app_ss_lite_csr_awvalid       ( app_ss_lite_csr_awvalid ),
     .ss_app_lite_csr_awready       ( ss_app_lite_csr_awready ),
     .app_ss_lite_csr_awaddr        ( app_ss_lite_csr_awaddr  ),
     .app_ss_lite_csr_wvalid        ( app_ss_lite_csr_wvalid  ),
     .ss_app_lite_csr_wready        ( ss_app_lite_csr_wready  ),
     .app_ss_lite_csr_wdata         ( app_ss_lite_csr_wdata   ),
     .app_ss_lite_csr_wstrb         ( app_ss_lite_csr_wstrb   ),
     .ss_app_lite_csr_bvalid        ( ss_app_lite_csr_bvalid  ),
     .app_ss_lite_csr_bready        ( app_ss_lite_csr_bready  ),
     .ss_app_lite_csr_bresp         ( ss_app_lite_csr_bresp   ),
     .app_ss_lite_csr_arvalid       ( app_ss_lite_csr_arvalid ),
     .ss_app_lite_csr_arready       ( ss_app_lite_csr_arready ),
     .app_ss_lite_csr_araddr        ( app_ss_lite_csr_araddr  ),
     .ss_app_lite_csr_rvalid        ( ss_app_lite_csr_rvalid  ),
     .app_ss_lite_csr_rready        ( app_ss_lite_csr_rready  ),
     .ss_app_lite_csr_rdata         ( ss_app_lite_csr_rdata   ),
     .ss_app_lite_csr_rresp         ( ss_app_lite_csr_rresp   ),
 
     // Control and Status Register Responder Interface (axi_lite_clk)
     .usr_hip_reconfig_awvalid     ( usr_hip_reconfig_awvalid ),
     .usr_hip_reconfig_awready     ( usr_hip_reconfig_awready ),
     .usr_hip_reconfig_awaddr      ( usr_hip_reconfig_awaddr  ),
     .usr_hip_reconfig_wvalid      ( usr_hip_reconfig_wvalid  ),
     .usr_hip_reconfig_wready      ( usr_hip_reconfig_wready  ),
     .usr_hip_reconfig_wdata       ( usr_hip_reconfig_wdata   ),
     .usr_hip_reconfig_wstrb       ( usr_hip_reconfig_wstrb   ),
     .usr_hip_reconfig_bvalid      ( usr_hip_reconfig_bvalid  ),
     .usr_hip_reconfig_bready      ( usr_hip_reconfig_bready  ),
     .usr_hip_reconfig_bresp       ( usr_hip_reconfig_bresp   ),
     .usr_hip_reconfig_arvalid     ( usr_hip_reconfig_arvalid ),
     .usr_hip_reconfig_arready     ( usr_hip_reconfig_arready ),
     .usr_hip_reconfig_araddr      ( usr_hip_reconfig_araddr  ),
     .usr_hip_reconfig_rvalid      ( usr_hip_reconfig_rvalid  ),
     .usr_hip_reconfig_rready      ( usr_hip_reconfig_rready  ),
     .usr_hip_reconfig_rdata       ( usr_hip_reconfig_rdata   ),
     .usr_hip_reconfig_rresp       ( usr_hip_reconfig_rresp   ),
 
     // User Side AXI-MM DMA Interface (axi_mm_clk)
     .dma_axi_mm_awvalid   ( dma_axi_mm_awvalid ),
     .dma_axi_mm_awready   ( dma_axi_mm_awready ),
     .dma_axi_mm_awid      ( dma_axi_mm_awid    ),
     .dma_axi_mm_awaddr    ( dma_axi_mm_awaddr  ),
     .dma_axi_mm_awlen     ( dma_axi_mm_awlen   ),
     .dma_axi_mm_awsize    ( dma_axi_mm_awsize  ),
     .dma_axi_mm_awburst   ( dma_axi_mm_awburst ),
     .dma_axi_mm_awprot    ( dma_axi_mm_awprot  ),
     .dma_axi_mm_awlock    ( dma_axi_mm_awlock  ),
     .dma_axi_mm_wvalid    ( dma_axi_mm_wvalid  ),
     .dma_axi_mm_wlast     ( dma_axi_mm_wlast   ),
     .dma_axi_mm_wready    ( dma_axi_mm_wready  ),
     .dma_axi_mm_wdata     ( dma_axi_mm_wdata   ),
     .dma_axi_mm_wstrb     ( dma_axi_mm_wstrb   ),
     .dma_axi_mm_bvalid    ( dma_axi_mm_bvalid  ),
     .dma_axi_mm_bready    ( dma_axi_mm_bready  ),
     .dma_axi_mm_bid       ( dma_axi_mm_bid     ),
     .dma_axi_mm_bresp     ( dma_axi_mm_bresp   ),
     .dma_axi_mm_arvalid   ( dma_axi_mm_arvalid ),
     .dma_axi_mm_arready   ( dma_axi_mm_arready ),
     .dma_axi_mm_arid      ( dma_axi_mm_arid    ),
     .dma_axi_mm_araddr    ( dma_axi_mm_araddr  ),
     .dma_axi_mm_arlen     ( dma_axi_mm_arlen   ),
     .dma_axi_mm_arsize    ( dma_axi_mm_arsize  ),
     .dma_axi_mm_arburst   ( dma_axi_mm_arburst ),
     .dma_axi_mm_arprot    ( dma_axi_mm_arprot  ),
     .dma_axi_mm_arlock    ( dma_axi_mm_arlock  ),
     .dma_axi_mm_rvalid    ( dma_axi_mm_rvalid  ),
     .dma_axi_mm_rlast     ( dma_axi_mm_rlast   ),
     .dma_axi_mm_rready    ( dma_axi_mm_rready  ),
     .dma_axi_mm_rid       ( dma_axi_mm_rid     ),
     .dma_axi_mm_rdata     ( dma_axi_mm_rdata   ),
     .dma_axi_mm_rresp     ( dma_axi_mm_rresp   ),
 
     // User Side AXI-stream Master (H2D) Interface (axi_st_clk)
     .h2d_axi_st_tvalid          ( h2d_axi_st_tvalid ),
     .h2d_axi_st_tready          ( h2d_axi_st_tready ),
     .h2d_axi_st_tdata           ( h2d_axi_st_tdata  ),
     .h2d_axi_st_tkeep           ( h2d_axi_st_tkeep  ),
     .h2d_axi_st_tlast           ( h2d_axi_st_tlast  ),
     .h2d_axi_st_tuser_error     ( h2d_axi_st_tuser_error      ),
     .h2d_axi_st_tuser_metadata  ( h2d_axi_st_tuser_metadata   ),
     .h2d_axi_st_tid             ( h2d_axi_st_tid    ),
 
     // User Side AXI-stream Slave (D2H) Interface (axi_st_clk)
     .d2h_axi_st_tvalid          ( d2h_axi_st_tvalid ),
     .d2h_axi_st_tready          ( d2h_axi_st_tready ),
     .d2h_axi_st_tdata           ( d2h_axi_st_tdata  ),
     .d2h_axi_st_tkeep           ( d2h_axi_st_tkeep  ),
     .d2h_axi_st_tlast           ( d2h_axi_st_tlast  ),
     .d2h_axi_st_tuser_error     ( d2h_axi_st_tuser_error      ),
     .d2h_axi_st_tuser_metadata  ( d2h_axi_st_tuser_metadata   ),
     .d2h_axi_st_tid             ( d2h_axi_st_tid    ),
 
     // User Side PIO AXI Lite Initiator Interface (axi_lite_clk)
     .rx_pio_axi_lite_awvalid ( rx_pio_axi_lite_awvalid ),
     .rx_pio_axi_lite_awready ( rx_pio_axi_lite_awready ),
     .rx_pio_axi_lite_awaddr  ( rx_pio_axi_lite_awaddr  ),
     .rx_pio_axi_lite_wvalid  ( rx_pio_axi_lite_wvalid  ),
     .rx_pio_axi_lite_wready  ( rx_pio_axi_lite_wready  ),
     .rx_pio_axi_lite_wdata   ( rx_pio_axi_lite_wdata   ),
     .rx_pio_axi_lite_wstrb   ( rx_pio_axi_lite_wstrb   ),
     .rx_pio_axi_lite_bvalid  ( rx_pio_axi_lite_bvalid  ),
     .rx_pio_axi_lite_bready  ( rx_pio_axi_lite_bready  ),
     .rx_pio_axi_lite_bresp   ( rx_pio_axi_lite_bresp   ),
     .rx_pio_axi_lite_arvalid ( rx_pio_axi_lite_arvalid ),
     .rx_pio_axi_lite_arready ( rx_pio_axi_lite_arready ),
     .rx_pio_axi_lite_araddr  ( rx_pio_axi_lite_araddr  ),
     .rx_pio_axi_lite_rvalid  ( rx_pio_axi_lite_rvalid  ),
     .rx_pio_axi_lite_rready  ( rx_pio_axi_lite_rready  ),
     .rx_pio_axi_lite_rdata   ( rx_pio_axi_lite_rdata   ),
     .rx_pio_axi_lite_rresp   ( rx_pio_axi_lite_rresp   ),
 
     // User Side AXI-MM BAM Interface (axi_mm_clk)
     .bam_axi_mm_awvalid   ( bam_axi_mm_awvalid ),
     .bam_axi_mm_awready   ( bam_axi_mm_awready ),
     .bam_axi_mm_awid      ( bam_axi_mm_awid    ),
     .bam_axi_mm_awaddr    ( bam_axi_mm_awaddr  ),
     .bam_axi_mm_awlen     ( bam_axi_mm_awlen   ),
     .bam_axi_mm_awsize    ( bam_axi_mm_awsize  ),
     .bam_axi_mm_awburst   ( bam_axi_mm_awburst ),
     .bam_axi_mm_awprot    ( bam_axi_mm_awprot  ),
     .bam_axi_mm_awlock    ( bam_axi_mm_awlock  ),
     .bam_axi_mm_wvalid    ( bam_axi_mm_wvalid  ),
     .bam_axi_mm_wlast     ( bam_axi_mm_wlast   ),
     .bam_axi_mm_wready    ( bam_axi_mm_wready  ),
     .bam_axi_mm_wdata     ( bam_axi_mm_wdata   ),
     .bam_axi_mm_wstrb     ( bam_axi_mm_wstrb   ),
     .bam_axi_mm_bvalid    ( bam_axi_mm_bvalid  ),
     .bam_axi_mm_bready    ( bam_axi_mm_bready  ),
     .bam_axi_mm_bid       ( bam_axi_mm_bid     ),
     .bam_axi_mm_bresp     ( bam_axi_mm_bresp   ),
     .bam_axi_mm_arvalid   ( bam_axi_mm_arvalid ),
     .bam_axi_mm_arready   ( bam_axi_mm_arready ),
     .bam_axi_mm_arid      ( bam_axi_mm_arid    ),
     .bam_axi_mm_araddr    ( bam_axi_mm_araddr  ),
     .bam_axi_mm_arlen     ( bam_axi_mm_arlen   ),
     .bam_axi_mm_arsize    ( bam_axi_mm_arsize  ),
     .bam_axi_mm_arburst   ( bam_axi_mm_arburst ),
     .bam_axi_mm_arprot    ( bam_axi_mm_arprot  ),
     .bam_axi_mm_arlock    ( bam_axi_mm_arlock  ),
     .bam_axi_mm_rvalid    ( bam_axi_mm_rvalid  ),
     .bam_axi_mm_rlast     ( bam_axi_mm_rlast   ),
     .bam_axi_mm_rready    ( bam_axi_mm_rready  ),
     .bam_axi_mm_rid       ( bam_axi_mm_rid     ),
     .bam_axi_mm_rdata     ( bam_axi_mm_rdata   ),
     .bam_axi_mm_rresp     ( bam_axi_mm_rresp   ),
 
     // User Side AXI-MM BAS Interface (axi_mm_clk)
     .bas_axi_mm_awvalid   ( bas_axi_mm_awvalid ),
     .bas_axi_mm_awready   ( bas_axi_mm_awready ),
     .bas_axi_mm_awid      ( bas_axi_mm_awid    ),
     .bas_axi_mm_awaddr    ( bas_axi_mm_awaddr  ),
     .bas_axi_mm_awuser    ( bas_axi_mm_awuser  ),
     .bas_axi_mm_awlen     ( bas_axi_mm_awlen   ),
     .bas_axi_mm_awsize    ( bas_axi_mm_awsize  ),
     .bas_axi_mm_awburst   ( bas_axi_mm_awburst ),
     .bas_axi_mm_awprot    ( bas_axi_mm_awprot  ),
     .bas_axi_mm_awlock    ( bas_axi_mm_awlock  ),
     .bas_axi_mm_wvalid    ( bas_axi_mm_wvalid  ),
     .bas_axi_mm_wlast     ( bas_axi_mm_wlast   ),
     .bas_axi_mm_wready    ( bas_axi_mm_wready  ),
     .bas_axi_mm_wdata     ( bas_axi_mm_wdata   ),
     .bas_axi_mm_wstrb     ( bas_axi_mm_wstrb   ),
     .bas_axi_mm_bvalid    ( bas_axi_mm_bvalid  ),
     .bas_axi_mm_bready    ( bas_axi_mm_bready  ),
     .bas_axi_mm_bid       ( bas_axi_mm_bid     ),
     .bas_axi_mm_bresp     ( bas_axi_mm_bresp   ),
     .bas_axi_mm_arvalid   ( bas_axi_mm_arvalid ),
     .bas_axi_mm_arready   ( bas_axi_mm_arready ),
     .bas_axi_mm_arid      ( bas_axi_mm_arid    ),
     .bas_axi_mm_araddr    ( bas_axi_mm_araddr  ),
     .bas_axi_mm_aruser    ( bas_axi_mm_aruser  ),
     .bas_axi_mm_arlen     ( bas_axi_mm_arlen   ),
     .bas_axi_mm_arsize    ( bas_axi_mm_arsize  ),
     .bas_axi_mm_arburst   ( bas_axi_mm_arburst ),
     .bas_axi_mm_arprot    ( bas_axi_mm_arprot  ),
     .bas_axi_mm_arlock    ( bas_axi_mm_arlock  ),
     .bas_axi_mm_rvalid    ( bas_axi_mm_rvalid  ),
     .bas_axi_mm_rlast     ( bas_axi_mm_rlast   ),
     .bas_axi_mm_rready    ( bas_axi_mm_rready  ),
     .bas_axi_mm_rid       ( bas_axi_mm_rid     ),
     .bas_axi_mm_rdata     ( bas_axi_mm_rdata   ),
     .bas_axi_mm_rresp     ( bas_axi_mm_rresp   ),

     // User Side CS AXI Lite Responder Interface (axi_lite_clk)
     .cs_axi_lite_awvalid  ( cs_axi_lite_awvalid ),
     .cs_axi_lite_awready  ( cs_axi_lite_awready ),
     .cs_axi_lite_awaddr   ( cs_axi_lite_awaddr  ),
     .cs_axi_lite_wvalid   ( cs_axi_lite_wvalid  ),
     .cs_axi_lite_wready   ( cs_axi_lite_wready  ),
     .cs_axi_lite_wdata    ( cs_axi_lite_wdata   ),
     .cs_axi_lite_wstrb    ( cs_axi_lite_wstrb   ),
     .cs_axi_lite_bvalid   ( cs_axi_lite_bvalid  ),
     .cs_axi_lite_bready   ( cs_axi_lite_bready  ),
     .cs_axi_lite_bresp    ( cs_axi_lite_bresp   ),
     .cs_axi_lite_arvalid  ( cs_axi_lite_arvalid ),
     .cs_axi_lite_arready  ( cs_axi_lite_arready ),
     .cs_axi_lite_araddr   ( cs_axi_lite_araddr  ),
     .cs_axi_lite_rvalid   ( cs_axi_lite_rvalid  ),
     .cs_axi_lite_rready   ( cs_axi_lite_rready  ),
     .cs_axi_lite_rdata    ( cs_axi_lite_rdata   ),
     .cs_axi_lite_rresp    ( cs_axi_lite_rresp   ),
 
     // FLR interface to application/user side
     .user_flr_rcvd_val         ( user_flr_rcvd_val      ),
     .user_flr_rcvd_chan_num    ( user_flr_rcvd_chan_num ),
     .user_flr_completed        ( user_flr_completed     ),
 
     // MSI-X Request interface from application/user side
     .user_event_msix_tready    ( user_event_msix_tready ),
     .user_event_msix_tvalid    ( user_event_msix_tvalid ),
     .user_event_msix_tdata     ( user_event_msix_tdata  ),
 
     // MSI Request interface from application/user side (axi_lite_clk)
     .user_msi_req               ( user_msi_req      ),
     .user_msi_func_num          ( user_msi_func_num ),
     .user_msi_num               ( user_msi_num      ),
     .user_msi_ack               ( user_msi_ack      ),
     .user_msi_status            ( user_msi_status   ), // 00 = MSI message sent, 
                                                        // 01 = Pending bit set(mask set) and no message sent, 
                                                        // 10 = error (msix not enabled or not alloted)
 
     // Clock and reset
     .axi_st_clk                 ( axi_st_clk        ),
     .axi_lite_clk               ( axi_lite_clk      ),
     .axi_st_areset_n            ( axi_st_areset_n   ),
     .axi_lite_areset_n          ( axi_lite_areset_n ),
     .axi_mm_clk                 ( axi_mm_clk        ),
     .axi_mm_areset_n            ( axi_mm_areset_n   )  


);

endmodule


