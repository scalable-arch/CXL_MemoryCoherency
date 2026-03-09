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


package platform_intel_pcie_ss_axi_0_intel_pcie_ss_axi_310_h5dl4na_pkg;
typedef struct packed {
  logic last_segment7; 
  logic last_segment6; 
  logic last_segment5; 
  logic last_segment4; 
  logic last_segment3; 
  logic last_segment2; 
  logic last_segment1; 
  logic last_segment0;
} tuser;
endpackage


module platform_intel_pcie_ss_axi_0_intel_pcie_ss_axi_310_h5dl4na
import platform_intel_pcie_ss_axi_0_intel_pcie_ss_axi_310_h5dl4na_pkg::*;
#(
  parameter   device_family                         = "Agilex",       
  parameter   TILE                                  = "R-TILE",       
  parameter   device_type                           = "EP",           
  parameter   HIGH_SPEED                            = "BOTH_CLK",
  parameter   high_speed_freq_hwtcl                 = "Disable",
  parameter   CPL_BUFF_HDR_DOUBLE_DEPTH             = 0,
  

  parameter   core16_FUNC_MODE                      = "AXIST_DM",   
  parameter   core16_Header_Packing_scheme          = "Simple",       
  parameter   core16_DWIDTH                         = 512,            
  parameter   core16_NUM_OF_SEG                     = 4,              
  parameter   core16_ST_readyLatency                = 0,              
  parameter   core16_CRS_EN_DEFAULT                 = 0,              
  parameter   core16_LiteSlvAWD                     = 20,             
  parameter   core16_LiteSlvDWD                     = 32,             
  parameter   core16_LiteMstrAWD                    = 32,             
  parameter   core16_LiteMstrDWD                    = 32,             
  parameter   core16_LiteMstr_readyLatency          = 0,              
  parameter   core16_MMAWD                          = 64,             
  parameter   core16_MMBLWD                         = 8, 
  parameter   core16_MMDWD                          = 512,            
  parameter   core16_MM_readyLatency                = 0,              
  parameter   core16_CPL_REORDERING                 = "Disable",      
  parameter   core16_DEVATT_TX_ROUTING              = "Disable",      
  parameter   core16_DOWNSTREAM_MSG_FWD             = "Disable",      
  parameter   core16_MSI_MSG_GEN                    = "Disable",      
  parameter   core16_FLR_REQ_DROP                   = "Disable",      
  parameter   core16_REORDER_BUFF_SIZE              = 64,             
  parameter   core16_CPLTO_THRU_AXI_ST              = "Disable",      
  parameter   core16_DM_ADR_ALIGN                   = "Disable",      
  parameter   core16_MMIO_ADR_ALIGN                 = "Disable", 
  parameter   core16_MSIX_TABLE                     = "Disable",      
  parameter   core16_MSIX_TABLE_SIZE                = 4096,           
  parameter   core16_MSIX_BIR                       = 5,
  parameter   core16_MSIX_BAR_OFFSET                = 0,              
  parameter   core16_MSIX_VECTOR_ALLOC              = "Static",
  parameter   core16_HEADER_SCHEME                  = "IN-BAND",
  parameter   core16_MSIX_DYN_SIZE_BYPASS           = 0,
  parameter   core16_autonomous_pm_enter_l23        = 0,              
  parameter   core16_device_att                     = "Enable",      
  parameter   core16_perfmon_clk_freq               = 250,            

  parameter   core8_FUNC_MODE                       = "POWER_USER",   
  parameter   core8_Header_Packing_scheme           = "Simple",       
  parameter   core8_DWIDTH                          = 256,            
  parameter   core8_NUM_OF_SEG                      = 4,              
  parameter   core8_ST_readyLatency                 = 0,              
  parameter   core8_CRS_EN_DEFAULT           = 0,              
  parameter   core8_LiteSlvAWD                      = 20,
  parameter   core8_LiteSlvDWD                      = 32,
  parameter   core8_LiteMstrAWD                     = 32,
  parameter   core8_LiteMstrDWD                     = 32,
  parameter   core8_LiteMstr_readyLatency           = 0,
  parameter   core8_MMAWD                           = 64,
  parameter   core8_MMBLWD                          = 8,
  parameter   core8_MMDWD                           = 512,
  parameter   core8_MM_readyLatency                 = 0,
  parameter   core8_CPL_REORDERING                  = "Disable",      
  parameter   core8_DEVATT_TX_ROUTING               = "Disable",      
  parameter   core8_DOWNSTREAM_MSG_FWD              = "Disable",      
  parameter   core8_MSI_MSG_GEN                     = "Disable",      
  parameter   core8_FLR_REQ_DROP                    = "Disable",      
  parameter   core8_REORDER_BUFF_SIZE               = 64,             
  parameter   core8_CPLTO_THRU_AXI_ST               = "Disable",      
  parameter   core8_DM_ADR_ALIGN                    = "Disable",      
  parameter   core8_MMIO_ADR_ALIGN                  = "Disable",
  parameter   core8_MSIX_TABLE                      = "Disable",      
  parameter   core8_MSIX_TABLE_SIZE                 = 4096,
  parameter   core8_MSIX_BIR                        = 5,
  parameter   core8_MSIX_BAR_OFFSET                 = 0,
  parameter   core8_MSIX_VECTOR_ALLOC               = "Static",
  parameter   core8_HEADER_SCHEME                  = "IN-BAND",
  parameter   core8_MSIX_DYN_SIZE_BYPASS            = 0,
  parameter   core8_autonomous_pm_enter_l23         = 0,              
  parameter   core8_device_att                      = "Disable",      
  parameter   core8_perfmon_clk_freq                = 250,

  parameter   core4_0_FUNC_MODE                     = "POWER_USER",   
  parameter   core4_0_Header_Packing_scheme         = "Simple",       
  parameter   core4_0_DWIDTH                        = 256,            
  parameter   core4_0_NUM_OF_SEG                    = 4,              
  parameter   core4_0_ST_readyLatency               = 0,              
  parameter   core4_0_CRS_EN_DEFAULT           = 0,              
  parameter   core4_0_LiteSlvAWD                    = 20,
  parameter   core4_0_LiteSlvDWD                    = 32,
  parameter   core4_0_LiteMstrAWD                   = 32,
  parameter   core4_0_LiteMstrDWD                   = 32,
  parameter   core4_0_LiteMstr_readyLatency         = 0,
  parameter   core4_0_MMAWD                         = 64,
  parameter   core4_0_MMBLWD                        = 8,
  parameter   core4_0_MMDWD                         = 512,
  parameter   core4_0_MM_readyLatency               = 0,
  parameter   core4_0_CPL_REORDERING                = "Disable",      
  parameter   core4_0_DEVATT_TX_ROUTING             = "Disable",
  parameter   core4_0_DOWNSTREAM_MSG_FWD            = "Disable",      
  parameter   core4_0_MSI_MSG_GEN                   = "Disable",      
  parameter   core4_0_FLR_REQ_DROP                  = "Disable",      
  parameter   core4_0_REORDER_BUFF_SIZE             = 64,             
  parameter   core4_0_CPLTO_THRU_AXI_ST             = "Disable",      
  parameter   core4_0_DM_ADR_ALIGN                  = "Disable",      
  parameter   core4_0_MMIO_ADR_ALIGN                = "Disable",
  parameter   core4_0_MSIX_TABLE                    = "Disable",      
  parameter   core4_0_MSIX_TABLE_SIZE               = 4096,
  parameter   core4_0_MSIX_BIR                      = 5,
  parameter   core4_0_MSIX_BAR_OFFSET               = 0,
  parameter   core4_0_MSIX_VECTOR_ALLOC             = "Static",
  parameter   core4_0_HEADER_SCHEME                  = "IN-BAND",
  parameter   core4_0_MSIX_DYN_SIZE_BYPASS          = 0,
  parameter   core4_0_autonomous_pm_enter_l23       = 0,              
  parameter   core4_0_device_att                    = "Disable",      
  parameter   core4_0_perfmon_clk_freq              = 250,
  parameter   core4_0_total_pf_count_hwtcl          = 1,
  parameter   core4_0_enable_sriov_hwtcl            = 0,

  parameter   core4_1_FUNC_MODE                     = "POWER_USER",   
  parameter   core4_1_Header_Packing_scheme         = "Simple",       
  parameter   core4_1_DWIDTH                        = 256,            
  parameter   core4_1_NUM_OF_SEG                    = 4,              
  parameter   core4_1_ST_readyLatency               = 0,              
  parameter   core4_1_CRS_EN_DEFAULT           = 0,              
  parameter   core4_1_LiteSlvAWD                    = 20,
  parameter   core4_1_LiteSlvDWD                    = 32,
  parameter   core4_1_LiteMstrAWD                   = 32,
  parameter   core4_1_LiteMstrDWD                   = 32,
  parameter   core4_1_LiteMstr_readyLatency         = 0,
  parameter   core4_1_MMAWD                         = 64,
  parameter   core4_1_MMBLWD                        = 8,
  parameter   core4_1_MMDWD                         = 512,
  parameter   core4_1_MM_readyLatency               = 0,
  parameter   core4_1_CPL_REORDERING                = "Disable",       
  parameter   core4_1_DEVATT_TX_ROUTING	            = "Disable",
  parameter   core4_1_DOWNSTREAM_MSG_FWD            = "Disable",      
  parameter   core4_1_MSI_MSG_GEN                   = "Disable",      
  parameter   core4_1_FLR_REQ_DROP                  = "Disable",      
  parameter   core4_1_REORDER_BUFF_SIZE             = 64,              
  parameter   core4_1_CPLTO_THRU_AXI_ST             = "Disable",       
  parameter   core4_1_DM_ADR_ALIGN                  = "Disable",       
  parameter   core4_1_MMIO_ADR_ALIGN                = "Disable",
  parameter   core4_1_MSIX_TABLE                    = "Disable",       
  parameter   core4_1_MSIX_TABLE_SIZE               = 4096,
  parameter   core4_1_MSIX_BIR                      = 5,
  parameter   core4_1_MSIX_BAR_OFFSET               = 0,
  parameter   core4_1_MSIX_VECTOR_ALLOC             = "Static",
  parameter   core4_1_HEADER_SCHEME                  = "IN-BAND",
  parameter   core4_1_MSIX_DYN_SIZE_BYPASS          = 0,
  parameter   core4_1_autonomous_pm_enter_l23       = 0,              
  parameter   core4_1_device_att                    = "Disable",      
  parameter   core4_1_perfmon_clk_freq              = 250,
  parameter   core4_1_total_pf_count_hwtcl          = 1,
  parameter   core4_1_enable_sriov_hwtcl            = 0,

  parameter   core16_pf0_bar01_size_mask            = 0,
  parameter   core16_pf0_bar23_size_mask            = 0,
  parameter   core16_pf0_bar45_size_mask            = 0,
  parameter   core16_pf0_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf0_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf0_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf1_bar01_size_mask            = 0,
  parameter   core16_pf1_bar23_size_mask            = 0,
  parameter   core16_pf1_bar45_size_mask            = 0,
  parameter   core16_pf1_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf1_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf1_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf2_bar01_size_mask            = 0,
  parameter   core16_pf2_bar23_size_mask            = 0,
  parameter   core16_pf2_bar45_size_mask            = 0,
  parameter   core16_pf2_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf2_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf2_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf3_bar01_size_mask            = 0,
  parameter   core16_pf3_bar23_size_mask            = 0,
  parameter   core16_pf3_bar45_size_mask            = 0,
  parameter   core16_pf3_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf3_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf3_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf4_bar01_size_mask            = 0,
  parameter   core16_pf4_bar23_size_mask            = 0,
  parameter   core16_pf4_bar45_size_mask            = 0,
  parameter   core16_pf4_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf4_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf4_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf5_bar01_size_mask            = 0,
  parameter   core16_pf5_bar23_size_mask            = 0,
  parameter   core16_pf5_bar45_size_mask            = 0,
  parameter   core16_pf5_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf5_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf5_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf6_bar01_size_mask            = 0,
  parameter   core16_pf6_bar23_size_mask            = 0,
  parameter   core16_pf6_bar45_size_mask            = 0,
  parameter   core16_pf6_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf6_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf6_sriov_vf_bar45_size_mask   = 0,
  parameter   core16_pf7_bar01_size_mask            = 0,
  parameter   core16_pf7_bar23_size_mask            = 0,
  parameter   core16_pf7_bar45_size_mask            = 0,
  parameter   core16_pf7_sriov_vf_bar01_size_mask   = 0,
  parameter   core16_pf7_sriov_vf_bar23_size_mask   = 0,
  parameter   core16_pf7_sriov_vf_bar45_size_mask   = 0,

  parameter   core8_pf0_bar01_size_mask             = 0,
  parameter   core8_pf0_bar23_size_mask             = 0,
  parameter   core8_pf0_bar45_size_mask             = 0,
  parameter   core8_pf0_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf0_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf0_sriov_vf_bar45_size_mask    = 0,
  parameter   core8_pf1_bar01_size_mask             = 0,
  parameter   core8_pf1_bar23_size_mask             = 0,
  parameter   core8_pf1_bar45_size_mask             = 0,
  parameter   core8_pf1_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf1_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf1_sriov_vf_bar45_size_mask    = 0,
  parameter   core8_pf2_bar01_size_mask             = 0,
  parameter   core8_pf2_bar23_size_mask             = 0,
  parameter   core8_pf2_bar45_size_mask             = 0,
  parameter   core8_pf2_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf2_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf2_sriov_vf_bar45_size_mask    = 0,
  parameter   core8_pf3_bar01_size_mask             = 0,
  parameter   core8_pf3_bar23_size_mask             = 0,
  parameter   core8_pf3_bar45_size_mask             = 0,
  parameter   core8_pf3_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf3_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf3_sriov_vf_bar45_size_mask    = 0,
  parameter   core8_pf4_bar01_size_mask             = 0,
  parameter   core8_pf4_bar23_size_mask             = 0,
  parameter   core8_pf4_bar45_size_mask             = 0,
  parameter   core8_pf4_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf4_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf4_sriov_vf_bar45_size_mask    = 0,
  parameter   core8_pf5_bar01_size_mask             = 0,
  parameter   core8_pf5_bar23_size_mask             = 0,
  parameter   core8_pf5_bar45_size_mask             = 0,
  parameter   core8_pf5_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf5_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf5_sriov_vf_bar45_size_mask    = 0,
  parameter   core8_pf6_bar01_size_mask             = 0,
  parameter   core8_pf6_bar23_size_mask             = 0,
  parameter   core8_pf6_bar45_size_mask             = 0,
  parameter   core8_pf6_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf6_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf6_sriov_vf_bar45_size_mask    = 0,
  parameter   core8_pf7_bar01_size_mask             = 0,
  parameter   core8_pf7_bar23_size_mask             = 0,
  parameter   core8_pf7_bar45_size_mask             = 0,
  parameter   core8_pf7_sriov_vf_bar01_size_mask    = 0,
  parameter   core8_pf7_sriov_vf_bar23_size_mask    = 0,
  parameter   core8_pf7_sriov_vf_bar45_size_mask    = 0,

  parameter   core4_0_pf0_bar01_size_mask             = 0,
  parameter   core4_0_pf0_bar23_size_mask             = 0,
  parameter   core4_0_pf0_bar45_size_mask             = 0,

  parameter   core4_1_pf0_bar01_size_mask             = 0,
  parameter   core4_1_pf0_bar23_size_mask             = 0,
  parameter   core4_1_pf0_bar45_size_mask             = 0,


  parameter   pciess_topology                       = "pcie_x8",
  parameter   qhip_silicon_reva_revb_hwtcl	 				= 0,
  parameter   qhip_mmio_enable_hwtcl 	 					= 0,
  parameter   piped_full_func_mode_integer_hwtcl	 		= 0,
  parameter   independent_perst_int_hwtcl	 				= 0,
  parameter   qhip_silicon_revc_hwtcl	 					= 0,

  parameter   hssi_ctp_func_mode                    = "pcie_g4_x16_ep",
  parameter   hssi_ctp_topology                     = "pcie_x8x8",  

	parameter   core16_enable_cpl_timeout_hwtcl       = 1,
	parameter   core8_enable_cpl_timeout_hwtcl        = 1,
	parameter   core4_0_enable_cpl_timeout_hwtcl      = 1,
	parameter   core4_1_enable_cpl_timeout_hwtcl      = 1,

  parameter   core16_payload_width_integer_hwtcl    = 512,
  parameter   core16_hdr_width_integer_hwtcl        = 256,
  parameter   core16_pfx_width_integer_hwtcl        = 64,
  parameter   core16_double_width_integer_hwtcl     = 2,
  parameter   core8_double_width_integer_hwtcl      = 1,
  parameter   core4_0_double_width_integer_hwtcl    = 1,
  parameter   core4_1_double_width_integer_hwtcl    = 1,
  parameter   core16_empty_width_integer_hwtcl      = 2,
  parameter   core8_payload_width_integer_hwtcl     = 512,
  parameter   core8_hdr_width_integer_hwtcl         = 256,
  parameter   core8_pfx_width_integer_hwtcl         = 64,
  parameter   core8_empty_width_integer_hwtcl       = 2,
  parameter   core4_0_payload_width_integer_hwtcl   = 512,
  parameter   core4_0_hdr_width_integer_hwtcl       = 256,
  parameter   core4_0_pfx_width_integer_hwtcl       = 64,
  parameter   core4_0_empty_width_integer_hwtcl     = 1,
  parameter   core4_1_payload_width_integer_hwtcl   = 512,
  parameter   core4_1_hdr_width_integer_hwtcl       = 256,
  parameter   core4_1_pfx_width_integer_hwtcl       = 64,
  parameter   core4_1_empty_width_integer_hwtcl     = 1,
  parameter   core16_enable_sriov_hwtcl             = 0,
  parameter   core8_enable_sriov_hwtcl              = 0,
  parameter core16_total_pf_count_width_hwtcl       = 1,
  parameter   core16_total_pf_count_hwtcl           = 1,
  parameter   core16_total_vf_count_hwtcl           = 1,
  parameter core8_total_pf_count_width_hwtcl        = 1,
  parameter   core8_total_pf_count_hwtcl            = 1,
  parameter   core8_total_vf_count_hwtcl            = 1,
  parameter   core16_pf0_vf_count_hwtcl             = 0,
  parameter   core16_pf1_vf_count_hwtcl             = 0,
  parameter   core16_pf2_vf_count_hwtcl             = 0,
  parameter   core16_pf3_vf_count_hwtcl             = 0,
  parameter   core16_pf4_vf_count_hwtcl             = 0,
  parameter   core16_pf5_vf_count_hwtcl             = 0,
  parameter   core16_pf6_vf_count_hwtcl             = 0,
  parameter   core16_pf7_vf_count_hwtcl             = 0,
  parameter   core8_pf0_vf_count_hwtcl              = 0,
  parameter   core8_pf1_vf_count_hwtcl              = 0,
  parameter   core8_pf2_vf_count_hwtcl              = 0,
  parameter   core8_pf3_vf_count_hwtcl              = 0,
  parameter   core8_pf4_vf_count_hwtcl              = 0,
  parameter   core8_pf5_vf_count_hwtcl              = 0,
  parameter   core8_pf6_vf_count_hwtcl              = 0,
  parameter   core8_pf7_vf_count_hwtcl              = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar0_type          = "pf0_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar1_type          = "pf0_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar2_type          = "pf0_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar3_type          = "pf0_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar4_type          = "pf0_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_bar5_type          = "pf0_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar0_type_r = "pf0_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar1_type_r = "pf0_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar2_type_r = "pf0_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar3_type_r = "pf0_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar4_type_r = "pf0_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_sriov_vf_bar5_type_r = "pf0_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar0_type          = "pf1_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar1_type          = "pf1_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar2_type          = "pf1_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar3_type          = "pf1_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar4_type          = "pf1_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_bar5_type          = "pf1_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar0_type_r = "pf1_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar1_type_r = "pf1_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar2_type_r = "pf1_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar3_type_r = "pf1_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar4_type_r = "pf1_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_sriov_vf_bar5_type_r = "pf1_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar0_type          = "pf2_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar1_type          = "pf2_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar2_type          = "pf2_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar3_type          = "pf2_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar4_type          = "pf2_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_bar5_type          = "pf2_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar0_type_r = "pf2_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar1_type_r = "pf2_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar2_type_r = "pf2_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar3_type_r = "pf2_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar4_type_r = "pf2_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_sriov_vf_bar5_type_r = "pf2_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar0_type          = "pf3_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar1_type          = "pf3_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar2_type          = "pf3_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar3_type          = "pf3_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar4_type          = "pf3_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_bar5_type          = "pf3_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar0_type_r = "pf3_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar1_type_r = "pf3_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar2_type_r = "pf3_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar3_type_r = "pf3_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar4_type_r = "pf3_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_sriov_vf_bar5_type_r = "pf3_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar0_type          = "pf4_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar1_type          = "pf4_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar2_type          = "pf4_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar3_type          = "pf4_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar4_type          = "pf4_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_bar5_type          = "pf4_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar0_type_r = "pf4_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar1_type_r = "pf4_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar2_type_r = "pf4_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar3_type_r = "pf4_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar4_type_r = "pf4_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_sriov_vf_bar5_type_r = "pf4_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar0_type          = "pf5_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar1_type          = "pf5_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar2_type          = "pf5_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar3_type          = "pf5_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar4_type          = "pf5_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_bar5_type          = "pf5_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar0_type_r = "pf5_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar1_type_r = "pf5_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar2_type_r = "pf5_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar3_type_r = "pf5_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar4_type_r = "pf5_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_sriov_vf_bar5_type_r = "pf5_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar0_type          = "pf6_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar1_type          = "pf6_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar2_type          = "pf6_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar3_type          = "pf6_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar4_type          = "pf6_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_bar5_type          = "pf6_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar0_type_r = "pf6_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar1_type_r = "pf6_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar2_type_r = "pf6_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar3_type_r = "pf6_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar4_type_r = "pf6_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_sriov_vf_bar5_type_r = "pf6_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar0_type          = "pf7_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar1_type          = "pf7_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar2_type          = "pf7_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar3_type          = "pf7_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar4_type          = "pf7_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_bar5_type          = "pf7_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar0_type_r = "pf7_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar1_type_r = "pf7_sriov_vf_bar1_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar2_type_r = "pf7_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar3_type_r = "pf7_sriov_vf_bar3_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar4_type_r = "pf7_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_sriov_vf_bar5_type_r = "pf7_sriov_vf_bar5_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_bar0_type           = "pf0_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_bar1_type           = "pf0_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_bar2_type           = "pf0_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_bar3_type           = "pf0_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_bar4_type           = "pf0_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_bar5_type           = "pf0_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_sriov_vf_bar0_type_r  = "pf0_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_sriov_vf_bar1_type_r  = "pf0_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_sriov_vf_bar2_type_r  = "pf0_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_sriov_vf_bar3_type_r  = "pf0_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_sriov_vf_bar4_type_r  = "pf0_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_sriov_vf_bar5_type_r  = "pf0_sriov_vf_bar0_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_bar0_type           = "pf1_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_bar1_type           = "pf1_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_bar2_type           = "pf1_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_bar3_type           = "pf1_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_bar4_type           = "pf1_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_bar5_type           = "pf1_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_sriov_vf_bar0_type_r  = "pf1_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_sriov_vf_bar1_type_r  = "pf1_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_sriov_vf_bar2_type_r  = "pf1_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_sriov_vf_bar3_type_r  = "pf1_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_sriov_vf_bar4_type_r  = "pf1_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_sriov_vf_bar5_type_r  = "pf1_sriov_vf_bar0_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_bar0_type           = "pf2_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_bar1_type           = "pf2_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_bar2_type           = "pf2_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_bar3_type           = "pf2_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_bar4_type           = "pf2_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_bar5_type           = "pf2_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_sriov_vf_bar0_type_r  = "pf2_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_sriov_vf_bar1_type_r  = "pf2_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_sriov_vf_bar2_type_r  = "pf2_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_sriov_vf_bar3_type_r  = "pf2_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_sriov_vf_bar4_type_r  = "pf2_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_sriov_vf_bar5_type_r  = "pf2_sriov_vf_bar0_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_bar0_type           = "pf3_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_bar1_type           = "pf3_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_bar2_type           = "pf3_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_bar3_type           = "pf3_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_bar4_type           = "pf3_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_bar5_type           = "pf3_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_sriov_vf_bar0_type_r  = "pf3_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_sriov_vf_bar1_type_r  = "pf3_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_sriov_vf_bar2_type_r  = "pf3_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_sriov_vf_bar3_type_r  = "pf3_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_sriov_vf_bar4_type_r  = "pf3_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_sriov_vf_bar5_type_r  = "pf3_sriov_vf_bar0_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_bar0_type           = "pf4_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_bar1_type           = "pf4_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_bar2_type           = "pf4_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_bar3_type           = "pf4_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_bar4_type           = "pf4_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_bar5_type           = "pf4_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_sriov_vf_bar0_type_r  = "pf4_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_sriov_vf_bar1_type_r  = "pf4_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_sriov_vf_bar2_type_r  = "pf4_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_sriov_vf_bar3_type_r  = "pf4_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_sriov_vf_bar4_type_r  = "pf4_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_sriov_vf_bar5_type_r  = "pf4_sriov_vf_bar0_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_bar0_type           = "pf5_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_bar1_type           = "pf5_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_bar2_type           = "pf5_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_bar3_type           = "pf5_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_bar4_type           = "pf5_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_bar5_type           = "pf5_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_sriov_vf_bar0_type_r  = "pf5_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_sriov_vf_bar1_type_r  = "pf5_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_sriov_vf_bar2_type_r  = "pf5_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_sriov_vf_bar3_type_r  = "pf5_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_sriov_vf_bar4_type_r  = "pf5_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_sriov_vf_bar5_type_r  = "pf5_sriov_vf_bar0_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_bar0_type           = "pf6_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_bar1_type           = "pf6_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_bar2_type           = "pf6_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_bar3_type           = "pf6_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_bar4_type           = "pf6_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_bar5_type           = "pf6_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_sriov_vf_bar0_type_r  = "pf6_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_sriov_vf_bar1_type_r  = "pf6_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_sriov_vf_bar2_type_r  = "pf6_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_sriov_vf_bar3_type_r  = "pf6_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_sriov_vf_bar4_type_r  = "pf6_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_sriov_vf_bar5_type_r  = "pf6_sriov_vf_bar0_mem64", 

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_bar0_type           = "pf7_bar0_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_bar1_type           = "pf7_bar1_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_bar2_type           = "pf7_bar2_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_bar3_type           = "pf7_bar3_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_bar4_type           = "pf7_bar4_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_bar5_type           = "pf7_bar5_mem32",          
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_sriov_vf_bar0_type_r  = "pf7_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_sriov_vf_bar1_type_r  = "pf7_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_sriov_vf_bar2_type_r  = "pf7_sriov_vf_bar2_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_sriov_vf_bar3_type_r  = "pf7_sriov_vf_bar0_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_sriov_vf_bar4_type_r  = "pf7_sriov_vf_bar4_mem64", 
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_sriov_vf_bar5_type_r  = "pf7_sriov_vf_bar0_mem64", 

  parameter   core16_pf0_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf0_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf1_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf2_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf3_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf4_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf5_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf6_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar0_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar1_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar2_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar3_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar4_address_width_hwtcl               =   16,
  parameter   core16_pf7_bar5_address_width_hwtcl               =   16,
  parameter   core16_pf0_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf1_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf2_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf3_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf4_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf5_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf6_expansion_base_address_register_hwtcl  =    0,
  parameter   core16_pf7_expansion_base_address_register_hwtcl  =    0,
  
  parameter   core8_pf0_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf0_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf0_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf0_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf0_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf0_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf1_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf1_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf1_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf1_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf1_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf1_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf2_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf2_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf2_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf2_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf2_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf2_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf3_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf3_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf3_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf3_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf3_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf3_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf4_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf4_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf4_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf4_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf4_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf4_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf5_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf5_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf5_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf5_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf5_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf5_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf6_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf6_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf6_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf6_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf6_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf6_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf7_bar0_address_width_hwtcl                =    16,
  parameter   core8_pf7_bar1_address_width_hwtcl                =    16,
  parameter   core8_pf7_bar2_address_width_hwtcl                =    16,
  parameter   core8_pf7_bar3_address_width_hwtcl                =    16,
  parameter   core8_pf7_bar4_address_width_hwtcl                =    16,
  parameter   core8_pf7_bar5_address_width_hwtcl                =    16,
  parameter   core8_pf0_expansion_base_address_register_hwtcl   =     0,
  parameter   core8_pf1_expansion_base_address_register_hwtcl   =     0,
  parameter   core8_pf2_expansion_base_address_register_hwtcl   =     0,
  parameter   core8_pf3_expansion_base_address_register_hwtcl   =     0,
  parameter   core8_pf4_expansion_base_address_register_hwtcl   =     0,
  parameter   core8_pf5_expansion_base_address_register_hwtcl   =     0,
  parameter   core8_pf6_expansion_base_address_register_hwtcl   =     0,
  parameter   core8_pf7_expansion_base_address_register_hwtcl   =     0,  

  parameter   core4_0_pf0_bar0_address_width_hwtcl              =    16,
  parameter   core4_0_pf0_bar1_address_width_hwtcl              =    16,
  parameter   core4_0_pf0_bar2_address_width_hwtcl              =    16,
  parameter   core4_0_pf0_bar3_address_width_hwtcl              =    16,
  parameter   core4_0_pf0_bar4_address_width_hwtcl              =    16,
  parameter   core4_0_pf0_bar5_address_width_hwtcl              =    16,
  parameter   core4_0_pf0_expansion_base_address_register_hwtcl =     0,

  parameter   core4_1_pf0_bar0_address_width_hwtcl              =    16,
  parameter   core4_1_pf0_bar1_address_width_hwtcl              =    16,
  parameter   core4_1_pf0_bar2_address_width_hwtcl              =    16,
  parameter   core4_1_pf0_bar3_address_width_hwtcl              =    16,
  parameter   core4_1_pf0_bar4_address_width_hwtcl              =    16,
  parameter   core4_1_pf0_bar5_address_width_hwtcl              =    16,
  parameter   core4_1_pf0_expansion_base_address_register_hwtcl =     0,

  parameter   core16_pf0_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf0_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf1_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf2_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf3_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf4_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf5_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf6_sriov_vf_bar5_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar0_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar1_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar2_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar3_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar4_address_width_int_hwtcl  =    16,
  parameter   core16_pf7_sriov_vf_bar5_address_width_int_hwtcl  =    16,

  parameter   core8_pf0_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf0_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf0_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf0_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf0_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf0_sriov_vf_bar5_address_width_int_hwtcl   =    16,
  parameter   core8_pf1_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf1_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf1_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf1_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf1_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf1_sriov_vf_bar5_address_width_int_hwtcl   =    16,
  parameter   core8_pf2_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf2_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf2_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf2_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf2_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf2_sriov_vf_bar5_address_width_int_hwtcl   =    16,
  parameter   core8_pf3_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf3_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf3_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf3_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf3_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf3_sriov_vf_bar5_address_width_int_hwtcl   =    16,
  parameter   core8_pf4_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf4_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf4_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf4_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf4_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf4_sriov_vf_bar5_address_width_int_hwtcl   =    16,
  parameter   core8_pf5_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf5_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf5_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf5_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf5_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf5_sriov_vf_bar5_address_width_int_hwtcl   =    16,
  parameter   core8_pf6_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf6_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf6_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf6_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf6_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf6_sriov_vf_bar5_address_width_int_hwtcl   =    16,
  parameter   core8_pf7_sriov_vf_bar0_address_width_int_hwtcl   =    16,
  parameter   core8_pf7_sriov_vf_bar1_address_width_int_hwtcl   =    16,
  parameter   core8_pf7_sriov_vf_bar2_address_width_int_hwtcl   =    16,
  parameter   core8_pf7_sriov_vf_bar3_address_width_int_hwtcl   =    16,
  parameter   core8_pf7_sriov_vf_bar4_address_width_int_hwtcl   =    16,
  parameter   core8_pf7_sriov_vf_bar5_address_width_int_hwtcl   =    16,

  parameter   core16_virtio_pci_cfg_acc_intf_en_hwtcl                  = 0,
  parameter   core8_virtio_pci_cfg_acc_intf_en_hwtcl                  = 0,

  parameter   core16_enable_virtio_hwtcl                        = 0,
  parameter   core16_ceb_en_hwtcl                               = 0,  
  parameter   core16_ceb_ack_latency_hwtcl                      = 100,
  parameter   core16_ceb_pf_std_cap_last_ptr                    = 0,     
  parameter   core16_ceb_pf_ext_cap_last_ptr                    = 64,   
  parameter   core16_ceb_vf_std_cap_last_ptr                    = 0,     
  parameter   core16_ceb_vf_ext_cap_last_ptr                    = 64,   

  parameter   core8_enable_virtio_hwtcl                         = 0,
  parameter   core8_ceb_en_hwtcl                               = 0,  
  parameter   core8_ceb_ack_latency_hwtcl                       = 100,
  parameter   core8_ceb_pf_std_cap_last_ptr                     = 0,     
  parameter   core8_ceb_pf_ext_cap_last_ptr                     = 0,   
  parameter   core8_ceb_vf_std_cap_last_ptr                    = 0,     
  parameter   core8_ceb_vf_ext_cap_last_ptr                    = 0,   

  parameter   core4_0_ceb_en_hwtcl                               = 0,  
  parameter   core4_0_ceb_ack_latency_hwtcl                      = 100,
  parameter   core4_0_ceb_pf_std_cap_last_ptr                    = 0,     
  parameter   core4_0_ceb_pf_ext_cap_last_ptr                    = 64,   
  parameter   core4_0_ceb_vf_std_cap_last_ptr                    = 0,     
  parameter   core4_0_ceb_vf_ext_cap_last_ptr                    = 64,   

  parameter   core4_1_ceb_en_hwtcl                               = 0,  
  parameter   core4_1_ceb_ack_latency_hwtcl                      = 100,
  parameter   core4_1_ceb_pf_std_cap_last_ptr                    = 0,     
  parameter   core4_1_ceb_pf_ext_cap_last_ptr                    = 64,   
  parameter   core4_1_ceb_vf_std_cap_last_ptr                    = 0,     
  parameter   core4_1_ceb_vf_ext_cap_last_ptr                    = 64,   


  
  parameter   core16_cii_en_hwtcl                                       = 0,
  parameter   core16_cii_ack_latency_hwtcl                              = 100,
  parameter   core16_enable_config_monitoring_hwtcl                           =0,

  parameter   core8_cii_en_hwtcl                                        = 0,
  parameter   core8_cii_ack_latency_hwtcl                               = 100,
  parameter   core8_enable_config_monitoring_hwtcl                           =0,

    parameter   core4_0_cii_en_hwtcl                                       = 0,
    parameter   core4_0_cii_ack_latency_hwtcl                              = 100,
    parameter   core4_0_enable_config_monitoring_hwtcl                           =0,

   parameter   core4_1_cii_en_hwtcl                                       = 0,
   parameter   core4_1_cii_ack_latency_hwtcl                              = 100,
   parameter   core4_1_enable_config_monitoring_hwtcl                           =0,


  parameter   core16_dfl_en_hwtcl                                       = 0,
  parameter   core8_dfl_en_hwtcl                                        = 0,
  parameter   core4_0_dfl_en_hwtcl                                       = 0,
  parameter   core4_1_dfl_en_hwtcl                                        = 0,
  parameter   core16_dfl_total                                   = 1,
  parameter   core8_dfl_total                                    = 1,
  parameter   core4_0_dfl_total                                   = 1,
  parameter   core4_1_dfl_total                                    = 1,
  parameter   core16_dfl_next_cap_offset                         = 0,
  parameter   core8_dfl_next_cap_offset                          = 0,
  parameter   core4_0_dfl_next_cap_offset                         = 0,
  parameter   core4_1_dfl_next_cap_offset                          = 0,


  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_virtio_en            = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_virtio_en       = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_msix_enable          = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf1_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf2_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf3_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf4_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf5_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf6_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf7_pci_msix_table_size        = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_msix_cap_enable = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf0        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf1        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf2        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf3        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf4        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf5        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf6        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_exvf_msix_tablesize_pf7        = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_pf0_pcie_slot_imp                = 0,
 
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_ats_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_tph_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf0_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf1_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf2_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf3_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf4_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf5_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf6_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_pf7_exvf_acs_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf0_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf1_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf2_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf3_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf4_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf5_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf6_virtio_en            = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf7_virtio_en            = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf0_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf1_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf2_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf3_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf4_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf5_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf6_exvf_virtio_en       = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf7_exvf_virtio_en       = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf0_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf1_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf2_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf3_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf4_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf5_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf6_msix_enable          = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf7_msix_enable          = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf1_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf2_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf3_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf4_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf5_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf6_pci_msix_table_size        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf7_pci_msix_table_size        = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf0_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf1_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf2_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf3_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf4_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf5_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf6_exvf_msix_cap_enable = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf7_exvf_msix_cap_enable = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf0        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf1        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf2        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf3        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf4        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf5        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf6        = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_exvf_msix_tablesize_pf7        = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_pf0_pcie_slot_imp                = 0,
  
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf0_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf1_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf2_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf3_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf4_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf5_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf6_exvf_ats_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf7_exvf_ats_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf0_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf1_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf2_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf3_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf4_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf5_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf6_exvf_tph_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf7_exvf_tph_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf0_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf1_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf2_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf3_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf4_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf5_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf6_exvf_acs_cap_enable  = 0,
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_pf7_exvf_acs_cap_enable  = 0,

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_maxpayload_size  =   "max_payload_1024",
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_maxpayload_size   =   "max_payload_1024",
  parameter   hssi_ctp_u_wrpcie_top_u_core4_0_virtual_maxpayload_size =   "max_payload_1024",
  parameter   hssi_ctp_u_wrpcie_top_u_core4_1_virtual_maxpayload_size =   "max_payload_1024",

  parameter   hssi_ctp_u_wrpcie_top_u_core16_virtual_link_width       =   "x16",
  parameter   hssi_ctp_u_wrpcie_top_u_core8_virtual_link_width        =   "x8",
  parameter   hssi_ctp_u_wrpcie_top_u_core4_0_virtual_link_width      =   "x4",
  parameter   hssi_ctp_u_wrpcie_top_u_core4_1_virtual_link_width      =   "x4",

  parameter   core16_flr_cap_hwtcl                                    = 0,
  parameter   core8_flr_cap_hwtcl                                     = 0,
  parameter   core4_0_flr_cap_hwtcl                                   = 0,
  parameter   core4_1_flr_cap_hwtcl                                   = 0,

  parameter   core16_dfh_fid_hwtcl                = 0,
  parameter   core16_dfh_major_ver_hwtcl          = 0,
  parameter   core16_dfh_next_byte_offset_hwtcl   = 0,
  parameter   core16_dfh_end_hwtcl                = 0,
  parameter   core16_dfh_minor_rev_hwtcl          = 0,
  parameter   core16_dfh_ver_hwtcl                = 0,
  parameter   core16_dfh_feature_type_hwtcl       = 0,
  parameter   core16_inst_id_hwtcl                = 0,

  parameter   core8_dfh_fid_hwtcl                 = 0,
  parameter   core8_dfh_major_ver_hwtcl           = 0,
  parameter   core8_dfh_next_byte_offset_hwtcl    = 0,
  parameter   core8_dfh_end_hwtcl                 = 0,
  parameter   core8_dfh_minor_rev_hwtcl           = 0,
  parameter   core8_dfh_ver_hwtcl                 = 0,
  parameter   core8_dfh_feature_type_hwtcl        = 0,
  parameter   core8_inst_id_hwtcl                 = 0,

  parameter   core4_0_dfh_fid_hwtcl                = 0,
  parameter   core4_0_dfh_major_ver_hwtcl          = 0,
  parameter   core4_0_dfh_next_byte_offset_hwtcl   = 0,
  parameter   core4_0_dfh_end_hwtcl                = 0,
  parameter   core4_0_dfh_minor_rev_hwtcl          = 0,
  parameter   core4_0_dfh_ver_hwtcl                = 0,
  parameter   core4_0_dfh_feature_type_hwtcl       = 0,
  parameter   core4_0_inst_id_hwtcl                = 0,

  parameter   core4_1_dfh_fid_hwtcl                 = 0,
  parameter   core4_1_dfh_major_ver_hwtcl           = 0,
  parameter   core4_1_dfh_next_byte_offset_hwtcl    = 0,
  parameter   core4_1_dfh_end_hwtcl                 = 0,
  parameter   core4_1_dfh_minor_rev_hwtcl           = 0,
  parameter   core4_1_dfh_ver_hwtcl                 = 0,
  parameter   core4_1_dfh_feature_type_hwtcl        = 0,
  parameter   core4_1_inst_id_hwtcl                 = 0,

  
  parameter   rtile_debug_toolkit_hwtcl                               = 0,
  parameter   qhip_mode_hwtcl                                         = 0,
  parameter   virtual_tlp_bypass_en_user_hwtcl                        = 0, 
  parameter   MIF_DIRECTORY                                           = "../mif",
  parameter   DFL_MIF_DIRECTORY                                       = "../mif",
  parameter   PERFMON_EN                          = 0,
  parameter   BP_DEBUG_MON_EN                     = 0,


      parameter  pfnum_width_hwtcl 				 =  2, 
	    parameter  vfnum_width_hwtcl				 =  12,  
   	  parameter  seg_width_hwtcl 					 =  ((pciess_topology=="pcie_x4x4x4x4") || (pciess_topology=="pcie_x4x4") || (pciess_topology=="pcie_x4"))? 128 :256,
    	parameter  en_10bit_tag_hwtcl        =  0,
	    parameter  einfo_width_hwtcl         = 14
	

  )(

  input                              refclk0,
  input                              refclk1, 
  input 			         pcie_systempll_clk,
  input                              dummy_user_avmm_rst, 
  input                              pin_perst_n,
  output wire                        coreclkout_hip_toapp,
  output                             p0_pin_perst_n, 
  output                             p1_pin_perst_n,
  output                             p2_pin_perst_n,
  output                             p3_pin_perst_n,
  output                             p0_reset_status_n,
  output                             p1_reset_status_n,
  output                             p2_reset_status_n,
  output                             p3_reset_status_n,

  input                              ninit_done,            

  input                              p0_axi_st_clk,
  input                              p0_axi_lite_clk,
  input                              p1_axi_st_clk,
  input                              p1_axi_lite_clk,
  input                              p2_axi_st_clk,
  input                              p2_axi_lite_clk,
  input                              p3_axi_st_clk,
  input                              p3_axi_lite_clk,

  input                              p0_axi_st_areset_n,
  input                              p0_axi_lite_areset_n,
  input                              p1_axi_st_areset_n,
  input                              p1_axi_lite_areset_n,
  input                              p2_axi_st_areset_n,
  input                              p2_axi_lite_areset_n,
  input                              p3_axi_st_areset_n,
  input                              p3_axi_lite_areset_n,

  input                              p0_subsystem_cold_rst_n,
  input                              p0_subsystem_warm_rst_n,
  output                             p0_subsystem_cold_rst_ack_n,
  output                             p0_subsystem_warm_rst_ack_n,
  input                              p0_subsystem_rst_req,
  output                             p0_subsystem_rst_rdy,
  output                             p0_initiate_warmrst_req,
  input                              p0_initiate_rst_req_rdy,

  input                              p1_subsystem_cold_rst_n,
  input                              p1_subsystem_warm_rst_n,
  output                             p1_subsystem_cold_rst_ack_n,
  output                             p1_subsystem_warm_rst_ack_n,
  input                              p1_subsystem_rst_req,
  output                             p1_subsystem_rst_rdy,
  output                             p1_initiate_warmrst_req,
  input                              p1_initiate_rst_req_rdy,

  input                              p2_subsystem_cold_rst_n,
  input                              p2_subsystem_warm_rst_n,
  output                             p2_subsystem_cold_rst_ack_n,
  output                             p2_subsystem_warm_rst_ack_n,
  input                              p2_subsystem_rst_req,
  output                             p2_subsystem_rst_rdy,
  output                             p2_initiate_warmrst_req,
  input                              p2_initiate_rst_req_rdy,

  input                              p3_subsystem_cold_rst_n,
  input                              p3_subsystem_warm_rst_n,
  output                             p3_subsystem_cold_rst_ack_n,
  output                             p3_subsystem_warm_rst_ack_n,
  input                              p3_subsystem_rst_req,
  output                             p3_subsystem_rst_rdy,
  output                             p3_initiate_warmrst_req,
  input                              p3_initiate_rst_req_rdy,

  input                              p0_axi_mm_clk,
  input                              p0_axi_mm_areset_n,
  input                              p1_axi_mm_clk,
  input                              p1_axi_mm_areset_n,
  input                              p2_axi_mm_clk,
  input                              p2_axi_mm_areset_n,
  input                              p3_axi_mm_clk,
  input                              p3_axi_mm_areset_n,

  output                             p0_ss_app_st_rx_tvalid,
  input                              p0_app_ss_st_rx_tready,
  output [core16_DWIDTH-1:0]         p0_ss_app_st_rx_tdata,
  output [(core16_DWIDTH/8)-1:0]     p0_ss_app_st_rx_tkeep,
  output                             p0_ss_app_st_rx_tlast,
  output [core16_NUM_OF_SEG-1:0]     p0_ss_app_st_rx_tuser_vendor,
  output [core16_NUM_OF_SEG-1:0]     p0_ss_app_st_rx_tuser_last_segment,
  output [core16_NUM_OF_SEG-1:0]     p0_ss_app_st_rx_tuser_hvalid,
  output [core16_NUM_OF_SEG-1:0]     p0_ss_app_st_rx_tuser_transaction_abort,
  output [256*core16_NUM_OF_SEG-1:0] p0_ss_app_st_rx_tuser_hdr,

  output                             p1_ss_app_st_rx_tvalid,
  input                              p1_app_ss_st_rx_tready,
  output [core8_DWIDTH-1:0]          p1_ss_app_st_rx_tdata,
  output [(core8_DWIDTH/8)-1:0]      p1_ss_app_st_rx_tkeep,
  output                             p1_ss_app_st_rx_tlast,
  output [core8_NUM_OF_SEG-1:0]      p1_ss_app_st_rx_tuser_vendor,
  output [core8_NUM_OF_SEG-1:0]      p1_ss_app_st_rx_tuser_last_segment,
  output [core8_NUM_OF_SEG-1:0]      p1_ss_app_st_rx_tuser_hvalid,
  output [core8_NUM_OF_SEG-1:0]      p1_ss_app_st_rx_tuser_transaction_abort,
  output [256*core8_NUM_OF_SEG-1:0]  p1_ss_app_st_rx_tuser_hdr,

  output                             p2_ss_app_st_rx_tvalid,
  input                              p2_app_ss_st_rx_tready,
  output [core4_0_DWIDTH-1:0]        p2_ss_app_st_rx_tdata,
  output [(core4_0_DWIDTH/8)-1:0]    p2_ss_app_st_rx_tkeep,
  output                             p2_ss_app_st_rx_tlast,
  output [core4_0_NUM_OF_SEG-1:0]    p2_ss_app_st_rx_tuser_vendor,
  output [core4_0_NUM_OF_SEG-1:0]    p2_ss_app_st_rx_tuser_last_segment,
  output [core4_0_NUM_OF_SEG-1:0]    p2_ss_app_st_rx_tuser_hvalid,
  output [core4_0_NUM_OF_SEG-1:0]    p2_ss_app_st_rx_tuser_transaction_abort,
  output [256*core4_0_NUM_OF_SEG-1:0]p2_ss_app_st_rx_tuser_hdr,

  output                             p3_ss_app_st_rx_tvalid,
  input                              p3_app_ss_st_rx_tready,
  output [core4_1_DWIDTH-1:0]        p3_ss_app_st_rx_tdata,
  output [(core4_1_DWIDTH/8)-1:0]    p3_ss_app_st_rx_tkeep,
  output                             p3_ss_app_st_rx_tlast,
  output [core4_1_NUM_OF_SEG-1:0]    p3_ss_app_st_rx_tuser_vendor,
  output [core4_1_NUM_OF_SEG-1:0]    p3_ss_app_st_rx_tuser_last_segment,
  output [core4_1_NUM_OF_SEG-1:0]    p3_ss_app_st_rx_tuser_hvalid,
  output [core4_1_NUM_OF_SEG-1:0]    p3_ss_app_st_rx_tuser_transaction_abort,
  output [256*core4_1_NUM_OF_SEG-1:0]p3_ss_app_st_rx_tuser_hdr,
  
     
  input                              p0_app_ss_st_tx_tvalid,
  output                             p0_ss_app_st_tx_tready,
  input  [core16_DWIDTH-1:0]         p0_app_ss_st_tx_tdata,
  input  [(core16_DWIDTH/8)-1:0]     p0_app_ss_st_tx_tkeep,
  input                              p0_app_ss_st_tx_tlast,
  input  [core16_NUM_OF_SEG-1:0]     p0_app_ss_st_tx_tuser_vendor,
  input  [core16_NUM_OF_SEG-1:0]     p0_app_ss_st_tx_tuser_last_segment,
  input  [core16_NUM_OF_SEG-1:0]     p0_app_ss_st_tx_tuser_hvalid,
  input  [core16_NUM_OF_SEG-1:0]     p0_app_ss_st_tx_tuser_transaction_abort,
  input  [256*core16_NUM_OF_SEG-1:0] p0_app_ss_st_tx_tuser_hdr,

  input                              p1_app_ss_st_tx_tvalid,
  output                             p1_ss_app_st_tx_tready,
  input  [core8_DWIDTH-1:0]          p1_app_ss_st_tx_tdata,
  input  [(core8_DWIDTH/8)-1:0]      p1_app_ss_st_tx_tkeep,
  input                              p1_app_ss_st_tx_tlast,
  input  [core8_NUM_OF_SEG-1:0]      p1_app_ss_st_tx_tuser_vendor,
  input  [core8_NUM_OF_SEG-1:0]      p1_app_ss_st_tx_tuser_last_segment,
  input  [core8_NUM_OF_SEG-1:0]      p1_app_ss_st_tx_tuser_hvalid,
  input  [core8_NUM_OF_SEG-1:0]      p1_app_ss_st_tx_tuser_transaction_abort,
  input  [256*core8_NUM_OF_SEG-1:0]  p1_app_ss_st_tx_tuser_hdr,

  input                              p2_app_ss_st_tx_tvalid,
  output                             p2_ss_app_st_tx_tready,
  input  [core4_0_DWIDTH-1:0]        p2_app_ss_st_tx_tdata,
  input  [(core4_0_DWIDTH/8)-1:0]    p2_app_ss_st_tx_tkeep,
  input                              p2_app_ss_st_tx_tlast,
  input  [core4_0_NUM_OF_SEG-1:0]    p2_app_ss_st_tx_tuser_vendor,
  input  [core4_0_NUM_OF_SEG-1:0]    p2_app_ss_st_tx_tuser_last_segment,
  input  [core4_0_NUM_OF_SEG-1:0]    p2_app_ss_st_tx_tuser_hvalid,
  input  [core4_0_NUM_OF_SEG-1:0]    p2_app_ss_st_tx_tuser_transaction_abort,
  input  [256*core4_0_NUM_OF_SEG-1:0]p2_app_ss_st_tx_tuser_hdr,

  input                              p3_app_ss_st_tx_tvalid,
  output                             p3_ss_app_st_tx_tready,
  input  [core4_1_DWIDTH-1:0]        p3_app_ss_st_tx_tdata,
  input  [(core4_1_DWIDTH/8)-1:0]    p3_app_ss_st_tx_tkeep,
  input                              p3_app_ss_st_tx_tlast,
  input  [core4_1_NUM_OF_SEG-1:0]    p3_app_ss_st_tx_tuser_vendor,
  input  [core4_1_NUM_OF_SEG-1:0]    p3_app_ss_st_tx_tuser_last_segment,
  input  [core4_1_NUM_OF_SEG-1:0]    p3_app_ss_st_tx_tuser_hvalid,
  input  [core4_1_NUM_OF_SEG-1:0]    p3_app_ss_st_tx_tuser_transaction_abort,
  input  [256*core4_1_NUM_OF_SEG-1:0]p3_app_ss_st_tx_tuser_hdr,

 
  output                             p0_ss_app_st_ciireq_tvalid,
  input                              p0_app_ss_st_ciireq_tready,
  output [71:0]                      p0_ss_app_st_ciireq_tdata,
  input                              p0_app_ss_st_ciiresp_tvalid,
  input  [32:0]                      p0_app_ss_st_ciiresp_tdata,

  output                             p1_ss_app_st_ciireq_tvalid,
  input                              p1_app_ss_st_ciireq_tready,
  output [71:0]                      p1_ss_app_st_ciireq_tdata,
  input                              p1_app_ss_st_ciiresp_tvalid,
  input  [32:0]                      p1_app_ss_st_ciiresp_tdata,

  output                             p2_ss_app_st_ciireq_tvalid,
  input                              p2_app_ss_st_ciireq_tready,
  output [71:0]                      p2_ss_app_st_ciireq_tdata,
  input                              p2_app_ss_st_ciiresp_tvalid,
  input  [32:0]                      p2_app_ss_st_ciiresp_tdata,

  output                             p3_ss_app_st_ciireq_tvalid,
  input                              p3_app_ss_st_ciireq_tready,
  output [71:0]                      p3_ss_app_st_ciireq_tdata,
  input                              p3_app_ss_st_ciiresp_tvalid,
  input  [32:0]                      p3_app_ss_st_ciiresp_tdata,

  output                             p0_ss_app_st_cebreq_tvalid,
  input                              p0_app_ss_st_cebreq_tready,
  output [67:0]                      p0_ss_app_st_cebreq_tdata,

  output                             p1_ss_app_st_cebreq_tvalid,
  input                              p1_app_ss_st_cebreq_tready,
  output [67:0]                      p1_ss_app_st_cebreq_tdata,

  output                             p2_ss_app_st_cebreq_tvalid,
  input                              p2_app_ss_st_cebreq_tready,
  output [67:0]                      p2_ss_app_st_cebreq_tdata,

  output                             p3_ss_app_st_cebreq_tvalid,
  input                              p3_app_ss_st_cebreq_tready,
  output [67:0]                      p3_ss_app_st_cebreq_tdata,

  input                              p0_app_ss_st_cebresp_tvalid,
  input  [31:0]                      p0_app_ss_st_cebresp_tdata,

  input                              p1_app_ss_st_cebresp_tvalid,
  input  [31:0]                      p1_app_ss_st_cebresp_tdata,

  input                              p2_app_ss_st_cebresp_tvalid,
  input  [31:0]                      p2_app_ss_st_cebresp_tdata,

  input                              p3_app_ss_st_cebresp_tvalid,
  input  [31:0]                      p3_app_ss_st_cebresp_tdata,

  output                             p0_ss_app_st_flrrcvd_tvalid,
  output [19:0]                      p0_ss_app_st_flrrcvd_tdata,

  output                             p1_ss_app_st_flrrcvd_tvalid,
  output [19:0]                      p1_ss_app_st_flrrcvd_tdata,

  output                             p2_ss_app_st_flrrcvd_tvalid,
  output [19:0]                      p2_ss_app_st_flrrcvd_tdata,

  output                             p3_ss_app_st_flrrcvd_tvalid,
  output [19:0]                      p3_ss_app_st_flrrcvd_tdata,

  input                              p0_app_ss_st_flrcmpl_tvalid,
  input  [19:0]                      p0_app_ss_st_flrcmpl_tdata,
  output                             p0_ss_app_st_flrcmpl_tready,

  input                              p1_app_ss_st_flrcmpl_tvalid,
  input  [19:0]                      p1_app_ss_st_flrcmpl_tdata,
  output                             p1_ss_app_st_flrcmpl_tready,

  input                              p2_app_ss_st_flrcmpl_tvalid,
  input  [19:0]                      p2_app_ss_st_flrcmpl_tdata,
  output                             p2_ss_app_st_flrcmpl_tready,

  input                              p3_app_ss_st_flrcmpl_tvalid,
  input  [19:0]                      p3_app_ss_st_flrcmpl_tdata,
  output                             p3_ss_app_st_flrcmpl_tready,

  output                             p0_ss_app_st_ctrlshadow_tvalid,
  output [39:0]                      p0_ss_app_st_ctrlshadow_tdata,

  output                             p1_ss_app_st_ctrlshadow_tvalid,
  output [39:0]                      p1_ss_app_st_ctrlshadow_tdata,

  output                             p2_ss_app_st_ctrlshadow_tvalid,
  output [39:0]                      p2_ss_app_st_ctrlshadow_tdata,

  output                             p3_ss_app_st_ctrlshadow_tvalid,
  output [39:0]                      p3_ss_app_st_ctrlshadow_tdata,

  output                             p0_ss_app_st_txcrdt_tvalid,
  output [18:0]                      p0_ss_app_st_txcrdt_tdata,

  output                             p1_ss_app_st_txcrdt_tvalid,
  output [18:0]                      p1_ss_app_st_txcrdt_tdata,

  output                             p2_ss_app_st_txcrdt_tvalid,
  output [18:0]                      p2_ss_app_st_txcrdt_tdata,

  output                             p3_ss_app_st_txcrdt_tvalid,
  output [18:0]                      p3_ss_app_st_txcrdt_tdata,

  output                             p0_ss_app_st_cplto_tvalid,
  output [29:0]                      p0_ss_app_st_cplto_tdata,

  output                             p1_ss_app_st_cplto_tvalid,
  output [29:0]                      p1_ss_app_st_cplto_tdata,

  output                             p2_ss_app_st_cplto_tvalid,
  output [29:0]                      p2_ss_app_st_cplto_tdata,

  output                             p3_ss_app_st_cplto_tvalid,
  output [29:0]                      p3_ss_app_st_cplto_tdata,

  input                              p0_app_ss_st_err_tvalid,
  input [31:0]                       p0_app_ss_st_err_tdata,
  input [13:0]                       p0_app_ss_st_err_tuser_error_type,
  input                              p0_app_ss_st_err_tlast,
  output                             p0_ss_app_st_err_tready,

  input                              p1_app_ss_st_err_tvalid,
  input [31:0]                       p1_app_ss_st_err_tdata,
  input [13:0]                       p1_app_ss_st_err_tuser_error_type,
  input                              p1_app_ss_st_err_tlast,
  output                             p1_ss_app_st_err_tready,

  input                              p2_app_ss_st_err_tvalid,
  input [31:0]                       p2_app_ss_st_err_tdata,
  input [13:0]                       p2_app_ss_st_err_tuser_error_type,
  input                              p2_app_ss_st_err_tlast,
  output                             p2_ss_app_st_err_tready,

  input                              p3_app_ss_st_err_tvalid,
  input [31:0]                       p3_app_ss_st_err_tdata,
  input [13:0]                       p3_app_ss_st_err_tuser_error_type,
  input                              p3_app_ss_st_err_tlast,
  output                             p3_ss_app_st_err_tready,

  output                             p0_ss_app_vf_err_poisonedwrreq_s0,
  output                             p0_ss_app_vf_err_poisonedwrreq_s1,
  output                             p0_ss_app_vf_err_poisonedwrreq_s2,  
  output                             p0_ss_app_vf_err_poisonedwrreq_s3,  

  output                             p0_ss_app_vf_err_poisonedcompl_s0,
  output                             p0_ss_app_vf_err_poisonedcompl_s1,
  output                             p0_ss_app_vf_err_poisonedcompl_s2,
  output                             p0_ss_app_vf_err_poisonedcompl_s3,

  output                             p0_ss_app_vf_err_ur_postedreq_s0,
  output                             p0_ss_app_vf_err_ur_postedreq_s1,
  output                             p0_ss_app_vf_err_ur_postedreq_s2,
  output                             p0_ss_app_vf_err_ur_postedreq_s3,

  output                             p0_ss_app_vf_err_ca_postedreq_s0,
  output                             p0_ss_app_vf_err_ca_postedreq_s1,
  output                             p0_ss_app_vf_err_ca_postedreq_s2,
  output                             p0_ss_app_vf_err_ca_postedreq_s3,

  output [10:0]                      p0_ss_app_vf_err_vf_num_s0,
  output [10:0]                      p0_ss_app_vf_err_vf_num_s1,
  output [10:0]                      p0_ss_app_vf_err_vf_num_s2,
  output [10:0]                      p0_ss_app_vf_err_vf_num_s3,

  output [2:0]                       p0_ss_app_vf_err_func_num_s0,
  output [2:0]                       p0_ss_app_vf_err_func_num_s1,
  output [2:0]                       p0_ss_app_vf_err_func_num_s2,
  output [2:0]                       p0_ss_app_vf_err_func_num_s3,

  output                             p0_ss_app_vf_err_overflow,
  input                              p0_app_ss_sent_vfnonfatalmsg,
  input  [10:0]                      p0_app_ss_vfnonfatalmsg_vf_num,
  input  [2:0]                       p0_app_ss_vfnonfatalmsg_func_num,
  output                             p0_ss_app_vfnonfatalmsg_ready,

  output                             p1_ss_app_vf_err_poisonedwrreq_s0,
  output                             p1_ss_app_vf_err_poisonedwrreq_s1,

  output                             p1_ss_app_vf_err_poisonedcompl_s0,
  output                             p1_ss_app_vf_err_poisonedcompl_s1,
  
  output                             p1_ss_app_vf_err_ur_postedreq_s0,
  output                             p1_ss_app_vf_err_ur_postedreq_s1,
  
  output                             p1_ss_app_vf_err_ca_postedreq_s0,
  output                             p1_ss_app_vf_err_ca_postedreq_s1,
  
  output [10:0]                      p1_ss_app_vf_err_vf_num_s0,
  output [10:0]                      p1_ss_app_vf_err_vf_num_s1,
  output [10:0]                      p1_ss_app_vf_err_vf_num_s2,
  output [10:0]                      p1_ss_app_vf_err_vf_num_s3,
  
  
  
  output [2:0]                       p1_ss_app_vf_err_func_num_s0,
  output [2:0]                       p1_ss_app_vf_err_func_num_s1,
  
  output                             p1_ss_app_vf_err_overflow,
  input                              p1_app_ss_sent_vfnonfatalmsg,
  input  [10:0]                      p1_app_ss_vfnonfatalmsg_vf_num,
  input  [2:0]                       p1_app_ss_vfnonfatalmsg_func_num,
  output                             p1_ss_app_vfnonfatalmsg_ready,

  output                             p2_ss_app_vf_err_poisonedwrreq_s0,
  output                             p2_ss_app_vf_err_poisonedcompl_s0,
  output                             p2_ss_app_vf_err_ur_postedreq_s0,
  output                             p2_ss_app_vf_err_ca_postedreq_s0,
  output [10:0]                      p2_ss_app_vf_err_vf_num_s0,
  output [2:0]                       p2_ss_app_vf_err_func_num_s0,

   output                            p2_ss_app_vf_err_overflow,
  input                              p2_app_ss_sent_vfnonfatalmsg,
  input  [10:0]                      p2_app_ss_vfnonfatalmsg_vf_num,
  input  [2:0]                       p2_app_ss_vfnonfatalmsg_func_num,
  output                             p2_ss_app_vfnonfatalmsg_ready,

  output                             p3_ss_app_vf_err_poisonedwrreq_s0,
  output                             p3_ss_app_vf_err_poisonedcompl_s0,
  output                             p3_ss_app_vf_err_ur_postedreq_s0,
  output                             p3_ss_app_vf_err_ca_postedreq_s0,
  output [10:0]                      p3_ss_app_vf_err_vf_num_s0,
  output [2:0]                       p3_ss_app_vf_err_func_num_s0,

   output                            p3_ss_app_vf_err_overflow,
  input                              p3_app_ss_sent_vfnonfatalmsg,
  input  [10:0]                      p3_app_ss_vfnonfatalmsg_vf_num,
  input  [2:0]                       p3_app_ss_vfnonfatalmsg_func_num,
  output                             p3_ss_app_vfnonfatalmsg_ready,

  
  input                              p0_app_ss_lite_csr_awvalid,
  output                             p0_ss_app_lite_csr_awready,
  input  [core16_LiteSlvAWD-1:0]     p0_app_ss_lite_csr_awaddr,
  input  [2:0]                       p0_app_ss_lite_csr_awprot,
  

  input                              p0_app_ss_lite_csr_wvalid,
  output                             p0_ss_app_lite_csr_wready,
  input  [core16_LiteSlvDWD-1:0]     p0_app_ss_lite_csr_wdata,
  input  [core16_LiteSlvDWD/8 -1:0]  p0_app_ss_lite_csr_wstrb,

  output                             p0_ss_app_lite_csr_bvalid,
  input                              p0_app_ss_lite_csr_bready,
  output [1:0]                       p0_ss_app_lite_csr_bresp,

  input                              p0_app_ss_lite_csr_arvalid,
  output                             p0_ss_app_lite_csr_arready,
  input  [core16_LiteSlvAWD-1:0]     p0_app_ss_lite_csr_araddr,
  input  [2:0]                       p0_app_ss_lite_csr_arprot,
  

  output                             p0_ss_app_lite_csr_rvalid,
  input                              p0_app_ss_lite_csr_rready,
  output [core16_LiteSlvDWD-1:0]     p0_ss_app_lite_csr_rdata,
  output [1:0]                       p0_ss_app_lite_csr_rresp,

  input                              p1_app_ss_lite_csr_awvalid,
  output                             p1_ss_app_lite_csr_awready,
  input  [core8_LiteSlvAWD-1:0]      p1_app_ss_lite_csr_awaddr,
  input  [2:0]                       p1_app_ss_lite_csr_awprot,
  

  input                              p1_app_ss_lite_csr_wvalid,
  output                             p1_ss_app_lite_csr_wready,
  input  [core8_LiteSlvDWD-1:0]      p1_app_ss_lite_csr_wdata,
  input  [core8_LiteSlvDWD/8 -1:0]   p1_app_ss_lite_csr_wstrb,

  output                             p1_ss_app_lite_csr_bvalid,
  input                              p1_app_ss_lite_csr_bready,
  output [1:0]                       p1_ss_app_lite_csr_bresp,

  input                              p1_app_ss_lite_csr_arvalid,
  output                             p1_ss_app_lite_csr_arready,
  input  [core8_LiteSlvAWD-1:0]      p1_app_ss_lite_csr_araddr,
  input  [2:0]                       p1_app_ss_lite_csr_arprot,
  
  output                             p1_ss_app_lite_csr_rvalid,
  input                              p1_app_ss_lite_csr_rready,
  output [core8_LiteSlvDWD-1:0]      p1_ss_app_lite_csr_rdata,
  output [1:0]                       p1_ss_app_lite_csr_rresp,

  input                              p2_app_ss_lite_csr_awvalid,
  output                             p2_ss_app_lite_csr_awready,
  input  [core4_0_LiteSlvAWD-1:0]    p2_app_ss_lite_csr_awaddr,
  input  [2:0]                       p2_app_ss_lite_csr_awprot,
  
  input                              p2_app_ss_lite_csr_wvalid,
  output                             p2_ss_app_lite_csr_wready,
  input  [core4_0_LiteSlvDWD-1:0]    p2_app_ss_lite_csr_wdata,
  input  [core4_0_LiteSlvDWD/8 -1:0] p2_app_ss_lite_csr_wstrb,

  output                             p2_ss_app_lite_csr_bvalid,
  input                              p2_app_ss_lite_csr_bready,
  output [1:0]                       p2_ss_app_lite_csr_bresp,

  input                              p2_app_ss_lite_csr_arvalid,
  output                             p2_ss_app_lite_csr_arready,
  input  [core4_0_LiteSlvAWD-1:0]    p2_app_ss_lite_csr_araddr,
  input  [2:0]                       p2_app_ss_lite_csr_arprot,
  

  output                             p2_ss_app_lite_csr_rvalid,
  input                              p2_app_ss_lite_csr_rready,
  output [core4_0_LiteSlvDWD-1:0]    p2_ss_app_lite_csr_rdata,
  output [1:0]                       p2_ss_app_lite_csr_rresp,

  input                              p3_app_ss_lite_csr_awvalid,
  output                             p3_ss_app_lite_csr_awready,
  input  [core4_1_LiteSlvAWD-1:0]    p3_app_ss_lite_csr_awaddr,
  input  [2:0]                       p3_app_ss_lite_csr_awprot,
  
  input                              p3_app_ss_lite_csr_wvalid,
  output                             p3_ss_app_lite_csr_wready,
  input  [core4_1_LiteSlvDWD-1:0]    p3_app_ss_lite_csr_wdata,
  input  [core4_1_LiteSlvDWD/8 -1:0] p3_app_ss_lite_csr_wstrb,

  output                             p3_ss_app_lite_csr_bvalid,
  input                              p3_app_ss_lite_csr_bready,
  output [1:0]                       p3_ss_app_lite_csr_bresp,

  input                              p3_app_ss_lite_csr_arvalid,
  output                             p3_ss_app_lite_csr_arready,
  input  [core4_1_LiteSlvAWD-1:0]    p3_app_ss_lite_csr_araddr,
  input  [2:0]                       p3_app_ss_lite_csr_arprot,
  
  output                             p3_ss_app_lite_csr_rvalid,
  input                              p3_app_ss_lite_csr_rready,
  output [core4_1_LiteSlvDWD-1:0]    p3_ss_app_lite_csr_rdata,
  output [1:0]                       p3_ss_app_lite_csr_rresp,

  output                             p0_ss_app_lite_initatr_awvalid,
  input                              p0_app_ss_lite_initatr_awready,
  output [core16_LiteMstrAWD-1:0]    p0_ss_app_lite_initatr_awaddr,

  output                             p0_ss_app_lite_initatr_wvalid,
  input                              p0_app_ss_lite_initatr_wready,
  output [core16_LiteMstrDWD-1:0]    p0_ss_app_lite_initatr_wdata,
  output [core16_LiteMstrDWD/8 -1:0] p0_ss_app_lite_initatr_wstrb,

  input                              p0_app_ss_lite_initatr_bvalid,
  output                             p0_ss_app_lite_initatr_bready,
  input  [1:0]                       p0_app_ss_lite_initatr_bresp,

  output                             p0_ss_app_lite_initatr_arvalid,
  input                              p0_app_ss_lite_initatr_arready,
  output [core16_LiteMstrAWD-1:0]    p0_ss_app_lite_initatr_araddr,

  input                              p0_app_ss_lite_initatr_rvalid,
  output                             p0_ss_app_lite_initatr_rready,
  input  [core16_LiteMstrDWD-1:0]    p0_app_ss_lite_initatr_rdata,
  input  [1:0]                       p0_app_ss_lite_initatr_rresp,

  output                             p1_ss_app_lite_initatr_awvalid,
  input                              p1_app_ss_lite_initatr_awready,
  output [core8_LiteMstrAWD-1:0]     p1_ss_app_lite_initatr_awaddr,

  output                             p1_ss_app_lite_initatr_wvalid,
  input                              p1_app_ss_lite_initatr_wready,
  output [core8_LiteMstrDWD-1:0]     p1_ss_app_lite_initatr_wdata,
  output [core8_LiteMstrDWD/8 -1:0]  p1_ss_app_lite_initatr_wstrb,

  input                              p1_app_ss_lite_initatr_bvalid,
  output                             p1_ss_app_lite_initatr_bready,
  input  [1:0]                       p1_app_ss_lite_initatr_bresp,

  output                             p1_ss_app_lite_initatr_arvalid,
  input                              p1_app_ss_lite_initatr_arready,
  output [core8_LiteMstrAWD-1:0]     p1_ss_app_lite_initatr_araddr,

  input                              p1_app_ss_lite_initatr_rvalid,
  output                             p1_ss_app_lite_initatr_rready,
  input  [core8_LiteMstrDWD-1:0]     p1_app_ss_lite_initatr_rdata,
  input  [1:0]                       p1_app_ss_lite_initatr_rresp,

  output                             p2_ss_app_lite_initatr_awvalid,
  input                              p2_app_ss_lite_initatr_awready,
  output [core4_0_LiteMstrAWD-1:0]   p2_ss_app_lite_initatr_awaddr,

  output                             p2_ss_app_lite_initatr_wvalid,
  input                              p2_app_ss_lite_initatr_wready,
  output [core4_0_LiteMstrDWD-1:0]   p2_ss_app_lite_initatr_wdata,
  output [core4_0_LiteMstrDWD/8 -1:0]p2_ss_app_lite_initatr_wstrb,

  input                              p2_app_ss_lite_initatr_bvalid,
  output                             p2_ss_app_lite_initatr_bready,
  input  [1:0]                       p2_app_ss_lite_initatr_bresp,

  output                             p2_ss_app_lite_initatr_arvalid,
  input                              p2_app_ss_lite_initatr_arready,
  output [core4_0_LiteMstrAWD-1:0]   p2_ss_app_lite_initatr_araddr,

  input                              p2_app_ss_lite_initatr_rvalid,
  output                             p2_ss_app_lite_initatr_rready,
  input  [core4_0_LiteMstrDWD-1:0]   p2_app_ss_lite_initatr_rdata,
  input  [1:0]                       p2_app_ss_lite_initatr_rresp,

  output                             p3_ss_app_lite_initatr_awvalid,
  input                              p3_app_ss_lite_initatr_awready,
  output [core4_1_LiteMstrAWD-1:0]   p3_ss_app_lite_initatr_awaddr,

  output                             p3_ss_app_lite_initatr_wvalid,
  input                              p3_app_ss_lite_initatr_wready,
  output [core4_1_LiteMstrDWD-1:0]   p3_ss_app_lite_initatr_wdata,
  output [core4_1_LiteMstrDWD/8 -1:0]p3_ss_app_lite_initatr_wstrb,

  input                              p3_app_ss_lite_initatr_bvalid,
  output                             p3_ss_app_lite_initatr_bready,
  input  [1:0]                       p3_app_ss_lite_initatr_bresp,

  output                             p3_ss_app_lite_initatr_arvalid,
  input                              p3_app_ss_lite_initatr_arready,
  output [core4_1_LiteMstrAWD-1:0]   p3_ss_app_lite_initatr_araddr,

  input                              p3_app_ss_lite_initatr_rvalid,
  output                             p3_ss_app_lite_initatr_rready,
  input  [core4_1_LiteMstrDWD-1:0]   p3_app_ss_lite_initatr_rdata,
  input  [1:0]                       p3_app_ss_lite_initatr_rresp,

  output                             p0_ss_app_mm_initatr_awvalid,
  input                              p0_app_ss_mm_initatr_awready,
  output [core16_MMAWD-1:0]          p0_ss_app_mm_initatr_awaddr,
  output [core16_MMBLWD-1:0]         p0_ss_app_mm_initatr_awlen,
  output [2:0]                       p0_ss_app_mm_initatr_awsize,
  output [2:0]                       p0_ss_app_mm_initatr_awprot,

  output                             p0_ss_app_mm_initatr_wvalid,
  output                             p0_ss_app_mm_initatr_wlast,
  input                              p0_app_ss_mm_initatr_wready,
  output [core16_MMDWD-1:0]          p0_ss_app_mm_initatr_wdata,
  output [core16_MMDWD/8 -1:0]       p0_ss_app_mm_initatr_wstrb,

  input                              p0_app_ss_mm_initatr_bvalid,
  output                             p0_ss_app_mm_initatr_bready,
  input  [1:0]                       p0_app_ss_mm_initatr_bresp,

  output                             p0_ss_app_mm_initatr_arvalid,
  input                              p0_app_ss_mm_initatr_arready,
  output [core16_MMAWD-1:0]          p0_ss_app_mm_initatr_araddr,
  output [core16_MMBLWD-1:0]         p0_ss_app_mm_initatr_arlen,
  output [2:0]                       p0_ss_app_mm_initatr_arsize,
  output [2:0]                       p0_ss_app_mm_initatr_arprot,

  input                              p0_app_ss_mm_initatr_rvalid,
  input                              p0_app_ss_mm_initatr_rlast,
  output                             p0_ss_app_mm_initatr_rready,
  input  [core16_MMDWD-1:0]          p0_app_ss_mm_initatr_rdata,
  input  [1:0]                       p0_app_ss_mm_initatr_rresp,

  output                             p1_ss_app_mm_initatr_awvalid,
  input                              p1_app_ss_mm_initatr_awready,
  output [core8_MMAWD-1:0]           p1_ss_app_mm_initatr_awaddr,
  output [core8_MMBLWD-1:0]          p1_ss_app_mm_initatr_awlen,
  output [2:0]                       p1_ss_app_mm_initatr_awsize,
  output [2:0]                       p1_ss_app_mm_initatr_awprot,

  output                             p1_ss_app_mm_initatr_wvalid,
  output                             p1_ss_app_mm_initatr_wlast,
  input                              p1_app_ss_mm_initatr_wready,
  output [core8_MMDWD-1:0]           p1_ss_app_mm_initatr_wdata,
  output [core8_MMDWD/8 -1:0]        p1_ss_app_mm_initatr_wstrb,

  input                              p1_app_ss_mm_initatr_bvalid,
  output                             p1_ss_app_mm_initatr_bready,
  input  [1:0]                       p1_app_ss_mm_initatr_bresp,

  output                             p1_ss_app_mm_initatr_arvalid,
  input                              p1_app_ss_mm_initatr_arready,
  output [core8_MMAWD-1:0]           p1_ss_app_mm_initatr_araddr,
  output [core8_MMBLWD-1:0]          p1_ss_app_mm_initatr_arlen,
  output [2:0]                       p1_ss_app_mm_initatr_arsize,
  output [2:0]                       p1_ss_app_mm_initatr_arprot,

  input                              p1_app_ss_mm_initatr_rvalid,
  input                              p1_app_ss_mm_initatr_rlast,
  output                             p1_ss_app_mm_initatr_rready,
  input  [core8_MMDWD-1:0]           p1_app_ss_mm_initatr_rdata,
  input  [1:0]                       p1_app_ss_mm_initatr_rresp,

  output                             p2_ss_app_mm_initatr_awvalid,
  input                              p2_app_ss_mm_initatr_awready,
  output [core4_0_MMAWD-1:0]         p2_ss_app_mm_initatr_awaddr,
  output [core4_0_MMBLWD-1:0]        p2_ss_app_mm_initatr_awlen,
  output [2:0]                       p2_ss_app_mm_initatr_awsize,
  output [2:0]                       p2_ss_app_mm_initatr_awprot,

  output                             p2_ss_app_mm_initatr_wvalid,
  output                             p2_ss_app_mm_initatr_wlast,
  input                              p2_app_ss_mm_initatr_wready,
  output [core4_0_MMDWD-1:0]         p2_ss_app_mm_initatr_wdata,
  output [core4_0_MMDWD/8 -1:0]      p2_ss_app_mm_initatr_wstrb,

  input                              p2_app_ss_mm_initatr_bvalid,
  output                             p2_ss_app_mm_initatr_bready,
  input  [1:0]                       p2_app_ss_mm_initatr_bresp,

  output                             p2_ss_app_mm_initatr_arvalid,
  input                              p2_app_ss_mm_initatr_arready,
  output [core4_0_MMAWD-1:0]         p2_ss_app_mm_initatr_araddr,
  output [core4_0_MMBLWD-1:0]        p2_ss_app_mm_initatr_arlen,
  output [2:0]                       p2_ss_app_mm_initatr_arsize,
  output [2:0]                       p2_ss_app_mm_initatr_arprot,

  input                              p2_app_ss_mm_initatr_rvalid,
  input                              p2_app_ss_mm_initatr_rlast,
  output                             p2_ss_app_mm_initatr_rready,
  input  [core4_0_MMDWD-1:0]         p2_app_ss_mm_initatr_rdata,
  input  [1:0]                       p2_app_ss_mm_initatr_rresp,

  output                             p3_ss_app_mm_initatr_awvalid,
  input                              p3_app_ss_mm_initatr_awready,
  output [core4_1_MMAWD-1:0]         p3_ss_app_mm_initatr_awaddr,
  output [core4_1_MMBLWD-1:0]        p3_ss_app_mm_initatr_awlen,
  output [2:0]                       p3_ss_app_mm_initatr_awsize,
  output [2:0]                       p3_ss_app_mm_initatr_awprot,

  output                             p3_ss_app_mm_initatr_wvalid,
  output                             p3_ss_app_mm_initatr_wlast,
  input                              p3_app_ss_mm_initatr_wready,
  output [core4_1_MMDWD-1:0]         p3_ss_app_mm_initatr_wdata,
  output [core4_1_MMDWD/8 -1:0]      p3_ss_app_mm_initatr_wstrb,

  input                              p3_app_ss_mm_initatr_bvalid,
  output                             p3_ss_app_mm_initatr_bready,
  input  [1:0]                       p3_app_ss_mm_initatr_bresp,

  output                             p3_ss_app_mm_initatr_arvalid,
  input                              p3_app_ss_mm_initatr_arready,
  output [core4_1_MMAWD-1:0]         p3_ss_app_mm_initatr_araddr,
  output [core4_1_MMBLWD-1:0]        p3_ss_app_mm_initatr_arlen,
  output [2:0]                       p3_ss_app_mm_initatr_arsize,
  output [2:0]                       p3_ss_app_mm_initatr_arprot,

  input                              p3_app_ss_mm_initatr_rvalid,
  input                              p3_app_ss_mm_initatr_rlast,
  output                             p3_ss_app_mm_initatr_rready,
  input  [core4_1_MMDWD-1:0]         p3_app_ss_mm_initatr_rdata,
  input  [1:0]                       p3_app_ss_mm_initatr_rresp,

  output                             p0_ss_app_virtio_pcicfgreq_tvalid,
  output [95:0]                      p0_ss_app_virtio_pcicfgreq_tdata,
  input  [31:0]                      p0_app_ss_virtio_pcicfgcmpl_tdata,
  input                              p0_app_ss_virtio_pcicfgcmpl_tvalid,

  output                             p1_ss_app_virtio_pcicfgreq_tvalid,
  output [95:0]                      p1_ss_app_virtio_pcicfgreq_tdata,
  output [95:0]                      p2_ss_app_virtio_pcicfgreq_tdata,
  output [95:0]                      p3_ss_app_virtio_pcicfgreq_tdata,
  input  [31:0]                      p1_app_ss_virtio_pcicfgcmpl_tdata,
  input  [31:0]                      p2_app_ss_virtio_pcicfgcmpl_tdata,
  input  [31:0]                      p3_app_ss_virtio_pcicfgcmpl_tdata,
  input                              p1_app_ss_virtio_pcicfgcmpl_tvalid,

  output                             p0_ss_app_serr,
  output                             p1_ss_app_serr,
  output                             p2_ss_app_serr,
  output                             p3_ss_app_serr,

  output                             p0_ss_app_linkup,
  output                             p1_ss_app_linkup,
  output                             p2_ss_app_linkup,
  output                             p3_ss_app_linkup,

  output                             p0_ss_app_dlup,
  output                             p1_ss_app_dlup,
  output                             p2_ss_app_dlup,
  output                             p3_ss_app_dlup,

  output                             p0_ss_app_surprise_down_err,
  output                             p1_ss_app_surprise_down_err,
  output                             p2_ss_app_surprise_down_err,
  output                             p3_ss_app_surprise_down_err,

  output [5:0]                       p0_ss_app_ltssmstate,
  output [5:0]                       p1_ss_app_ltssmstate,
  output [5:0]                       p2_ss_app_ltssmstate,
  output [5:0]                       p3_ss_app_ltssmstate,

  output                             p0_ss_app_rx_par_err,
  output                             p1_ss_app_rx_par_err,
  output                             p2_ss_app_rx_par_err,
  output                             p3_ss_app_rx_par_err,

  output                             p0_ss_app_tx_par_err,
  output                             p1_ss_app_tx_par_err,
  output                             p2_ss_app_tx_par_err,
  output                             p3_ss_app_tx_par_err,


  output                             p0_ss_app_int_status,
  output                             p1_ss_app_int_status,
  output                             p2_ss_app_int_status,
  output                             p3_ss_app_int_status,

  input                              xcvr_reconfig_clk,
  input                              xcvr_reconfig_write,
  input                              xcvr_reconfig_read,
  input  [20:0]                      xcvr_reconfig_address,
  input  [7:0]                       xcvr_reconfig_writedata,
  output [7:0]                       xcvr_reconfig_readdata,
  output                             xcvr_reconfig_readdatavalid,
  output                             xcvr_reconfig_waitrequest,

   output							   pciess_reconfig_clk_o,
   output [20:0]	                   pciess_reconfig_address_o,
   output		                       pciess_reconfig_write_o,
   output [7:0]		                   pciess_reconfig_writedata_o,
   output		                       pciess_reconfig_read_o,
  

  input                             p0_ss_app_st_rxcrdt_tvalid,
  input [18:0]                      p0_ss_app_st_rxcrdt_tdata,
  
  input                             p1_ss_app_st_rxcrdt_tvalid,
  input [18:0]                      p1_ss_app_st_rxcrdt_tdata,
  
  input                             p2_ss_app_st_rxcrdt_tvalid,
  input [18:0]                      p2_ss_app_st_rxcrdt_tdata,
  
  input                             p3_ss_app_st_rxcrdt_tvalid,
  input [18:0]                      p3_ss_app_st_rxcrdt_tdata,

  output                             tx_n_out0,
  output                             tx_n_out1,
  output                             tx_n_out2,
  output                             tx_n_out3,
  output                             tx_n_out4,
  output                             tx_n_out5,
  output                             tx_n_out6,
  output                             tx_n_out7,
  output                             tx_n_out8,
  output                             tx_n_out9,
  output                             tx_n_out10,
  output                             tx_n_out11,
  output                             tx_n_out12,
  output                             tx_n_out13,
  output                             tx_n_out14,
  output                             tx_n_out15,

  output                             tx_p_out0,
  output                             tx_p_out1,
  output                             tx_p_out2,
  output                             tx_p_out3,
  output                             tx_p_out4,
  output                             tx_p_out5,
  output                             tx_p_out6,
  output                             tx_p_out7,
  output                             tx_p_out8,
  output                             tx_p_out9,
  output                             tx_p_out10,
  output                             tx_p_out11,
  output                             tx_p_out12,
  output                             tx_p_out13,
  output                             tx_p_out14,
  output                             tx_p_out15,

  input                              rx_n_in0,
  input                              rx_n_in1,
  input                              rx_n_in2,
  input                              rx_n_in3,
  input                              rx_n_in4,
  input                              rx_n_in5,
  input                              rx_n_in6,
  input                              rx_n_in7,
  input                              rx_n_in8,
  input                              rx_n_in9,
  input                              rx_n_in10,
  input                              rx_n_in11,
  input                              rx_n_in12,
  input                              rx_n_in13,
  input                              rx_n_in14,
  input                              rx_n_in15,

  input                              rx_p_in0,
  input                              rx_p_in1,
  input                              rx_p_in2,
  input                              rx_p_in3,
  input                              rx_p_in4,
  input                              rx_p_in5,
  input                              rx_p_in6,
  input                              rx_p_in7,
  input                              rx_p_in8,
  input                              rx_p_in9,
  input                              rx_p_in10,
  input                              rx_p_in11,
  input                              rx_p_in12,
  input                              rx_p_in13,
  input                              rx_p_in14,
  input                              rx_p_in15,

  input  [1:0]                       p0_test_in_i,
  output [139:0]                     p0_test_out_o,
  input                              p1_test_in_i,
  output [69:0]                      p1_test_out_o,
  input                              p2_test_in_i,
  output [34:0]                      p2_test_out_o,
  input                              p3_test_in_i,
  output [34:0]                      p3_test_out_o,

  output                             ptm_clk_updated_o,
  output [63:0]                      ptm_local_clock_o,
  output                             ptm_context_valid_o,
  input                              ptm_manual_update_i,

	input [5:0]	i_rxpipe0_dirfeedback,
	input [7:0]	i_rxpipe0_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe0_localfs,
	input [5:0]	i_rxpipe0_locallf,
	input		i_rxpipe0_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe0_localtxpresetcoefficients,
	input [7:0]	i_rxpipe0_p2m_bus,
	input		i_rxpipe0_pclkchangeok,
	input		i_rxpipe0_phystatus,
	input [39:0]	i_rxpipe0_rxdata,
	input [3:0]	i_rxpipe0_rxdatak,
	input		i_rxpipe0_rxdatavalid,
	input		i_rxpipe0_rxelecidlea,
	input		i_rxpipe0_rxstandbystatus,
	input [0:0]	i_rxpipe0_rxstartblock,
	input [2:0]	i_rxpipe0_rxstatus,
	input [3:0]	i_rxpipe0_rxsyncheader,
	input		i_rxpipe0_rxvalid,
	input [5:0]	i_rxpipe1_dirfeedback,
	input [7:0]	i_rxpipe1_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe1_localfs,
	input [5:0]	i_rxpipe1_locallf,
	input		i_rxpipe1_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe1_localtxpresetcoefficients,
	input [7:0]	i_rxpipe1_p2m_bus,
	input		i_rxpipe1_pclkchangeok,
	input		i_rxpipe1_phystatus,
	input [39:0]	i_rxpipe1_rxdata,
	input [3:0]	i_rxpipe1_rxdatak,
	input		i_rxpipe1_rxdatavalid,
	input		i_rxpipe1_rxelecidlea,
	input		i_rxpipe1_rxstandbystatus,
	input [0:0]	i_rxpipe1_rxstartblock,
	input [2:0]	i_rxpipe1_rxstatus,
	input [3:0]	i_rxpipe1_rxsyncheader,
	input		i_rxpipe1_rxvalid,
	input [5:0]	i_rxpipe2_dirfeedback,
	input [7:0]	i_rxpipe2_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe2_localfs,
	input [5:0]	i_rxpipe2_locallf,
	input		i_rxpipe2_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe2_localtxpresetcoefficients,
	input [7:0]	i_rxpipe2_p2m_bus,
	input		i_rxpipe2_pclkchangeok,
	input		i_rxpipe2_phystatus,
	input [39:0]	i_rxpipe2_rxdata,
	input [3:0]	i_rxpipe2_rxdatak,
	input		i_rxpipe2_rxdatavalid,
	input		i_rxpipe2_rxelecidlea,
	input		i_rxpipe2_rxstandbystatus,
	input [0:0]	i_rxpipe2_rxstartblock,
	input [2:0]	i_rxpipe2_rxstatus,
	input [3:0]	i_rxpipe2_rxsyncheader,
	input		i_rxpipe2_rxvalid,
	input [5:0]	i_rxpipe3_dirfeedback,
	input [7:0]	i_rxpipe3_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe3_localfs,
	input [5:0]	i_rxpipe3_locallf,
	input		i_rxpipe3_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe3_localtxpresetcoefficients,
	input [7:0]	i_rxpipe3_p2m_bus,
	input		i_rxpipe3_pclkchangeok,
	input		i_rxpipe3_phystatus,
	input [39:0]	i_rxpipe3_rxdata,
	input [3:0]	i_rxpipe3_rxdatak,
	input		i_rxpipe3_rxdatavalid,
	input		i_rxpipe3_rxelecidlea,
	input		i_rxpipe3_rxstandbystatus,
	input [0:0]	i_rxpipe3_rxstartblock,
	input [2:0]	i_rxpipe3_rxstatus,
	input [3:0]	i_rxpipe3_rxsyncheader,
	input		i_rxpipe3_rxvalid,
	input [5:0]	i_rxpipe4_dirfeedback,
	input [7:0]	i_rxpipe4_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe4_localfs,
	input [5:0]	i_rxpipe4_locallf,
	input		i_rxpipe4_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe4_localtxpresetcoefficients,
	input [7:0]	i_rxpipe4_p2m_bus,
	input		i_rxpipe4_pclkchangeok,
	input		i_rxpipe4_phystatus,
	input [39:0]	i_rxpipe4_rxdata,
	input [3:0]	i_rxpipe4_rxdatak,
	input		i_rxpipe4_rxdatavalid,
	input		i_rxpipe4_rxelecidlea,
	input		i_rxpipe4_rxstandbystatus,
	input [0:0]	i_rxpipe4_rxstartblock,
	input [2:0]	i_rxpipe4_rxstatus,
	input [3:0]	i_rxpipe4_rxsyncheader,
	input		i_rxpipe4_rxvalid,
	input [5:0]	i_rxpipe5_dirfeedback,
	input [7:0]	i_rxpipe5_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe5_localfs,
	input [5:0]	i_rxpipe5_locallf,
	input		i_rxpipe5_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe5_localtxpresetcoefficients,
	input [7:0]	i_rxpipe5_p2m_bus,
	input		i_rxpipe5_pclkchangeok,
	input		i_rxpipe5_phystatus,
	input [39:0]	i_rxpipe5_rxdata,
	input [3:0]	i_rxpipe5_rxdatak,
	input		i_rxpipe5_rxdatavalid,
	input		i_rxpipe5_rxelecidlea,
	input		i_rxpipe5_rxstandbystatus,
	input [0:0]	i_rxpipe5_rxstartblock,
	input [2:0]	i_rxpipe5_rxstatus,
	input [3:0]	i_rxpipe5_rxsyncheader,
	input		i_rxpipe5_rxvalid,
	input [5:0]	i_rxpipe6_dirfeedback,
	input [7:0]	i_rxpipe6_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe6_localfs,
	input [5:0]	i_rxpipe6_locallf,
	input		i_rxpipe6_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe6_localtxpresetcoefficients,
	input [7:0]	i_rxpipe6_p2m_bus,
	input		i_rxpipe6_pclkchangeok,
	input		i_rxpipe6_phystatus,
	input [39:0]	i_rxpipe6_rxdata,
	input [3:0]	i_rxpipe6_rxdatak,
	input		i_rxpipe6_rxdatavalid,
	input		i_rxpipe6_rxelecidlea,
	input		i_rxpipe6_rxstandbystatus,
	input [0:0]	i_rxpipe6_rxstartblock,
	input [2:0]	i_rxpipe6_rxstatus,
	input [3:0]	i_rxpipe6_rxsyncheader,
	input		i_rxpipe6_rxvalid,
	input [5:0]	i_rxpipe7_dirfeedback,
	input [7:0]	i_rxpipe7_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe7_localfs,
	input [5:0]	i_rxpipe7_locallf,
	input		i_rxpipe7_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe7_localtxpresetcoefficients,
	input [7:0]	i_rxpipe7_p2m_bus,
	input		i_rxpipe7_pclkchangeok,
	input		i_rxpipe7_phystatus,
	input [39:0]	i_rxpipe7_rxdata,
	input [3:0]	i_rxpipe7_rxdatak,
	input		i_rxpipe7_rxdatavalid,
	input		i_rxpipe7_rxelecidlea,
	input		i_rxpipe7_rxstandbystatus,
	input [0:0]	i_rxpipe7_rxstartblock,
	input [2:0]	i_rxpipe7_rxstatus,
	input [3:0]	i_rxpipe7_rxsyncheader,
	input		i_rxpipe7_rxvalid,
	input [5:0]	i_rxpipe8_dirfeedback,
	input [7:0]	i_rxpipe8_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe8_localfs,
	input [5:0]	i_rxpipe8_locallf,
	input		i_rxpipe8_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe8_localtxpresetcoefficients,
	input [7:0]	i_rxpipe8_p2m_bus,
	input		i_rxpipe8_pclkchangeok,
	input		i_rxpipe8_phystatus,
	input [39:0]	i_rxpipe8_rxdata,
	input [3:0]	i_rxpipe8_rxdatak,
	input		i_rxpipe8_rxdatavalid,
	input		i_rxpipe8_rxelecidlea,
	input		i_rxpipe8_rxstandbystatus,
	input [0:0]	i_rxpipe8_rxstartblock,
	input [2:0]	i_rxpipe8_rxstatus,
	input [3:0]	i_rxpipe8_rxsyncheader,
	input		i_rxpipe8_rxvalid,
	input [5:0]	i_rxpipe9_dirfeedback,
	input [7:0]	i_rxpipe9_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe9_localfs,
	input [5:0]	i_rxpipe9_locallf,
	input		i_rxpipe9_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe9_localtxpresetcoefficients,
	input [7:0]	i_rxpipe9_p2m_bus,
	input		i_rxpipe9_pclkchangeok,
	input		i_rxpipe9_phystatus,
	input [39:0]	i_rxpipe9_rxdata,
	input [3:0]	i_rxpipe9_rxdatak,
	input		i_rxpipe9_rxdatavalid,
	input		i_rxpipe9_rxelecidlea,
	input		i_rxpipe9_rxstandbystatus,
	input [0:0]	i_rxpipe9_rxstartblock,
	input [2:0]	i_rxpipe9_rxstatus,
	input [3:0]	i_rxpipe9_rxsyncheader,
	input		i_rxpipe9_rxvalid,
	input [5:0]	i_rxpipe10_dirfeedback,
	input [7:0]	i_rxpipe10_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe10_localfs,
	input [5:0]	i_rxpipe10_locallf,
	input		i_rxpipe10_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe10_localtxpresetcoefficients,
	input [7:0]	i_rxpipe10_p2m_bus,
	input		i_rxpipe10_pclkchangeok,
	input		i_rxpipe10_phystatus,
	input [39:0]	i_rxpipe10_rxdata,
	input [3:0]	i_rxpipe10_rxdatak,
	input		i_rxpipe10_rxdatavalid,
	input		i_rxpipe10_rxelecidlea,
	input		i_rxpipe10_rxstandbystatus,
	input [0:0]	i_rxpipe10_rxstartblock,
	input [2:0]	i_rxpipe10_rxstatus,
	input [3:0]	i_rxpipe10_rxsyncheader,
	input		i_rxpipe10_rxvalid,
	input [5:0]	i_rxpipe11_dirfeedback,
	input [7:0]	i_rxpipe11_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe11_localfs,
	input [5:0]	i_rxpipe11_locallf,
	input		i_rxpipe11_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe11_localtxpresetcoefficients,
	input [7:0]	i_rxpipe11_p2m_bus,
	input		i_rxpipe11_pclkchangeok,
	input		i_rxpipe11_phystatus,
	input [39:0]	i_rxpipe11_rxdata,
	input [3:0]	i_rxpipe11_rxdatak,
	input		i_rxpipe11_rxdatavalid,
	input		i_rxpipe11_rxelecidlea,
	input		i_rxpipe11_rxstandbystatus,
	input [0:0]	i_rxpipe11_rxstartblock,
	input [2:0]	i_rxpipe11_rxstatus,
	input [3:0]	i_rxpipe11_rxsyncheader,
	input		i_rxpipe11_rxvalid,
	input [5:0]	i_rxpipe12_dirfeedback,
	input [7:0]	i_rxpipe12_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe12_localfs,
	input [5:0]	i_rxpipe12_locallf,
	input		i_rxpipe12_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe12_localtxpresetcoefficients,
	input [7:0]	i_rxpipe12_p2m_bus,
	input		i_rxpipe12_pclkchangeok,
	input		i_rxpipe12_phystatus,
	input [39:0]	i_rxpipe12_rxdata,
	input [3:0]	i_rxpipe12_rxdatak,
	input		i_rxpipe12_rxdatavalid,
	input		i_rxpipe12_rxelecidlea,
	input		i_rxpipe12_rxstandbystatus,
	input [0:0]	i_rxpipe12_rxstartblock,
	input [2:0]	i_rxpipe12_rxstatus,
	input [3:0]	i_rxpipe12_rxsyncheader,
	input		i_rxpipe12_rxvalid,
	input [5:0]	i_rxpipe13_dirfeedback,
	input [7:0]	i_rxpipe13_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe13_localfs,
	input [5:0]	i_rxpipe13_locallf,
	input		i_rxpipe13_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe13_localtxpresetcoefficients,
	input [7:0]	i_rxpipe13_p2m_bus,
	input		i_rxpipe13_pclkchangeok,
	input		i_rxpipe13_phystatus,
	input [39:0]	i_rxpipe13_rxdata,
	input [3:0]	i_rxpipe13_rxdatak,
	input		i_rxpipe13_rxdatavalid,
	input		i_rxpipe13_rxelecidlea,
	input		i_rxpipe13_rxstandbystatus,
	input [0:0]	i_rxpipe13_rxstartblock,
	input [2:0]	i_rxpipe13_rxstatus,
	input [3:0]	i_rxpipe13_rxsyncheader,
	input		i_rxpipe13_rxvalid,
	input [5:0]	i_rxpipe14_dirfeedback,
	input [7:0]	i_rxpipe14_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe14_localfs,
	input [5:0]	i_rxpipe14_locallf,
	input		i_rxpipe14_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe14_localtxpresetcoefficients,
	input [7:0]	i_rxpipe14_p2m_bus,
	input		i_rxpipe14_pclkchangeok,
	input		i_rxpipe14_phystatus,
	input [39:0]	i_rxpipe14_rxdata,
	input [3:0]	i_rxpipe14_rxdatak,
	input		i_rxpipe14_rxdatavalid,
	input		i_rxpipe14_rxelecidlea,
	input		i_rxpipe14_rxstandbystatus,
	input [0:0]	i_rxpipe14_rxstartblock,
	input [2:0]	i_rxpipe14_rxstatus,
	input [3:0]	i_rxpipe14_rxsyncheader,
	input		i_rxpipe14_rxvalid,
	input [5:0]	i_rxpipe15_dirfeedback,
	input [7:0]	i_rxpipe15_linkevaluationfeedbackfiguremerit,
	input [5:0]	i_rxpipe15_localfs,
	input [5:0]	i_rxpipe15_locallf,
	input		i_rxpipe15_localtxcoefficientsvalid,
	input [17:0]	i_rxpipe15_localtxpresetcoefficients,
	input [7:0]	i_rxpipe15_p2m_bus,
	input		i_rxpipe15_pclkchangeok,
	input		i_rxpipe15_phystatus,
	input [39:0]	i_rxpipe15_rxdata,
	input [3:0]	i_rxpipe15_rxdatak,
	input		i_rxpipe15_rxdatavalid,
	input		i_rxpipe15_rxelecidlea,
	input		i_rxpipe15_rxstandbystatus,
	input [0:0]	i_rxpipe15_rxstartblock,
	input [2:0]	i_rxpipe15_rxstatus,
	input [3:0]	i_rxpipe15_rxsyncheader,
	input		i_rxpipe15_rxvalid,
	output		o_txpipe0_asyncpowerchangeack,
	output		o_txpipe0_blockaligncontrol,
	output		o_txpipe0_cfg_hw_auto_sp_dis,
	output		o_txpipe0_dirchange,
	output		o_txpipe0_ebuf_mode,
	output		o_txpipe0_encodedecodebypass,
	output [5:0]	o_txpipe0_fs,
	output		o_txpipe0_getlocalpresetcoefficients,
	output		o_txpipe0_invalidrequest,
	output [5:0]	o_txpipe0_lf,
	output [4:0]	o_txpipe0_localpresetindex,
	output [7:0]	o_txpipe0_m2p_bus,
	output [2:0]	o_txpipe0_pclk_rate,
	output		o_txpipe0_pclkchangeack,
	output [3:0]	o_txpipe0_powerdown,
	output [2:0]	o_txpipe0_rate,
	output		o_txpipe0_rxelecidle_disable_a,
	output		o_txpipe0_rxeqeval,
	output		o_txpipe0_rxeqinprogress,
	output		o_txpipe0_rxeqtraining,
	output		o_txpipe0_rxpolarity,
	output [2:0]	o_txpipe0_rxpresethint,
	output		o_txpipe0_rxstandby,
	output		o_txpipe0_rxtermination,
	output		o_txpipe0_srisenable,
	output		o_txpipe0_txcmnmode_disable_a,
	output		o_txpipe0_txcompliance,
	output [39:0]	o_txpipe0_txdata,
	output [3:0]	o_txpipe0_txdatak,
	output		o_txpipe0_txdatavalid,
	output [17:0]	o_txpipe0_txdeemph,
	output		o_txpipe0_txdtctrx_lb,
	output		o_txpipe0_txelecidle,
	output [2:0]	o_txpipe0_txmargin,
	output		o_txpipe0_txoneszeros,
	output [0:0]	o_txpipe0_txstartblock,
	output		o_txpipe0_txswing,
	output [3:0]	o_txpipe0_txsyncheader,
	output [2:0]	o_txpipe0_width,
	output		o_txpipe1_asyncpowerchangeack,
	output		o_txpipe1_blockaligncontrol,
	output		o_txpipe1_cfg_hw_auto_sp_dis,
	output		o_txpipe1_dirchange,
	output		o_txpipe1_ebuf_mode,
	output		o_txpipe1_encodedecodebypass,
	output [5:0]	o_txpipe1_fs,
	output		o_txpipe1_getlocalpresetcoefficients,
	output		o_txpipe1_invalidrequest,
	output [5:0]	o_txpipe1_lf,
	output [4:0]	o_txpipe1_localpresetindex,
	output [7:0]	o_txpipe1_m2p_bus,
	output [2:0]	o_txpipe1_pclk_rate,
	output		o_txpipe1_pclkchangeack,
	output [3:0]	o_txpipe1_powerdown,
	output [2:0]	o_txpipe1_rate,
	output		o_txpipe1_rxelecidle_disable_a,
	output		o_txpipe1_rxeqeval,
	output		o_txpipe1_rxeqinprogress,
	output		o_txpipe1_rxeqtraining,
	output		o_txpipe1_rxpolarity,
	output [2:0]	o_txpipe1_rxpresethint,
	output		o_txpipe1_rxstandby,
	output		o_txpipe1_rxtermination,
	output		o_txpipe1_srisenable,
	output		o_txpipe1_txcmnmode_disable_a,
	output		o_txpipe1_txcompliance,
	output [39:0]	o_txpipe1_txdata,
	output [3:0]	o_txpipe1_txdatak,
	output		o_txpipe1_txdatavalid,
	output [17:0]	o_txpipe1_txdeemph,
	output		o_txpipe1_txdtctrx_lb,
	output		o_txpipe1_txelecidle,
	output [2:0]	o_txpipe1_txmargin,
	output		o_txpipe1_txoneszeros,
	output [0:0]	o_txpipe1_txstartblock,
	output		o_txpipe1_txswing,
	output [3:0]	o_txpipe1_txsyncheader,
	output [2:0]	o_txpipe1_width,
	output		o_txpipe2_asyncpowerchangeack,
	output		o_txpipe2_blockaligncontrol,
	output		o_txpipe2_cfg_hw_auto_sp_dis,
	output		o_txpipe2_dirchange,
	output		o_txpipe2_ebuf_mode,
	output		o_txpipe2_encodedecodebypass,
	output [5:0]	o_txpipe2_fs,
	output		o_txpipe2_getlocalpresetcoefficients,
	output		o_txpipe2_invalidrequest,
	output [5:0]	o_txpipe2_lf,
	output [4:0]	o_txpipe2_localpresetindex,
	output [7:0]	o_txpipe2_m2p_bus,
	output [2:0]	o_txpipe2_pclk_rate,
	output		o_txpipe2_pclkchangeack,
	output [3:0]	o_txpipe2_powerdown,
	output [2:0]	o_txpipe2_rate,
	output		o_txpipe2_rxelecidle_disable_a,
	output		o_txpipe2_rxeqeval,
	output		o_txpipe2_rxeqinprogress,
	output		o_txpipe2_rxeqtraining,
	output		o_txpipe2_rxpolarity,
	output [2:0]	o_txpipe2_rxpresethint,
	output		o_txpipe2_rxstandby,
	output		o_txpipe2_rxtermination,
	output		o_txpipe2_srisenable,
	output		o_txpipe2_txcmnmode_disable_a,
	output		o_txpipe2_txcompliance,
	output [39:0]	o_txpipe2_txdata,
	output [3:0]	o_txpipe2_txdatak,
	output		o_txpipe2_txdatavalid,
	output [17:0]	o_txpipe2_txdeemph,
	output		o_txpipe2_txdtctrx_lb,
	output		o_txpipe2_txelecidle,
	output [2:0]	o_txpipe2_txmargin,
	output		o_txpipe2_txoneszeros,
	output [0:0]	o_txpipe2_txstartblock,
	output		o_txpipe2_txswing,
	output [3:0]	o_txpipe2_txsyncheader,
	output [2:0]	o_txpipe2_width,
	output		o_txpipe3_asyncpowerchangeack,
	output		o_txpipe3_blockaligncontrol,
	output		o_txpipe3_cfg_hw_auto_sp_dis,
	output		o_txpipe3_dirchange,
	output		o_txpipe3_ebuf_mode,
	output		o_txpipe3_encodedecodebypass,
	output [5:0]	o_txpipe3_fs,
	output		o_txpipe3_getlocalpresetcoefficients,
	output		o_txpipe3_invalidrequest,
	output [5:0]	o_txpipe3_lf,
	output [4:0]	o_txpipe3_localpresetindex,
	output [7:0]	o_txpipe3_m2p_bus,
	output [2:0]	o_txpipe3_pclk_rate,
	output		o_txpipe3_pclkchangeack,
	output [3:0]	o_txpipe3_powerdown,
	output [2:0]	o_txpipe3_rate,
	output		o_txpipe3_rxelecidle_disable_a,
	output		o_txpipe3_rxeqeval,
	output		o_txpipe3_rxeqinprogress,
	output		o_txpipe3_rxeqtraining,
	output		o_txpipe3_rxpolarity,
	output [2:0]	o_txpipe3_rxpresethint,
	output		o_txpipe3_rxstandby,
	output		o_txpipe3_rxtermination,
	output		o_txpipe3_srisenable,
	output		o_txpipe3_txcmnmode_disable_a,
	output		o_txpipe3_txcompliance,
	output [39:0]	o_txpipe3_txdata,
	output [3:0]	o_txpipe3_txdatak,
	output		o_txpipe3_txdatavalid,
	output [17:0]	o_txpipe3_txdeemph,
	output		o_txpipe3_txdtctrx_lb,
	output		o_txpipe3_txelecidle,
	output [2:0]	o_txpipe3_txmargin,
	output		o_txpipe3_txoneszeros,
	output [0:0]	o_txpipe3_txstartblock,
	output		o_txpipe3_txswing,
	output [3:0]	o_txpipe3_txsyncheader,
	output [2:0]	o_txpipe3_width,
	output		o_txpipe4_asyncpowerchangeack,
	output		o_txpipe4_blockaligncontrol,
	output		o_txpipe4_cfg_hw_auto_sp_dis,
	output		o_txpipe4_dirchange,
	output		o_txpipe4_ebuf_mode,
	output		o_txpipe4_encodedecodebypass,
	output [5:0]	o_txpipe4_fs,
	output		o_txpipe4_getlocalpresetcoefficients,
	output		o_txpipe4_invalidrequest,
	output [5:0]	o_txpipe4_lf,
	output [4:0]	o_txpipe4_localpresetindex,
	output [7:0]	o_txpipe4_m2p_bus,
	output [2:0]	o_txpipe4_pclk_rate,
	output		o_txpipe4_pclkchangeack,
	output [3:0]	o_txpipe4_powerdown,
	output [2:0]	o_txpipe4_rate,
	output		o_txpipe4_rxelecidle_disable_a,
	output		o_txpipe4_rxeqeval,
	output		o_txpipe4_rxeqinprogress,
	output		o_txpipe4_rxeqtraining,
	output		o_txpipe4_rxpolarity,
	output [2:0]	o_txpipe4_rxpresethint,
	output		o_txpipe4_rxstandby,
	output		o_txpipe4_rxtermination,
	output		o_txpipe4_srisenable,
	output		o_txpipe4_txcmnmode_disable_a,
	output		o_txpipe4_txcompliance,
	output [39:0]	o_txpipe4_txdata,
	output [3:0]	o_txpipe4_txdatak,
	output		o_txpipe4_txdatavalid,
	output [17:0]	o_txpipe4_txdeemph,
	output		o_txpipe4_txdtctrx_lb,
	output		o_txpipe4_txelecidle,
	output [2:0]	o_txpipe4_txmargin,
	output		o_txpipe4_txoneszeros,
	output [0:0]	o_txpipe4_txstartblock,
	output		o_txpipe4_txswing,
	output [3:0]	o_txpipe4_txsyncheader,
	output [2:0]	o_txpipe4_width,
	output		o_txpipe5_asyncpowerchangeack,
	output		o_txpipe5_blockaligncontrol,
	output		o_txpipe5_cfg_hw_auto_sp_dis,
	output		o_txpipe5_dirchange,
	output		o_txpipe5_ebuf_mode,
	output		o_txpipe5_encodedecodebypass,
	output [5:0]	o_txpipe5_fs,
	output		o_txpipe5_getlocalpresetcoefficients,
	output		o_txpipe5_invalidrequest,
	output [5:0]	o_txpipe5_lf,
	output [4:0]	o_txpipe5_localpresetindex,
	output [7:0]	o_txpipe5_m2p_bus,
	output [2:0]	o_txpipe5_pclk_rate,
	output		o_txpipe5_pclkchangeack,
	output [3:0]	o_txpipe5_powerdown,
	output [2:0]	o_txpipe5_rate,
	output		o_txpipe5_rxelecidle_disable_a,
	output		o_txpipe5_rxeqeval,
	output		o_txpipe5_rxeqinprogress,
	output		o_txpipe5_rxeqtraining,
	output		o_txpipe5_rxpolarity,
	output [2:0]	o_txpipe5_rxpresethint,
	output		o_txpipe5_rxstandby,
	output		o_txpipe5_rxtermination,
	output		o_txpipe5_srisenable,
	output		o_txpipe5_txcmnmode_disable_a,
	output		o_txpipe5_txcompliance,
	output [39:0]	o_txpipe5_txdata,
	output [3:0]	o_txpipe5_txdatak,
	output		o_txpipe5_txdatavalid,
	output [17:0]	o_txpipe5_txdeemph,
	output		o_txpipe5_txdtctrx_lb,
	output		o_txpipe5_txelecidle,
	output [2:0]	o_txpipe5_txmargin,
	output		o_txpipe5_txoneszeros,
	output [0:0]	o_txpipe5_txstartblock,
	output		o_txpipe5_txswing,
	output [3:0]	o_txpipe5_txsyncheader,
	output [2:0]	o_txpipe5_width,
	output		o_txpipe6_asyncpowerchangeack,
	output		o_txpipe6_blockaligncontrol,
	output		o_txpipe6_cfg_hw_auto_sp_dis,
	output		o_txpipe6_dirchange,
	output		o_txpipe6_ebuf_mode,
	output		o_txpipe6_encodedecodebypass,
	output [5:0]	o_txpipe6_fs,
	output		o_txpipe6_getlocalpresetcoefficients,
	output		o_txpipe6_invalidrequest,
	output [5:0]	o_txpipe6_lf,
	output [4:0]	o_txpipe6_localpresetindex,
	output [7:0]	o_txpipe6_m2p_bus,
	output [2:0]	o_txpipe6_pclk_rate,
	output		o_txpipe6_pclkchangeack,
	output [3:0]	o_txpipe6_powerdown,
	output [2:0]	o_txpipe6_rate,
	output		o_txpipe6_rxelecidle_disable_a,
	output		o_txpipe6_rxeqeval,
	output		o_txpipe6_rxeqinprogress,
	output		o_txpipe6_rxeqtraining,
	output		o_txpipe6_rxpolarity,
	output [2:0]	o_txpipe6_rxpresethint,
	output		o_txpipe6_rxstandby,
	output		o_txpipe6_rxtermination,
	output		o_txpipe6_srisenable,
	output		o_txpipe6_txcmnmode_disable_a,
	output		o_txpipe6_txcompliance,
	output [39:0]	o_txpipe6_txdata,
	output [3:0]	o_txpipe6_txdatak,
	output		o_txpipe6_txdatavalid,
	output [17:0]	o_txpipe6_txdeemph,
	output		o_txpipe6_txdtctrx_lb,
	output		o_txpipe6_txelecidle,
	output [2:0]	o_txpipe6_txmargin,
	output		o_txpipe6_txoneszeros,
	output [0:0]	o_txpipe6_txstartblock,
	output		o_txpipe6_txswing,
	output [3:0]	o_txpipe6_txsyncheader,
	output [2:0]	o_txpipe6_width,
	output		o_txpipe7_asyncpowerchangeack,
	output		o_txpipe7_blockaligncontrol,
	output		o_txpipe7_cfg_hw_auto_sp_dis,
	output		o_txpipe7_dirchange,
	output		o_txpipe7_ebuf_mode,
	output		o_txpipe7_encodedecodebypass,
	output [5:0]	o_txpipe7_fs,
	output		o_txpipe7_getlocalpresetcoefficients,
	output		o_txpipe7_invalidrequest,
	output [5:0]	o_txpipe7_lf,
	output [4:0]	o_txpipe7_localpresetindex,
	output [7:0]	o_txpipe7_m2p_bus,
	output [2:0]	o_txpipe7_pclk_rate,
	output		o_txpipe7_pclkchangeack,
	output [3:0]	o_txpipe7_powerdown,
	output [2:0]	o_txpipe7_rate,
	output		o_txpipe7_rxelecidle_disable_a,
	output		o_txpipe7_rxeqeval,
	output		o_txpipe7_rxeqinprogress,
	output		o_txpipe7_rxeqtraining,
	output		o_txpipe7_rxpolarity,
	output [2:0]	o_txpipe7_rxpresethint,
	output		o_txpipe7_rxstandby,
	output		o_txpipe7_rxtermination,
	output		o_txpipe7_srisenable,
	output		o_txpipe7_txcmnmode_disable_a,
	output		o_txpipe7_txcompliance,
	output [39:0]	o_txpipe7_txdata,
	output [3:0]	o_txpipe7_txdatak,
	output		o_txpipe7_txdatavalid,
	output [17:0]	o_txpipe7_txdeemph,
	output		o_txpipe7_txdtctrx_lb,
	output		o_txpipe7_txelecidle,
	output [2:0]	o_txpipe7_txmargin,
	output		o_txpipe7_txoneszeros,
	output [0:0]	o_txpipe7_txstartblock,
	output		o_txpipe7_txswing,
	output [3:0]	o_txpipe7_txsyncheader,
	output [2:0]	o_txpipe7_width,
	output		o_txpipe8_asyncpowerchangeack,
	output		o_txpipe8_blockaligncontrol,
	output		o_txpipe8_cfg_hw_auto_sp_dis,
	output		o_txpipe8_dirchange,
	output		o_txpipe8_ebuf_mode,
	output		o_txpipe8_encodedecodebypass,
	output [5:0]	o_txpipe8_fs,
	output		o_txpipe8_getlocalpresetcoefficients,
	output		o_txpipe8_invalidrequest,
	output [5:0]	o_txpipe8_lf,
	output [4:0]	o_txpipe8_localpresetindex,
	output [7:0]	o_txpipe8_m2p_bus,
	output [2:0]	o_txpipe8_pclk_rate,
	output		o_txpipe8_pclkchangeack,
	output [3:0]	o_txpipe8_powerdown,
	output [2:0]	o_txpipe8_rate,
	output		o_txpipe8_rxelecidle_disable_a,
	output		o_txpipe8_rxeqeval,
	output		o_txpipe8_rxeqinprogress,
	output		o_txpipe8_rxeqtraining,
	output		o_txpipe8_rxpolarity,
	output [2:0]	o_txpipe8_rxpresethint,
	output		o_txpipe8_rxstandby,
	output		o_txpipe8_rxtermination,
	output		o_txpipe8_srisenable,
	output		o_txpipe8_txcmnmode_disable_a,
	output		o_txpipe8_txcompliance,
	output [39:0]	o_txpipe8_txdata,
	output [3:0]	o_txpipe8_txdatak,
	output		o_txpipe8_txdatavalid,
	output [17:0]	o_txpipe8_txdeemph,
	output		o_txpipe8_txdtctrx_lb,
	output		o_txpipe8_txelecidle,
	output [2:0]	o_txpipe8_txmargin,
	output		o_txpipe8_txoneszeros,
	output [0:0]	o_txpipe8_txstartblock,
	output		o_txpipe8_txswing,
	output [3:0]	o_txpipe8_txsyncheader,
	output [2:0]	o_txpipe8_width,
	output		o_txpipe9_asyncpowerchangeack,
	output		o_txpipe9_blockaligncontrol,
	output		o_txpipe9_cfg_hw_auto_sp_dis,
	output		o_txpipe9_dirchange,
	output		o_txpipe9_ebuf_mode,
	output		o_txpipe9_encodedecodebypass,
	output [5:0]	o_txpipe9_fs,
	output		o_txpipe9_getlocalpresetcoefficients,
	output		o_txpipe9_invalidrequest,
	output [5:0]	o_txpipe9_lf,
	output [4:0]	o_txpipe9_localpresetindex,
	output [7:0]	o_txpipe9_m2p_bus,
	output [2:0]	o_txpipe9_pclk_rate,
	output		o_txpipe9_pclkchangeack,
	output [3:0]	o_txpipe9_powerdown,
	output [2:0]	o_txpipe9_rate,
	output		o_txpipe9_rxelecidle_disable_a,
	output		o_txpipe9_rxeqeval,
	output		o_txpipe9_rxeqinprogress,
	output		o_txpipe9_rxeqtraining,
	output		o_txpipe9_rxpolarity,
	output [2:0]	o_txpipe9_rxpresethint,
	output		o_txpipe9_rxstandby,
	output		o_txpipe9_rxtermination,
	output		o_txpipe9_srisenable,
	output		o_txpipe9_txcmnmode_disable_a,
	output		o_txpipe9_txcompliance,
	output [39:0]	o_txpipe9_txdata,
	output [3:0]	o_txpipe9_txdatak,
	output		o_txpipe9_txdatavalid,
	output [17:0]	o_txpipe9_txdeemph,
	output		o_txpipe9_txdtctrx_lb,
	output		o_txpipe9_txelecidle,
	output [2:0]	o_txpipe9_txmargin,
	output		o_txpipe9_txoneszeros,
	output [0:0]	o_txpipe9_txstartblock,
	output		o_txpipe9_txswing,
	output [3:0]	o_txpipe9_txsyncheader,
	output [2:0]	o_txpipe9_width,
	output		o_txpipe10_asyncpowerchangeack,
	output		o_txpipe10_blockaligncontrol,
	output		o_txpipe10_cfg_hw_auto_sp_dis,
	output		o_txpipe10_dirchange,
	output		o_txpipe10_ebuf_mode,
	output		o_txpipe10_encodedecodebypass,
	output [5:0]	o_txpipe10_fs,
	output		o_txpipe10_getlocalpresetcoefficients,
	output		o_txpipe10_invalidrequest,
	output [5:0]	o_txpipe10_lf,
	output [4:0]	o_txpipe10_localpresetindex,
	output [7:0]	o_txpipe10_m2p_bus,
	output [2:0]	o_txpipe10_pclk_rate,
	output		o_txpipe10_pclkchangeack,
	output [3:0]	o_txpipe10_powerdown,
	output [2:0]	o_txpipe10_rate,
	output		o_txpipe10_rxelecidle_disable_a,
	output		o_txpipe10_rxeqeval,
	output		o_txpipe10_rxeqinprogress,
	output		o_txpipe10_rxeqtraining,
	output		o_txpipe10_rxpolarity,
	output [2:0]	o_txpipe10_rxpresethint,
	output		o_txpipe10_rxstandby,
	output		o_txpipe10_rxtermination,
	output		o_txpipe10_srisenable,
	output		o_txpipe10_txcmnmode_disable_a,
	output		o_txpipe10_txcompliance,
	output [39:0]	o_txpipe10_txdata,
	output [3:0]	o_txpipe10_txdatak,
	output		o_txpipe10_txdatavalid,
	output [17:0]	o_txpipe10_txdeemph,
	output		o_txpipe10_txdtctrx_lb,
	output		o_txpipe10_txelecidle,
	output [2:0]	o_txpipe10_txmargin,
	output		o_txpipe10_txoneszeros,
	output [0:0]	o_txpipe10_txstartblock,
	output		o_txpipe10_txswing,
	output [3:0]	o_txpipe10_txsyncheader,
	output [2:0]	o_txpipe10_width,
	output		o_txpipe11_asyncpowerchangeack,
	output		o_txpipe11_blockaligncontrol,
	output		o_txpipe11_cfg_hw_auto_sp_dis,
	output		o_txpipe11_dirchange,
	output		o_txpipe11_ebuf_mode,
	output		o_txpipe11_encodedecodebypass,
	output [5:0]	o_txpipe11_fs,
	output		o_txpipe11_getlocalpresetcoefficients,
	output		o_txpipe11_invalidrequest,
	output [5:0]	o_txpipe11_lf,
	output [4:0]	o_txpipe11_localpresetindex,
	output [7:0]	o_txpipe11_m2p_bus,
	output [2:0]	o_txpipe11_pclk_rate,
	output		o_txpipe11_pclkchangeack,
	output [3:0]	o_txpipe11_powerdown,
	output [2:0]	o_txpipe11_rate,
	output		o_txpipe11_rxelecidle_disable_a,
	output		o_txpipe11_rxeqeval,
	output		o_txpipe11_rxeqinprogress,
	output		o_txpipe11_rxeqtraining,
	output		o_txpipe11_rxpolarity,
	output [2:0]	o_txpipe11_rxpresethint,
	output		o_txpipe11_rxstandby,
	output		o_txpipe11_rxtermination,
	output		o_txpipe11_srisenable,
	output		o_txpipe11_txcmnmode_disable_a,
	output		o_txpipe11_txcompliance,
	output [39:0]	o_txpipe11_txdata,
	output [3:0]	o_txpipe11_txdatak,
	output		o_txpipe11_txdatavalid,
	output [17:0]	o_txpipe11_txdeemph,
	output		o_txpipe11_txdtctrx_lb,
	output		o_txpipe11_txelecidle,
	output [2:0]	o_txpipe11_txmargin,
	output		o_txpipe11_txoneszeros,
	output [0:0]	o_txpipe11_txstartblock,
	output		o_txpipe11_txswing,
	output [3:0]	o_txpipe11_txsyncheader,
	output [2:0]	o_txpipe11_width,
	output		o_txpipe12_asyncpowerchangeack,
	output		o_txpipe12_blockaligncontrol,
	output		o_txpipe12_cfg_hw_auto_sp_dis,
	output		o_txpipe12_dirchange,
	output		o_txpipe12_ebuf_mode,
	output		o_txpipe12_encodedecodebypass,
	output [5:0]	o_txpipe12_fs,
	output		o_txpipe12_getlocalpresetcoefficients,
	output		o_txpipe12_invalidrequest,
	output [5:0]	o_txpipe12_lf,
	output [4:0]	o_txpipe12_localpresetindex,
	output [7:0]	o_txpipe12_m2p_bus,
	output [2:0]	o_txpipe12_pclk_rate,
	output		o_txpipe12_pclkchangeack,
	output [3:0]	o_txpipe12_powerdown,
	output [2:0]	o_txpipe12_rate,
	output		o_txpipe12_rxelecidle_disable_a,
	output		o_txpipe12_rxeqeval,
	output		o_txpipe12_rxeqinprogress,
	output		o_txpipe12_rxeqtraining,
	output		o_txpipe12_rxpolarity,
	output [2:0]	o_txpipe12_rxpresethint,
	output		o_txpipe12_rxstandby,
	output		o_txpipe12_rxtermination,
	output		o_txpipe12_srisenable,
	output		o_txpipe12_txcmnmode_disable_a,
	output		o_txpipe12_txcompliance,
	output [39:0]	o_txpipe12_txdata,
	output [3:0]	o_txpipe12_txdatak,
	output		o_txpipe12_txdatavalid,
	output [17:0]	o_txpipe12_txdeemph,
	output		o_txpipe12_txdtctrx_lb,
	output		o_txpipe12_txelecidle,
	output [2:0]	o_txpipe12_txmargin,
	output		o_txpipe12_txoneszeros,
	output [0:0]	o_txpipe12_txstartblock,
	output		o_txpipe12_txswing,
	output [3:0]	o_txpipe12_txsyncheader,
	output [2:0]	o_txpipe12_width,
	output		o_txpipe13_asyncpowerchangeack,
	output		o_txpipe13_blockaligncontrol,
	output		o_txpipe13_cfg_hw_auto_sp_dis,
	output		o_txpipe13_dirchange,
	output		o_txpipe13_ebuf_mode,
	output		o_txpipe13_encodedecodebypass,
	output [5:0]	o_txpipe13_fs,
	output		o_txpipe13_getlocalpresetcoefficients,
	output		o_txpipe13_invalidrequest,
	output [5:0]	o_txpipe13_lf,
	output [4:0]	o_txpipe13_localpresetindex,
	output [7:0]	o_txpipe13_m2p_bus,
	output [2:0]	o_txpipe13_pclk_rate,
	output		o_txpipe13_pclkchangeack,
	output [3:0]	o_txpipe13_powerdown,
	output [2:0]	o_txpipe13_rate,
	output		o_txpipe13_rxelecidle_disable_a,
	output		o_txpipe13_rxeqeval,
	output		o_txpipe13_rxeqinprogress,
	output		o_txpipe13_rxeqtraining,
	output		o_txpipe13_rxpolarity,
	output [2:0]	o_txpipe13_rxpresethint,
	output		o_txpipe13_rxstandby,
	output		o_txpipe13_rxtermination,
	output		o_txpipe13_srisenable,
	output		o_txpipe13_txcmnmode_disable_a,
	output		o_txpipe13_txcompliance,
	output [39:0]	o_txpipe13_txdata,
	output [3:0]	o_txpipe13_txdatak,
	output		o_txpipe13_txdatavalid,
	output [17:0]	o_txpipe13_txdeemph,
	output		o_txpipe13_txdtctrx_lb,
	output		o_txpipe13_txelecidle,
	output [2:0]	o_txpipe13_txmargin,
	output		o_txpipe13_txoneszeros,
	output [0:0]	o_txpipe13_txstartblock,
	output		o_txpipe13_txswing,
	output [3:0]	o_txpipe13_txsyncheader,
	output [2:0]	o_txpipe13_width,
	output		o_txpipe14_asyncpowerchangeack,
	output		o_txpipe14_blockaligncontrol,
	output		o_txpipe14_cfg_hw_auto_sp_dis,
	output		o_txpipe14_dirchange,
	output		o_txpipe14_ebuf_mode,
	output		o_txpipe14_encodedecodebypass,
	output [5:0]	o_txpipe14_fs,
	output		o_txpipe14_getlocalpresetcoefficients,
	output		o_txpipe14_invalidrequest,
	output [5:0]	o_txpipe14_lf,
	output [4:0]	o_txpipe14_localpresetindex,
	output [7:0]	o_txpipe14_m2p_bus,
	output [2:0]	o_txpipe14_pclk_rate,
	output		o_txpipe14_pclkchangeack,
	output [3:0]	o_txpipe14_powerdown,
	output [2:0]	o_txpipe14_rate,
	output		o_txpipe14_rxelecidle_disable_a,
	output		o_txpipe14_rxeqeval,
	output		o_txpipe14_rxeqinprogress,
	output		o_txpipe14_rxeqtraining,
	output		o_txpipe14_rxpolarity,
	output [2:0]	o_txpipe14_rxpresethint,
	output		o_txpipe14_rxstandby,
	output		o_txpipe14_rxtermination,
	output		o_txpipe14_srisenable,
	output		o_txpipe14_txcmnmode_disable_a,
	output		o_txpipe14_txcompliance,
	output [39:0]	o_txpipe14_txdata,
	output [3:0]	o_txpipe14_txdatak,
	output		o_txpipe14_txdatavalid,
	output [17:0]	o_txpipe14_txdeemph,
	output		o_txpipe14_txdtctrx_lb,
	output		o_txpipe14_txelecidle,
	output [2:0]	o_txpipe14_txmargin,
	output		o_txpipe14_txoneszeros,
	output [0:0]	o_txpipe14_txstartblock,
	output		o_txpipe14_txswing,
	output [3:0]	o_txpipe14_txsyncheader,
	output [2:0]	o_txpipe14_width,
	output		o_txpipe15_asyncpowerchangeack,
	output		o_txpipe15_blockaligncontrol,
	output		o_txpipe15_cfg_hw_auto_sp_dis,
	output		o_txpipe15_dirchange,
	output		o_txpipe15_ebuf_mode,
	output		o_txpipe15_encodedecodebypass,
	output [5:0]	o_txpipe15_fs,
	output		o_txpipe15_getlocalpresetcoefficients,
	output		o_txpipe15_invalidrequest,
	output [5:0]	o_txpipe15_lf,
	output [4:0]	o_txpipe15_localpresetindex,
	output [7:0]	o_txpipe15_m2p_bus,
	output [2:0]	o_txpipe15_pclk_rate,
	output		o_txpipe15_pclkchangeack,
	output [3:0]	o_txpipe15_powerdown,
	output [2:0]	o_txpipe15_rate,
	output		o_txpipe15_rxelecidle_disable_a,
	output		o_txpipe15_rxeqeval,
	output		o_txpipe15_rxeqinprogress,
	output		o_txpipe15_rxeqtraining,
	output		o_txpipe15_rxpolarity,
	output [2:0]	o_txpipe15_rxpresethint,
	output		o_txpipe15_rxstandby,
	output		o_txpipe15_rxtermination,
	output		o_txpipe15_srisenable,
	output		o_txpipe15_txcmnmode_disable_a,
	output		o_txpipe15_txcompliance,
	output [39:0]	o_txpipe15_txdata,
	output [3:0]	o_txpipe15_txdatak,
	output		o_txpipe15_txdatavalid,
	output [17:0]	o_txpipe15_txdeemph,
	output		o_txpipe15_txdtctrx_lb,
	output		o_txpipe15_txelecidle,
	output [2:0]	o_txpipe15_txmargin,
	output		o_txpipe15_txoneszeros,
	output [0:0]	o_txpipe15_txstartblock,
	output		o_txpipe15_txswing,
	output [3:0]	o_txpipe15_txsyncheader,
	output [2:0]	o_txpipe15_width,
	input		i_pclk_x4_l4,
	input		i_pclk_x4_l12,
	input		i_pclk_x8_l8,
	input		i_pclk_x16_l0,

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
   input	fastp_pcie_phy_mac_rx15_clk_i

   );
  
 `define BAR_SIZE_LOCALPARAM(PF_INDEX) localparam  core16_pf``PF_INDEX``_clog2_bar0_size             = core16_pf``PF_INDEX``_bar0_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar1_size             = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_bar0_type == "pf``PF_INDEX``_bar0_mem64")? core16_pf``PF_INDEX``_bar0_address_width_hwtcl : core16_pf``PF_INDEX``_bar1_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar2_size             = core16_pf``PF_INDEX``_bar2_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar3_size             = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_bar2_type == "pf``PF_INDEX``_bar2_mem64")? core16_pf``PF_INDEX``_bar2_address_width_hwtcl : core16_pf``PF_INDEX``_bar3_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar4_size             = core16_pf``PF_INDEX``_bar4_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar5_size             = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_bar4_type == "pf``PF_INDEX``_bar4_mem64")? core16_pf``PF_INDEX``_bar4_address_width_hwtcl : core16_pf``PF_INDEX``_bar5_address_width_hwtcl;localparam  core16_pf``PF_INDEX``_clog2_bar7_size             = core16_pf``PF_INDEX``_expansion_base_address_register_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar0_size    = core16_pf``PF_INDEX``_sriov_vf_bar0_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar1_size    = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_sriov_vf_bar0_type_r == "pf``PF_INDEX``_sriov_vf_bar0_mem64")? core16_pf``PF_INDEX``_sriov_vf_bar0_address_width_int_hwtcl : core16_pf``PF_INDEX``_sriov_vf_bar1_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar2_size    = core16_pf``PF_INDEX``_sriov_vf_bar2_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar3_size    = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_sriov_vf_bar2_type_r == "pf``PF_INDEX``_sriov_vf_bar2_mem64")? core16_pf``PF_INDEX``_sriov_vf_bar2_address_width_int_hwtcl : core16_pf``PF_INDEX``_sriov_vf_bar3_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar4_size    = core16_pf``PF_INDEX``_sriov_vf_bar4_address_width_int_hwtcl;localparam  core16_pf``PF_INDEX``_sriov_vf_clog2_bar5_size    = (hssi_ctp_u_wrpcie_top_u_core16_pf``PF_INDEX``_sriov_vf_bar4_type_r == "pf``PF_INDEX``_sriov_vf_bar4_mem64")? core16_pf``PF_INDEX``_sriov_vf_bar4_address_width_int_hwtcl : core16_pf``PF_INDEX``_sriov_vf_bar5_address_width_int_hwtcl;localparam  core8_pf``PF_INDEX``_clog2_bar0_size              = core8_pf``PF_INDEX``_bar0_address_width_hwtcl;localparam  core8_pf``PF_INDEX``_clog2_bar1_size              = (hssi_ctp_u_wrpcie_top_u_core8_pf``PF_INDEX``_bar0_type == "pf``PF_INDEX``_bar0_mem64")? core8_pf``PF_INDEX``_bar0_address_width_hwtcl : core8_pf``PF_INDEX``_bar1_address_width_hwtcl;localparam  core8_pf``PF_INDEX``_clog2_bar2_size              = core8_pf``PF_INDEX``_bar2_address_width_hwtcl;localparam  core8_pf``PF_INDEX``_clog2_bar3_size              = (hssi_ctp_u_wrpcie_top_u_core8_pf``PF_INDEX``_bar2_type == "pf``PF_INDEX``_bar2_mem64")? core8_pf``PF_INDEX``_bar2_address_width_hwtcl : core8_pf``PF_INDEX``_bar3_address_width_hwtcl;localparam  core8_pf``PF_INDEX``_clog2_bar4_size              = core8_pf``PF_INDEX``_bar4_address_width_hwtcl;localparam  core8_pf``PF_INDEX``_clog2_bar5_size              = (hssi_ctp_u_wrpcie_top_u_core8_pf``PF_INDEX``_bar4_type == "pf``PF_INDEX``_bar4_mem64")? core8_pf``PF_INDEX``_bar4_address_width_hwtcl : core8_pf``PF_INDEX``_bar5_address_width_hwtcl;localparam  core8_pf``PF_INDEX``_clog2_bar7_size             = core8_pf``PF_INDEX``_expansion_base_address_register_hwtcl;localparam  core8_pf``PF_INDEX``_sriov_vf_clog2_bar0_size     = core8_pf``PF_INDEX``_sriov_vf_bar0_address_width_int_hwtcl;localparam  core8_pf``PF_INDEX``_sriov_vf_clog2_bar1_size     = (hssi_ctp_u_wrpcie_top_u_core8_pf``PF_INDEX``_sriov_vf_bar0_type_r == "pf``PF_INDEX``_sriov_vf_bar0_mem64")? core8_pf``PF_INDEX``_sriov_vf_bar0_address_width_int_hwtcl : core8_pf``PF_INDEX``_sriov_vf_bar1_address_width_int_hwtcl;localparam  core8_pf``PF_INDEX``_sriov_vf_clog2_bar2_size     = core8_pf``PF_INDEX``_sriov_vf_bar2_address_width_int_hwtcl;localparam  core8_pf``PF_INDEX``_sriov_vf_clog2_bar3_size     = (hssi_ctp_u_wrpcie_top_u_core8_pf``PF_INDEX``_sriov_vf_bar2_type_r == "pf``PF_INDEX``_sriov_vf_bar2_mem64")? core8_pf``PF_INDEX``_sriov_vf_bar2_address_width_int_hwtcl : core8_pf``PF_INDEX``_sriov_vf_bar3_address_width_int_hwtcl;localparam  core8_pf``PF_INDEX``_sriov_vf_clog2_bar4_size     = core8_pf``PF_INDEX``_sriov_vf_bar4_address_width_int_hwtcl;localparam  core8_pf``PF_INDEX``_sriov_vf_clog2_bar5_size     = (hssi_ctp_u_wrpcie_top_u_core8_pf``PF_INDEX``_sriov_vf_bar4_type_r == "pf``PF_INDEX``_sriov_vf_bar4_mem64")? core8_pf``PF_INDEX``_sriov_vf_bar4_address_width_int_hwtcl : core8_pf``PF_INDEX``_sriov_vf_bar5_address_width_int_hwtcl;
  `BAR_SIZE_LOCALPARAM(0)
  `BAR_SIZE_LOCALPARAM(1)
  `BAR_SIZE_LOCALPARAM(2)
  `BAR_SIZE_LOCALPARAM(3)
  `BAR_SIZE_LOCALPARAM(4)
  `BAR_SIZE_LOCALPARAM(5)
  `BAR_SIZE_LOCALPARAM(6)
  `BAR_SIZE_LOCALPARAM(7)

  localparam SS_PWIDTH = 32; 


  wire                                   pli_avmm_master_write = 0;
  wire                                   pli_avmm_master_read = 0;
  wire [23:0]                            pli_avmm_master_address = 0;
  wire [31:0]                            pli_avmm_master_writedata = 0;
  wire [31:0]                            pli_avmm_master_readdata;
  wire                                   pli_avmm_master_readdatavalid;
  wire                                   pli_avmm_master_waitrequest;
/*
   logic [core16_NUM_OF_SEG-1:0]                             p0_app_ss_st_tx_tuser_last_segment;
   logic [core8_NUM_OF_SEG-1:0]                             p1_app_ss_st_tx_tuser_last_segment;
   logic [core4_0_NUM_OF_SEG-1:0]                            p2_app_ss_st_tx_tuser_last_segment;
   logic [core4_1_NUM_OF_SEG-1:0]                            p3_app_ss_st_tx_tuser_last_segment;
   logic [core16_NUM_OF_SEG-1:0]                            p0_ss_app_st_rx_tuser_last_segment;
   logic [core8_NUM_OF_SEG-1:0]                            p1_ss_app_st_rx_tuser_last_segment;
   logic [core4_0_NUM_OF_SEG-1:0]                            p2_ss_app_st_rx_tuser_last_segment;
   logic [core4_1_NUM_OF_SEG-1:0]                            p3_ss_app_st_rx_tuser_last_segment;
*/
  wire                                   p0_dtk_hip_reconfig_clk;
  wire                                   p1_dtk_hip_reconfig_clk;
  wire                                   p2_dtk_hip_reconfig_clk;
  wire                                   p3_dtk_hip_reconfig_clk;

  wire                                             pciess_reconfig_clk;
  wire [20:0]                                      pciess_reconfig_address;
  wire                                             pciess_reconfig_waitrequest;
  wire                                             pciess_reconfig_read;
  wire [7:0]                                       pciess_reconfig_readdata;
  wire                                             pciess_reconfig_readdatavalid;
  wire                                             pciess_reconfig_write;
  wire [7:0]                                       pciess_reconfig_writedata; 
  
  wire [18:0]                                      p0_dbg_lite_csr_awaddr;
  wire                                             p0_dbg_lite_csr_awvalid;
  wire                                             p0_dbg_lite_csr_awready;
  wire [31:0]                                      p0_dbg_lite_csr_wdata;
  wire [3:0]                                       p0_dbg_lite_csr_wstrb;
  wire                                             p0_dbg_lite_csr_wvalid;
  wire                                             p0_dbg_lite_csr_wready;
  wire [1:0]                                       p0_dbg_lite_csr_bresp;
  wire                                             p0_dbg_lite_csr_bvalid;
  wire                                             p0_dbg_lite_csr_bready;
  wire [18:0]                                      p0_dbg_lite_csr_araddr;
  wire                                             p0_dbg_lite_csr_arvalid;
  wire                                             p0_dbg_lite_csr_arready;
  wire [31:0]                                      p0_dbg_lite_csr_rdata;
  wire [1:0]                                       p0_dbg_lite_csr_rresp;
  wire                                             p0_dbg_lite_csr_rvalid;
  wire                                             p0_dbg_lite_csr_rready;

  wire [18:0]                                      p1_dbg_lite_csr_awaddr;
  wire                                             p1_dbg_lite_csr_awvalid;
  wire                                             p1_dbg_lite_csr_awready;
  wire [31:0]                                      p1_dbg_lite_csr_wdata;
  wire [3:0]                                       p1_dbg_lite_csr_wstrb;
  wire                                             p1_dbg_lite_csr_wvalid;
  wire                                             p1_dbg_lite_csr_wready;
  wire [1:0]                                       p1_dbg_lite_csr_bresp;
  wire                                             p1_dbg_lite_csr_bvalid;
  wire                                             p1_dbg_lite_csr_bready;
  wire [18:0]                                      p1_dbg_lite_csr_araddr;
  wire                                             p1_dbg_lite_csr_arvalid;
  wire                                             p1_dbg_lite_csr_arready;
  wire [31:0]                                      p1_dbg_lite_csr_rdata;
  wire [1:0]                                       p1_dbg_lite_csr_rresp;
  wire                                             p1_dbg_lite_csr_rvalid;
  wire                                             p1_dbg_lite_csr_rready;

  wire [18:0]                                      p2_dbg_lite_csr_awaddr;
  wire                                             p2_dbg_lite_csr_awvalid;
  wire                                             p2_dbg_lite_csr_awready;
  wire [31:0]                                      p2_dbg_lite_csr_wdata;
  wire [3:0]                                       p2_dbg_lite_csr_wstrb;
  wire                                             p2_dbg_lite_csr_wvalid;
  wire                                             p2_dbg_lite_csr_wready;
  wire [1:0]                                       p2_dbg_lite_csr_bresp;
  wire                                             p2_dbg_lite_csr_bvalid;
  wire                                             p2_dbg_lite_csr_bready;
  wire [18:0]                                      p2_dbg_lite_csr_araddr;
  wire                                             p2_dbg_lite_csr_arvalid;
  wire                                             p2_dbg_lite_csr_arready;
  wire [31:0]                                      p2_dbg_lite_csr_rdata;
  wire [1:0]                                       p2_dbg_lite_cscsrresp;
  wire                                             p2_dbg_lite_csr_rvalid;
  wire                                             p2_dbg_lite_csr_rready;

  wire [18:0]                                      p3_dbg_lite_csr_awaddr;
  wire                                             p3_dbg_lite_csr_awvalid;
  wire                                             p3_dbg_lite_csr_awready;
  wire [31:0]                                      p3_dbg_lite_csr_wdata;
  wire [3:0]                                       p3_dbg_lite_csr_wstrb;
  wire                                             p3_dbg_lite_csr_wvalid;
  wire                                             p3_dbg_lite_csc_wready;
  wire [1:0]                                       p3_dbg_lite_csr_bresp;
  wire                                             p3_dbg_lite_csr_bvalid;
  wire                                             p3_dbg_lite_csr_bready;
  wire [18:0]                                      p3_dbg_lite_csr_araddr;
  wire                                             p3_dbg_lite_csr_arvalid;
  wire                                             p3_dbg_lite_csr_arready;
  wire [31:0]                                      p3_dbg_lite_csr_rdata;
  wire [1:0]                                       p3_dbg_lite_csr_rresp;
  wire                                             p3_dbg_lite_csr_rvalid;
  wire                                             p3_dbg_lite_csr_rready;

  wire [core16_LiteSlvAWD-1:0]                     p0_lite_csr_awaddr;
  wire                                             p0_lite_csr_awvalid;
  wire                                             p0_lite_csr_awready;
  wire [core16_LiteSlvDWD-1:0]                     p0_lite_csr_wdata;
  wire [core16_LiteSlvDWD/8-1:0]                   p0_lite_csr_wstrb;
  wire                                             p0_lite_csr_wvalid;
  wire                                             p0_lite_csr_wready;
  wire [1:0]                                       p0_lite_csr_bresp;
  wire                                             p0_lite_csr_bvalid;
  wire                                             p0_lite_csr_bready;
  wire [core16_LiteSlvAWD-1:0]                     p0_lite_csr_araddr;
  wire                                             p0_lite_csr_arvalid;
  wire                                             p0_lite_csr_arready;
  wire [core16_LiteSlvDWD-1:0]                     p0_lite_csr_rdata;
  wire [1:0]                                       p0_lite_csr_rresp;
  wire                                             p0_lite_csr_rvalid;
  wire                                             p0_lite_csr_rready;

  wire [core8_LiteSlvAWD-1:0]                      p1_lite_csr_awaddr;
  wire                                             p1_lite_csr_awvalid;
  wire                                             p1_lite_csr_awready;
  wire [core8_LiteSlvDWD-1:0]                      p1_lite_csr_wdata;
  wire [core8_LiteSlvDWD/8-1:0]                    p1_lite_csr_wstrb;
  wire                                             p1_lite_csr_wvalid;
  wire                                             p1_lite_csr_wready;
  wire [1:0]                                       p1_lite_csr_bresp;
  wire                                             p1_lite_csr_bvalid;
  wire                                             p1_lite_csr_bready;
  wire [core8_LiteSlvAWD-1:0]                      p1_lite_csr_araddr;
  wire                                             p1_lite_csr_arvalid;
  wire                                             p1_lite_csr_arready;
  wire [core8_LiteSlvDWD-1:0]                      p1_lite_csr_rdata;
  wire [1:0]                                       p1_lite_csr_rresp;
  wire                                             p1_lite_csr_rvalid;
  wire                                             p1_lite_csr_rready;

  wire [core4_0_LiteSlvAWD-1:0]                    p2_lite_csr_awaddr;
  wire                                             p2_lite_csr_awvalid;
  wire                                             p2_lite_csr_awready;
  wire [core4_0_LiteSlvDWD-1:0]                    p2_lite_csr_wdata;
  wire [core4_0_LiteSlvDWD/8-1:0]                  p2_lite_csr_wstrb;
  wire                                             p2_lite_csr_wvalid;
  wire                                             p2_lite_csr_wready;
  wire [1:0]                                       p2_lite_csr_bresp;
  wire                                             p2_lite_csr_bvalid;
  wire                                             p2_lite_csr_bready;
  wire [core4_0_LiteSlvAWD-1:0]                    p2_lite_csr_araddr;
  wire                                             p2_lite_csr_arvalid;
  wire                                             p2_lite_csr_arready;
  wire [core4_0_LiteSlvDWD-1:0]                    p2_lite_csr_rdata;
  wire [1:0]                                       p2_lite_csr_rresp;
  wire                                             p2_lite_csr_rvalid;
  wire                                             p2_lite_csr_rready;

  wire [core4_1_LiteSlvAWD-1:0]                    p3_lite_csr_awaddr;
  wire                                             p3_lite_csr_awvalid;
  wire                                             p3_lite_csr_awready;
  wire [core4_1_LiteSlvDWD-1:0]                    p3_lite_csr_wdata;
  wire [core4_1_LiteSlvDWD/8-1:0]                  p3_lite_csr_wstrb;
  wire                                             p3_lite_csr_wvalid;
  wire                                             p3_lite_csr_wready;
  wire [1:0]                                       p3_lite_csr_bresp;
  wire                                             p3_lite_csr_bvalid;
  wire                                             p3_lite_csr_bready;
  wire [core4_1_LiteSlvAWD-1:0]                    p3_lite_csr_araddr;
  wire                                             p3_lite_csr_arvalid;
  wire                                             p3_lite_csr_arready;
  wire [core4_1_LiteSlvDWD-1:0]                    p3_lite_csr_rdata;
  wire [1:0]                                       p3_lite_csr_rresp;
  wire                                             p3_lite_csr_rvalid;
  wire                                             p3_lite_csr_rready;

  wire                                             p0_warm_rst_coreclk_n;
  wire                                             p1_warm_rst_coreclk_n;
  wire                                             p2_warm_rst_coreclk_n;
  wire                                             p3_warm_rst_coreclk_n;
  wire                                             p0_warm_rst_stclk_n;
  wire                                             p1_warm_rst_stclk_n;
  wire                                             p2_warm_rst_stclk_n;
  wire                                             p3_warm_rst_stclk_n;
  wire                                             p0_ss_app_serr_sync;
  wire                                             p1_ss_app_serr_sync;
  wire                                             p2_ss_app_serr_sync;
  wire                                             p3_ss_app_serr_sync;
  wire                                             p0_ss_app_linkup_sync;
  wire                                             p1_ss_app_linkup_sync;
  wire                                             p2_ss_app_linkup_sync;
  wire                                             p3_ss_app_linkup_sync;
  wire                                             p0_ss_app_dlup_sync;
  wire                                             p1_ss_app_dlup_sync;
  wire                                             p2_ss_app_dlup_sync;
  wire                                             p3_ss_app_dlup_sync;

  wire                                             p0_ss_app_surprise_down_err_sync;
  wire                                             p1_ss_app_surprise_down_err_sync;
  wire                                             p2_ss_app_surprise_down_err_sync;
  wire                                             p3_ss_app_surprise_down_err_sync;
  wire [5:0]                                       p0_ss_app_ltssmstate_sync;
  wire [5:0]                                       p1_ss_app_ltssmstate_sync;
  wire [5:0]                                       p2_ss_app_ltssmstate_sync;
  wire [5:0]                                       p3_ss_app_ltssmstate_sync;
  wire                                             p0_ss_app_rx_par_err_sync;
  wire                                             p1_ss_app_rx_par_err_sync;
  wire                                             p2_ss_app_rx_par_err_sync;
  wire                                             p3_ss_app_rx_par_err_sync;
  wire                                             p0_ss_app_tx_par_err_sync;
  wire                                             p1_ss_app_tx_par_err_sync;
  wire                                             p2_ss_app_tx_par_err_sync;
  wire                                             p3_ss_app_tx_par_err_sync;
  wire                                             p0_ss_app_int_status_sync;
  wire                                             p1_ss_app_int_status_sync;

  wire                                             coreclkout_hip;
  wire 											   slow_clk; 
  logic                                            pin_perst_n_o;
  wire p0_coreclkout_hip_i ;
  wire p1_coreclkout_hip_i ;
  wire p2_coreclkout_hip_i ;
  wire p3_coreclkout_hip_i ;
  wire p0_reset_status_n_i ;
  wire p1_reset_status_n_i ;
  wire p2_reset_status_n_i ;
  wire p3_reset_status_n_i ;

  assign p0_coreclkout_hip_i = coreclkout_hip;
  assign p1_coreclkout_hip_i = coreclkout_hip;
  assign p2_coreclkout_hip_i = coreclkout_hip;
  assign p3_coreclkout_hip_i = coreclkout_hip;

  assign p0_pin_perst_n = pin_perst_n_o;
  assign p1_pin_perst_n = pin_perst_n_o;
  assign p2_pin_perst_n = pin_perst_n_o;
  assign p3_pin_perst_n = pin_perst_n_o;

  assign p0_reset_status_n_i = p0_reset_status_n;
  assign p1_reset_status_n_i = p1_reset_status_n;
  assign p2_reset_status_n_i = p2_reset_status_n;
  assign p3_reset_status_n_i = p3_reset_status_n;

  /*
  assign p0_app_ss_st_tx_tuser_last_segment = {p0_app_ss_st_tx_tuser.last_segment7, p0_app_ss_st_tx_tuser.last_segment6, p0_app_ss_st_tx_tuser.last_segment5,
                                               p0_app_ss_st_tx_tuser.last_segment4, p0_app_ss_st_tx_tuser.last_segment3, p0_app_ss_st_tx_tuser.last_segment2,
                                               p0_app_ss_st_tx_tuser.last_segment1, p0_app_ss_st_tx_tuser.last_segment0};
  assign p1_app_ss_st_tx_tuser_last_segment = {p1_app_ss_st_tx_tuser.last_segment7, p1_app_ss_st_tx_tuser.last_segment6, p1_app_ss_st_tx_tuser.last_segment5,
                                               p1_app_ss_st_tx_tuser.last_segment4, p1_app_ss_st_tx_tuser.last_segment3, p1_app_ss_st_tx_tuser.last_segment2,
                                               p1_app_ss_st_tx_tuser.last_segment1, p1_app_ss_st_tx_tuser.last_segment0};
  assign p2_app_ss_st_tx_tuser_last_segment = {p2_app_ss_st_tx_tuser.last_segment7, p2_app_ss_st_tx_tuser.last_segment6, p2_app_ss_st_tx_tuser.last_segment5,
                                               p2_app_ss_st_tx_tuser.last_segment4, p2_app_ss_st_tx_tuser.last_segment3, p2_app_ss_st_tx_tuser.last_segment2,
                                               p2_app_ss_st_tx_tuser.last_segment1, p2_app_ss_st_tx_tuser.last_segment0};
  assign p3_app_ss_st_tx_tuser_last_segment = {p3_app_ss_st_tx_tuser.last_segment7, p3_app_ss_st_tx_tuser.last_segment6, p3_app_ss_st_tx_tuser.last_segment5,
                                               p3_app_ss_st_tx_tuser.last_segment4, p3_app_ss_st_tx_tuser.last_segment3, p3_app_ss_st_tx_tuser.last_segment2,
                                               p3_app_ss_st_tx_tuser.last_segment1, p3_app_ss_st_tx_tuser.last_segment0};

  assign {p0_ss_app_st_rx_tuser.last_segment7, p0_ss_app_st_rx_tuser.last_segment6, p0_ss_app_st_rx_tuser.last_segment5,
          p0_ss_app_st_rx_tuser.last_segment4, p0_ss_app_st_rx_tuser.last_segment3, p0_ss_app_st_rx_tuser.last_segment2,
          p0_ss_app_st_rx_tuser.last_segment1, p0_ss_app_st_rx_tuser.last_segment0}                                       = p0_ss_app_st_rx_tuser_last_segment;
  assign {p1_ss_app_st_rx_tuser.last_segment7, p1_ss_app_st_rx_tuser.last_segment6, p1_ss_app_st_rx_tuser.last_segment5,
          p1_ss_app_st_rx_tuser.last_segment4, p1_ss_app_st_rx_tuser.last_segment3, p1_ss_app_st_rx_tuser.last_segment2,
          p1_ss_app_st_rx_tuser.last_segment1, p1_ss_app_st_rx_tuser.last_segment0}                                       = p1_ss_app_st_rx_tuser_last_segment;
  assign {p2_ss_app_st_rx_tuser.last_segment7, p2_ss_app_st_rx_tuser.last_segment6, p2_ss_app_st_rx_tuser.last_segment5,
          p2_ss_app_st_rx_tuser.last_segment4, p2_ss_app_st_rx_tuser.last_segment3, p2_ss_app_st_rx_tuser.last_segment2,
          p2_ss_app_st_rx_tuser.last_segment1, p2_ss_app_st_rx_tuser.last_segment0}                                       = p2_ss_app_st_rx_tuser_last_segment;
  assign {p3_ss_app_st_rx_tuser.last_segment7, p3_ss_app_st_rx_tuser.last_segment6, p3_ss_app_st_rx_tuser.last_segment5,
          p3_ss_app_st_rx_tuser.last_segment4, p3_ss_app_st_rx_tuser.last_segment3, p3_ss_app_st_rx_tuser.last_segment2,
          p3_ss_app_st_rx_tuser.last_segment1, p3_ss_app_st_rx_tuser.last_segment0}                                       = p3_ss_app_st_rx_tuser_last_segment;

*/
  generate
  if (rtile_debug_toolkit_hwtcl == 1) begin : gen_avmm2axilite
    avmm2axi4lite u_avmm2axi4lite (
    .reset                                              (ninit_done),
    .clk                                                (pciess_reconfig_clk),

    .avm_address                                        (pciess_reconfig_address), 
    .avm_waitrequest                                    (pciess_reconfig_waitrequest),
    .avm_read                                           (pciess_reconfig_read),
    .avm_readdata                                       (pciess_reconfig_readdata),
    .avm_readdatavalid                                  (pciess_reconfig_readdatavalid),
    .avm_write                                          (pciess_reconfig_write),
    .avm_writedata                                      (pciess_reconfig_writedata),

    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awaddr  (p0_dbg_lite_csr_awaddr), 
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awprot  (),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awvalid (p0_dbg_lite_csr_awvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_awready (p0_dbg_lite_csr_awready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wdata   (p0_dbg_lite_csr_wdata),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wstrb   (p0_dbg_lite_csr_wstrb),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wvalid  (p0_dbg_lite_csr_wvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_wready  (p0_dbg_lite_csr_wready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_bresp   (p0_dbg_lite_csr_bresp),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_bvalid  (p0_dbg_lite_csr_bvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_bready  (p0_dbg_lite_csr_bready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_araddr  (p0_dbg_lite_csr_araddr),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_arprot  (),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_arvalid (p0_dbg_lite_csr_arvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_arready (p0_dbg_lite_csr_arready),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rdata   (p0_dbg_lite_csr_rdata),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rresp   (p0_dbg_lite_csr_rresp),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rvalid  (p0_dbg_lite_csr_rvalid),
    .mgc_axi4lite_slave_0_altera_axi4lite_slave_rready  (p0_dbg_lite_csr_rready),
  
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_awaddr  (p1_dbg_lite_csr_awaddr),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_awprot  (),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_awvalid (p1_dbg_lite_csr_awvalid),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_awready (p1_dbg_lite_csr_awready),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_wdata   (p1_dbg_lite_csr_wdata),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_wstrb   (p1_dbg_lite_csr_wstrb),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_wvalid  (p1_dbg_lite_csr_wvalid),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_wready  (p1_dbg_lite_csr_wready),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_bresp   (p1_dbg_lite_csr_bresp),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_bvalid  (p1_dbg_lite_csr_bvalid),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_bready  (p1_dbg_lite_csr_bready),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_araddr  (p1_dbg_lite_csr_araddr),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_arprot  (),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_arvalid (p1_dbg_lite_csr_arvalid),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_arready (p1_dbg_lite_csr_arready),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_rdata   (p1_dbg_lite_csr_rdata),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_rresp   (p1_dbg_lite_csr_rresp),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_rvalid  (p1_dbg_lite_csr_rvalid),
    .mgc_axi4lite_slave_1_altera_axi4lite_slave_rready  (p1_dbg_lite_csr_rready),
  
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_awaddr  (p2_dbg_lite_csr_awaddr),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_awprot  (),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_awvalid (p2_dbg_lite_csr_awvalid),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_awready (p2_dbg_lite_csr_awready),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_wdata   (p2_dbg_lite_csr_wdata),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_wstrb   (p2_dbg_lite_csr_wstrb),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_wvalid  (p2_dbg_lite_csr_wvalid),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_wready  (p2_dbg_lite_csr_wready),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_bresp   (p2_dbg_lite_csr_bresp),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_bvalid  (p2_dbg_lite_csr_bvalid),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_bready  (p2_dbg_lite_csr_bready),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_araddr  (p2_dbg_lite_csr_araddr),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_arprot  (),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_arvalid (p2_dbg_lite_csr_arvalid),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_arready (p2_dbg_lite_csr_arready),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_rdata   (p2_dbg_lite_csr_rdata),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_rresp   (p2_dbg_lite_csr_rresp),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_rvalid  (p2_dbg_lite_csr_rvalid),
    .mgc_axi4lite_slave_2_altera_axi4lite_slave_rready  (p2_dbg_lite_csr_rready),
  
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_awaddr  (p3_dbg_lite_csr_awaddr),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_awprot  (),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_awvalid (p3_dbg_lite_csr_awvalid),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_awready (p3_dbg_lite_csr_awready),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_wdata   (p3_dbg_lite_csr_wdata),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_wstrb   (p3_dbg_lite_csr_wstrb),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_wvalid  (p3_dbg_lite_csr_wvalid),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_wready  (p3_dbg_lite_csr_wready),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_bresp   (p3_dbg_lite_csr_bresp),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_bvalid  (p3_dbg_lite_csr_bvalid),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_bready  (p3_dbg_lite_csr_bready),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_araddr  (p3_dbg_lite_csr_araddr),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_arprot  (),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_arvalid (p3_dbg_lite_csr_arvalid),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_arready (p3_dbg_lite_csr_arready),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_rdata   (p3_dbg_lite_csr_rdata),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_rresp   (p3_dbg_lite_csr_rresp),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_rvalid  (p3_dbg_lite_csr_rvalid),
    .mgc_axi4lite_slave_3_altera_axi4lite_slave_rready  (p3_dbg_lite_csr_rready)
    );

    assign p0_lite_csr_awvalid     = p0_dbg_lite_csr_awvalid;
    assign p0_dbg_lite_csr_awready = p0_lite_csr_awready;
    assign p0_lite_csr_awaddr      = {1'b0, p0_dbg_lite_csr_awaddr}; 
    assign p0_lite_csr_wvalid      = p0_dbg_lite_csr_wvalid;
    assign p0_dbg_lite_csr_wready  = p0_lite_csr_wready;
    assign p0_lite_csr_wdata       = p0_dbg_lite_csr_wdata;
    assign p0_lite_csr_wstrb       = p0_dbg_lite_csr_wstrb;
    assign p0_dbg_lite_csr_bvalid  = p0_lite_csr_bvalid;
    assign p0_lite_csr_bready      = p0_dbg_lite_csr_bready;
    assign p0_dbg_lite_csr_bresp   = p0_lite_csr_bresp;
    assign p0_lite_csr_arvalid     = p0_dbg_lite_csr_arvalid;
    assign p0_dbg_lite_csr_arready = p0_lite_csr_arready;
    assign p0_lite_csr_araddr      = {1'b0, p0_dbg_lite_csr_araddr};
    assign p0_dbg_lite_csr_rvalid  = p0_lite_csr_rvalid;
    assign p0_lite_csr_rready      = p0_dbg_lite_csr_rready;
    assign p0_dbg_lite_csr_rdata   = p0_lite_csr_rdata;
    assign p0_dbg_lite_csr_rresp   = p0_lite_csr_rresp;

    assign p1_lite_csr_awvalid     = p1_dbg_lite_csr_awvalid;
    assign p1_dbg_lite_csr_awready = p1_lite_csr_awready;
    assign p1_lite_csr_awaddr      = {1'b0, p1_dbg_lite_csr_awaddr};
    assign p1_lite_csr_wvalid      = p1_dbg_lite_csr_wvalid;
    assign p1_dbg_lite_csr_wready  = p1_lite_csr_wready;
    assign p1_lite_csr_wdata       = p1_dbg_lite_csr_wdata;
    assign p1_lite_csr_wstrb       = p1_dbg_lite_csr_wstrb;
    assign p1_dbg_lite_csr_bvalid  = p1_lite_csr_bvalid;
    assign p1_lite_csr_bready      = p1_dbg_lite_csr_bready;
    assign p1_dbg_lite_csr_bresp   = p1_lite_csr_bresp;
    assign p1_lite_csr_arvalid     = p1_dbg_lite_csr_arvalid;
    assign p1_dbg_lite_csr_arready = p1_lite_csr_arready;
    assign p1_lite_csr_araddr      = {1'b0, p1_dbg_lite_csr_araddr};
    assign p1_dbg_lite_csr_rvalid  = p1_lite_csr_rvalid;
    assign p1_lite_csr_rready      = p1_dbg_lite_csr_rready;
    assign p1_dbg_lite_csr_rdata   = p1_lite_csr_rdata;
    assign p1_dbg_lite_csr_rresp   = p1_lite_csr_rresp;

    assign p2_lite_csr_awvalid     = p2_dbg_lite_csr_awvalid;
    assign p2_dbg_lite_csr_awready = p2_lite_csr_awready;
    assign p2_lite_csr_awaddr      = {1'b0, p2_dbg_lite_csr_awaddr};
    assign p2_lite_csr_wvalid      = p2_dbg_lite_csr_wvalid;
    assign p2_dbg_lite_csr_wready  = p2_lite_csr_wready;
    assign p2_lite_csr_wdata       = p2_dbg_lite_csr_wdata;
    assign p2_lite_csr_wstrb       = p2_dbg_lite_csr_wstrb;
    assign p2_dbg_lite_csr_bvalid  = p2_lite_csr_bvalid;
    assign p2_lite_csr_bready      = p2_dbg_lite_csr_bready;
    assign p2_dbg_lite_csr_bresp   = p2_lite_csr_bresp;
    assign p2_lite_csr_arvalid     = p2_dbg_lite_csr_arvalid;
    assign p2_dbg_lite_csr_arready = p2_lite_csr_arready;
    assign p2_lite_csr_araddr      = {1'b0, p2_dbg_lite_csr_araddr};
    assign p2_dbg_lite_csr_rvalid  = p2_lite_csr_rvalid;
    assign p2_lite_csr_rready      = p2_dbg_lite_csr_rready;
    assign p2_dbg_lite_csr_rdata   = p2_lite_csr_rdata;
    assign p2_dbg_lite_csr_rresp   = p2_lite_csr_rresp;

    assign p3_lite_csr_awvalid     = p3_dbg_lite_csr_awvalid;
    assign p3_dbg_lite_csr_awready = p3_lite_csr_awready;
    assign p3_lite_csr_awaddr      = {1'b0, p3_dbg_lite_csr_awaddr};
    assign p3_lite_csr_wvalid      = p3_dbg_lite_csr_wvalid;
    assign p3_dbg_lite_csr_wready  = p3_lite_csr_wready;
    assign p3_lite_csr_wdata       = p3_dbg_lite_csr_wdata;
    assign p3_lite_csr_wstrb       = p3_dbg_lite_csr_wstrb;
    assign p3_dbg_lite_csr_bvalid  = p3_lite_csr_bvalid;
    assign p3_lite_csr_bready      = p3_dbg_lite_csr_bready;
    assign p3_dbg_lite_csr_bresp   = p3_lite_csr_bresp;
    assign p3_lite_csr_arvalid     = p3_dbg_lite_csr_arvalid;
    assign p3_dbg_lite_csr_arready = p3_lite_csr_arready;
    assign p3_lite_csr_araddr      = {1'b0, p3_dbg_lite_csr_araddr};
    assign p3_dbg_lite_csr_rvalid  = p3_lite_csr_rvalid;
    assign p3_lite_csr_rready      = p3_dbg_lite_csr_rready;
    assign p3_dbg_lite_csr_rdata   = p3_lite_csr_rdata;
    assign p3_dbg_lite_csr_rresp   = p3_lite_csr_rresp;
  end
  else begin : gen_avmm2axilite
    assign p0_lite_csr_awvalid        = p0_app_ss_lite_csr_awvalid;
    assign p0_ss_app_lite_csr_awready = p0_lite_csr_awready;
    assign p0_lite_csr_awaddr         = p0_app_ss_lite_csr_awaddr;
    assign p0_lite_csr_wvalid         = p0_app_ss_lite_csr_wvalid;
    assign p0_ss_app_lite_csr_wready  = p0_lite_csr_wready;
    assign p0_lite_csr_wdata          = p0_app_ss_lite_csr_wdata;
    assign p0_lite_csr_wstrb          = p0_app_ss_lite_csr_wstrb;
    assign p0_ss_app_lite_csr_bvalid  = p0_lite_csr_bvalid;
    assign p0_lite_csr_bready         = p0_app_ss_lite_csr_bready;
    assign p0_ss_app_lite_csr_bresp   = p0_lite_csr_bresp;
    assign p0_lite_csr_arvalid        = p0_app_ss_lite_csr_arvalid;
    assign p0_ss_app_lite_csr_arready = p0_lite_csr_arready;
    assign p0_lite_csr_araddr         = p0_app_ss_lite_csr_araddr;
    assign p0_ss_app_lite_csr_rvalid  = p0_lite_csr_rvalid;
    assign p0_lite_csr_rready         = p0_app_ss_lite_csr_rready;
    assign p0_ss_app_lite_csr_rdata   = p0_lite_csr_rdata;
    assign p0_ss_app_lite_csr_rresp   = p0_lite_csr_rresp;

    assign p1_lite_csr_awvalid        = p1_app_ss_lite_csr_awvalid;
    assign p1_ss_app_lite_csr_awready = p1_lite_csr_awready;
    assign p1_lite_csr_awaddr         = p1_app_ss_lite_csr_awaddr;
    assign p1_lite_csr_wvalid         = p1_app_ss_lite_csr_wvalid;
    assign p1_ss_app_lite_csr_wready  = p1_lite_csr_wready;
    assign p1_lite_csr_wdata          = p1_app_ss_lite_csr_wdata;
    assign p1_lite_csr_wstrb          = p1_app_ss_lite_csr_wstrb;
    assign p1_ss_app_lite_csr_bvalid  = p1_lite_csr_bvalid;
    assign p1_lite_csr_bready         = p1_app_ss_lite_csr_bready;
    assign p1_ss_app_lite_csr_bresp   = p1_lite_csr_bresp;
    assign p1_lite_csr_arvalid        = p1_app_ss_lite_csr_arvalid;
    assign p1_ss_app_lite_csr_arready = p1_lite_csr_arready;
    assign p1_lite_csr_araddr         = p1_app_ss_lite_csr_araddr;
    assign p1_ss_app_lite_csr_rvalid  = p1_lite_csr_rvalid;
    assign p1_lite_csr_rready         = p1_app_ss_lite_csr_rready;
    assign p1_ss_app_lite_csr_rdata   = p1_lite_csr_rdata;
    assign p1_ss_app_lite_csr_rresp   = p1_lite_csr_rresp;

    assign p2_lite_csr_awvalid        = p2_app_ss_lite_csr_awvalid;
    assign p2_ss_app_lite_csr_awready = p2_lite_csr_awready;
    assign p2_lite_csr_awaddr         = p2_app_ss_lite_csr_awaddr;
    assign p2_lite_csr_wvalid         = p2_app_ss_lite_csr_wvalid;
    assign p2_ss_app_lite_csr_wready  = p2_lite_csr_wready;
    assign p2_lite_csr_wdata          = p2_app_ss_lite_csr_wdata;
    assign p2_lite_csr_wstrb          = p2_app_ss_lite_csr_wstrb;
    assign p2_ss_app_lite_csr_bvalid  = p2_lite_csr_bvalid;
    assign p2_lite_csr_bready         = p2_app_ss_lite_csr_bready;
    assign p2_ss_app_lite_csr_bresp   = p2_lite_csr_bresp;
    assign p2_lite_csr_arvalid        = p2_app_ss_lite_csr_arvalid;
    assign p2_ss_app_lite_csr_arready = p2_lite_csr_arready;
    assign p2_lite_csr_araddr         = p2_app_ss_lite_csr_araddr;
    assign p2_ss_app_lite_csr_rvalid  = p2_lite_csr_rvalid;
    assign p2_lite_csr_rready         = p2_app_ss_lite_csr_rready;
    assign p2_ss_app_lite_csr_rdata   = p2_lite_csr_rdata;
    assign p2_ss_app_lite_csr_rresp   = p2_lite_csr_rresp;

    assign p3_lite_csr_awvalid        = p3_app_ss_lite_csr_awvalid;
    assign p3_ss_app_lite_csr_awready = p3_lite_csr_awready;
    assign p3_lite_csr_awaddr         = p3_app_ss_lite_csr_awaddr;
    assign p3_lite_csr_wvalid         = p3_app_ss_lite_csr_wvalid;
    assign p3_ss_app_lite_csr_wready  = p3_lite_csr_wready;
    assign p3_lite_csr_wdata          = p3_app_ss_lite_csr_wdata;
    assign p3_lite_csr_wstrb          = p3_app_ss_lite_csr_wstrb;
    assign p3_ss_app_lite_csr_bvalid  = p3_lite_csr_bvalid;
    assign p3_lite_csr_bready         = p3_app_ss_lite_csr_bready;
    assign p3_ss_app_lite_csr_bresp   = p3_lite_csr_bresp;
    assign p3_lite_csr_arvalid        = p3_app_ss_lite_csr_arvalid;
    assign p3_ss_app_lite_csr_arready = p3_lite_csr_arready;
    assign p3_lite_csr_araddr         = p3_app_ss_lite_csr_araddr;
    assign p3_ss_app_lite_csr_rvalid  = p3_lite_csr_rvalid;
    assign p3_lite_csr_rready         = p3_app_ss_lite_csr_rready;
    assign p3_ss_app_lite_csr_rdata   = p3_lite_csr_rdata;
    assign p3_ss_app_lite_csr_rresp   = p3_lite_csr_rresp;
  end
  endgenerate

       logic [2:0]                             p0_virtio_pcicfg_pfnum_o;
       logic [31:0]                            p0_virtio_pcicfg_length_o;
       logic [7:0]                             p0_virtio_pcicfg_bar_o;
       logic [31:0]                            p0_virtio_pcicfg_baroffset_o;
       logic                                   p0_virtio_pcicfg_cfgwr_o;
       logic [31:0]                            p0_virtio_pcicfg_cfgdata_o;
       logic [31:0]                            p0_virtio_pcicfg_data_i;
       logic                                   p0_virtio_pcicfg_rdack_i;
       logic                                   p0_virtio_pcicfg_cfgrd_o;
       logic                                   p0_virtio_pcicfg_vfaccess_o;
       logic [10:0]                            p0_virtio_pcicfg_vfnum_o;
       logic [3:0]                             p0_virtio_pcicfg_rdbe_i;
       logic [10:0]                            p0_virtio_pcicfg_appvfnum_i;
       logic [2:0]                             p0_virtio_pcicfg_apppfnum_i;

  logic 		 p0_sys_pwr_fault_det_o = 'd0; 
  logic 		 p1_sys_pwr_fault_det_o = 'd0; 
  logic 		 p2_sys_pwr_fault_det_o = 'd0; 
  logic 		 p3_sys_pwr_fault_det_o = 'd0; 
  logic 		 p0_sys_pre_det_chged_o = 'd0;
  logic 		 p1_sys_pre_det_chged_o = 'd0;
  logic 		 p2_sys_pre_det_chged_o = 'd0;
  logic 		 p3_sys_pre_det_chged_o = 'd0;


	logic								p0_irq_status_o;
	logic								p1_irq_status_o;
	logic								p2_irq_status_o;
	logic								p3_irq_status_o;

	logic [7:0]  p0_ss_app_st_rxreq_tuser_last_segment;
    logic [7:0]  p1_ss_app_st_rxreq_tuser_last_segment;
    logic [7:0]  p2_ss_app_st_rxreq_tuser_last_segment;
    logic [7:0]  p3_ss_app_st_rxreq_tuser_last_segment;


    
    
    
    
    logic [127:0] p1_tx_st2_header_i; 
    logic [127:0] p1_tx_st3_header_i;

		logic 								p0_app_init_rst_i;
		logic 								p1_app_init_rst_i;
		logic 								p2_app_init_rst_i;
		logic 								p3_app_init_rst_i;
		logic									p0_apps_pm_xmt_turnoff_i; 
		logic									p1_apps_pm_xmt_turnoff_i; 
		logic									p2_apps_pm_xmt_turnoff_i; 
		logic									p3_apps_pm_xmt_turnoff_i; 
		logic 								p0_apps_ready_entr_l23_i;	
		logic 								p1_apps_ready_entr_l23_i;	
		logic 								p2_apps_ready_entr_l23_i;	
		logic 								p3_apps_ready_entr_l23_i;	
		logic 								p0_sys_aux_pwr_det_i;
		logic 								p1_sys_aux_pwr_det_i;
		logic 								p2_sys_aux_pwr_det_i;
		logic 								p3_sys_aux_pwr_det_i;

		logic                                 p0_pld_warm_rst_rdy_i; 
		logic                                 p1_pld_warm_rst_rdy_i; 
		logic                                 p2_pld_warm_rst_rdy_i; 
		logic                                 p3_pld_warm_rst_rdy_i; 
       	logic                                 p0_pld_link_req_rst_o;
       	logic                                 p1_pld_link_req_rst_o;
       	logic                                 p2_pld_link_req_rst_o;
       	logic                                 p3_pld_link_req_rst_o;
       	logic                                 p0_pld_core_warm_rst_n_o;
       	logic                                 p1_pld_core_warm_rst_n_o;
       	logic                                 p2_pld_core_warm_rst_n_o;
       	logic                                 p3_pld_core_warm_rst_n_o;
       	logic                                 p0_pld_core_cold_rst_n_o;
       	logic                                 p1_pld_core_cold_rst_n_o;
       	logic                                 p2_pld_core_cold_rst_n_o;
       	logic                                 p3_pld_core_cold_rst_n_o;
		logic                                             p0_pld_in_use_o;
  		logic                                             p1_pld_in_use_o;
  		logic                                             p2_pld_in_use_o;
  		logic                                             p3_pld_in_use_o;
		logic                                             p0_user_mode_to_pld_o;
  		logic                                             p1_user_mode_to_pld_o;
  		logic                                             p2_user_mode_to_pld_o;
  		logic                                             p3_user_mode_to_pld_o;

	   logic		                                      p0_sys_eml_interlock_engaged_i;
       logic                                              p0_sys_cmd_cpled_int_i;
       logic                                              p0_sys_pwr_fault_det_i;
       logic                                              p0_sys_mrl_sensor_state_i;
       logic                                              p0_sys_pre_det_state_i;
       logic                                              p0_sys_atten_button_pressed_i;


		logic [2:0]                                       	p0_prs_event_func_i;
			
		logic [31:0]                                        p0_pm_dstate_o;
		logic [31:0]                                        p1_pm_dstate_o;
		logic [3:0]                                         p2_pm_dstate_o;
		logic [3:0]                                         p3_pm_dstate_o;
		logic [7:0]                                         p0_pm_curnt_state_o; 
		logic [7:0]                                         p1_pm_curnt_state_o; 
		logic [7:0]                                         p2_pm_curnt_state_o; 
		logic [7:0]                                         p3_pm_curnt_state_o; 
		 
		logic [7:0]                                         p0_app_req_retry_en_i;
		logic [7:0]                                         p1_app_req_retry_en_i;
		logic                                               p2_app_req_retry_en_i = 1'd0;
        logic                                               p3_app_req_retry_en_i = 1'd0;

		logic [7:0]                                               p0_apps_pm_xmt_pme_i;
		logic [7:0]                                               p1_apps_pm_xmt_pme_i;
		logic [7:0]                                               p2_apps_pm_xmt_pme_i;
		logic [7:0]                                               p3_apps_pm_xmt_pme_i;
        logic [7:0]                                         p2_app_int_wire;
        logic [7:0]                                         p3_app_int_wire;
		logic  [7:0]                                        p0_app_int_i;
		logic  [7:0]                                        p1_app_int_i;
		logic                                               p2_app_int_i = p2_app_int_wire[0];
		logic                                               p3_app_int_i = p3_app_int_wire[0];
		logic [7:0]                                         p0_app_int_ready_o;
		logic [7:0]                                         p1_app_int_ready_o;
		logic                                               p2_app_int_ready_o;
		logic                                               p3_app_int_ready_o;
		logic 											    p0_prs_event_valid_i;    
		logic 											    p1_prs_event_valid_i;    
		logic 											    p2_prs_event_valid_i;    
		logic 											    p3_prs_event_valid_i;    
		logic [1:0] 										p0_prs_event_i; 
		logic [1:0] 										p1_prs_event_i; 
		logic [1:0] 										p2_prs_event_i; 
		logic [1:0] 										p3_prs_event_i; 

    logic [5:0]                                        	p0_ltssm_state_delay_o;
		logic 								 				p0_surprise_down_err_o;
		logic 						  		 				p1_surprise_down_err_o;
		logic 								 				p2_surprise_down_err_o;
		logic 						 		 				p3_surprise_down_err_o;
		logic 								 				p0_ltssm_st_hipfifo_ovrflw_o;
		logic								 				p1_ltssm_st_hipfifo_ovrflw_o;
		logic								 				p2_ltssm_st_hipfifo_ovrflw_o;
		logic								 				p3_ltssm_st_hipfifo_ovrflw_o;
		logic								 				p0_app_xfer_pending_i;
		logic								 				p1_app_xfer_pending_i;
		logic								 				p2_app_xfer_pending_i;
		logic								 				p3_app_xfer_pending_i;
		logic								 				p0_link_up_o;
		logic								 				p1_link_up_o;
		logic								 				p2_link_up_o;
		logic								 				p3_link_up_o;
		logic								 				p0_dl_up_o;
		logic								 				p1_dl_up_o;
		logic								 				p2_dl_up_o;
		logic								 				p3_dl_up_o;
		logic								 				p0_dl_timer_update_o;
		logic								 				p1_dl_timer_update_o;
		logic								 				p2_dl_timer_update_o;
		logic								 				p3_dl_timer_update_o;
   logic [2:0]                                                                            p0_rx_st0_bar_o;      
   logic [2:0]                                                                            p0_rx_st1_bar_o;      
   logic [2:0]                                                                            p0_rx_st2_bar_o;      
   logic [2:0]                                                                            p1_rx_st2_bar_o;      
   logic [2:0]                                                                            p2_rx_st2_bar_o;      
   logic [2:0]                                                                            p3_rx_st2_bar_o;      
   logic [2:0]                                                                            p0_rx_st3_bar_o;      
   logic [2:0]                                                                            p1_rx_st3_bar_o;      
   logic [2:0]                                                                            p2_rx_st3_bar_o;      
   logic [2:0]                                                                            p3_rx_st3_bar_o;      
   logic [2:0]                                                                            p0_rx_st0_pfnum_o;      
   logic [2:0]                                                                            p0_rx_st1_pfnum_o;      
   logic [2:0]                                                                            p0_rx_st2_pfnum_o;      
   logic [2:0]                                                                            p0_rx_st3_pfnum_o;      
   logic                                                                                  p0_rx_st0_vfactive_o;      
   logic                                                                                  p0_rx_st1_vfactive_o;      
   logic                                                                                  p0_rx_st2_vfactive_o;      
   logic                                                                                  p0_rx_st3_vfactive_o;      
   logic [10:0]                                                                           p0_rx_st0_vfnum_o;      
   logic [10:0]                                                                           p0_rx_st1_vfnum_o;      
   logic [10:0]                                                                           p0_rx_st2_vfnum_o;      
   logic [10:0]                                                                           p0_rx_st3_vfnum_o;      
   logic                                                                                  p0_rx_st0_eop_o;      
   logic                                                                                  p0_rx_st1_eop_o;      
   logic                                                                                  p0_rx_st2_eop_o;      
   logic                                                                                  p0_rx_st3_eop_o;      
   logic [127:0]                                                                          p0_rx_st0_hdr_o;   
   logic [127:0]                                                                          p0_rx_st1_hdr_o;   
   logic [127:0]                                                                          p0_rx_st2_hdr_o;   
   logic [127:0]                                                                          p1_rx_st2_hdr_o;
   logic [127:0]                                                                          p2_rx_st2_hdr_o;
   logic [127:0]                                                                          p3_rx_st2_hdr_o;
   logic [127:0]                                                                          p0_rx_st3_hdr_o;   
   logic [127:0]                                                                          p1_rx_st3_hdr_o;   
   logic [127:0]                                                                          p2_rx_st3_hdr_o;   
   logic [127:0]                                                                          p3_rx_st3_hdr_o;   
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st0_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st1_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st2_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p1_rx_st2_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p2_rx_st2_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p3_rx_st2_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p0_rx_st3_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p1_rx_st3_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p2_rx_st3_data_o;  
   logic [seg_width_hwtcl-1:0]                                                            p3_rx_st3_data_o;  
   logic                                                                                  p0_rx_st0_sop_o;      
   logic                                                                                  p0_rx_st1_sop_o;      
   logic                                                                                  p0_rx_st2_sop_o;      
   logic                                                                                  p0_rx_st3_sop_o;      
   logic [7:0]                                                                            p0_rx_st0_data_par_o = '0;
   logic [7:0]                                                                            p0_rx_st1_data_par_o = '0;
   logic [7:0]                                                                            p0_rx_st2_data_par_o = '0;
   logic [7:0]                                                                            p0_rx_st3_data_par_o = '0;
   logic [7:0]                                                                            p2_rx_st3_data_par_o = '0;
   logic [7:0]                                                                            p3_rx_st3_data_par_o = '0;
   logic [3:0]                                                                       	  p0_rx_st0_hdr_par_o = '0;
   logic [3:0]                                                                       	  p0_rx_st1_hdr_par_o = '0;
   logic [3:0]                                                                       	  p0_rx_st2_hdr_par_o = '0;
   logic [3:0]                                                                       	  p0_rx_st3_hdr_par_o = '0;
   logic [3:0]                                                                       	  p2_rx_st3_hdr_par_o = '0;
   logic [3:0]                                                                       	  p3_rx_st3_hdr_par_o = '0;
   logic                                                                             	  p0_rx_st0_prefix_par_o = '0;
   logic                                                                             	  p0_rx_st1_prefix_par_o = '0;
   logic                                                                             	  p0_rx_st2_prefix_par_o = '0;
   logic                                                                             	  p0_rx_st3_prefix_par_o = '0;
   logic                                                                                  p0_rx_st0_hvalid_o;    
   logic                                                                                  p0_rx_st1_hvalid_o;    
   logic                                                                                  p0_rx_st2_hvalid_o;    
   logic                                                                                  p0_rx_st3_hvalid_o;    
   logic                                                                                  p0_rx_st0_dvalid_o;    
   logic                                                                                  p0_rx_st1_dvalid_o;    
   logic                                                                                  p0_rx_st2_dvalid_o;    
   logic                                                                                  p0_rx_st3_dvalid_o;    
   logic                                                                                  p0_rx_st0_pvalid_o;    
   logic                                                                                  p0_rx_st1_pvalid_o;    
   logic                                                                                  p0_rx_st2_pvalid_o;    
   logic                                                                                  p0_rx_st3_pvalid_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st0_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st1_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st2_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p1_rx_st2_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p2_rx_st2_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p3_rx_st2_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p0_rx_st3_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p1_rx_st3_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p2_rx_st3_empty_o;    
   logic [$clog2(seg_width_hwtcl/32)-1:0]                                                p3_rx_st3_empty_o;    
   logic [31:0]                                                                           p0_rx_st0_prefix_o; 
   logic [31:0]                                                                           p0_rx_st1_prefix_o; 
   logic [31:0]                                                                           p0_rx_st2_prefix_o; 
   logic [31:0]                                                                           p1_rx_st2_prefix_o; 
   logic [31:0]                                                                           p2_rx_st2_prefix_o; 
   logic [31:0]                                                                           p3_rx_st2_prefix_o; 
   logic [31:0]                                                                           p0_rx_st3_prefix_o; 
   logic [31:0]                                                                           p1_rx_st3_prefix_o; 
   logic [31:0]                                                                           p2_rx_st3_prefix_o; 
   logic [31:0]                                                                           p3_rx_st3_prefix_o; 
   logic                                                                                  p0_rx_st_ready_i;    
   logic                                                                                  p0_rx_st0_pt_parity_o;
   logic                                                                                  p0_rx_st1_pt_parity_o;
   logic                                                                                  p0_rx_st2_pt_parity_o;
   logic                                                                                  p0_rx_st3_pt_parity_o;
   logic                                                                                  p0_rx_st_par_err_o;
 
   logic                                                                                  p0_tx_st_par_err_o;
   logic                                                                                  p0_tx_st0_eop_i;  
   logic                                                                                  p0_tx_st1_eop_i;  
   logic                                                                                  p0_tx_st2_eop_i;  
   logic                                                                                  p0_tx_st3_eop_i;  
   logic [127:0]                                                                          p0_tx_st0_hdr_i;      
   logic [127:0]                                                                          p0_tx_st1_hdr_i;      
   logic [127:0]                                                                          p0_tx_st2_hdr_i;      
   logic [127:0]                                                                          p0_tx_st3_hdr_i;      
   logic [31:0]                                                                           p0_tx_st0_prefix_i;      
   logic [31:0]                                                                           p0_tx_st1_prefix_i;      
   logic [31:0]                                                                           p0_tx_st2_prefix_i;      
   logic [31:0]                                                                           p1_tx_st2_prefix_i;
   logic [31:0]                                                                           p2_tx_st2_prefix_i;
   logic [31:0]                                                                           p3_tx_st2_prefix_i;
   logic [31:0]                                                                           p0_tx_st3_prefix_i;      
   logic [31:0]                                                                           p1_tx_st3_prefix_i;      
   logic [31:0]                                                                           p2_tx_st3_prefix_i;      
   logic [31:0]                                                                           p3_tx_st3_prefix_i;      
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st0_data_i;     
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st1_data_i;     
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st2_data_i;     
   logic [seg_width_hwtcl-1:0]                                                            p0_tx_st3_data_i;     
   logic                                                                                  p0_tx_st0_sop_i;  
   logic                                                                                  p0_tx_st1_sop_i;  
   logic                                                                                  p0_tx_st2_sop_i;  
   logic                                                                                  p0_tx_st3_sop_i;  
   logic [7:0]                                                                            p0_tx_st0_data_par_i;
   logic [7:0]                                                                            p0_tx_st1_data_par_i;
   logic [7:0]                                                                            p0_tx_st2_data_par_i;
   logic [7:0]                                                                            p0_tx_st3_data_par_i;
   logic [3:0]                                                                       	  p0_tx_st0_hdr_par_i;
   logic [3:0]                                                                       	  p0_tx_st1_hdr_par_i;
   logic [3:0]                                                                       	  p0_tx_st2_hdr_par_i;
   logic [3:0]                                                                       	  p0_tx_st3_hdr_par_i;
   logic                                                                             	  p0_tx_st0_prefix_par_i;
   logic                                                                             	  p0_tx_st1_prefix_par_i;
   logic                                                                             	  p0_tx_st2_prefix_par_i;
   logic                                                                             	  p0_tx_st3_prefix_par_i;
   logic                                                                                  p0_tx_st0_dvalid_i;
   logic                                                                                  p0_tx_st1_dvalid_i;
   logic                                                                                  p0_tx_st2_dvalid_i;
   logic                                                                                  p0_tx_st3_dvalid_i;
   logic                                                                                  p0_tx_st0_pvalid_i;
   logic                                                                                  p0_tx_st1_pvalid_i;
   logic                                                                                  p0_tx_st2_pvalid_i;
   logic                                                                                  p0_tx_st3_pvalid_i;
   logic                                                                                  p0_tx_st0_hvalid_i;
   logic                                                                                  p0_tx_st1_hvalid_i;
   logic                                                                                  p0_tx_st2_hvalid_i;
   logic                                                                                  p0_tx_st3_hvalid_i;
   logic                                                                                  p0_tx_st_ready_o;       
 
   logic [2:0]                                                                            p0_rx_st_hcrdt_update_i;
   logic [5:0]                                                                            p0_rx_st_hcrdt_update_cnt_i;
   logic [2:0]                                                                            p0_rx_st_hcrdt_init_i;
   logic [2:0]                                                                            p0_rx_st_hcrdt_init_ack_o;
                                                                                          
   logic [2:0]                                                                            p0_rx_st_dcrdt_update_i;
   logic [11:0]                                                                           p0_rx_st_dcrdt_update_cnt_i;
   logic [2:0]                                                                            p0_rx_st_dcrdt_init_i;
   logic [2:0]                                                                            p0_rx_st_dcrdt_init_ack_o;
                                                                                          
   logic [2:0]                                                                            p0_tx_st_hcrdt_update_o;
   logic [5:0]                                                                            p0_tx_st_hcrdt_update_cnt_o;
   logic [2:0]                                                                            p0_tx_st_hcrdt_init_o;
   logic [2:0]                                                                            p0_tx_st_hcrdt_init_ack_i;
                                                                                          
   logic [2:0]                                                                            p0_tx_st_dcrdt_update_o;
   logic [11:0]                                                                           p0_tx_st_dcrdt_update_cnt_o;
   logic [2:0]                                                                            p0_tx_st_dcrdt_init_o;
   logic [2:0]                                                                            p0_tx_st_dcrdt_init_ack_i;
   
   logic                                                                                  p0_hip_reconfig_read_i;
   logic [31:0]                                                                           p0_hip_reconfig_address_i;
   logic                                                                                  p0_hip_reconfig_write_i;
   logic [7:0]                                                                            p0_hip_reconfig_writedata_i;
   logic                                                                                  p0_hip_reconfig_readdatavalid_o;
   logic [7:0]                                                                            p0_hip_reconfig_readdata_o;
   logic                                                                                  p0_hip_reconfig_waitrequest_o;

   logic                                                                                 p0_slow_reset_status_n;
 
   logic [7:0]                                                                            p0_flr_rcvd_pf_o       ;   
   logic                                                                                  p0_flr_rcvd_vf_o       ;   
   logic [2:0]                                                                            p0_flr_rcvd_pf_num_o   ;  
   logic [10:0]                                                                           p0_flr_rcvd_vf_num_o   ;   
   logic [7:0]                                                                            p0_flr_completed_pf_i  ;   
   logic                                                                                  p0_flr_completed_vf_i  ;   
   logic [2:0]                                                                            p0_flr_completed_pf_num_i ; 
   logic [10:0]                                                                           p0_flr_completed_vf_num_i ; 
   logic                                                                                  p0_flr_completed_ready_o;
 
   logic                                                                                  p0_cpl_timeout_o;                     
   logic [2:0]                                                                            p0_cpl_timeout_func_num_o;            
   logic [10:0]                                                                           p0_cpl_timeout_vfunc_num_o;           
   logic                                                                                  p0_cpl_timeout_vfunc_active_o;        
   logic [2:0]                                                                            p0_cpl_timeout_cpl_tc_o;              
   logic [1:0]                                                                            p0_cpl_timeout_cpl_attr_o;            
   logic [11:0]                                                                           p0_cpl_timeout_cpl_len_o;             
   logic [9:0]                                                                            p0_cpl_timeout_cpl_tag_o;             
 
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
 
   logic                                                                                  p0_app_err_valid_i    ;   
   logic [31:0]                                                                           p0_app_err_hdr_i      ;   
   logic [13:0]                                                                           p0_app_err_info_i     ;   
    logic [2:0]                                                                           p0_app_err_func_num_i ;  
   logic                                                                                  p0_serr_out_o         ;
   logic                                                                                  p0_app_err_ready_o    ;   
   
   logic [2:0]                                                                            p0_msi_pnd_func_i;
   logic [7:0]                                                                            p0_msi_pnd_byte_i;
   logic [1:0]                                                                            p0_msi_pnd_addr_i;
   logic                                                                                  p0_msi_pnd_ready_o;
   
   logic                                                                                  p0_tx_ehp_deallocate_empty_o;
 
   logic [7:0]                                                                            p0_pld_gp_status_i;
   logic [7:0]                                                                            p0_pld_gp_ctrl_o;
   logic                                                                                  p0_pld_gp_status_ready_o;
 
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
 
 
 
 
       
   		 logic [5:0]                                                                       p1_ltssm_state_delay_o;
       
       logic                                                                             p1_slow_reset_status_n;
       
       logic [2:0]                                                                       p1_msi_pnd_func_i;
       logic [1:0]                                                                       p1_msi_pnd_addr_i;
       logic [7:0]                                                                       p1_msi_pnd_byte_i;
       logic                                                                             p1_msi_pnd_ready_o;

			 logic [2:0]                                                                       p2_msi_pnd_func_i;
       logic [1:0]                                                                       p2_msi_pnd_addr_i;
       logic [7:0]                                                                       p2_msi_pnd_byte_i;
       logic                                                                             p2_msi_pnd_ready_o;
		 
		   logic [2:0]                                                                       p3_msi_pnd_func_i;
       logic [1:0]                                                                       p3_msi_pnd_addr_i;
       logic [7:0]                                                                       p3_msi_pnd_byte_i;
       logic                                                                             p3_msi_pnd_ready_o;
       
       logic                                                                             p1_sys_eml_interlock_engaged_i;
       logic                                                                             p1_sys_cmd_cpled_int_i;
       logic                                                                             p1_sys_pwr_fault_det_i;
       logic                                                                             p1_sys_mrl_sensor_state_i;
       logic                                                                             p1_sys_pre_det_state_i;
       logic                                                                             p1_sys_atten_button_pressed_i;
       
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
       
       logic [7:0]                                                                       p1_pld_gp_status_i;
       logic [7:0]                                                                       p1_pld_gp_ctrl_o;
       logic                                                                             p1_pld_gp_status_ready_o;
       
       logic                                                                             p1_ptm_manual_update_i;
       logic                                                                             p1_ptm_clk_updated_o;
       logic [63:0]                                                                      p1_ptm_local_clock_o;
       logic                                                                             p1_ptm_context_valid_o;
       
       logic                                                                             p1_app_err_valid_i;
       logic [31:0]                                                                      p1_app_err_hdr_i;
       logic [13:0]                                                                      p1_app_err_info_i;
       logic [2:0]                                                                       p1_app_err_func_num_i;
       logic                                                                             p1_app_err_ready_o;
       logic                                                                             p1_serr_out_o;
       
       logic [2:0]                                                                       p1_prs_event_func_i;
       
       logic [7:0]                                                                       p1_flr_rcvd_pf_o;
       logic                                                                             p1_flr_rcvd_vf_o;
       logic [2:0]                                                                       p1_flr_rcvd_pf_num_o;
       logic [10:0]                                                                      p1_flr_rcvd_vf_num_o;
       logic [7:0]                                                                       p1_flr_completed_pf_i;
       logic                                                                             p1_flr_completed_vf_i;
       logic [2:0]                                                                       p1_flr_completed_pf_num_i;
       logic [10:0]                                                                      p1_flr_completed_vf_num_i;
       logic                                                                             p1_flr_completed_ready_o;
       
       logic                                                                             p1_cpl_timeout_o;
       logic [2:0]                                                                       p1_cpl_timeout_func_num_o;
       logic [10:0]                                                                      p1_cpl_timeout_vfunc_num_o;
       logic                                                                             p1_cpl_timeout_vfunc_active_o;
       logic [2:0]                                                                       p1_cpl_timeout_cpl_tc_o;
       logic [1:0]                                                                       p1_cpl_timeout_cpl_attr_o;
       logic [11:0]                                                                      p1_cpl_timeout_cpl_len_o;
       logic [9:0]                                                                       p1_cpl_timeout_cpl_tag_o;
 
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
       
       logic [7:0]                                                                       p1_hip_reconfig_readdata_o;
       logic                                                                             p1_hip_reconfig_readdatavalid_o;
       logic                                                                             p1_hip_reconfig_waitrequest_o;
       logic [31:0]                                                                      p1_hip_reconfig_address_i;
       logic                                                                             p1_hip_reconfig_write_i;
       logic [7:0]                                                                       p1_hip_reconfig_writedata_i;
       logic                                                                             p1_hip_reconfig_read_i;
       
       logic                                                                             p1_local_ref_clk_req_n_o;
       logic                                                                             p1_cfg_l1sub_en_o;
       logic                                                                             p1_pm_linkst_in_l1sub_o;
       logic [7:0]                                                                       p1_pm_l1sub_state_o;
       logic                                                                             p1_clkreq_in_n_i;
       logic                                                                             p1_app_clk_req_n_i;
       
       logic                                                                             p1_rx_st_ready_i;
       logic [seg_width_hwtcl-1:0]                                                       p1_rx_st0_data_o;    
       logic                                                                             p1_rx_st0_sop_o;
       logic                                                                             p1_rx_st0_eop_o;
       logic                                                                             p1_rx_st0_dvalid_o;
       logic [$clog2(seg_width_hwtcl/32)-1:0]                                           p1_rx_st0_empty_o;   
       
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
       
       logic [seg_width_hwtcl-1:0]                                                       p1_rx_st1_data_o;    
       logic                                                                             p1_rx_st1_sop_o;
       logic                                                                             p1_rx_st1_eop_o;
       logic                                                                             p1_rx_st1_dvalid_o;
       logic [$clog2(seg_width_hwtcl/32)-1:0]                                           p1_rx_st1_empty_o;   


			 logic [7:0]                                                                       p1_rx_st2_data_par_o;
			 logic [7:0]                                                                       p2_rx_st2_data_par_o;
			 logic [7:0]                                                                       p3_rx_st2_data_par_o;
			 logic [3:0]                                                                       p1_rx_st2_hdr_par_o;
			 logic [3:0]                                                                       p2_rx_st2_hdr_par_o;
			 logic [3:0]                                                                       p3_rx_st2_hdr_par_o;
       logic                                                                             p1_rx_st2_hvalid_o;
       logic                                                                             p1_rx_st2_pvalid_o;
       logic                                                                             p1_rx_st2_prefix_par_o;
       logic                                                                             p1_rx_st2_vfactive_o;
       logic [10:0]                                                                      p1_rx_st2_vfnum_o;
       logic [2:0]                                                                       p1_rx_st2_pfnum_o;
       logic                                                                             p1_rx_st2_pt_parity_o;
 

      
       logic [7:0]                                                                       p1_rx_st3_data_par_o;
       logic [3:0]                                                                       p1_rx_st3_hdr_par_o;
       logic                                                                             p1_rx_st3_sop_o;
       logic                                                                             p1_rx_st3_eop_o;
       logic                                                                             p1_rx_st3_dvalid_o;
       logic                                                                             p1_rx_st3_vfactive_o;
       logic [10:0]                                                                      p1_rx_st3_vfnum_o;
       logic [2:0]                                                                       p1_rx_st3_pfnum_o;
      
 
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
       
       logic                                                                             p1_rx_dsk_valid_o;
       logic                                                                             p1_rx_dsk_eval_done_o;
       logic                                                                             p1_rx_dsk_lock_err_o;
       logic [511:0]                                                                     p1_rx_dsk_monitor_err_o;
       
       logic [2:0]                                                                       p1_rx_st_hcrdt_init_i;
       logic [2:0]                                                                       p1_rx_st_hcrdt_update_i;
       logic [5:0]                                                                       p1_rx_st_hcrdt_update_cnt_i;
       logic [2:0]                                                                       p1_rx_st_hcrdt_init_ack_o;
       logic [2:0]                                                                       p1_rx_st_dcrdt_init_i;
       logic [2:0]                                                                       p1_rx_st_dcrdt_update_i;
       logic [11:0]                                                                      p1_rx_st_dcrdt_update_cnt_i;
       logic [2:0]                                                                       p1_rx_st_dcrdt_init_ack_o;
       
       logic [2:0]                                                                       p1_tx_st_hcrdt_init_o;
       logic [2:0]                                                                       p1_tx_st_hcrdt_update_o;
       logic [5:0]                                                                       p1_tx_st_hcrdt_update_cnt_o;
       logic [2:0]                                                                       p1_tx_st_hcrdt_init_ack_i;
       logic [2:0]                                                                       p1_tx_st_dcrdt_init_o;
       logic [2:0]                                                                       p1_tx_st_dcrdt_update_o;
       logic [11:0]                                                                      p1_tx_st_dcrdt_update_cnt_o;
       logic [2:0]                                                                       p1_tx_st_dcrdt_init_ack_i;
       
       logic                                                                             p1_tx_st_ready_o;
       logic                                                                             p1_tx_st0_sop_i;
       logic                                                                             p1_tx_st0_eop_i;
       logic                                                                             p1_tx_st0_dvalid_i;
       
       logic [31:0]                                                                      p1_tx_st0_prefix_i;
       logic                                                                             p1_tx_st0_hvalid_i;
       logic                                                                             p1_tx_st0_pvalid_i;
       logic [7:0]                                                                       p1_tx_st0_data_par_i;
       logic [3:0]                                                                       p1_tx_st0_hdr_par_i;
       logic                                                                             p1_tx_st0_prefix_par_i;
       
       logic [seg_width_hwtcl-1:0]                                                       p1_tx_st0_data_i;    
       logic [seg_width_hwtcl-1:0]                                                       p1_tx_st1_data_i;    
       logic [seg_width_hwtcl-1:0]                                                       p1_tx_st2_data_i;    
       logic [seg_width_hwtcl-1:0]                                                       p2_tx_st2_data_i;    
       logic [seg_width_hwtcl-1:0]                                                       p3_tx_st2_data_i;    
       logic [seg_width_hwtcl-1:0]                                                       p1_tx_st3_data_i;    
       logic [seg_width_hwtcl-1:0]                                                       p2_tx_st3_data_i;    
       logic                                                                             p1_tx_st1_sop_i;
       logic                                                                             p1_tx_st1_eop_i;
       logic                                                                             p1_tx_st1_dvalid_i;
       
       logic [127:0]                                                                     p1_tx_st0_hdr_i;
       logic [127:0]                                                                     p1_tx_st1_hdr_i;
       logic [127:0]                                                                     p1_tx_st2_hdr_i;
       logic [127:0]                                                                     p2_tx_st2_hdr_i;
       logic [127:0]                                                                     p3_tx_st2_hdr_i;
       logic [127:0]                                                                     p1_tx_st3_hdr_i;
       logic [127:0]                                                                     p2_tx_st3_hdr_i;
       logic [127:0]                                                                     p3_tx_st3_hdr_i;
       logic [31:0]                                                                      p1_tx_st1_prefix_i;
       logic                                                                             p1_tx_st1_hvalid_i;
       logic                                                                             p1_tx_st1_pvalid_i;
       logic [7:0]                                                                       p1_tx_st1_data_par_i;
       logic [3:0]                                                                       p1_tx_st1_hdr_par_i;
       logic                                                                             p1_tx_st1_prefix_par_i;
       logic                                                                             p1_tx_st_par_err_o;
 
		  logic [7:0]                                                                       p1_tx_st2_data_par_i;
		  logic [7:0]                                                                       p2_tx_st2_data_par_i;
		  logic [7:0]                                                                       p3_tx_st2_data_par_i;
			logic [3:0]                                                                       p1_tx_st2_hdr_par_i;
			logic [3:0]                                                                       p2_tx_st2_hdr_par_i;
			logic [3:0]                                                                       p3_tx_st2_hdr_par_i;

 	
       
		  logic [7:0]                                                                       p1_tx_st3_data_par_i;
		  logic [7:0]                                                                       p2_tx_st3_data_par_i;
		  logic [7:0]                                                                       p3_tx_st3_data_par_i;
      logic [3:0]                                                                       p1_tx_st3_hdr_par_i;
      logic [3:0]                                                                       p2_tx_st3_hdr_par_i;
      logic [3:0]                                                                       p3_tx_st3_hdr_par_i;

       logic                                                                             p1_tx_ehp_deallocate_empty_o;
 
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
 
 
 
 
   logic [5:0]                                                                            p2_ltssm_state_delay_o;
       
       logic                                                                             p2_slow_reset_status_n;
       
       
       logic                                                                             p2_sys_eml_interlock_engaged_i;
       logic                                                                             p2_sys_cmd_cpled_int_i;
       logic                                                                             p2_sys_pwr_fault_det_i;
       logic                                                                             p2_sys_mrl_sensor_state_i;
       logic                                                                             p2_sys_pre_det_state_i;
       logic                                                                             p2_sys_atten_button_pressed_i;
       
       logic                                                                             p2_mnpput_o;
       logic                                                                             p2_mpcput_o;
       logic                                                                             p2_mnpcup_i;
       logic                                                                             p2_mpccup_i;
       logic                                                                             p2_meom_o;
       logic [15:0]                                                                      p2_mpayload_o;
       logic                                                                             p2_mparity_o;
       logic [2:0]                                                                       p2_side_ism_fabric_i;
       logic                                                                             p2_tnpput_i;
       logic                                                                             p2_tpcput_i;
       logic                                                                             p2_tnpcup_o;
       logic                                                                             p2_tpccup_o;
       logic                                                                             p2_teom_i;
       logic [15:0]                                                                      p2_tpayload_i;
       logic                                                                             p2_tparity_i;
       logic [2:0]                                                                       p2_side_ism_agent_o;
       
       logic [7:0]                                                                       p2_pld_gp_status_i;
       logic [7:0]                                                                       p2_pld_gp_ctrl_o;
       logic                                                                             p2_pld_gp_status_ready_o;
       
       
       logic                                                                             p2_app_err_valid_i;
       logic [31:0]                                                                      p2_app_err_hdr_i;
       logic [13:0]                                                                      p2_app_err_info_i;
       logic [2:0]                                                                       p2_app_err_func_num_i;
       logic                                                                             p2_app_err_ready_o;
       logic                                                                             p2_serr_out_o;
       
       logic [2:0]                                                                       p2_prs_event_func_i;
       
        logic [7:0]                                                                       p2_flr_rcvd_pf_o;
        logic                                                                             p2_flr_rcvd_vf_o;
        logic [2:0]                                                                       p2_flr_rcvd_pf_num_o;
        logic [10:0]                                                                      p2_flr_rcvd_vf_num_o;
        logic [7:0]                                                                       p2_flr_completed_pf_i;
        logic                                                                             p2_flr_completed_vf_i;
        logic [2:0]                                                                       p2_flr_completed_pf_num_i;
        logic [10:0]                                                                      p2_flr_completed_vf_num_i;
        logic                                                                             p2_flr_completed_ready_o;
       
       logic                                                                             p2_cpl_timeout_o;
       logic [2:0]                                                                       p2_cpl_timeout_func_num_o;
       logic [10:0]                                                                      p2_cpl_timeout_vfunc_num_o;
       logic                                                                             p2_cpl_timeout_vfunc_active_o;
       logic [2:0]                                                                       p2_cpl_timeout_cpl_tc_o;
       logic [1:0]                                                                       p2_cpl_timeout_cpl_attr_o;
       logic [11:0]                                                                      p2_cpl_timeout_cpl_len_o;
       logic [9:0]                                                                       p2_cpl_timeout_cpl_tag_o;
 
       logic                                                                             p2_cii_req_o;
       logic                                                                             p2_cii_hdr_poisoned_o;
       logic [3:0]                                                                       p2_cii_hdr_first_be_o;
       logic [2:0]                                                                       p2_cii_func_num_o;
       logic                                                                             p2_cii_wr_o;
       logic [9:0]                                                                       p2_cii_addr_o;
       logic [31:0]                                                                      p2_cii_dout_o;
       logic                                                                             p2_cii_override_en_i;
       logic [31:0]                                                                      p2_cii_override_din_i;
       logic                                                                             p2_cii_halt_i;
       logic                                                                             p2_cii_wr_vf_active_o;
       logic [10:0]                                                                      p2_cii_vf_num_o;
 
       logic [2:0]                                                                       p2_virtio_pcicfg_pfnum_o;
       logic [31:0]                                                                      p2_virtio_pcicfg_length_o;
       logic [7:0]                                                                       p2_virtio_pcicfg_bar_o;
       logic [31:0]                                                                      p2_virtio_pcicfg_baroffset_o;
       logic                                                                             p2_virtio_pcicfg_cfgwr_o;
       logic [31:0]                                                                      p2_virtio_pcicfg_cfgdata_o;
       logic [31:0]                                                                      p2_virtio_pcicfg_data_i;
       logic                                                                             p2_virtio_pcicfg_rdack_i;
       logic                                                                             p2_virtio_pcicfg_cfgrd_o;
       logic                                                                             p2_virtio_pcicfg_vfaccess_o;
       logic [10:0]                                                                      p2_virtio_pcicfg_vfnum_o;
       logic [3:0]                                                                       p2_virtio_pcicfg_rdbe_i;
       logic [10:0]                                                                      p2_virtio_pcicfg_appvfnum_i;
       logic [2:0]                                                                       p2_virtio_pcicfg_apppfnum_i;
       
       logic [7:0]                                                                       p2_hip_reconfig_readdata_o;
       logic                                                                             p2_hip_reconfig_readdatavalid_o;
       logic                                                                             p2_hip_reconfig_waitrequest_o;
       logic [31:0]                                                                      p2_hip_reconfig_address_i;
       logic                                                                             p2_hip_reconfig_write_i;
       logic [7:0]                                                                       p2_hip_reconfig_writedata_i;
       logic                                                                             p2_hip_reconfig_read_i;
       
       logic                                                                             p2_local_ref_clk_req_n_o;
       logic                                                                             p2_cfg_l1sub_en_o;
       logic                                                                             p2_pm_linkst_in_l1sub_o;
       logic [7:0]                                                                       p2_pm_l1sub_state_o;
       logic                                                                             p2_clkreq_in_n_i;
       logic                                                                             p2_app_clk_req_n_i;
       
       logic                                                                             p2_rx_st_ready_i;
       logic [seg_width_hwtcl-1:0]                                                       p2_rx_st0_data_o;    
       logic                                                                             p2_rx_st0_sop_o;
       logic                                                                             p2_rx_st0_eop_o;
       logic                                                                             p2_rx_st0_dvalid_o;
       logic [$clog2(seg_width_hwtcl/32)-1:0]                                           p2_rx_st0_empty_o;   
       
       logic [127:0]                                                                     p2_rx_st0_hdr_o;
       logic [31:0]                                                                      p2_rx_st0_prefix_o;
       logic                                                                             p2_rx_st0_hvalid_o;
       logic                                                                             p2_rx_st0_pvalid_o;
       logic [7:0]                                                                       p2_rx_st0_data_par_o = '0;
       logic [3:0]                                                                       p2_rx_st0_hdr_par_o = '0;
       logic                                                                             p2_rx_st0_prefix_par_o ='0;
       logic [2:0]                                                                       p2_rx_st0_bar_o;
       logic                                                                             p2_rx_st0_vfactive_o;
       logic [10:0]                                                                      p2_rx_st0_vfnum_o;
       logic [2:0]                                                                       p2_rx_st0_pfnum_o;
       logic                                                                             p2_rx_st0_pt_parity_o;
       
       logic [seg_width_hwtcl-1:0]                                                       p2_rx_st1_data_o;    
       logic                                                                             p2_rx_st1_sop_o;
       logic                                                                             p2_rx_st1_eop_o;
       logic                                                                             p2_rx_st1_dvalid_o;
       logic [$clog2(seg_width_hwtcl/32)-1:0]                                           p2_rx_st1_empty_o;   
       
       logic [127:0]                                                                     p2_rx_st1_hdr_o;
       logic [31:0]                                                                      p2_rx_st1_prefix_o;
       logic                                                                             p2_rx_st1_hvalid_o;
       logic                                                                             p2_rx_st1_pvalid_o;
       logic [7:0]                                                                       p2_rx_st1_data_par_o = '0;
       logic [3:0]                                                                       p2_rx_st1_hdr_par_o = '0;
       logic                                                                             p2_rx_st1_prefix_par_o = '0;
       logic [2:0]                                                                       p2_rx_st1_bar_o;
       logic                                                                             p2_rx_st1_vfactive_o;
       logic [10:0]                                                                      p2_rx_st1_vfnum_o;
       logic [2:0]                                                                       p2_rx_st1_pfnum_o;
       logic                                                                             p2_rx_st1_pt_parity_o;
       logic                                                                             p2_rx_st_par_err_o;
       
       logic                                                                             p2_rx_dsk_valid_o;
       logic                                                                             p2_rx_dsk_eval_done_o;
       logic                                                                             p2_rx_dsk_lock_err_o;
       logic [511:0]                                                                     p2_rx_dsk_monitor_err_o;
       
       logic [2:0]                                                                       p2_rx_st_hcrdt_init_i;
       logic [2:0]                                                                       p2_rx_st_hcrdt_update_i;
       logic [5:0]                                                                       p2_rx_st_hcrdt_update_cnt_i;
       logic [2:0]                                                                       p2_rx_st_hcrdt_init_ack_o;
       logic [2:0]                                                                       p2_rx_st_dcrdt_init_i;
       logic [2:0]                                                                       p2_rx_st_dcrdt_update_i;
       logic [11:0]                                                                      p2_rx_st_dcrdt_update_cnt_i;
       logic [2:0]                                                                       p2_rx_st_dcrdt_init_ack_o;
       
       logic [2:0]                                                                       p2_tx_st_hcrdt_init_o;
       logic [2:0]                                                                       p2_tx_st_hcrdt_update_o;
       logic [5:0]                                                                       p2_tx_st_hcrdt_update_cnt_o;
       logic [2:0]                                                                       p2_tx_st_hcrdt_init_ack_i;
       logic [2:0]                                                                       p2_tx_st_dcrdt_init_o;
       logic [2:0]                                                                       p2_tx_st_dcrdt_update_o;
       logic [11:0]                                                                      p2_tx_st_dcrdt_update_cnt_o;
       logic [2:0]                                                                       p2_tx_st_dcrdt_init_ack_i;
       
       logic                                                                             p2_tx_st_ready_o;
       logic [seg_width_hwtcl-1:0]                                                       p2_tx_st0_data_i;    
       logic                                                                             p2_tx_st0_sop_i;
       logic                                                                             p2_tx_st0_eop_i;
       logic                                                                             p2_tx_st0_dvalid_i;
       
       logic [127:0]                                                                     p2_tx_st0_hdr_i;
       logic [31:0]                                                                      p2_tx_st0_prefix_i;
       logic                                                                             p2_tx_st0_hvalid_i;
       logic                                                                             p2_tx_st0_pvalid_i;
       logic [7:0]                                                                       p2_tx_st0_data_par_i;
       logic [3:0]                                                                       p2_tx_st0_hdr_par_i;
       logic                                                                             p2_tx_st0_prefix_par_i;
       
       logic [seg_width_hwtcl-1:0]                                                       p2_tx_st1_data_i;    
       logic                                                                             p2_tx_st1_sop_i;
       logic                                                                             p2_tx_st2_sop_i;
       logic                                                                             p2_tx_st3_sop_i;
       logic                                                                             p2_tx_st1_eop_i;
       logic                                                                             p2_tx_st1_dvalid_i;
       
       logic [127:0]                                                                     p2_tx_st1_hdr_i;
       logic [31:0]                                                                      p2_tx_st1_prefix_i;
       logic                                                                             p2_tx_st1_hvalid_i;
       logic                                                                             p2_tx_st1_pvalid_i;
       logic [7:0]                                                                       p2_tx_st1_data_par_i;
       logic [3:0]                                                                       p2_tx_st1_hdr_par_i;
       logic                                                                             p2_tx_st1_prefix_par_i;
       logic                                                                             p2_tx_st_par_err_o;
 
 
       
       logic                                                                             p2_tx_ehp_deallocate_empty_o;
 
   logic                                                                                  p2_vf_err_ur_posted_s0_o;
   logic                                                                                  p2_vf_err_ur_posted_s1_o;
   logic [2:0]                                                                            p2_vf_err_func_num_s0_o;
   logic [2:0]                                                                            p2_vf_err_func_num_s1_o;
   logic                                                                                  p2_vf_err_ca_postedreq_s0_o;
   logic                                                                                  p2_vf_err_ca_postedreq_s1_o;
   logic [10:0]                                                                           p2_vf_err_vf_num_s0_o;
   logic [10:0]                                                                           p2_vf_err_vf_num_s1_o;
   logic                                                                                  p2_vf_err_poisonedwrreq_s0_o;
   logic                                                                                  p2_vf_err_poisonedwrreq_s1_o;
   logic                                                                                  p2_vf_err_poisonedcompl_s0_o;
   logic                                                                                  p2_vf_err_poisonedcompl_s1_o;
   logic [2:0]                                                                            p2_user_vfnonfatalmsg_func_num_i;
   logic [10:0]                                                                           p2_user_vfnonfatalmsg_vfnum_i;
   logic                                                                                  p2_user_sent_vfnonfatalmsg_i;
   logic                                                                                  p2_vf_err_overflow_o;
   logic                                                                                  p2_user_vfnonfatalmsg_ready_o;
 
 
 
 

       
   logic [5:0]                                                                            p3_ltssm_state_delay_o;
       
       logic                                                                             p3_slow_reset_status_n;
       
       
       logic                                                                             p3_sys_eml_interlock_engaged_i;
       logic                                                                             p3_sys_cmd_cpled_int_i;
       logic                                                                             p3_sys_pwr_fault_det_i;
       logic                                                                             p3_sys_mrl_sensor_state_i;
       logic                                                                             p3_sys_pre_det_state_i;
       logic                                                                             p3_sys_atten_button_pressed_i;
       
       logic                                                                             p3_mnpput_o;
       logic                                                                             p3_mpcput_o;
       logic                                                                             p3_mnpcup_i;
       logic                                                                             p3_mpccup_i;
       logic                                                                             p3_meom_o;
       logic [15:0]                                                                      p3_mpayload_o;
       logic                                                                             p3_mparity_o;
       logic [2:0]                                                                       p3_side_ism_fabric_i;
       logic                                                                             p3_tnpput_i;
       logic                                                                             p3_tpcput_i;
       logic                                                                             p3_tnpcup_o;
       logic                                                                             p3_tpccup_o;
       logic                                                                             p3_teom_i;
       logic [15:0]                                                                      p3_tpayload_i;
       logic                                                                             p3_tparity_i;
       logic [2:0]                                                                       p3_side_ism_agent_o;
       
       logic [7:0]                                                                       p3_pld_gp_status_i;
       logic [7:0]                                                                       p3_pld_gp_ctrl_o;
       logic                                                                             p3_pld_gp_status_ready_o;
       
       
       logic                                                                             p3_app_err_valid_i;
       logic [31:0]                                                                      p3_app_err_hdr_i;
       logic [13:0]                                                                      p3_app_err_info_i;
       logic [2:0]                                                                       p3_app_err_func_num_i;
       logic                                                                             p3_app_err_ready_o;
       logic                                                                             p3_serr_out_o;
       
       logic [2:0]                                                                       p3_prs_event_func_i;
       
        logic [7:0]                                                                       p3_flr_rcvd_pf_o;
        logic                                                                             p3_flr_rcvd_vf_o;
        logic [2:0]                                                                       p3_flr_rcvd_pf_num_o;
        logic [10:0]                                                                      p3_flr_rcvd_vf_num_o;
        logic [7:0]                                                                       p3_flr_completed_pf_i;
        logic                                                                             p3_flr_completed_vf_i;
        logic [2:0]                                                                       p3_flr_completed_pf_num_i;
        logic [10:0]                                                                      p3_flr_completed_vf_num_i;
        logic                                                                             p3_flr_completed_ready_o;
       
       logic                                                                             p3_cpl_timeout_o;
       logic [2:0]                                                                       p3_cpl_timeout_func_num_o;
       logic [10:0]                                                                      p3_cpl_timeout_vfunc_num_o;
       logic                                                                             p3_cpl_timeout_vfunc_active_o;
       logic [2:0]                                                                       p3_cpl_timeout_cpl_tc_o;
       logic [1:0]                                                                       p3_cpl_timeout_cpl_attr_o;
       logic [11:0]                                                                      p3_cpl_timeout_cpl_len_o;
       logic [9:0]                                                                       p3_cpl_timeout_cpl_tag_o;
 
       logic                                                                             p3_cii_req_o;
       logic                                                                             p3_cii_hdr_poisoned_o;
       logic [3:0]                                                                       p3_cii_hdr_first_be_o;
       logic [2:0]                                                                       p3_cii_func_num_o;
       logic                                                                             p3_cii_wr_o;
       logic [9:0]                                                                       p3_cii_addr_o;
       logic [31:0]                                                                      p3_cii_dout_o;
       logic                                                                             p3_cii_override_en_i;
       logic [31:0]                                                                      p3_cii_override_din_i;
       logic                                                                             p3_cii_halt_i;
       logic                                                                             p3_cii_wr_vf_active_o;
       logic [10:0]                                                                      p3_cii_vf_num_o;
 
       logic [2:0]                                                                       p3_virtio_pcicfg_pfnum_o;
       logic [31:0]                                                                      p3_virtio_pcicfg_length_o;
       logic [7:0]                                                                       p3_virtio_pcicfg_bar_o;
       logic [31:0]                                                                      p3_virtio_pcicfg_baroffset_o;
       logic                                                                             p3_virtio_pcicfg_cfgwr_o;
       logic [31:0]                                                                      p3_virtio_pcicfg_cfgdata_o;
       logic [31:0]                                                                      p3_virtio_pcicfg_data_i;
       logic                                                                             p3_virtio_pcicfg_rdack_i;
       logic                                                                             p3_virtio_pcicfg_cfgrd_o;
       logic                                                                             p3_virtio_pcicfg_vfaccess_o;
       logic [10:0]                                                                      p3_virtio_pcicfg_vfnum_o;
       logic [3:0]                                                                       p3_virtio_pcicfg_rdbe_i;
       logic [10:0]                                                                      p3_virtio_pcicfg_appvfnum_i;
       logic [2:0]                                                                       p3_virtio_pcicfg_apppfnum_i;
       
       logic [7:0]                                                                       p3_hip_reconfig_readdata_o;
       logic                                                                             p3_hip_reconfig_readdatavalid_o;
       logic                                                                             p3_hip_reconfig_waitrequest_o;
       logic [31:0]                                                                      p3_hip_reconfig_address_i;
       logic                                                                             p3_hip_reconfig_write_i;
       logic [7:0]                                                                       p3_hip_reconfig_writedata_i;
       logic                                                                             p3_hip_reconfig_read_i;
       
       logic                                                                             p3_local_ref_clk_req_n_o;
       logic                                                                             p3_cfg_l1sub_en_o;
       logic                                                                             p3_pm_linkst_in_l1sub_o;
       logic [7:0]                                                                       p3_pm_l1sub_state_o;
       logic                                                                             p3_clkreq_in_n_i;
       logic                                                                             p3_app_clk_req_n_i;
       
       logic                                                                             p3_rx_st_ready_i;
       logic [seg_width_hwtcl-1:0]                                                       p3_rx_st0_data_o;    
       logic                                                                             p3_rx_st0_sop_o;
       logic                                                                             p3_rx_st0_eop_o;
       logic                                                                             p3_rx_st0_dvalid_o;
       logic [$clog2(seg_width_hwtcl/32)-1:0]                                           p3_rx_st0_empty_o;   
       
       logic [127:0]                                                                     p3_rx_st0_hdr_o;
       logic [31:0]                                                                      p3_rx_st0_prefix_o;
       logic                                                                             p3_rx_st0_hvalid_o;
       logic                                                                             p3_rx_st0_pvalid_o;
       logic [7:0]                                                                       p3_rx_st0_data_par_o = '0;
       logic [3:0]                                                                       p3_rx_st0_hdr_par_o = '0;
       logic                                                                             p3_rx_st0_prefix_par_o = '0;
       logic [2:0]                                                                       p3_rx_st0_bar_o;
       logic                                                                             p3_rx_st0_vfactive_o;
       logic [10:0]                                                                      p3_rx_st0_vfnum_o;
       logic [2:0]                                                                       p3_rx_st0_pfnum_o;
       logic                                                                             p3_rx_st0_pt_parity_o;
       
       logic [seg_width_hwtcl-1:0]                                                       p3_rx_st1_data_o;    
       logic                                                                             p3_rx_st1_sop_o;
       logic                                                                             p3_rx_st1_eop_o;
       logic                                                                             p3_rx_st1_dvalid_o;
       logic [$clog2(seg_width_hwtcl/32)-1:0]                                           p3_rx_st1_empty_o;   
        
       logic [127:0]                                                                     p3_rx_st1_hdr_o;
       logic [31:0]                                                                      p3_rx_st1_prefix_o;
       logic                                                                             p3_rx_st1_hvalid_o;
       logic                                                                             p3_rx_st1_pvalid_o;
       logic [7:0]                                                                       p3_rx_st1_data_par_o = '0;
       logic [3:0]                                                                       p3_rx_st1_hdr_par_o = '0;
       logic                                                                             p3_rx_st1_prefix_par_o = '0;
       logic [2:0]                                                                       p3_rx_st1_bar_o;
       logic                                                                             p3_rx_st1_vfactive_o;
       logic [10:0]                                                                      p3_rx_st1_vfnum_o;
       logic [2:0]                                                                       p3_rx_st1_pfnum_o;
       logic                                                                             p3_rx_st1_pt_parity_o;
       logic                                                                             p3_rx_st_par_err_o;
       
       logic                                                                             p3_rx_dsk_valid_o;
       logic                                                                             p3_rx_dsk_eval_done_o;
       logic                                                                             p3_rx_dsk_lock_err_o;
       logic [511:0]                                                                     p3_rx_dsk_monitor_err_o;
       
       logic [2:0]                                                                       p3_rx_st_hcrdt_init_i;
       logic [2:0]                                                                       p3_rx_st_hcrdt_update_i;
       logic [5:0]                                                                       p3_rx_st_hcrdt_update_cnt_i;
       logic [2:0]                                                                       p3_rx_st_hcrdt_init_ack_o;
       logic [2:0]                                                                       p3_rx_st_dcrdt_init_i;
       logic [2:0]                                                                       p3_rx_st_dcrdt_update_i;
       logic [11:0]                                                                      p3_rx_st_dcrdt_update_cnt_i;
       logic [2:0]                                                                       p3_rx_st_dcrdt_init_ack_o;
       
       logic [2:0]                                                                       p3_tx_st_hcrdt_init_o;
       logic [2:0]                                                                       p3_tx_st_hcrdt_update_o;
       logic [5:0]                                                                       p3_tx_st_hcrdt_update_cnt_o;
       logic [2:0]                                                                       p3_tx_st_hcrdt_init_ack_i;
       logic [2:0]                                                                       p3_tx_st_dcrdt_init_o;
       logic [2:0]                                                                       p3_tx_st_dcrdt_update_o;
       logic [11:0]                                                                      p3_tx_st_dcrdt_update_cnt_o;
       logic [2:0]                                                                       p3_tx_st_dcrdt_init_ack_i;
       
       logic                                                                             p3_tx_st_ready_o;
       logic [seg_width_hwtcl-1:0]                                                       p3_tx_st0_data_i;    
       logic                                                                             p3_tx_st0_sop_i;
       logic                                                                             p3_tx_st0_eop_i;
       logic                                                                             p3_tx_st0_dvalid_i;
       
       logic [127:0]                                                                     p3_tx_st0_hdr_i;
       logic [31:0]                                                                      p3_tx_st0_prefix_i;
       logic                                                                             p3_tx_st0_hvalid_i;
       logic                                                                             p3_tx_st0_pvalid_i;
       logic [7:0]                                                                       p3_tx_st0_data_par_i;
       logic [3:0]                                                                       p3_tx_st0_hdr_par_i;
       logic                                                                             p3_tx_st0_prefix_par_i;
       
       logic [seg_width_hwtcl-1:0]                                                       p3_tx_st1_data_i;    
       logic [seg_width_hwtcl-1:0]                                                       p3_tx_st3_data_i;    
       logic                                                                             p3_tx_st1_sop_i;
       logic                                                                             p3_tx_st1_eop_i;
       logic                                                                             p3_tx_st1_dvalid_i;
       
       logic [127:0]                                                                     p3_tx_st1_hdr_i;
       logic [31:0]                                                                      p3_tx_st1_prefix_i;
       logic                                                                             p3_tx_st1_hvalid_i;
       logic                                                                             p3_tx_st1_pvalid_i;
       logic [7:0]                                                                       p3_tx_st1_data_par_i;
       logic [3:0]                                                                       p3_tx_st1_hdr_par_i;
       logic                                                                             p3_tx_st1_prefix_par_i;
       logic                                                                             p3_tx_st_par_err_o;
 
 
       
       logic                                                                             p3_tx_ehp_deallocate_empty_o;
 
   logic                                                                                  p3_vf_err_ur_posted_s0_o;
   logic                                                                                  p3_vf_err_ur_posted_s1_o;
   logic [2:0]                                                                            p3_vf_err_func_num_s0_o;
   logic [2:0]                                                                            p3_vf_err_func_num_s1_o;
   logic                                                                                  p3_vf_err_ca_postedreq_s0_o;
   logic                                                                                  p3_vf_err_ca_postedreq_s1_o;
   logic [10:0]                                                                           p3_vf_err_vf_num_s0_o;
   logic [10:0]                                                                           p3_vf_err_vf_num_s1_o;
   logic                                                                                  p3_vf_err_poisonedwrreq_s0_o;
   logic                                                                                  p3_vf_err_poisonedwrreq_s1_o;
   logic                                                                                  p3_vf_err_poisonedcompl_s0_o;
   logic                                                                                  p3_vf_err_poisonedcompl_s1_o;
   logic [2:0]                                                                            p3_user_vfnonfatalmsg_func_num_i;
   logic [10:0]                                                                           p3_user_vfnonfatalmsg_vfnum_i;
   logic                                                                                  p3_user_sent_vfnonfatalmsg_i;
   logic                                                                                  p3_vf_err_overflow_o;
   logic                                                                                  p3_user_vfnonfatalmsg_ready_o;
 
 
 
   assign p0_app_slow_reset_status_n = p0_slow_reset_status_n;
 

generate
if (device_type == "EP") begin : EP_RTILE_WRAPPER 
  intel_pciess_rtile_wrapper #(
    .device_family                   (device_family),
    .TILE                            (TILE),
    .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
    .device_type                     (device_type),
    .FUNC_MODE                       (core16_FUNC_MODE),
    .HEADER_SCHEME                   (core16_HEADER_SCHEME),
    .Header_Packing_scheme           (core16_Header_Packing_scheme),
    .DWIDTH                          (core16_DWIDTH),
    .NUM_OF_SEG                      (core16_NUM_OF_SEG),

    .ST_readyLatency                 (core16_ST_readyLatency),
    .CRS_EN_DEFAULT_VAL              (core16_CRS_EN_DEFAULT),
    .LiteSlvAWD                      (core16_LiteSlvAWD),
    .LiteSlvDWD                      (core16_LiteSlvDWD),
    .LiteMstrAWD                     (core16_LiteMstrAWD),
    .LiteMstrDWD                     (core16_LiteMstrDWD),
    .LiteMstr_readyLatency           (core16_LiteMstr_readyLatency),
    .MMAWD                           (core16_MMAWD),
    .MMBLWD                          (core16_MMBLWD),
    .MMDWD                           (core16_MMDWD),
    .MM_readyLatency                 (core16_MM_readyLatency),
    .MSIX_TABLE                      (core16_MSIX_TABLE),
    .MSIX_DYN_SIZE_BYPASS            (core16_MSIX_DYN_SIZE_BYPASS),
    .autonomous_pm_enter_l23         (core16_autonomous_pm_enter_l23),
    .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
    .device_att                      (core16_device_att),
    .perfmon_clk_freq                (core16_perfmon_clk_freq),
    .SS_PWIDTH                       (SS_PWIDTH),
    .seg_width_hwtcl                 (seg_width_hwtcl),
    .hssi_ctp_func_mode              (hssi_ctp_func_mode),
    .hssi_ctp_topology               (hssi_ctp_topology),
    .payload_width                   (core16_payload_width_integer_hwtcl),
    .hdr_width                       (core16_hdr_width_integer_hwtcl),
    .pfx_width                       (core16_pfx_width_integer_hwtcl),
    .double_width                    (core16_double_width_integer_hwtcl),
    .empty_width                     (core16_empty_width_integer_hwtcl),
    .enable_sriov                    (core16_enable_sriov_hwtcl),
    .total_pf_count                  (core16_total_pf_count_hwtcl),
    .total_vf_count                  (core16_total_vf_count_hwtcl),
    .pf0_vf_count                    (core16_pf0_vf_count_hwtcl),
    .pf1_vf_count                    (core16_pf1_vf_count_hwtcl),
    .pf2_vf_count                    (core16_pf2_vf_count_hwtcl),
    .pf3_vf_count                    (core16_pf3_vf_count_hwtcl),
    .pf4_vf_count                    (core16_pf4_vf_count_hwtcl),
    .pf5_vf_count                    (core16_pf5_vf_count_hwtcl),
    .pf6_vf_count                    (core16_pf6_vf_count_hwtcl),
    .pf7_vf_count                    (core16_pf7_vf_count_hwtcl),

    .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
    .virtio_pci_cfg_acc_intf_en_hwtcl(core16_virtio_pci_cfg_acc_intf_en_hwtcl),

    .PF0_SLOT_IMP                    (hssi_ctp_u_wrpcie_top_u_core16_pf0_pcie_slot_imp),     		 
    .PORT_ID                         (0),
    .ENABLE_VIRTIO                   (core16_enable_virtio_hwtcl),
    .ENABLE_DFL                      (core16_dfl_en_hwtcl),
    .dfl_next_cap_offset             (core16_dfl_next_cap_offset),
    .dfl_total                       (core16_dfl_total),
    .ENABLE_CEB                      (core16_ceb_en_hwtcl),
    .ENABLE_CII                      (core16_cii_en_hwtcl),
    .ENABLE_CONFIG_MONITORING        (core16_enable_config_monitoring_hwtcl),

    .PF_STD_NEXT_ADDR_PTR            (core16_ceb_pf_std_cap_last_ptr),
    .PF_EXT_NEXT_ADDR_PTR            (core16_ceb_pf_ext_cap_last_ptr),
    .VF_STD_NEXT_ADDR_PTR            (core16_ceb_vf_std_cap_last_ptr),
    .VF_EXT_NEXT_ADDR_PTR            (core16_ceb_vf_ext_cap_last_ptr),
    .CEB_TIMEOUT                     (core16_ceb_ack_latency_hwtcl),
    .CII_TIMEOUT                     (core16_cii_ack_latency_hwtcl),

    .dfh_fid_hwtcl                   (core16_dfh_fid_hwtcl),
    .dfh_major_ver_hwtcl             (core16_dfh_major_ver_hwtcl),
    .dfh_next_byte_offset_hwtcl      (core16_dfh_next_byte_offset_hwtcl),
    .dfh_end_hwtcl                   (core16_dfh_end_hwtcl),
    .dfh_minor_rev_hwtcl             (core16_dfh_minor_rev_hwtcl),
    .dfh_ver_hwtcl                   (core16_dfh_ver_hwtcl),
    .dfh_feature_type_hwtcl          (core16_dfh_feature_type_hwtcl),
    .inst_id_hwtcl                   (core16_inst_id_hwtcl),    

    .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
    .PERFMON_EN                      (PERFMON_EN),
    .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
    .HIGH_SPEED                      (HIGH_SPEED)

   	
	) u_pciess_p0 (
    	  .ninit_done 					   (ninit_done),
          .slow_clk                        ( slow_clk                       ),
          .slow_rst_n                      ( p0_slow_reset_status_n         ),
    	  .axi_st_clk                      (p0_axi_st_clk),
    	  .axi_lite_clk                    (p0_axi_lite_clk),
    	  .axi_st_areset_n                 (p0_axi_st_areset_n),
    	  .axi_lite_areset_n               (p0_axi_lite_areset_n),
    	  .axi_mm_clk                      (p0_axi_mm_clk),
    	  .axi_mm_areset_n                 (p0_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            (p0_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            (p0_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        (p0_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        (p0_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               (p0_subsystem_rst_req),
    	  .subsystem_rst_rdy               (p0_subsystem_rst_rdy),
    	  .initiate_warmrst_req            (p0_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            (p0_initiate_rst_req_rdy),
		  
          .ss_app_st_rx_tvalid             (p0_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             (p0_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              (p0_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              (p0_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              (p0_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       (p0_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment (p0_ss_app_st_rx_tuser_last_segment),	      
	  .ss_app_st_rx_tuser_hvalid       (p0_ss_app_st_rx_tuser_hvalid ),					
	  .ss_app_st_rx_tuser_transaction_abort (p0_ss_app_st_rx_tuser_transaction_abort ),
	  .ss_app_st_rx_tuser_hdr      	   (p0_ss_app_st_rx_tuser_hdr  ),

	  .app_ss_st_tx_tvalid             (p0_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             (p0_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              (p0_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              (p0_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              (p0_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       (p0_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment (p0_app_ss_st_tx_tuser_last_segment),
	  .app_ss_st_tx_tuser_hvalid       (p0_app_ss_st_tx_tuser_hvalid),
	  .app_ss_st_tx_tuser_transaction_abort (p0_app_ss_st_tx_tuser_transaction_abort),
	  .app_ss_st_tx_tuser_hdr          (p0_app_ss_st_tx_tuser_hdr),

	  .ss_app_st_ciireq_tvalid	       (p0_ss_app_st_ciireq_tvalid),
    	  .app_ss_st_ciireq_tready	       (p0_app_ss_st_ciireq_tready),
    	  .ss_app_st_ciireq_tdata	         (p0_ss_app_st_ciireq_tdata),
    	  .app_ss_st_ciiresp_tvalid	       (p0_app_ss_st_ciiresp_tvalid),
    	  .app_ss_st_ciiresp_tdata	       (p0_app_ss_st_ciiresp_tdata),
    	  
	  .ss_app_st_cebreq_tvalid         (p0_ss_app_st_cebreq_tvalid),
    	  .app_ss_st_cebreq_tready         (p0_app_ss_st_cebreq_tready),
    	  .ss_app_st_cebreq_tdata          (p0_ss_app_st_cebreq_tdata),
    	  .app_ss_st_cebresp_tvalid        (p0_app_ss_st_cebresp_tvalid),
    	  .app_ss_st_cebresp_tdata         (p0_app_ss_st_cebresp_tdata),
		  
    	  .ss_app_st_ctrlshadow_tvalid     (p0_ss_app_st_ctrlshadow_tvalid),
    	  .ss_app_st_ctrlshadow_tdata      (p0_ss_app_st_ctrlshadow_tdata),

		  .ss_app_st_flrrcvd_tvalid        (p0_ss_app_st_flrrcvd_tvalid),
    	  .ss_app_st_flrrcvd_tdata         (p0_ss_app_st_flrrcvd_tdata),
    	  .app_ss_st_flrcmpl_tvalid        (p0_app_ss_st_flrcmpl_tvalid),
    	  .app_ss_st_flrcmpl_tdata         (p0_app_ss_st_flrcmpl_tdata),
	  .ss_app_st_flrcmpl_tready        (p0_ss_app_st_flrcmpl_tready),
    	  
		  .ss_app_st_txcrdt_tvalid         (p0_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          (p0_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   (p0_ss_app_st_rxcrdt_tvalid), 		
    	  .ss_app_st_rxcrdt_tdata  		   (p0_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          (p0_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           (p0_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid            (p0_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	           (p0_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type  (p0_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast             (p0_app_ss_st_err_tlast),
          .ss_app_st_err_tready            (p0_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         (p0_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         (p0_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          (p0_lite_csr_awaddr),
          
   		  .app_ss_lite_csr_wvalid          (p0_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          (p0_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           (p0_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           (p0_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          (p0_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          (p0_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           (p0_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         (p0_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         (p0_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          (p0_lite_csr_araddr),
          
  		  .ss_app_lite_csr_rvalid          (p0_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          (p0_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           (p0_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           (p0_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  (p0_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   (p0_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  (p0_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid (p0_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            (p0_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        (p0_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              (p0_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          (p0_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            (p0_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        (p0_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              (p0_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          (p0_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            (p0_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        (p0_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              (p0_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          (p0_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            (p0_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        (p0_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              (p0_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          (p0_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p0_coreclkout_hip_i     ),
          .rst_n                                (p0_reset_status_n_i     ),

          .rx_st0_bar_i                         (p0_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p0_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p0_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p0_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st0_pfnum_o     :  '0     ),
          .rx_st1_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st1_pfnum_o     :  '0     ),
          .rx_st2_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st2_pfnum_o     :  '0     ),
          .rx_st3_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st3_pfnum_o     :  '0     ),

          .rx_st0_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p0_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p0_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p0_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p0_rx_st3_eop_o),                

          .rx_st0_header_i                      (p0_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p0_rx_st1_hdr_o),                
          .rx_st2_header_i                      (p0_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p0_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p0_rx_st0_data_o),               
          .rx_st1_payload_i                     (p0_rx_st1_data_o),               
          .rx_st2_payload_i                     (p0_rx_st2_data_o),               
          .rx_st3_payload_i                     (p0_rx_st3_data_o),               

          .rx_st0_sop_i                         (p0_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p0_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p0_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p0_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p0_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p0_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p0_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p0_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p0_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p0_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p0_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p0_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p0_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p0_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p0_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p0_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p0_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p0_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p0_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p0_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p0_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p0_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p0_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p0_rx_st3_prefix_o),             

          .rx_par_err_i                         (p0_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p0_rx_st_ready_i		),               
		  .rx_st0_data_par_i 					(p0_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p0_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p0_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p0_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p0_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p0_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p0_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p0_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p0_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p0_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p0_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p0_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p0_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p0_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p0_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p0_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p0_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p0_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p0_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p0_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p0_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p0_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p0_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p0_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p0_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p0_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p0_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p0_tx_st3_eop_i),                

          .tx_st0_header_o                      (p0_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p0_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p0_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p0_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p0_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p0_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p0_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p0_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p0_tx_st0_data_i),               
          .tx_st1_payload_o                     (p0_tx_st1_data_i),               
          .tx_st2_payload_o                     (p0_tx_st2_data_i),               
          .tx_st3_payload_o                     (p0_tx_st3_data_i),               

          .tx_st0_sop_o                         (p0_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p0_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p0_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p0_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p0_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p0_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p0_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p0_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p0_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p0_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p0_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p0_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p0_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p0_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p0_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p0_tx_st3_pvalid_i),             

          .tx_par_err_i                         (  p0_tx_st_par_err_o              ),
          .tx_st_ready_i                        (p0_tx_st_ready_o),               

          .dl_timer_update_i                    ( p0_dl_timer_update_o              ),
          .dl_up_i                              ( p0_dl_up_o                        ), 
          .link_up_i                            ( p0_link_up_o                      ), 

          .app_rst_n 							(),
	  	  .pin_perst_n                          ( p0_pin_perst_n                   ),	
    	  .app_clk 								(),

		  .hip_reconfig_read_o                  ( p0_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p0_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p0_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p0_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p0_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p0_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p0_hip_reconfig_waitrequest_o        ),

 		  .cii_req_i                            ( p0_cii_req_o                         ),
          .cii_hdr_poisoned_i                   ( p0_cii_hdr_poisoned_o                ),
          .cii_hdr_first_be_i                   ( p0_cii_hdr_first_be_o                ),
          .cii_func_num_i                       ( (core16_total_pf_count_hwtcl != 1) ? p0_cii_func_num_o : '0 ),
          .cii_wr_i                             ( p0_cii_wr_o                          ),
          .cii_addr_i                           ( p0_cii_addr_o                        ),
          .cii_dout_i                           ( p0_cii_dout_o                        ),
          .cii_override_en_o                    ( p0_cii_override_en_i  ), 
          .cii_override_din_o                   ( p0_cii_override_din_i ), 
          .cii_halt_o                           ( p0_cii_halt_i         ), 
          .cii_wr_vf_active_i                   ( core16_enable_sriov_hwtcl ? p0_cii_wr_vf_active_o : '0 ),
          .cii_vf_num_i                         ( core16_enable_sriov_hwtcl ? p0_cii_vf_num_o       : '0 ),
		  
	  .flr_rcvd_pf_i                        (  core16_flr_cap_hwtcl ? p0_flr_rcvd_pf_o : '0                                                ),
          .flr_rcvd_vf_i                        ( (core16_flr_cap_hwtcl & core16_enable_sriov_hwtcl) ? p0_flr_rcvd_vf_o : '0                   ),
          .flr_rcvd_pf_num_i                    ( (core16_flr_cap_hwtcl & core16_enable_sriov_hwtcl) ? p0_flr_rcvd_pf_num_o : '0               ),
          .flr_rcvd_vf_num_i                    ( (core16_flr_cap_hwtcl & core16_enable_sriov_hwtcl) ? p0_flr_rcvd_vf_num_o : '0               ),
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
		  
		  .app_err_valid_o                      ( p0_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p0_app_err_hdr_i                       ),
          .app_err_info_o                       ( p0_app_err_info_i                      ),
          .app_err_func_num_o                   ( p0_app_err_func_num_i                  ),
          
		  .serr_i                               ( p0_serr_out_o                          ),
          .app_err_ready_i                      ( p0_app_err_ready_o                     ),
		  
		  .hip_msi_pnd_func_o 					(	),
    	  .hip_msi_pnd_addr_o 					(	),
    	  .hip_msi_pnd_byte_o 					(	), 
 
		  .surprise_down_err_i                  (p0_surprise_down_err_o             ),
          .ltssm_state_i                        (p0_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p0_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p0_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p0_pm_curnt_state_o                ),
          .pm_dstate_i                          (p0_pm_dstate_o                     ),
          .pld_gp_ctrl_i                        (p0_pld_gp_ctrl_o                   ),
          .vf_err_ur_posted_s0_i                (p0_vf_err_ur_posted_s0_o           ),
          .vf_err_ur_posted_s1_i                (p0_vf_err_ur_posted_s1_o           ),
 
		.pld_in_use_i							(p0_pld_in_use_o	),	
        .user_mode_to_pld_i						(p0_user_mode_to_pld_o	),	
        .app_int_o								(p0_app_int_i	),	
        .msi_pnd_byte_o							(p0_msi_pnd_byte_i	),	
        .msi_pnd_func_o							(p0_msi_pnd_func_i	),	
        .msi_pnd_addr_o							(p0_msi_pnd_addr_i	),	
        .apps_pm_xmt_pme_o						(p0_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p0_app_xfer_pending_i	),	
        .app_init_rst_o							(p0_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p0_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p0_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p0_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p0_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p0_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p0_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p0_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p0_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p0_sys_eml_interlock_engaged_i	),	
        .virtio_pcicfg_appvfnum_o				(p0_virtio_pcicfg_appvfnum_i	),	
        .virtio_pcicfg_apppfnum_o				(p0_virtio_pcicfg_apppfnum_i	),	
        .virtio_pcicfg_rdack_o					(p0_virtio_pcicfg_rdack_i	),	
        .virtio_pcicfg_rdbe_o					(p0_virtio_pcicfg_rdbe_i	),	
        .virtio_pcicfg_data_o					(p0_virtio_pcicfg_data_i	),	
		.pld_gp_status_o						(p0_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p0_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p0_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p0_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p0_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(p0_app_req_retry_en_i	),	
        .prs_event_valid_o						(p0_prs_event_valid_i	),	
        .prs_event_func_o						(p0_prs_event_func_i	),	
        .prs_event_o							(p0_prs_event_i		 	),	
        
		.hip_reconfig_clk_o					   	(	),
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_vfaccess_o 	: '0	),	
        .virtio_pcicfg_vfnum_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_vfnum_o 		: '0	),	
        .virtio_pcicfg_pfnum_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_pfnum_o 		: '0	),	
        .virtio_pcicfg_bar_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_bar_o 		: '0	),	
        .virtio_pcicfg_length_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_length_o 	: '0	),	
        .virtio_pcicfg_baroffset_i				(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_baroffset_o	: '0	),	
        .virtio_pcicfg_cfgdata_i				(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_cfgdata_o 	: '0	),	
        .virtio_pcicfg_cfgwr_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_cfgwr_o 		: '0	),	
        .virtio_pcicfg_cfgrd_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_cfgrd_o 		: '0	),	
		
        .vf_err_ca_postedreq_s0_i               (p0_vf_err_ca_postedreq_s0_o         ),
        .vf_err_ca_postedreq_s1_i               (p0_vf_err_ca_postedreq_s1_o ),

        .vf_err_vf_num_s0_i                     (p0_vf_err_vf_num_s0_o                ),
        .vf_err_vf_num_s1_i                     (p0_vf_err_vf_num_s1_o),
 		.vf_err_poisonedwrreq_s0_i            	(p0_vf_err_poisonedwrreq_s0_o          ),
        .vf_err_poisonedwrreq_s1_i            	(p0_vf_err_poisonedwrreq_s1_o),
        .vf_err_poisonedcompl_s0_i              (p0_vf_err_poisonedcompl_s0_o         ),
        .vf_err_poisonedcompl_s1_i              (p0_vf_err_poisonedcompl_s1_o),
     	.vf_err_overflow_i                    	(p0_vf_err_overflow_o            ),  
 		
		.ss_app_vf_err_poisonedwrreq_s0_o       (p0_ss_app_vf_err_poisonedwrreq_s0  ), 
        .ss_app_vf_err_poisonedwrreq_s1_o       ( p0_ss_app_vf_err_poisonedwrreq_s1  ),
        .ss_app_vf_err_poisonedcompl_s0_o     	(p0_ss_app_vf_err_poisonedcompl_s0   ),
        .ss_app_vf_err_poisonedcompl_s1_o     	( p0_ss_app_vf_err_poisonedcompl_s1  ),

 		.ss_app_vf_err_ur_postedreq_s0_o      	(p0_ss_app_vf_err_ur_postedreq_s0    ),
        .ss_app_vf_err_ur_postedreq_s1_o      	( p0_ss_app_vf_err_ur_postedreq_s1   ),
        .ss_app_vf_err_ca_postedreq_s0_o      	(p0_ss_app_vf_err_ca_postedreq_s0    ), 
        .ss_app_vf_err_ca_postedreq_s1_o      	( p0_ss_app_vf_err_ca_postedreq_s1   ),
        
		.ss_app_vf_err_vf_num_s0_o            	(p0_ss_app_vf_err_vf_num_s0          ),   
        .ss_app_vf_err_vf_num_s1_o            	( p0_ss_app_vf_err_vf_num_s1      ),
        .ss_app_vf_err_func_num_s0            	(p0_ss_app_vf_err_func_num_s0     ),
        .ss_app_vf_err_func_num_s1            	( p0_ss_app_vf_err_func_num_s1    ),
	.ss_app_vf_err_overflow                	(p0_ss_app_vf_err_overflow            ),
        .app_ss_sent_vfnonfatalmsg              (p0_app_ss_sent_vfnonfatalmsg         ),
        .app_ss_vfnonfatalmsg_vf_num            (p0_app_ss_vfnonfatalmsg_vf_num       ),
        .app_ss_vfnonfatalmsg_func_num          (p0_app_ss_vfnonfatalmsg_func_num     ),
        .ss_app_vfnonfatalmsg_ready           	(p0_ss_app_vfnonfatalmsg_ready        ),
        .vf_err_func_num_s0_i                   ( p0_vf_err_func_num_s0_o    ),
        .vf_err_func_num_s1_i                   (p0_vf_err_func_num_s1_o)
     	
    );

    if (pciess_topology=="pcie_x4x4x4x4" || pciess_topology=="pcie_x8x8" || pciess_topology== "pcie_x4x4") begin : gen_pciess_p1
      intel_pciess_rtile_wrapper #(
      .device_family                   (device_family),
      .TILE                            (TILE),
	  .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
      .device_type                     ("EP"),
      .FUNC_MODE                       (core8_FUNC_MODE),
      .HEADER_SCHEME                   (core8_HEADER_SCHEME),
      .Header_Packing_scheme           (core8_Header_Packing_scheme),
      
	  .DWIDTH                          (core8_DWIDTH),
      .NUM_OF_SEG                      (core8_NUM_OF_SEG),
      
      .ST_readyLatency                 (core8_ST_readyLatency),
      .CRS_EN_DEFAULT_VAL              (core8_CRS_EN_DEFAULT),
      .LiteSlvAWD                      (core8_LiteSlvAWD),
      .LiteSlvDWD                      (core8_LiteSlvDWD),
      .LiteMstrAWD                     (core8_LiteMstrAWD),
      .LiteMstrDWD                     (core8_LiteMstrDWD),
      .LiteMstr_readyLatency           (core8_LiteMstr_readyLatency),
	  .MMAWD                           (core8_MMAWD),
      .MMBLWD                          (core8_MMBLWD),
      .MMDWD                           (core8_MMDWD),
      .MM_readyLatency                 (core8_MM_readyLatency),
      .MSIX_TABLE                      (core8_MSIX_TABLE),
      .autonomous_pm_enter_l23         (core8_autonomous_pm_enter_l23),
      .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
      .device_att                      (core8_device_att),
      .perfmon_clk_freq                (core8_perfmon_clk_freq),
      .SS_PWIDTH                       (SS_PWIDTH),
      .seg_width_hwtcl                 (seg_width_hwtcl), 
      .hssi_ctp_func_mode              (hssi_ctp_func_mode),
      .hssi_ctp_topology               (hssi_ctp_topology),
	  .payload_width                   (core8_payload_width_integer_hwtcl),
      .hdr_width                       (core8_hdr_width_integer_hwtcl),
      .pfx_width                       (core8_pfx_width_integer_hwtcl),
      .double_width                    (core8_double_width_integer_hwtcl),
      .empty_width                     (core8_empty_width_integer_hwtcl),
      .enable_sriov                    (core8_enable_sriov_hwtcl),
      .total_pf_count                  (core8_total_pf_count_hwtcl),
      .total_vf_count                  (core8_total_vf_count_hwtcl),
      .pf0_vf_count                    (core8_pf0_vf_count_hwtcl),
      .pf1_vf_count                    (core8_pf1_vf_count_hwtcl),
      .pf2_vf_count                    (core8_pf2_vf_count_hwtcl),
      .pf3_vf_count                    (core8_pf3_vf_count_hwtcl),
      .pf4_vf_count                    (core8_pf4_vf_count_hwtcl),
      .pf5_vf_count                    (core8_pf5_vf_count_hwtcl),
      .pf6_vf_count                    (core8_pf6_vf_count_hwtcl),
      .pf7_vf_count                    (core8_pf7_vf_count_hwtcl),
      
	  .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
      .virtio_pci_cfg_acc_intf_en_hwtcl(core8_virtio_pci_cfg_acc_intf_en_hwtcl),

	  .PF0_SLOT_IMP                    (hssi_ctp_u_wrpcie_top_u_core8_pf0_pcie_slot_imp),
      .PORT_ID                         (1),
      .ENABLE_VIRTIO                   (core8_enable_virtio_hwtcl),
      .ENABLE_DFL                      (core8_dfl_en_hwtcl),
      .dfl_next_cap_offset             (core8_dfl_next_cap_offset),
      .dfl_total                       (core8_dfl_total),
   	  .ENABLE_CEB                      (core8_ceb_en_hwtcl),
      .ENABLE_CII                      (core8_cii_en_hwtcl),
      .ENABLE_CONFIG_MONITORING        (core8_enable_config_monitoring_hwtcl),

      
      .PF_STD_NEXT_ADDR_PTR            (core8_ceb_pf_std_cap_last_ptr),
      .PF_EXT_NEXT_ADDR_PTR            (core8_ceb_pf_ext_cap_last_ptr),
      .VF_STD_NEXT_ADDR_PTR            (core8_ceb_vf_std_cap_last_ptr),
      .VF_EXT_NEXT_ADDR_PTR            (core8_ceb_vf_ext_cap_last_ptr),
      .CEB_TIMEOUT                     (core8_ceb_ack_latency_hwtcl),
      .CII_TIMEOUT                     (core8_cii_ack_latency_hwtcl),
      
	  .dfh_fid_hwtcl                   (core8_dfh_fid_hwtcl),
      .dfh_major_ver_hwtcl             (core8_dfh_major_ver_hwtcl),
      .dfh_next_byte_offset_hwtcl      (core8_dfh_next_byte_offset_hwtcl),
      .dfh_end_hwtcl                   (core8_dfh_end_hwtcl),
      .dfh_minor_rev_hwtcl             (core8_dfh_minor_rev_hwtcl),
      .dfh_ver_hwtcl                   (core8_dfh_ver_hwtcl),
      .dfh_feature_type_hwtcl          (core8_dfh_feature_type_hwtcl),
      .inst_id_hwtcl                   (core8_inst_id_hwtcl), 
      
      .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
      .PERFMON_EN                      (PERFMON_EN),
      .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
	  .HIGH_SPEED                      (HIGH_SPEED)
      ) u_pciess_p1 (
    	  .ninit_done 					   		(ninit_done),
          .slow_clk                        		( slow_clk                       ),
          .slow_rst_n                      		(p1_slow_reset_status_n         ),
    	  .axi_st_clk                      		(p1_axi_st_clk),
    	  .axi_lite_clk                    		(p1_axi_lite_clk),
    	  .axi_st_areset_n                 		(p1_axi_st_areset_n),
    	  .axi_lite_areset_n               		(p1_axi_lite_areset_n),
    	  .axi_mm_clk                      		(p1_axi_mm_clk),
    	  .axi_mm_areset_n                 		(p1_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            		(p1_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            		(p1_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        		(p1_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        		(p1_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               		(p1_subsystem_rst_req),
    	  .subsystem_rst_rdy               		(p1_subsystem_rst_rdy),
    	  .initiate_warmrst_req            		(p1_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            		(p1_initiate_rst_req_rdy),
		  
          .ss_app_st_rx_tvalid             		(p1_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             		(p1_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              		(p1_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              		(p1_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              		(p1_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       		(p1_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment 		(p1_ss_app_st_rx_tuser_last_segment),	      
          .ss_app_st_rx_tuser_hvalid                    (p1_ss_app_st_rx_tuser_hvalid ),					
          .ss_app_st_rx_tuser_transaction_abort         (p1_ss_app_st_rx_tuser_transaction_abort ),
          .ss_app_st_rx_tuser_hdr                       (p1_ss_app_st_rx_tuser_hdr  ),

          .app_ss_st_tx_tvalid             		(p1_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             		(p1_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              		(p1_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              		(p1_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              		(p1_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       		(p1_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment 		(p1_app_ss_st_tx_tuser_last_segment),
          .app_ss_st_tx_tuser_hvalid                    (p1_app_ss_st_tx_tuser_hvalid),
          .app_ss_st_tx_tuser_transaction_abort         (p1_app_ss_st_tx_tuser_transaction_abort),
          .app_ss_st_tx_tuser_hdr                       (p1_app_ss_st_tx_tuser_hdr),

		  .ss_app_st_ciireq_tvalid	       		(p1_ss_app_st_ciireq_tvalid),
    	  .app_ss_st_ciireq_tready	       		(p1_app_ss_st_ciireq_tready),
    	  .ss_app_st_ciireq_tdata	       		(p1_ss_app_st_ciireq_tdata),
    	  .app_ss_st_ciiresp_tvalid	       		(p1_app_ss_st_ciiresp_tvalid),
    	  .app_ss_st_ciiresp_tdata	       		(p1_app_ss_st_ciiresp_tdata),
    	  
		  .ss_app_st_cebreq_tvalid         		(p1_ss_app_st_cebreq_tvalid),
    	  .app_ss_st_cebreq_tready         		(p1_app_ss_st_cebreq_tready),
    	  .ss_app_st_cebreq_tdata          		(p1_ss_app_st_cebreq_tdata),
    	  .app_ss_st_cebresp_tvalid        		(p1_app_ss_st_cebresp_tvalid),
    	  .app_ss_st_cebresp_tdata         		(p1_app_ss_st_cebresp_tdata),
		  
    	  .ss_app_st_ctrlshadow_tvalid     		(p1_ss_app_st_ctrlshadow_tvalid),
    	  .ss_app_st_ctrlshadow_tdata      		(p1_ss_app_st_ctrlshadow_tdata),

		  .ss_app_st_flrrcvd_tvalid        		(p1_ss_app_st_flrrcvd_tvalid),
    	  .ss_app_st_flrrcvd_tdata         		(p1_ss_app_st_flrrcvd_tdata),
    	  .app_ss_st_flrcmpl_tvalid        		(p1_app_ss_st_flrcmpl_tvalid),
    	  .app_ss_st_flrcmpl_tdata         		(p1_app_ss_st_flrcmpl_tdata),
	  .ss_app_st_flrcmpl_tready                     (p1_ss_app_st_flrcmpl_tready),
    	  
		  .ss_app_st_txcrdt_tvalid         		(p1_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          		(p1_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   		(p1_ss_app_st_rxcrdt_tvalid), 		
    	  .ss_app_st_rxcrdt_tdata  		   		(p1_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          		(p1_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           		(p1_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid                         (p1_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	                        (p1_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type               (p1_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast                          (p1_app_ss_st_err_tlast),
          .ss_app_st_err_tready                         (p1_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         		(p1_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         		(p1_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          		(p1_lite_csr_awaddr),
          
   		  .app_ss_lite_csr_wvalid          		(p1_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          		(p1_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           		(p1_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           		(p1_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          		(p1_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          		(p1_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           		(p1_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         		(p1_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         		(p1_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          		(p1_lite_csr_araddr),
              	  
		  .ss_app_lite_csr_rvalid          		(p1_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          		(p1_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           		(p1_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           		(p1_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  		(p1_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   		(p1_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  		(p1_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid 		(p1_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            		(p1_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        		(p1_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              		(p1_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          		(p1_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            		(p1_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        		(p1_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              		(p1_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          		(p1_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            		(p1_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        		(p1_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              		(p1_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          		(p1_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            		(p1_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        		(p1_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              		(p1_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          		(p1_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p1_coreclkout_hip_i     ),
          .rst_n                                (p1_reset_status_n_i     ),

          .rx_st0_bar_i                         (p1_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p1_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p1_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p1_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st0_pfnum_o  :  '0  ),
          .rx_st1_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st1_pfnum_o  :  '0  ),
          .rx_st2_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st2_pfnum_o  :  '0  ),
          .rx_st3_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st3_pfnum_o  :  '0  ),

          .rx_st0_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p1_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p1_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p1_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p1_rx_st3_eop_o),                

          .rx_st0_header_i                      (p1_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p1_rx_st1_hdr_o),                
          .rx_st2_header_i                      (p1_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p1_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p1_rx_st0_data_o),               
          .rx_st1_payload_i                     (p1_rx_st1_data_o),               
          .rx_st2_payload_i                     (p1_rx_st2_data_o),               
          .rx_st3_payload_i                     (p1_rx_st3_data_o),               

          .rx_st0_sop_i                         (p1_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p1_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p1_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p1_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p1_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p1_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p1_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p1_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p1_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p1_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p1_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p1_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p1_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p1_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p1_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p1_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p1_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p1_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p1_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p1_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p1_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p1_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p1_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p1_rx_st3_prefix_o),             

          .rx_par_err_i                         (p1_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p1_rx_st_ready_i		),        
		  .rx_st0_data_par_i 					(p1_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p1_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p1_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p1_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p1_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p1_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p1_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p1_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p1_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p1_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p1_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p1_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p1_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p1_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p1_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p1_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p1_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p1_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p1_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p1_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p1_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p1_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p1_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p1_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p1_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p1_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p1_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p1_tx_st3_eop_i),                

          .tx_st0_header_o                      (p1_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p1_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p1_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p1_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p1_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p1_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p1_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p1_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p1_tx_st0_data_i),               
          .tx_st1_payload_o                     (p1_tx_st1_data_i),               
          .tx_st2_payload_o                     (p1_tx_st2_data_i),               
          .tx_st3_payload_o                     (p1_tx_st3_data_i),               

          .tx_st0_sop_o                         (p1_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p1_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p1_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p1_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p1_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p1_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p1_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p1_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p1_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p1_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p1_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p1_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p1_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p1_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p1_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p1_tx_st3_pvalid_i),             

          .tx_par_err_i                         ( p1_tx_st_par_err_o         ),
          .tx_st_ready_i                        ( p1_tx_st_ready_o),               

          .dl_timer_update_i                    ( p1_dl_timer_update_o       ),
          .dl_up_i                              ( p1_dl_up_o                 ),   
          .link_up_i                            ( p1_link_up_o               ),   

          .app_rst_n 							(	),
	  	  .pin_perst_n                          ( p1_pin_perst_n                   ),	
    	  .app_clk 								(	),

		  .hip_reconfig_read_o                  ( p1_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p1_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p1_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p1_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p1_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p1_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p1_hip_reconfig_waitrequest_o        ),

 		  .cii_req_i                            ( p1_cii_req_o                         ),
          .cii_hdr_poisoned_i                   ( p1_cii_hdr_poisoned_o                ),
          .cii_hdr_first_be_i                   ( p1_cii_hdr_first_be_o                ),
          .cii_func_num_i                       ( (core8_total_pf_count_hwtcl != 1) ? p1_cii_func_num_o : '0 ),
          .cii_wr_i                             ( p1_cii_wr_o                          ),
          .cii_addr_i                           ( p1_cii_addr_o                        ),
          .cii_dout_i                           ( p1_cii_dout_o                        ),
          .cii_override_en_o                    ( p1_cii_override_en_i  ), 
          .cii_override_din_o                   ( p1_cii_override_din_i ), 
          .cii_halt_o                           ( p1_cii_halt_i         ), 
          .cii_wr_vf_active_i                   ( core8_enable_sriov_hwtcl ? p1_cii_wr_vf_active_o : '0 ),
          .cii_vf_num_i                         ( core8_enable_sriov_hwtcl ? p1_cii_vf_num_o       : '0 ),
		  
	  .flr_rcvd_pf_i                        (  core8_flr_cap_hwtcl ? p1_flr_rcvd_pf_o : '0          ),
          .flr_rcvd_vf_i                        ( (core8_flr_cap_hwtcl & core8_enable_sriov_hwtcl) ? p1_flr_rcvd_vf_o : '0  ),
          .flr_rcvd_pf_num_i                    ( (core8_flr_cap_hwtcl & core8_enable_sriov_hwtcl) ? p1_flr_rcvd_pf_num_o : '0  ),
          .flr_rcvd_vf_num_i                    ( (core8_flr_cap_hwtcl & core8_enable_sriov_hwtcl) ? p1_flr_rcvd_vf_num_o : '0               ),
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
		  
		  .app_err_valid_o                      ( p1_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p1_app_err_hdr_i                       ),
          .app_err_info_o                       ( p1_app_err_info_i                      ),
          .app_err_func_num_o                   ( p1_app_err_func_num_i                  ),
          
		  .serr_i                               ( p1_serr_out_o                          ),
          .app_err_ready_i                      ( p1_app_err_ready_o                     ),
		  
		  .hip_msi_pnd_func_o 					(	),
    	  .hip_msi_pnd_addr_o 					(	),
    	  .hip_msi_pnd_byte_o 					(	), 
 
		  .surprise_down_err_i                  (p1_surprise_down_err_o             ),
          .ltssm_state_i                        (p1_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p1_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p1_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p1_pm_curnt_state_o                ),
          .pm_dstate_i                          (p1_pm_dstate_o                     ),
          .pld_gp_ctrl_i                        (p1_pld_gp_ctrl_o                   ),
          .vf_err_ur_posted_s0_i                (p1_vf_err_ur_posted_s0_o           ),
          .vf_err_ur_posted_s1_i                ( p1_vf_err_ur_posted_s1_o ),
 
		.pld_in_use_i							(p1_pld_in_use_o	),	
        .user_mode_to_pld_i						(p1_user_mode_to_pld_o	),	
        .app_int_o								(p1_app_int_i	),	
        .msi_pnd_byte_o							(p1_msi_pnd_byte_i	),	
        .msi_pnd_func_o							(p1_msi_pnd_func_i	),	
        .msi_pnd_addr_o							(p1_msi_pnd_addr_i	),	
        .apps_pm_xmt_pme_o						(p1_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p1_app_xfer_pending_i	),	
        .app_init_rst_o							(p1_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p1_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p1_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p1_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p1_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p1_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p1_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p1_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p1_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p1_sys_eml_interlock_engaged_i	),	
        .virtio_pcicfg_appvfnum_o				(p1_virtio_pcicfg_appvfnum_i	),	
        .virtio_pcicfg_apppfnum_o				(p1_virtio_pcicfg_apppfnum_i	),	
        .virtio_pcicfg_rdack_o					(p1_virtio_pcicfg_rdack_i	),	
        .virtio_pcicfg_rdbe_o					(p1_virtio_pcicfg_rdbe_i	),	
        .virtio_pcicfg_data_o					(p1_virtio_pcicfg_data_i	),	
		.pld_gp_status_o						(p1_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p1_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p1_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p1_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p1_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(p1_app_req_retry_en_i	),	
        .prs_event_valid_o						(p1_prs_event_valid_i	),	
        .prs_event_func_o						(p1_prs_event_func_i	),	
        .prs_event_o							(p1_prs_event_i		 	),	
		
		.hip_reconfig_clk_o   					(	),
		
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_vfaccess_o	:'0 ),	
        .virtio_pcicfg_vfnum_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_vfnum_o 		:'0 ),	
        .virtio_pcicfg_pfnum_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_pfnum_o 		:'0 ),	
        .virtio_pcicfg_bar_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_bar_o 		:'0 ),	
        .virtio_pcicfg_length_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_length_o 		:'0 ),	
        .virtio_pcicfg_baroffset_i				(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_baroffset_o 	:'0 ),	
        .virtio_pcicfg_cfgdata_i				(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_cfgdata_o 	:'0 ),	
        .virtio_pcicfg_cfgwr_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_cfgwr_o 		:'0 ),	
        .virtio_pcicfg_cfgrd_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_cfgrd_o 		:'0 ),		

        .vf_err_ca_postedreq_s0_i               (p1_vf_err_ca_postedreq_s0_o         ),
        .vf_err_ca_postedreq_s1_i               ( p1_vf_err_ca_postedreq_s1_o ),

        .vf_err_vf_num_s0_i                     (p1_vf_err_vf_num_s0_o               ),
        .vf_err_vf_num_s1_i                     ( p1_vf_err_vf_num_s1_o),
 		.vf_err_poisonedwrreq_s0_i            	(p1_vf_err_poisonedwrreq_s0_o        ),
        .vf_err_poisonedwrreq_s1_i            	( p1_vf_err_poisonedwrreq_s1_o ),
        .vf_err_poisonedcompl_s0_i              (p1_vf_err_poisonedcompl_s0_o        ),
        .vf_err_poisonedcompl_s1_i              ( p1_vf_err_poisonedcompl_s1_o ),
     	.vf_err_overflow_i                    	(p1_vf_err_overflow_o            	 ),  
 		
		.ss_app_vf_err_poisonedwrreq_s0_o       (p1_ss_app_vf_err_poisonedwrreq_s0   ), 
        .ss_app_vf_err_poisonedwrreq_s1_o       (    ),
        .ss_app_vf_err_poisonedcompl_s0_o     	(p1_ss_app_vf_err_poisonedcompl_s0   ),
        .ss_app_vf_err_poisonedcompl_s1_o     	(    ),

 		.ss_app_vf_err_ur_postedreq_s0_o      	(p1_ss_app_vf_err_ur_postedreq_s0    ),
        .ss_app_vf_err_ur_postedreq_s1_o      	(    ),
        .ss_app_vf_err_ca_postedreq_s0_o      	(p1_ss_app_vf_err_ca_postedreq_s0    ), 
        .ss_app_vf_err_ca_postedreq_s1_o      	(    ),
        .ss_app_vf_err_vf_num_s0_o            	(p1_ss_app_vf_err_vf_num_s0          ),   
        .ss_app_vf_err_vf_num_s1_o            	(    ),
        .ss_app_vf_err_func_num_s0            	(p1_ss_app_vf_err_func_num_s0        ),
        .ss_app_vf_err_func_num_s1            	(    ),
		.ss_app_vf_err_overflow                	(p1_ss_app_vf_err_overflow           ),
        .app_ss_sent_vfnonfatalmsg              (p1_app_ss_sent_vfnonfatalmsg        ),
        .app_ss_vfnonfatalmsg_vf_num            (p1_app_ss_vfnonfatalmsg_vf_num      ),
        .app_ss_vfnonfatalmsg_func_num          (p1_app_ss_vfnonfatalmsg_func_num    ),
        .ss_app_vfnonfatalmsg_ready           	(p1_ss_app_vfnonfatalmsg_ready        ),
        .vf_err_func_num_s0_i                   (p1_vf_err_func_num_s0_o    ),
        .vf_err_func_num_s1_i                   ( p1_vf_err_func_num_s1_o )

      );
	end


    if (pciess_topology=="pcie_x4x4x4x4") begin : gen_pciess_p2_p3
     intel_pciess_rtile_wrapper  #(
      .device_family                   (device_family),
      .TILE                            (TILE),
      .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
      .device_type                     ("EP"),
      .FUNC_MODE                       (core4_0_FUNC_MODE),
      .HEADER_SCHEME                   (core4_0_HEADER_SCHEME),
      .Header_Packing_scheme           (core4_0_Header_Packing_scheme),
  	  .DWIDTH                          (core4_0_DWIDTH),
      .NUM_OF_SEG                      (core4_0_NUM_OF_SEG),
      
 	  .ST_readyLatency                 (core4_0_ST_readyLatency),
      .CRS_EN_DEFAULT_VAL              (core4_0_CRS_EN_DEFAULT),
      .LiteSlvAWD                      (core4_0_LiteSlvAWD),
      .LiteSlvDWD                      (core4_0_LiteSlvDWD),
      .LiteMstrAWD                     (core4_0_LiteMstrAWD),
      .LiteMstrDWD                     (core4_0_LiteMstrDWD),
      .LiteMstr_readyLatency           (core4_0_LiteMstr_readyLatency),
      .MMAWD                           (core4_0_MMAWD),
      .MMBLWD                          (core4_0_MMBLWD),
      .MMDWD                           (core4_0_MMDWD),
      .MM_readyLatency                 (core4_0_MM_readyLatency),
      .MSIX_TABLE                      (core4_0_MSIX_TABLE),
      .autonomous_pm_enter_l23         (core4_0_autonomous_pm_enter_l23),
      .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
      .device_att                      (core4_0_device_att),
      .perfmon_clk_freq                (core4_0_perfmon_clk_freq),
      .SS_PWIDTH                       (SS_PWIDTH),
      .seg_width_hwtcl                 (seg_width_hwtcl), 
	    .hssi_ctp_func_mode              (hssi_ctp_func_mode),
      .hssi_ctp_topology               (hssi_ctp_topology),
      .payload_width                   (core4_0_payload_width_integer_hwtcl),
      .hdr_width                       (core4_0_hdr_width_integer_hwtcl),
      .pfx_width                       (core4_0_pfx_width_integer_hwtcl),
      .double_width                    (core4_0_double_width_integer_hwtcl),
      .empty_width                     (core4_0_empty_width_integer_hwtcl),
      .enable_sriov                    (0),

      .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
      .virtio_pci_cfg_acc_intf_en_hwtcl(0),
	  
	  .PORT_ID                         (2),
      .ENABLE_VIRTIO                   (0),
      .ENABLE_DFL                      (core4_0_dfl_en_hwtcl),
      .dfl_next_cap_offset             (core4_0_dfl_next_cap_offset),
      .dfl_total                       (core4_0_dfl_total),
      .ENABLE_CEB                      (core4_0_ceb_en_hwtcl),
      .ENABLE_CII                      (core4_0_cii_en_hwtcl),
      .ENABLE_CONFIG_MONITORING        (core4_0_enable_config_monitoring_hwtcl),

      .PF_STD_NEXT_ADDR_PTR            (core4_0_ceb_pf_std_cap_last_ptr),
      .PF_EXT_NEXT_ADDR_PTR            (core4_0_ceb_pf_ext_cap_last_ptr),
      .VF_STD_NEXT_ADDR_PTR            (core4_0_ceb_vf_std_cap_last_ptr),
      .VF_EXT_NEXT_ADDR_PTR            (core4_0_ceb_vf_ext_cap_last_ptr),
      .CEB_TIMEOUT                     (core4_0_ceb_ack_latency_hwtcl),
      .CII_TIMEOUT                     (core4_0_cii_ack_latency_hwtcl),
	       
	  .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
      .PERFMON_EN                      (PERFMON_EN),
      .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
	  .HIGH_SPEED                      (HIGH_SPEED),
    
	  .total_pf_count                  (	),  
      .total_vf_count                  (	),  
      .pf0_vf_count                    (	),  
      .pf1_vf_count                    (	),  
      .pf2_vf_count                    (	),  
      .pf3_vf_count                    (	),  
      .pf4_vf_count                    (	),  
      .pf5_vf_count                    (	),  
      .pf6_vf_count                    (	),  
      .pf7_vf_count                    (	),  
	  .PF0_SLOT_IMP                    (	),  
	  .dfh_fid_hwtcl                   (core4_0_dfh_fid_hwtcl),
      .dfh_major_ver_hwtcl             (core4_0_dfh_major_ver_hwtcl),
      .dfh_next_byte_offset_hwtcl      (core4_0_dfh_next_byte_offset_hwtcl),
      .dfh_end_hwtcl                   (core4_0_dfh_end_hwtcl),
      .dfh_minor_rev_hwtcl             (core4_0_dfh_minor_rev_hwtcl),
      .dfh_ver_hwtcl                   (core4_0_dfh_ver_hwtcl),
      .dfh_feature_type_hwtcl          (core4_0_dfh_feature_type_hwtcl),
      .inst_id_hwtcl                   (core4_0_inst_id_hwtcl) 

      ) u_pciess_p2 (
    	  .ninit_done 					   		(ninit_done),
          .slow_clk                        		( slow_clk                       ),
          .slow_rst_n                      		(p2_slow_reset_status_n         ),
    	  .axi_st_clk                      		(p2_axi_st_clk),
    	  .axi_lite_clk                    		(p2_axi_lite_clk),
    	  .axi_st_areset_n                 		(p2_axi_st_areset_n),
    	  .axi_lite_areset_n               		(p2_axi_lite_areset_n),
    	  .axi_mm_clk                      		(p2_axi_mm_clk),
    	  .axi_mm_areset_n                 		(p2_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            		(p2_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            		(p2_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        		(p2_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        		(p2_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               		(p2_subsystem_rst_req),
    	  .subsystem_rst_rdy               		(p2_subsystem_rst_rdy),
    	  .initiate_warmrst_req            		(p2_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            		(p2_initiate_rst_req_rdy),
		  
	  .ss_app_st_rx_tvalid             		(p2_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             		(p2_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              		(p2_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              		(p2_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              		(p2_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       		(p2_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment 		(p2_ss_app_st_rx_tuser_last_segment),	      
	  .ss_app_st_rx_tuser_hvalid       		(p2_ss_app_st_rx_tuser_hvalid ),					
	  .ss_app_st_rx_tuser_transaction_abort         (p2_ss_app_st_rx_tuser_transaction_abort ),
	  .ss_app_st_rx_tuser_hdr      	   		(p2_ss_app_st_rx_tuser_hdr  ),

	  .app_ss_st_tx_tvalid             		(p2_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             		(p2_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              		(p2_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              		(p2_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              		(p2_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       		(p2_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment 		(p2_app_ss_st_tx_tuser_last_segment),
          .app_ss_st_tx_tuser_hvalid                    (p2_app_ss_st_tx_tuser_hvalid),
          .app_ss_st_tx_tuser_transaction_abort         (p2_app_ss_st_tx_tuser_transaction_abort),
          .app_ss_st_tx_tuser_hdr                       (p2_app_ss_st_tx_tuser_hdr),

		  .ss_app_st_ciireq_tvalid	       		(p2_ss_app_st_ciireq_tvalid),
    	  .app_ss_st_ciireq_tready	       		(p2_app_ss_st_ciireq_tready),
    	  .ss_app_st_ciireq_tdata	       		(p2_ss_app_st_ciireq_tdata),
    	  .app_ss_st_ciiresp_tvalid	       		(p2_app_ss_st_ciiresp_tvalid),
    	  .app_ss_st_ciiresp_tdata	       		(p2_app_ss_st_ciiresp_tdata),
    	  
		  .ss_app_st_cebreq_tvalid         		(p2_ss_app_st_cebreq_tvalid),
    	  .app_ss_st_cebreq_tready         		(p2_app_ss_st_cebreq_tready),
    	  .ss_app_st_cebreq_tdata          		(p2_ss_app_st_cebreq_tdata),
    	  .app_ss_st_cebresp_tvalid        		(p2_app_ss_st_cebresp_tvalid),
    	  .app_ss_st_cebresp_tdata         		(p2_app_ss_st_cebresp_tdata),
		  
    	  .ss_app_st_ctrlshadow_tvalid     		(p2_ss_app_st_ctrlshadow_tvalid),
    	  .ss_app_st_ctrlshadow_tdata      		(p2_ss_app_st_ctrlshadow_tdata),

		  .ss_app_st_flrrcvd_tvalid        		(p2_ss_app_st_flrrcvd_tvalid),
    	  .ss_app_st_flrrcvd_tdata         		(p2_ss_app_st_flrrcvd_tdata),
    	  .app_ss_st_flrcmpl_tvalid        		(p2_app_ss_st_flrcmpl_tvalid),
    	  .app_ss_st_flrcmpl_tdata         		(p2_app_ss_st_flrcmpl_tdata),
	  .ss_app_st_flrcmpl_tready                     (p2_ss_app_st_flrcmpl_tready),
    	  
		  .ss_app_st_txcrdt_tvalid         		(p2_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          		(p2_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   		(p2_ss_app_st_rxcrdt_tvalid), 		
    	  .ss_app_st_rxcrdt_tdata  		   		(p2_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          		(p2_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           		(p2_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid                         (p2_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	                        (p2_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type               (p2_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast                          (p2_app_ss_st_err_tlast),
          .ss_app_st_err_tready                         (p2_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         		(p2_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         		(p2_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          		(p2_lite_csr_awaddr),
    	  
		  .app_ss_lite_csr_wvalid          		(p2_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          		(p2_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           		(p2_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           		(p2_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          		(p2_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          		(p2_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           		(p2_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         		(p2_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         		(p2_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          		(p2_lite_csr_araddr),
              	  
		  .ss_app_lite_csr_rvalid          		(p2_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          		(p2_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           		(p2_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           		(p2_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  		(p2_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   		(p2_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  		(p2_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid 		(p2_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            		(p2_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        		(p2_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              		(p2_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          		(p2_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            		(p2_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        		(p2_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              		(p2_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          		(p2_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            		(p2_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        		(p2_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              		(p2_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          		(p2_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            		(p2_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        		(p2_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              		(p2_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          		(p2_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p2_coreclkout_hip_i     ),
          .rst_n                                (p2_reset_status_n_i     ),

          .rx_st0_bar_i                         (p2_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p2_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p2_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p2_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st0_pfnum_o  :  '0  ),
          .rx_st1_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st1_pfnum_o  :  '0  ),
          .rx_st2_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st2_pfnum_o  :  '0  ),
          .rx_st3_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st3_pfnum_o  :  '0  ),

          .rx_st0_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p2_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p2_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p2_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p2_rx_st3_eop_o),                

          .rx_st0_header_i                      (p2_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p2_rx_st1_hdr_o),                
          .rx_st2_header_i                      (p2_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p2_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p2_rx_st0_data_o),               
          .rx_st1_payload_i                     (p2_rx_st1_data_o),               
          .rx_st2_payload_i                     (p2_rx_st2_data_o),               
          .rx_st3_payload_i                     (p2_rx_st3_data_o),               

          .rx_st0_sop_i                         (p2_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p2_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p2_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p2_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p2_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p2_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p2_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p2_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p2_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p2_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p2_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p2_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p2_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p2_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p2_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p2_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p2_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p2_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p2_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p2_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p2_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p2_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p2_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p2_rx_st3_prefix_o),             

          .rx_par_err_i                         (p2_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p2_rx_st_ready_i		),        
		  .rx_st0_data_par_i 					(p2_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p2_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p2_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p2_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p2_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p2_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p2_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p2_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p2_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p2_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p2_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p2_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p2_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p2_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p2_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p2_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p2_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p2_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p2_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p2_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p2_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p2_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p2_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p2_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p2_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p2_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p2_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p2_tx_st3_eop_i),                

          .tx_st0_header_o                      (p2_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p2_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p2_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p2_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p2_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p2_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p2_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p2_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p2_tx_st0_data_i),               
          .tx_st1_payload_o                     (p2_tx_st1_data_i),               
          .tx_st2_payload_o                     (p2_tx_st2_data_i),               
          .tx_st3_payload_o                     (p2_tx_st3_data_i),               

          .tx_st0_sop_o                         (p2_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p2_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p2_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p2_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p2_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p2_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p2_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p2_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p2_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p2_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p2_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p2_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p2_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p2_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p2_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p2_tx_st3_pvalid_i),             

          .tx_par_err_i                         ( p2_tx_st_par_err_o         ),
          .tx_st_ready_i                        ( p2_tx_st_ready_o),               

          .dl_timer_update_i                    ( p2_dl_timer_update_o       ),
          .dl_up_i                              ( p2_dl_up_o                 ),   
          .link_up_i                            ( p2_link_up_o               ),   

          .app_rst_n 							(	),
	  	  .pin_perst_n                          ( p2_pin_perst_n                   ),	
    	  .app_clk 								(	),

		  .hip_reconfig_read_o                  ( p2_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p2_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p2_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p2_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p2_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p2_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p2_hip_reconfig_waitrequest_o        ),

 		  .cii_req_i                            ( p2_cii_req_o                         ),
          .cii_hdr_poisoned_i                   ( p2_cii_hdr_poisoned_o                ),
          .cii_hdr_first_be_i                   ( p2_cii_hdr_first_be_o                ),
          .cii_func_num_i                       ( (core4_0_total_pf_count_hwtcl != 1) ? p1_cii_func_num_o : '0 ),
          .cii_wr_i                             ( p2_cii_wr_o                          ),
          .cii_addr_i                           ( p2_cii_addr_o                        ),
          .cii_dout_i                           ( p2_cii_dout_o                        ),
          .cii_override_en_o                    ( p2_cii_override_en_i  ), 
          .cii_override_din_o                   ( p2_cii_override_din_i ), 
          .cii_halt_o                           ( p2_cii_halt_i         ), 
          .cii_wr_vf_active_i                   ( core4_0_enable_sriov_hwtcl ? p2_cii_wr_vf_active_o : '0 ),
          .cii_vf_num_i                         ( core4_0_enable_sriov_hwtcl ? p2_cii_vf_num_o       : '0 ),
		  
	  .flr_rcvd_pf_i                        (  core4_0_flr_cap_hwtcl ? p2_flr_rcvd_pf_o : '0          ),
          .flr_rcvd_vf_i                        ( (core4_0_flr_cap_hwtcl & core4_0_enable_sriov_hwtcl) ? p2_flr_rcvd_vf_o : '0  ),
          .flr_rcvd_pf_num_i                    ( (core4_0_flr_cap_hwtcl & core4_0_enable_sriov_hwtcl) ? p2_flr_rcvd_pf_num_o : '0  ),
          .flr_rcvd_vf_num_i                    ( (core4_0_flr_cap_hwtcl & core4_0_enable_sriov_hwtcl) ? p2_flr_rcvd_vf_num_o : '0               ),
          .flr_completed_pf_o                   ( p2_flr_completed_pf_i                 ),
          .flr_completed_vf_o                   ( p2_flr_completed_vf_i                 ),
          .flr_completed_pf_num_o               ( p2_flr_completed_pf_num_i             ),
          .flr_completed_vf_num_o               ( p2_flr_completed_vf_num_i             ),
          .flr_completed_ready_i                ( core4_0_flr_cap_hwtcl ? p2_flr_completed_ready_o : '0 ),
          
		  .cpl_timeout_i                        ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_tag_o       : '0  ),
		  
		  .app_err_valid_o                      ( p2_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p2_app_err_hdr_i                       ),
          .app_err_info_o                       ( p2_app_err_info_i                      ),
          .app_err_func_num_o                   ( p2_app_err_func_num_i                  ),
          
		  .serr_i                               ( p2_serr_out_o                          ),
          .app_err_ready_i                      ( p2_app_err_ready_o                     ),
		  
		  .hip_msi_pnd_func_o 					(	),
    	  .hip_msi_pnd_addr_o 					(	),
    	  .hip_msi_pnd_byte_o 					(	), 
 
		  .surprise_down_err_i                  (p2_surprise_down_err_o             ),
          .ltssm_state_i                        (p2_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p2_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p2_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p2_pm_curnt_state_o                ),
          .pm_dstate_i                          ({28'd0,p2_pm_dstate_o}                     ),
          .pld_gp_ctrl_i                        (p2_pld_gp_ctrl_o                   ),
          .vf_err_ur_posted_s0_i                ( 'd0           ),
          .vf_err_ur_posted_s1_i                ( 'd0           ),
 
		.pld_in_use_i							(p2_pld_in_use_o	),	
        .user_mode_to_pld_i						(p2_user_mode_to_pld_o	),	
        .app_int_o								(p2_app_int_wire	),	
        .msi_pnd_byte_o							(p2_msi_pnd_byte_i	),	
        .msi_pnd_func_o							(p2_msi_pnd_func_i	),	
        .msi_pnd_addr_o							(p2_msi_pnd_addr_i	),	
        .apps_pm_xmt_pme_o						(p2_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p2_app_xfer_pending_i	),	
        .app_init_rst_o							(p2_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p2_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p2_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p2_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p2_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p2_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p2_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p2_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p2_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p2_sys_eml_interlock_engaged_i	),	
        .virtio_pcicfg_appvfnum_o				(p2_virtio_pcicfg_appvfnum_i	),	
        .virtio_pcicfg_apppfnum_o				(p2_virtio_pcicfg_apppfnum_i	),	
        .virtio_pcicfg_rdack_o					(p2_virtio_pcicfg_rdack_i	),	
        .virtio_pcicfg_rdbe_o					(p2_virtio_pcicfg_rdbe_i	),	
        .virtio_pcicfg_data_o					(p2_virtio_pcicfg_data_i	),	
		.pld_gp_status_o						(p2_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p2_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p2_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p2_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p2_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(/*p2_app_req_retry_en_i*/	),	
        .prs_event_valid_o						(p2_prs_event_valid_i	),	
        .prs_event_func_o						(p2_prs_event_func_i	),	
        .prs_event_o							(p2_prs_event_i		 	),	
		
		.hip_reconfig_clk_o   					(	),
		
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(p2_virtio_pcicfg_vfaccess_o),	
        .virtio_pcicfg_vfnum_i					(p2_virtio_pcicfg_vfnum_o	),	
        .virtio_pcicfg_pfnum_i					(p2_virtio_pcicfg_pfnum_o	),	
        .virtio_pcicfg_bar_i					(p2_virtio_pcicfg_bar_o	),	
        .virtio_pcicfg_length_i					(p2_virtio_pcicfg_length_o	),	
        .virtio_pcicfg_baroffset_i				(p2_virtio_pcicfg_baroffset_o	),	
        .virtio_pcicfg_cfgdata_i				(p2_virtio_pcicfg_cfgdata_o	),	
        .virtio_pcicfg_cfgwr_i					(p2_virtio_pcicfg_cfgwr_o	),	
        .virtio_pcicfg_cfgrd_i					(p2_virtio_pcicfg_cfgrd_o	),	

        .vf_err_ca_postedreq_s0_i               ( 'd0),
        .vf_err_ca_postedreq_s1_i               ( 'd0),

        .vf_err_vf_num_s0_i                     ( 11'd0),
        .vf_err_vf_num_s1_i                     ( 11'd0 ),
 		.vf_err_poisonedwrreq_s0_i            	( 'd0 ),
        .vf_err_poisonedwrreq_s1_i            	( 'd0 ),
        .vf_err_poisonedcompl_s0_i              ( 'd0 ),
        .vf_err_poisonedcompl_s1_i              ( 'd0 ),
     	.vf_err_overflow_i                    	( 1'b0 ),  
 		
		.ss_app_vf_err_poisonedwrreq_s0_o       (    ), 
        .ss_app_vf_err_poisonedwrreq_s1_o       (    ),
        .ss_app_vf_err_poisonedcompl_s0_o     	(    ),
        .ss_app_vf_err_poisonedcompl_s1_o     	(    ),

 		.ss_app_vf_err_ur_postedreq_s0_o      	(    ),
        .ss_app_vf_err_ur_postedreq_s1_o      	(    ),
        .ss_app_vf_err_ca_postedreq_s0_o      	(    ), 
        .ss_app_vf_err_ca_postedreq_s1_o      	(    ),
        .ss_app_vf_err_vf_num_s0_o            	(    ),   
        .ss_app_vf_err_vf_num_s1_o            	(    ),
        .ss_app_vf_err_func_num_s0            	(    ),
        .ss_app_vf_err_func_num_s1            	(    ),
		.ss_app_vf_err_overflow                	(p2_ss_app_vf_err_overflow           ),
        .app_ss_sent_vfnonfatalmsg              (1'd0      ),
        .app_ss_vfnonfatalmsg_vf_num            (11'd0     ),
        .app_ss_vfnonfatalmsg_func_num          (3'd0    ),
        .vf_err_func_num_s0_i                   ( 3'd0 ),
        .vf_err_func_num_s1_i                   ( 3'd0 ),
	.ss_app_vfnonfatalmsg_ready           	(p2_ss_app_vfnonfatalmsg_ready        )

      );

intel_pciess_rtile_wrapper #(
      .device_family                   (device_family),
      .TILE                            (TILE),
      .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
      .device_type                     ("EP"),
      .FUNC_MODE                       (core4_1_FUNC_MODE),
      .HEADER_SCHEME                   (core4_1_HEADER_SCHEME),
      .Header_Packing_scheme           (core4_1_Header_Packing_scheme),
      .DWIDTH                          (core4_1_DWIDTH),
      .NUM_OF_SEG                      (core4_1_NUM_OF_SEG),
      
	  .ST_readyLatency                 (core4_1_ST_readyLatency),
      .CRS_EN_DEFAULT_VAL              (core4_1_CRS_EN_DEFAULT),
      .LiteSlvAWD                      (core4_1_LiteSlvAWD),
      .LiteSlvDWD                      (core4_1_LiteSlvDWD),
      .LiteMstrAWD                     (core4_1_LiteMstrAWD),
      .LiteMstrDWD                     (core4_1_LiteMstrDWD),
      .LiteMstr_readyLatency           (core4_1_LiteMstr_readyLatency),
      .MMAWD                           (core4_1_MMAWD),
      .MMBLWD                          (core4_1_MMBLWD),
      .MMDWD                           (core4_1_MMDWD),
      .MM_readyLatency                 (core4_1_MM_readyLatency),
      .MSIX_TABLE                      (core4_1_MSIX_TABLE),
      .autonomous_pm_enter_l23         (core4_1_autonomous_pm_enter_l23),
      .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
      .device_att                      (core4_1_device_att),
      .perfmon_clk_freq                (core4_1_perfmon_clk_freq),
      .SS_PWIDTH                       (SS_PWIDTH),
      .seg_width_hwtcl                 (seg_width_hwtcl), 
	  .hssi_ctp_func_mode              (hssi_ctp_func_mode),
      .hssi_ctp_topology               (hssi_ctp_topology),
      .payload_width                   (core4_1_payload_width_integer_hwtcl),
      .hdr_width                       (core4_1_hdr_width_integer_hwtcl),
      .pfx_width                       (core4_1_pfx_width_integer_hwtcl),
      .double_width                    (core4_1_double_width_integer_hwtcl),
      .empty_width                     (core4_1_empty_width_integer_hwtcl),
      .enable_sriov                    (0),
      
      .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
      .virtio_pci_cfg_acc_intf_en_hwtcl(0),

      .PORT_ID                         (3),
      .ENABLE_VIRTIO                   (0),
      .ENABLE_DFL                      (core4_1_dfl_en_hwtcl),
      .dfl_next_cap_offset             (core4_1_dfl_next_cap_offset),
      .dfl_total                       (core4_1_dfl_total),
      .ENABLE_CEB                      (core4_1_ceb_en_hwtcl),
      .ENABLE_CII                      (core4_1_cii_en_hwtcl),
      .ENABLE_CONFIG_MONITORING        (core4_1_enable_config_monitoring_hwtcl),

      .PF_STD_NEXT_ADDR_PTR            (core4_1_ceb_pf_std_cap_last_ptr),
      .PF_EXT_NEXT_ADDR_PTR            (core4_1_ceb_pf_ext_cap_last_ptr),
      .VF_STD_NEXT_ADDR_PTR            (core4_1_ceb_vf_std_cap_last_ptr),
      .VF_EXT_NEXT_ADDR_PTR            (core4_1_ceb_vf_ext_cap_last_ptr),
      .CEB_TIMEOUT                     (core4_1_ceb_ack_latency_hwtcl),
      .CII_TIMEOUT                     (core4_1_cii_ack_latency_hwtcl),
      	  
      .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
      .PERFMON_EN                      (PERFMON_EN),
      .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
	  .HIGH_SPEED                      (HIGH_SPEED),
 	  
	  .total_pf_count                  (	),   
      .total_vf_count                  (	),   
      .pf0_vf_count                    (	),   
      .pf1_vf_count                    (	),   
      .pf2_vf_count                    (	),   
      .pf3_vf_count                    (	),   
      .pf4_vf_count                    (	),   
      .pf5_vf_count                    (	),   
      .pf6_vf_count                    (	),   
      .pf7_vf_count                    (	),   
	  .PF0_SLOT_IMP                    (	),   
	  .dfh_fid_hwtcl                   (core4_1_dfh_fid_hwtcl),
      .dfh_major_ver_hwtcl             (core4_1_dfh_major_ver_hwtcl),
      .dfh_next_byte_offset_hwtcl      (core4_1_dfh_next_byte_offset_hwtcl),
      .dfh_end_hwtcl                   (core4_1_dfh_end_hwtcl),
      .dfh_minor_rev_hwtcl             (core4_1_dfh_minor_rev_hwtcl),
      .dfh_ver_hwtcl                   (core4_1_dfh_ver_hwtcl),
      .dfh_feature_type_hwtcl          (core4_1_dfh_feature_type_hwtcl),
      .inst_id_hwtcl                   (core4_1_inst_id_hwtcl) 
	 
	) u_pciess_p3 (
    	  .ninit_done 					   		(ninit_done),
          .slow_clk                        		( slow_clk                       ),
          .slow_rst_n                      		(p3_slow_reset_status_n         ),
    	  .axi_st_clk                      		(p3_axi_st_clk),
    	  .axi_lite_clk                    		(p3_axi_lite_clk),
    	  .axi_st_areset_n                 		(p3_axi_st_areset_n),
    	  .axi_lite_areset_n               		(p3_axi_lite_areset_n),
    	  .axi_mm_clk                      		(p3_axi_mm_clk),
    	  .axi_mm_areset_n                 		(p3_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            		(p3_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            		(p3_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        		(p3_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        		(p3_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               		(p3_subsystem_rst_req),
    	  .subsystem_rst_rdy               		(p3_subsystem_rst_rdy),
    	  .initiate_warmrst_req            		(p3_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            		(p3_initiate_rst_req_rdy),
		  
          .ss_app_st_rx_tvalid             		(p3_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             		(p3_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              		(p3_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              		(p3_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              		(p3_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       		(p3_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment 		(p3_ss_app_st_rx_tuser_last_segment),	      
          .ss_app_st_rx_tuser_hvalid                    (p3_ss_app_st_rx_tuser_hvalid ),					
          .ss_app_st_rx_tuser_transaction_abort         (p3_ss_app_st_rx_tuser_transaction_abort ),
          .ss_app_st_rx_tuser_hdr                       (p3_ss_app_st_rx_tuser_hdr  ),

	  .app_ss_st_tx_tvalid             		(p3_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             		(p3_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              		(p3_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              		(p3_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              		(p3_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       		(p3_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment 		(p3_app_ss_st_tx_tuser_last_segment),
          .app_ss_st_tx_tuser_hvalid                    (p3_app_ss_st_tx_tuser_hvalid),
          .app_ss_st_tx_tuser_transaction_abort         (p3_app_ss_st_tx_tuser_transaction_abort),
          .app_ss_st_tx_tuser_hdr                       (p3_app_ss_st_tx_tuser_hdr),

		  .ss_app_st_ciireq_tvalid	       		(p3_ss_app_st_ciireq_tvalid),
    	  .app_ss_st_ciireq_tready	       		(p3_app_ss_st_ciireq_tready),
    	  .ss_app_st_ciireq_tdata	       		(p3_ss_app_st_ciireq_tdata),
    	  .app_ss_st_ciiresp_tvalid	       		(p3_app_ss_st_ciiresp_tvalid),
    	  .app_ss_st_ciiresp_tdata	       		(p3_app_ss_st_ciiresp_tdata),
    	  
		  .ss_app_st_cebreq_tvalid         		(p3_ss_app_st_cebreq_tvalid),
    	  .app_ss_st_cebreq_tready         		(p3_app_ss_st_cebreq_tready),
    	  .ss_app_st_cebreq_tdata          		(p3_ss_app_st_cebreq_tdata),
    	  .app_ss_st_cebresp_tvalid        		(p3_app_ss_st_cebresp_tvalid),
    	  .app_ss_st_cebresp_tdata         		(p3_app_ss_st_cebresp_tdata),
		  
    	  .ss_app_st_ctrlshadow_tvalid     		(p3_ss_app_st_ctrlshadow_tvalid),
    	  .ss_app_st_ctrlshadow_tdata      		(p3_ss_app_st_ctrlshadow_tdata),

		  .ss_app_st_flrrcvd_tvalid        		(p3_ss_app_st_flrrcvd_tvalid),
    	  .ss_app_st_flrrcvd_tdata         		(p3_ss_app_st_flrrcvd_tdata),
    	  .app_ss_st_flrcmpl_tvalid        		(p3_app_ss_st_flrcmpl_tvalid),
    	  .app_ss_st_flrcmpl_tdata         		(p3_app_ss_st_flrcmpl_tdata),
	  .ss_app_st_flrcmpl_tready                     (p3_ss_app_st_flrcmpl_tready),
    	  
		  .ss_app_st_txcrdt_tvalid         		(p3_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          		(p3_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   		(p3_ss_app_st_rxcrdt_tvalid), 		
    	  .ss_app_st_rxcrdt_tdata  		   		(p3_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          		(p3_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           		(p3_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid                         (p3_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	                        (p3_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type               (p3_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast                          (p3_app_ss_st_err_tlast),
          .ss_app_st_err_tready                         (p3_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         		(p3_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         		(p3_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          		(p3_lite_csr_awaddr),
              	  
		  .app_ss_lite_csr_wvalid          		(p3_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          		(p3_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           		(p3_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           		(p3_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          		(p3_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          		(p3_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           		(p3_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         		(p3_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         		(p3_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          		(p3_lite_csr_araddr),
              	  
		  .ss_app_lite_csr_rvalid          		(p3_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          		(p3_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           		(p3_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           		(p3_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  		(p3_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   		(p3_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  		(p3_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid 		(p3_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            		(p3_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        		(p3_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              		(p3_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          		(p3_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            		(p3_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        		(p3_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              		(p3_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          		(p3_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            		(p3_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        		(p3_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              		(p3_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          		(p3_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            		(p3_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        		(p3_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              		(p3_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          		(p3_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p3_coreclkout_hip_i     ),
          .rst_n                                (p3_reset_status_n_i     ),

          .rx_st0_bar_i                         (p3_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p3_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p3_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p3_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st0_pfnum_o  :  '0  ),
          .rx_st1_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st1_pfnum_o  :  '0  ),
          .rx_st2_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st2_pfnum_o  :  '0  ),
          .rx_st3_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st3_pfnum_o  :  '0  ),

          .rx_st0_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p3_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p3_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p3_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p3_rx_st3_eop_o),                

          .rx_st0_header_i                      (p3_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p3_rx_st1_hdr_o),                
          .rx_st2_header_i                      (p3_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p3_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p3_rx_st0_data_o),               
          .rx_st1_payload_i                     (p3_rx_st1_data_o),               
          .rx_st2_payload_i                     (p3_rx_st2_data_o),               
          .rx_st3_payload_i                     (p3_rx_st3_data_o),               

          .rx_st0_sop_i                         (p3_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p3_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p3_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p3_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p3_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p3_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p3_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p3_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p3_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p3_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p3_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p3_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p3_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p3_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p3_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p3_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p3_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p3_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p3_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p3_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p3_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p3_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p3_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p3_rx_st3_prefix_o),             

          .rx_par_err_i                         (p3_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p3_rx_st_ready_i		),        
		  .rx_st0_data_par_i 					(p3_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p3_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p3_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p3_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p3_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p3_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p3_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p3_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p3_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p3_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p3_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p3_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p3_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p3_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p3_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p3_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p3_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p3_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p3_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p3_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p3_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p3_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p3_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p3_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p3_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p3_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p3_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p3_tx_st3_eop_i),                

          .tx_st0_header_o                      (p3_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p3_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p3_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p3_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p3_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p3_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p3_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p3_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p3_tx_st0_data_i),               
          .tx_st1_payload_o                     (p3_tx_st1_data_i),               
          .tx_st2_payload_o                     (p3_tx_st2_data_i),               
          .tx_st3_payload_o                     (p3_tx_st3_data_i),               

          .tx_st0_sop_o                         (p3_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p3_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p3_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p3_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p3_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p3_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p3_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p3_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p3_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p3_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p3_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p3_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p3_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p3_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p3_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p3_tx_st3_pvalid_i),             

          .tx_par_err_i                         ( p3_tx_st_par_err_o         ),
          .tx_st_ready_i                        ( p3_tx_st_ready_o),               

          .dl_timer_update_i                    ( p3_dl_timer_update_o       ),
          .dl_up_i                              ( p3_dl_up_o                 ),   
          .link_up_i                            ( p3_link_up_o               ),   

          .app_rst_n 							(	),
	  	  .pin_perst_n                          ( p3_pin_perst_n                   ),	
    	  .app_clk 								(	),

		  .hip_reconfig_read_o                  ( p3_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p3_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p3_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p3_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p3_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p3_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p3_hip_reconfig_waitrequest_o        ),

 		  .cii_req_i                            ( p3_cii_req_o                         ),
          .cii_hdr_poisoned_i                   ( p3_cii_hdr_poisoned_o                ),
          .cii_hdr_first_be_i                   ( p3_cii_hdr_first_be_o                ),
          .cii_func_num_i                       ( (core4_1_total_pf_count_hwtcl != 1) ? p3_cii_func_num_o : '0 ),
          .cii_wr_i                             ( p3_cii_wr_o                          ),
          .cii_addr_i                           ( p3_cii_addr_o                        ),
          .cii_dout_i                           ( p3_cii_dout_o                        ),
          .cii_override_en_o                    ( p3_cii_override_en_i  ), 
          .cii_override_din_o                   ( p3_cii_override_din_i ), 
          .cii_halt_o                           ( p3_cii_halt_i         ), 
          .cii_wr_vf_active_i                   ( core4_1_enable_sriov_hwtcl ? p3_cii_wr_vf_active_o : '0 ),
          .cii_vf_num_i                         ( core4_1_enable_sriov_hwtcl ? p3_cii_vf_num_o       : '0 ),
		  
	  .flr_rcvd_pf_i                        (  core4_1_flr_cap_hwtcl ? p3_flr_rcvd_pf_o : '0          ),
          .flr_rcvd_vf_i                        ( (core4_1_flr_cap_hwtcl & core4_1_enable_sriov_hwtcl) ? p3_flr_rcvd_vf_o : '0  ),
          .flr_rcvd_pf_num_i                    ( (core4_1_flr_cap_hwtcl & core4_1_enable_sriov_hwtcl) ? p3_flr_rcvd_pf_num_o : '0  ),
          .flr_rcvd_vf_num_i                    ( (core4_1_flr_cap_hwtcl & core4_1_enable_sriov_hwtcl) ? p3_flr_rcvd_vf_num_o : '0               ),
          .flr_completed_pf_o                   ( p3_flr_completed_pf_i                 ),
          .flr_completed_vf_o                   ( p3_flr_completed_vf_i                 ),
          .flr_completed_pf_num_o               ( p3_flr_completed_pf_num_i             ),
          .flr_completed_vf_num_o               ( p3_flr_completed_vf_num_i             ),
          .flr_completed_ready_i                ( core4_1_flr_cap_hwtcl ? p3_flr_completed_ready_o : '0 ),
          
		  .cpl_timeout_i                        ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_tag_o       : '0  ),
		  
		  .app_err_valid_o                      ( p3_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p3_app_err_hdr_i                       ),
          .app_err_info_o                       ( p3_app_err_info_i                      ),
          .app_err_func_num_o                   ( p3_app_err_func_num_i                  ),
          
		  .serr_i                               ( p3_serr_out_o                          ),
          .app_err_ready_i                      ( p3_app_err_ready_o                     ),
		  
		  .hip_msi_pnd_func_o 					(	),
    	  .hip_msi_pnd_addr_o 					(	),
    	  .hip_msi_pnd_byte_o 					(	), 
 
		  .surprise_down_err_i                  (p3_surprise_down_err_o             ),
          .ltssm_state_i                        (p3_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p3_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p3_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p3_pm_curnt_state_o                ),
          .pm_dstate_i                          ({28'd0,p3_pm_dstate_o}                     ),
          .pld_gp_ctrl_i                        (p3_pld_gp_ctrl_o                   ),
          .vf_err_ur_posted_s0_i                ( 'd0 ),
          .vf_err_ur_posted_s1_i                ( 'd0 ),
 
		.pld_in_use_i							(p3_pld_in_use_o	),	
        .user_mode_to_pld_i						(p3_user_mode_to_pld_o	),	
        .app_int_o								(p3_app_int_wire	),	
        .msi_pnd_byte_o							(p3_msi_pnd_byte_i	),	
        .msi_pnd_func_o							(p3_msi_pnd_func_i	),	
        .msi_pnd_addr_o							(p3_msi_pnd_addr_i	),	
        .apps_pm_xmt_pme_o						(p3_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p3_app_xfer_pending_i	),	
        .app_init_rst_o							(p3_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p3_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p3_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p3_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p3_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p3_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p3_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p3_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p3_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p3_sys_eml_interlock_engaged_i	),	
        .virtio_pcicfg_appvfnum_o				(p3_virtio_pcicfg_appvfnum_i	),	
        .virtio_pcicfg_apppfnum_o				(p3_virtio_pcicfg_apppfnum_i	),	
        .virtio_pcicfg_rdack_o					(p3_virtio_pcicfg_rdack_i	),	
        .virtio_pcicfg_rdbe_o					(p3_virtio_pcicfg_rdbe_i	),	
        .virtio_pcicfg_data_o					(p3_virtio_pcicfg_data_i	),	
		.pld_gp_status_o						(p3_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p3_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p3_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p3_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p3_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(/*p3_app_req_retry_en_i*/	),	
        .prs_event_valid_o						(p3_prs_event_valid_i	),	
        .prs_event_func_o						(p3_prs_event_func_i	),	
        .prs_event_o							(p3_prs_event_i		 	),	
		
		.hip_reconfig_clk_o   					(	),
		
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(p3_virtio_pcicfg_vfaccess_o),	
        .virtio_pcicfg_vfnum_i					(p3_virtio_pcicfg_vfnum_o	),	
        .virtio_pcicfg_pfnum_i					(p3_virtio_pcicfg_pfnum_o	),	
        .virtio_pcicfg_bar_i					(p3_virtio_pcicfg_bar_o	),	
        .virtio_pcicfg_length_i					(p3_virtio_pcicfg_length_o	),	
        .virtio_pcicfg_baroffset_i				(p3_virtio_pcicfg_baroffset_o	),	
        .virtio_pcicfg_cfgdata_i				(p3_virtio_pcicfg_cfgdata_o	),	
        .virtio_pcicfg_cfgwr_i					(p3_virtio_pcicfg_cfgwr_o	),	
        .virtio_pcicfg_cfgrd_i					(p3_virtio_pcicfg_cfgrd_o	),	

        .vf_err_ca_postedreq_s0_i               ( 'd0),
        .vf_err_ca_postedreq_s1_i               ( 'd0),

        .vf_err_vf_num_s0_i                     ( 11'd0),
        .vf_err_vf_num_s1_i                     ( 11'd0 ),
 		.vf_err_poisonedwrreq_s0_i            	( 'd0 ),
        .vf_err_poisonedwrreq_s1_i            	( 'd0 ),
        .vf_err_poisonedcompl_s0_i              ( 'd0 ),
        .vf_err_poisonedcompl_s1_i              ( 'd0 ),
     	.vf_err_overflow_i                    	( 1'b0 ),  
 		
		.ss_app_vf_err_poisonedwrreq_s0_o       (    ), 
        .ss_app_vf_err_poisonedwrreq_s1_o       (    ),
        .ss_app_vf_err_poisonedcompl_s0_o     	(    ),
        .ss_app_vf_err_poisonedcompl_s1_o     	(    ),

 		.ss_app_vf_err_ur_postedreq_s0_o      	(    ),
        .ss_app_vf_err_ur_postedreq_s1_o      	(    ),
        .ss_app_vf_err_ca_postedreq_s0_o      	(    ), 
        .ss_app_vf_err_ca_postedreq_s1_o      	(    ),
        .ss_app_vf_err_vf_num_s0_o            	(    ),   
        .ss_app_vf_err_vf_num_s1_o            	(    ),
        .ss_app_vf_err_func_num_s0            	(    ),
        .ss_app_vf_err_func_num_s1            	(    ),
	.ss_app_vf_err_overflow                	    (p3_ss_app_vf_err_overflow           ),
        .app_ss_sent_vfnonfatalmsg              (1'd0      ),
        .app_ss_vfnonfatalmsg_vf_num            (11'd0     ),
        .app_ss_vfnonfatalmsg_func_num          (3'd0     ),
        .vf_err_func_num_s0_i                   ( 3'd0 ),
        .vf_err_func_num_s1_i                   ( 3'd0 ),
        .ss_app_vfnonfatalmsg_ready           	(p3_ss_app_vfnonfatalmsg_ready        )

      );
    end
  end    
else begin : RP_RTILE_WRAPPER                
  intel_pciess_rtile_rp_wrapper #(
    .device_family                   (device_family),
    .TILE                            (TILE),
    .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
    .device_type                     ("RP"),
    .FUNC_MODE                       (core16_FUNC_MODE),
    .HEADER_SCHEME                   (core16_HEADER_SCHEME),
    .Header_Packing_scheme           (core16_Header_Packing_scheme),
    .DWIDTH                          (core16_DWIDTH),
    .NUM_OF_SEG                      (core16_NUM_OF_SEG),

    .ST_readyLatency                 (core16_ST_readyLatency),
    .LiteSlvAWD                      (core16_LiteSlvAWD),
    .LiteSlvDWD                      (core16_LiteSlvDWD),
    .LiteMstrAWD                     (core16_LiteMstrAWD),
    .LiteMstrDWD                     (core16_LiteMstrDWD),
    .LiteMstr_readyLatency           (core16_LiteMstr_readyLatency),
    .MMAWD                           (core16_MMAWD),
    .MMBLWD                          (core16_MMBLWD),
    .MMDWD                           (core16_MMDWD),
    .MM_readyLatency                 (core16_MM_readyLatency),
 
 
    .autonomous_pm_enter_l23         (core16_autonomous_pm_enter_l23),
    .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
    .perfmon_clk_freq                (core16_perfmon_clk_freq),
    .SS_PWIDTH                       (SS_PWIDTH),
    .seg_width_hwtcl                 (seg_width_hwtcl),
    .hssi_ctp_func_mode              (hssi_ctp_func_mode),
    .hssi_ctp_topology               (hssi_ctp_topology),
    .payload_width                   (core16_payload_width_integer_hwtcl),
    .hdr_width                       (core16_hdr_width_integer_hwtcl),
    .pfx_width                       (core16_pfx_width_integer_hwtcl),
    .double_width                    (core16_double_width_integer_hwtcl),
    .empty_width                     (core16_empty_width_integer_hwtcl),
    .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
    .virtio_pci_cfg_acc_intf_en_hwtcl(core16_virtio_pci_cfg_acc_intf_en_hwtcl),

    .PF0_SLOT_IMP                    (hssi_ctp_u_wrpcie_top_u_core16_pf0_pcie_slot_imp),     		 
    .PORT_ID                         (0),
    .ENABLE_VIRTIO                   (core16_enable_virtio_hwtcl),
    .inst_id_hwtcl                   (core16_inst_id_hwtcl),    

    .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
    .PERFMON_EN                      (PERFMON_EN),
    .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
    .HIGH_SPEED                      (HIGH_SPEED)

   	
	) u_pciess_rp_p0 (
    	  .ninit_done 					   (ninit_done),
          .slow_clk                        ( slow_clk                       ),
          .slow_rst_n                      ( p0_slow_reset_status_n         ),
    	  .axi_st_clk                      (p0_axi_st_clk),
    	  .axi_lite_clk                    (p0_axi_lite_clk),
    	  .axi_st_areset_n                 (p0_axi_st_areset_n),
    	  .axi_lite_areset_n               (p0_axi_lite_areset_n),
    	  .axi_mm_clk                      (p0_axi_mm_clk),
    	  .axi_mm_areset_n                 (p0_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            (p0_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            (p0_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        (p0_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        (p0_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               (p0_subsystem_rst_req),
    	  .subsystem_rst_rdy               (p0_subsystem_rst_rdy),
    	  .initiate_warmrst_req            (p0_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            (p0_initiate_rst_req_rdy),
		  
          .ss_app_st_rx_tvalid             (p0_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             (p0_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              (p0_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              (p0_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              (p0_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       (p0_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment (p0_ss_app_st_rx_tuser_last_segment),	      
	  .ss_app_st_rx_tuser_hvalid       (p0_ss_app_st_rx_tuser_hvalid ),					
	  .ss_app_st_rx_tuser_transaction_abort (p0_ss_app_st_rx_tuser_transaction_abort ),
	  .ss_app_st_rx_tuser_hdr      	   (p0_ss_app_st_rx_tuser_hdr  ),

	  .app_ss_st_tx_tvalid             (p0_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             (p0_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              (p0_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              (p0_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              (p0_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       (p0_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment (p0_app_ss_st_tx_tuser_last_segment),
	  .app_ss_st_tx_tuser_hvalid       (p0_app_ss_st_tx_tuser_hvalid),
	  .app_ss_st_tx_tuser_transaction_abort (p0_app_ss_st_tx_tuser_transaction_abort),
	  .app_ss_st_tx_tuser_hdr          (p0_app_ss_st_tx_tuser_hdr),
    	  
		  .ss_app_st_txcrdt_tvalid         (p0_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          (p0_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   (p0_ss_app_st_rxcrdt_tvalid), 		    	          
				.ss_app_st_rxcrdt_tdata  		   (p0_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          (p0_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           (p0_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid            (p0_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	           (p0_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type  (p0_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast             (p0_app_ss_st_err_tlast),
          .ss_app_st_err_tready            (p0_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         (p0_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         (p0_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          (p0_lite_csr_awaddr),
              	  
		  .app_ss_lite_csr_wvalid          (p0_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          (p0_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           (p0_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           (p0_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          (p0_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          (p0_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           (p0_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         (p0_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         (p0_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          (p0_lite_csr_araddr),
              	  
		  .ss_app_lite_csr_rvalid          (p0_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          (p0_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           (p0_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           (p0_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  (p0_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   (p0_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  (p0_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid (p0_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            (p0_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        (p0_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              (p0_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          (p0_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            (p0_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        (p0_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              (p0_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          (p0_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            (p0_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        (p0_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              (p0_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          (p0_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            (p0_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        (p0_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              (p0_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          (p0_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p0_coreclkout_hip_i     ),
          .rst_n                                (p0_reset_status_n_i     ),

          .rx_st0_bar_i                         (p0_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p0_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p0_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p0_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st0_pfnum_o     :  '0     ),
          .rx_st1_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st1_pfnum_o     :  '0     ),
          .rx_st2_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st2_pfnum_o     :  '0     ),
          .rx_st3_pfnum_i                       (  (core16_total_pf_count_hwtcl != 1)  ? p0_rx_st3_pfnum_o     :  '0     ),

          .rx_st0_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core16_enable_sriov_hwtcl           ? p0_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core16_enable_sriov_hwtcl           ? p0_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p0_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p0_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p0_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p0_rx_st3_eop_o),                

          .rx_st0_header_i                      (p0_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p0_rx_st1_hdr_o),                
          .rx_st2_header_i                      (p0_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p0_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p0_rx_st0_data_o),               
          .rx_st1_payload_i                     (p0_rx_st1_data_o),               
          .rx_st2_payload_i                     (p0_rx_st2_data_o),               
          .rx_st3_payload_i                     (p0_rx_st3_data_o),               

          .rx_st0_sop_i                         (p0_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p0_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p0_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p0_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p0_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p0_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p0_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p0_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p0_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p0_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p0_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p0_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p0_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p0_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p0_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p0_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p0_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p0_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p0_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p0_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p0_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p0_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p0_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p0_rx_st3_prefix_o),             

          .rx_par_err_i                         (p0_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p0_rx_st_ready_i		),               
		  .rx_st0_data_par_i 					(p0_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p0_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p0_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p0_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p0_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p0_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p0_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p0_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p0_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p0_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p0_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p0_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p0_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p0_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p0_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p0_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p0_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p0_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p0_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p0_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p0_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p0_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p0_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p0_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p0_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p0_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p0_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p0_tx_st3_eop_i),                

          .tx_st0_header_o                      (p0_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p0_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p0_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p0_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p0_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p0_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p0_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p0_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p0_tx_st0_data_i),               
          .tx_st1_payload_o                     (p0_tx_st1_data_i),               
          .tx_st2_payload_o                     (p0_tx_st2_data_i),               
          .tx_st3_payload_o                     (p0_tx_st3_data_i),               

          .tx_st0_sop_o                         (p0_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p0_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p0_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p0_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p0_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p0_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p0_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p0_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p0_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p0_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p0_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p0_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p0_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p0_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p0_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p0_tx_st3_pvalid_i),             

          .tx_par_err_i                         (  p0_tx_st_par_err_o              ),
          .tx_st_ready_i                        (p0_tx_st_ready_o),               

          .dl_timer_update_i                    ( p0_dl_timer_update_o              ),
          .dl_up_i                              ( p0_dl_up_o                        ), 
          .link_up_i                            ( p0_link_up_o                      ), 

          .app_rst_n 							(),
	  	  .pin_perst_n                          ( p0_pin_perst_n                   ),	
    	  .app_clk 								(),

		  .hip_reconfig_read_o                  ( p0_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p0_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p0_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p0_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p0_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p0_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p0_hip_reconfig_waitrequest_o        ),

           
		  .cpl_timeout_i                        ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core16_enable_cpl_timeout_hwtcl ? p0_cpl_timeout_cpl_tag_o       : '0  ),
		  
		  .app_err_valid_o                      ( p0_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p0_app_err_hdr_i                       ),
          .app_err_info_o                       ( p0_app_err_info_i                      ),
          .app_err_func_num_o                   ( p0_app_err_func_num_i                  ),
          
		  .serr_i                               ( p0_serr_out_o                          ),
          .app_err_ready_i                      ( p0_app_err_ready_o                     ),
		  
			  .surprise_down_err_i                  (p0_surprise_down_err_o             ),
          .ltssm_state_i                        (p0_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p0_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p0_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p0_pm_curnt_state_o                ),
          .pm_dstate_i                          (p0_pm_dstate_o                     ),
          .pld_gp_ctrl_i                        (p0_pld_gp_ctrl_o                   ),
          
		.pld_in_use_i							(p0_pld_in_use_o	),	
        .user_mode_to_pld_i						(p0_user_mode_to_pld_o	),	
        .apps_pm_xmt_pme_o						(p0_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p0_app_xfer_pending_i	),	
        .app_init_rst_o							(p0_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p0_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p0_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p0_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p0_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p0_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p0_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p0_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p0_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p0_sys_eml_interlock_engaged_i	),	
      		.pld_gp_status_o						(p0_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p0_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p0_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p0_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p0_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(p0_app_req_retry_en_i	),	
        .prs_event_valid_o						(p0_prs_event_valid_i	),	
        .prs_event_func_o						(p0_prs_event_func_i	),	
        .prs_event_o							(p0_prs_event_i		 	),	
        
		.hip_reconfig_clk_o					   	(	),
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_vfaccess_o 	: '0	),	
        .virtio_pcicfg_vfnum_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_vfnum_o 		: '0	),	
        .virtio_pcicfg_pfnum_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_pfnum_o 		: '0	),	
        .virtio_pcicfg_bar_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_bar_o 		: '0	),	
        .virtio_pcicfg_length_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_length_o 	: '0	),	
        .virtio_pcicfg_baroffset_i				(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_baroffset_o	: '0	),	
        .virtio_pcicfg_cfgdata_i				(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_cfgdata_o 	: '0	),	
        .virtio_pcicfg_cfgwr_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_cfgwr_o 		: '0	),	
        .virtio_pcicfg_cfgrd_i					(core16_enable_virtio_hwtcl ? p0_virtio_pcicfg_cfgrd_o 		: '0	)	
		
            	
    );

if (pciess_topology=="pcie_x4x4x4x4" || pciess_topology=="pcie_x8x8") begin : gen_pciess_rp_p1
      intel_pciess_rtile_rp_wrapper #(
      .device_family                   (device_family),
      .TILE                            (TILE),
	  .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
      .device_type                     ("RP"),
      .FUNC_MODE                       (core8_FUNC_MODE),
      .HEADER_SCHEME                   (core8_HEADER_SCHEME),
      .Header_Packing_scheme           (core8_Header_Packing_scheme),
      
	  .DWIDTH                          (core8_DWIDTH),
      .NUM_OF_SEG                      (core8_NUM_OF_SEG),
      
      .ST_readyLatency                 (core8_ST_readyLatency),
      .LiteSlvAWD                      (core8_LiteSlvAWD),
      .LiteSlvDWD                      (core8_LiteSlvDWD),
      .LiteMstrAWD                     (core8_LiteMstrAWD),
      .LiteMstrDWD                     (core8_LiteMstrDWD),
      .LiteMstr_readyLatency           (core8_LiteMstr_readyLatency),
	  .MMAWD                           (core8_MMAWD),
      .MMBLWD                          (core8_MMBLWD),
      .MMDWD                           (core8_MMDWD),
      .MM_readyLatency                 (core8_MM_readyLatency),
      .autonomous_pm_enter_l23         (core8_autonomous_pm_enter_l23),
      .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
      .perfmon_clk_freq                (core8_perfmon_clk_freq),
      .SS_PWIDTH                       (SS_PWIDTH),
      
      .hssi_ctp_func_mode              (hssi_ctp_func_mode),
      .hssi_ctp_topology               (hssi_ctp_topology),
	  .payload_width                   (core8_payload_width_integer_hwtcl),
      .hdr_width                       (core8_hdr_width_integer_hwtcl),
      .pfx_width                       (core8_pfx_width_integer_hwtcl),
      .double_width                    (core8_double_width_integer_hwtcl),
      .empty_width                     (core8_empty_width_integer_hwtcl),
            
	  .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
      .virtio_pci_cfg_acc_intf_en_hwtcl(core8_virtio_pci_cfg_acc_intf_en_hwtcl),
    .seg_width_hwtcl                     (seg_width_hwtcl),
	  .PF0_SLOT_IMP                    (hssi_ctp_u_wrpcie_top_u_core8_pf0_pcie_slot_imp),
      .PORT_ID                         (1),
      .ENABLE_VIRTIO                   (core8_enable_virtio_hwtcl),
          .inst_id_hwtcl                   (core8_inst_id_hwtcl), 
      
      .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
      .PERFMON_EN                      (PERFMON_EN),
      .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
	  .HIGH_SPEED                      (HIGH_SPEED)
      ) u_pciess_rp_p1 (
    	  .ninit_done 					   		(ninit_done),
          .slow_clk                        		( slow_clk                       ),
          .slow_rst_n                      		(p1_slow_reset_status_n         ),
    	  .axi_st_clk                      		(p1_axi_st_clk),
    	  .axi_lite_clk                    		(p1_axi_lite_clk),
    	  .axi_st_areset_n                 		(p1_axi_st_areset_n),
    	  .axi_lite_areset_n               		(p1_axi_lite_areset_n),
    	  .axi_mm_clk                      		(p1_axi_mm_clk),
    	  .axi_mm_areset_n                 		(p1_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            		(p1_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            		(p1_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        		(p1_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        		(p1_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               		(p1_subsystem_rst_req),
    	  .subsystem_rst_rdy               		(p1_subsystem_rst_rdy),
    	  .initiate_warmrst_req            		(p1_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            		(p1_initiate_rst_req_rdy),
		  
          .ss_app_st_rx_tvalid             		(p1_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             		(p1_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              		(p1_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              		(p1_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              		(p1_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       		(p1_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment 		(p1_ss_app_st_rx_tuser_last_segment),	      
          .ss_app_st_rx_tuser_hvalid                    (p1_ss_app_st_rx_tuser_hvalid ),					
          .ss_app_st_rx_tuser_transaction_abort         (p1_ss_app_st_rx_tuser_transaction_abort ),
          .ss_app_st_rx_tuser_hdr                       (p1_ss_app_st_rx_tuser_hdr  ),

          .app_ss_st_tx_tvalid             		(p1_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             		(p1_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              		(p1_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              		(p1_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              		(p1_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       		(p1_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment 		(p1_app_ss_st_tx_tuser_last_segment),
          .app_ss_st_tx_tuser_hvalid                    (p1_app_ss_st_tx_tuser_hvalid),
          .app_ss_st_tx_tuser_transaction_abort         (p1_app_ss_st_tx_tuser_transaction_abort),
          .app_ss_st_tx_tuser_hdr                       (p1_app_ss_st_tx_tuser_hdr),

			  .ss_app_st_txcrdt_tvalid         		(p1_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          		(p1_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   		(p1_ss_app_st_rxcrdt_tvalid), 		
    	  .ss_app_st_rxcrdt_tdata  		   		(p1_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          		(p1_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           		(p1_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid                         (p1_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	                        (p1_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type               (p1_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast                          (p1_app_ss_st_err_tlast),
          .ss_app_st_err_tready                         (p1_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         		(p1_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         		(p1_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          		(p1_lite_csr_awaddr),
              	  
		  .app_ss_lite_csr_wvalid          		(p1_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          		(p1_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           		(p1_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           		(p1_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          		(p1_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          		(p1_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           		(p1_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         		(p1_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         		(p1_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          		(p1_lite_csr_araddr),
              	  
		  .ss_app_lite_csr_rvalid          		(p1_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          		(p1_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           		(p1_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           		(p1_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  		(p1_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   		(p1_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  		(p1_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid 		(p1_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            		(p1_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        		(p1_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              		(p1_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          		(p1_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            		(p1_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        		(p1_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              		(p1_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          		(p1_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            		(p1_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        		(p1_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              		(p1_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          		(p1_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            		(p1_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        		(p1_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              		(p1_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          		(p1_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p1_coreclkout_hip_i     ),
          .rst_n                                (p1_reset_status_n_i     ),

          .rx_st0_bar_i                         (p1_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p1_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p1_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p1_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st0_pfnum_o  :  '0  ),
          .rx_st1_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st1_pfnum_o  :  '0  ),
          .rx_st2_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st2_pfnum_o  :  '0  ),
          .rx_st3_pfnum_i                       ( (core8_total_pf_count_hwtcl != 1)  ? p1_rx_st3_pfnum_o  :  '0  ),

          .rx_st0_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core8_enable_sriov_hwtcl     ? p1_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core8_enable_sriov_hwtcl     ? p1_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p1_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p1_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p1_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p1_rx_st3_eop_o),                

          .rx_st0_header_i                      (p1_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p1_rx_st1_hdr_o),                
          .rx_st2_header_i                      (p1_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p1_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p1_rx_st0_data_o),               
          .rx_st1_payload_i                     (p1_rx_st1_data_o),               
          .rx_st2_payload_i                     (p1_rx_st2_data_o),               
          .rx_st3_payload_i                     (p1_rx_st3_data_o),               

          .rx_st0_sop_i                         (p1_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p1_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p1_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p1_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p1_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p1_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p1_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p1_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p1_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p1_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p1_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p1_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p1_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p1_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p1_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p1_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p1_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p1_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p1_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p1_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p1_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p1_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p1_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p1_rx_st3_prefix_o),             

          .rx_par_err_i                         (p1_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p1_rx_st_ready_i		),        
		  .rx_st0_data_par_i 					(p1_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p1_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p1_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p1_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p1_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p1_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p1_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p1_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p1_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p1_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p1_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p1_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p1_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p1_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p1_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p1_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p1_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p1_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p1_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p1_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p1_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p1_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p1_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p1_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p1_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p1_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p1_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p1_tx_st3_eop_i),                

          .tx_st0_header_o                      (p1_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p1_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p1_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p1_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p1_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p1_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p1_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p1_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p1_tx_st0_data_i),               
          .tx_st1_payload_o                     (p1_tx_st1_data_i),               
          .tx_st2_payload_o                     (p1_tx_st2_data_i),               
          .tx_st3_payload_o                     (p1_tx_st3_data_i),               

          .tx_st0_sop_o                         (p1_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p1_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p1_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p1_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p1_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p1_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p1_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p1_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p1_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p1_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p1_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p1_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p1_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p1_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p1_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p1_tx_st3_pvalid_i),             

          .tx_par_err_i                         ( p1_tx_st_par_err_o         ),
          .tx_st_ready_i                        ( p1_tx_st_ready_o),               

          .dl_timer_update_i                    ( p1_dl_timer_update_o       ),
          .dl_up_i                              ( p1_dl_up_o                 ),   
          .link_up_i                            ( p1_link_up_o               ),   

          .app_rst_n 							(	),
	  	  .pin_perst_n                          ( p1_pin_perst_n                   ),	
    	  .app_clk 								(	),

		  .hip_reconfig_read_o                  ( p1_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p1_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p1_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p1_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p1_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p1_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p1_hip_reconfig_waitrequest_o        ),

 	          
		  .cpl_timeout_i                        ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core8_enable_cpl_timeout_hwtcl ? p1_cpl_timeout_cpl_tag_o       : '0  ),
		  
		  .app_err_valid_o                      ( p1_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p1_app_err_hdr_i                       ),
          .app_err_info_o                       ( p1_app_err_info_i                      ),
          .app_err_func_num_o                   ( p1_app_err_func_num_i                  ),
          
		  .serr_i                               ( p1_serr_out_o                          ),
          .app_err_ready_i                      ( p1_app_err_ready_o                     ),
		  .surprise_down_err_i                  (p1_surprise_down_err_o             ),
          .ltssm_state_i                        (p1_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p1_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p1_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p1_pm_curnt_state_o                ),
          .pm_dstate_i                          (p1_pm_dstate_o                     ),
          .pld_gp_ctrl_i                        (p1_pld_gp_ctrl_o                   ),
   		.pld_in_use_i							(p1_pld_in_use_o	),	
        .user_mode_to_pld_i						(p1_user_mode_to_pld_o	),	
            .apps_pm_xmt_pme_o						(p1_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p1_app_xfer_pending_i	),	
        .app_init_rst_o							(p1_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p1_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p1_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p1_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p1_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p1_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p1_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p1_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p1_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p1_sys_eml_interlock_engaged_i	),	
       		.pld_gp_status_o						(p1_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p1_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p1_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p1_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p1_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(p1_app_req_retry_en_i	),	
        .prs_event_valid_o						(p1_prs_event_valid_i	),	
        .prs_event_func_o						(p1_prs_event_func_i	),	
        .prs_event_o							(p1_prs_event_i		 	),	
		
		.hip_reconfig_clk_o   					(	),
		
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_vfaccess_o	:'0 ),	
        .virtio_pcicfg_vfnum_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_vfnum_o 		:'0 ),	
        .virtio_pcicfg_pfnum_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_pfnum_o 		:'0 ),	
        .virtio_pcicfg_bar_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_bar_o 		:'0 ),	
        .virtio_pcicfg_length_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_length_o 		:'0 ),	
        .virtio_pcicfg_baroffset_i				(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_baroffset_o 	:'0 ),	
        .virtio_pcicfg_cfgdata_i				(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_cfgdata_o 	:'0 ),	
        .virtio_pcicfg_cfgwr_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_cfgwr_o 		:'0 ),	
        .virtio_pcicfg_cfgrd_i					(core8_enable_virtio_hwtcl ? p1_virtio_pcicfg_cfgrd_o 		:'0 )		

     
      );
	end

    if (pciess_topology=="pcie_x4x4x4x4") begin : gen_pciess_rp_p2_p3
     intel_pciess_rtile_rp_wrapper  #(
      .device_family                   (device_family),
      .TILE                            (TILE),
      .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
      .device_type                     ("RP"),
      .FUNC_MODE                       (core4_0_FUNC_MODE),
      .HEADER_SCHEME                   (core4_0_HEADER_SCHEME),
      .Header_Packing_scheme           (core4_0_Header_Packing_scheme),
  	  .DWIDTH                          (core4_0_DWIDTH),
      .NUM_OF_SEG                      (core4_0_NUM_OF_SEG),
      
 	  .ST_readyLatency                 (core4_0_ST_readyLatency),
      .LiteSlvAWD                      (core4_0_LiteSlvAWD),
      .LiteSlvDWD                      (core4_0_LiteSlvDWD),
      .LiteMstrAWD                     (core4_0_LiteMstrAWD),
      .LiteMstrDWD                     (core4_0_LiteMstrDWD),
      .LiteMstr_readyLatency           (core4_0_LiteMstr_readyLatency),
      .MMAWD                           (core4_0_MMAWD),
      .MMBLWD                          (core4_0_MMBLWD),
      .MMDWD                           (core4_0_MMDWD),
      .MM_readyLatency                 (core4_0_MM_readyLatency),
      .autonomous_pm_enter_l23         (core4_0_autonomous_pm_enter_l23),
      .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
      .perfmon_clk_freq                (core4_0_perfmon_clk_freq),
      .SS_PWIDTH                       (SS_PWIDTH),
      
	  .hssi_ctp_func_mode              (hssi_ctp_func_mode),
      .hssi_ctp_topology               (hssi_ctp_topology),
      .payload_width                   (core4_0_payload_width_integer_hwtcl),
      .hdr_width                       (core4_0_hdr_width_integer_hwtcl),
      .pfx_width                       (core4_0_pfx_width_integer_hwtcl),
      .double_width                    (core4_0_double_width_integer_hwtcl),
      .empty_width                     (core4_0_empty_width_integer_hwtcl),

      .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
      .virtio_pci_cfg_acc_intf_en_hwtcl(0),
	 .seg_width_hwtcl                 (seg_width_hwtcl),
	  .PORT_ID                         (2),
      .ENABLE_VIRTIO                   (0),
          
	  .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
      .PERFMON_EN                      (PERFMON_EN),
      .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
	  .HIGH_SPEED                      (HIGH_SPEED),
   	  .PF0_SLOT_IMP                    (	),  
	      .inst_id_hwtcl                   (	)   

      ) u_pciess__rp_p2 (
    	  .ninit_done 					   		(ninit_done),
          .slow_clk                        		( slow_clk                       ),
          .slow_rst_n                      		(p2_slow_reset_status_n         ),
    	  .axi_st_clk                      		(p2_axi_st_clk),
    	  .axi_lite_clk                    		(p2_axi_lite_clk),
    	  .axi_st_areset_n                 		(p2_axi_st_areset_n),
    	  .axi_lite_areset_n               		(p2_axi_lite_areset_n),
    	  .axi_mm_clk                      		(p2_axi_mm_clk),
    	  .axi_mm_areset_n                 		(p2_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            		(p2_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            		(p2_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        		(p2_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        		(p2_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               		(p2_subsystem_rst_req),
    	  .subsystem_rst_rdy               		(p2_subsystem_rst_rdy),
    	  .initiate_warmrst_req            		(p2_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            		(p2_initiate_rst_req_rdy),
		  
	  .ss_app_st_rx_tvalid             		(p2_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             		(p2_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              		(p2_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              		(p2_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              		(p2_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       		(p2_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment 		(p2_ss_app_st_rx_tuser_last_segment),	      
	  .ss_app_st_rx_tuser_hvalid       		(p2_ss_app_st_rx_tuser_hvalid ),					
	  .ss_app_st_rx_tuser_transaction_abort         (p2_ss_app_st_rx_tuser_transaction_abort ),
	  .ss_app_st_rx_tuser_hdr      	   		(p2_ss_app_st_rx_tuser_hdr  ),

	  .app_ss_st_tx_tvalid             		(p2_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             		(p2_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              		(p2_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              		(p2_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              		(p2_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       		(p2_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment 		(p2_app_ss_st_tx_tuser_last_segment),
          .app_ss_st_tx_tuser_hvalid                    (p2_app_ss_st_tx_tuser_hvalid),
          .app_ss_st_tx_tuser_transaction_abort         (p2_app_ss_st_tx_tuser_transaction_abort),
          .app_ss_st_tx_tuser_hdr                       (p2_app_ss_st_tx_tuser_hdr),

		    	  
		  .ss_app_st_txcrdt_tvalid         		(p2_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          		(p2_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   		(p2_ss_app_st_rxcrdt_tvalid), 		
    	  .ss_app_st_rxcrdt_tdata  		   		(p2_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          		(p2_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           		(p2_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid                         (p2_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	                        (p2_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type               (p2_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast                          (p2_app_ss_st_err_tlast),
          .ss_app_st_err_tready                         (p2_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         		(p2_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         		(p2_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          		(p2_lite_csr_awaddr),
              	  
		  .app_ss_lite_csr_wvalid          		(p2_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          		(p2_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           		(p2_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           		(p2_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          		(p2_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          		(p2_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           		(p2_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         		(p2_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         		(p2_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          		(p2_lite_csr_araddr),
              	  
		  .ss_app_lite_csr_rvalid          		(p2_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          		(p2_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           		(p2_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           		(p2_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  		(p2_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   		(p2_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  		(p2_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid 		(p2_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            		(p2_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        		(p2_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              		(p2_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          		(p2_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            		(p2_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        		(p2_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              		(p2_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          		(p2_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            		(p2_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        		(p2_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              		(p2_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          		(p2_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            		(p2_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        		(p2_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              		(p2_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          		(p2_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p2_coreclkout_hip_i     ),
          .rst_n                                (p2_reset_status_n_i     ),

          .rx_st0_bar_i                         (p2_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p2_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p2_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p2_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st0_pfnum_o  :  '0  ),
          .rx_st1_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st1_pfnum_o  :  '0  ),
          .rx_st2_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st2_pfnum_o  :  '0  ),
          .rx_st3_pfnum_i                       ( (core4_0_total_pf_count_hwtcl != 1)  ? p2_rx_st3_pfnum_o  :  '0  ),

          .rx_st0_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core4_0_enable_sriov_hwtcl     ? p2_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core4_0_enable_sriov_hwtcl     ? p2_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p2_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p2_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p2_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p2_rx_st3_eop_o),                

          .rx_st0_header_i                      (p2_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p2_rx_st1_hdr_o),               
          .rx_st2_header_i                      (p2_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p2_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p2_rx_st0_data_o),               
          .rx_st1_payload_i                     (p2_rx_st1_data_o),               
          .rx_st2_payload_i                     (p2_rx_st2_data_o),               
          .rx_st3_payload_i                     (p2_rx_st3_data_o),               

          .rx_st0_sop_i                         (p2_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p2_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p2_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p2_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p2_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p2_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p2_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p2_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p2_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p2_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p2_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p2_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p2_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p2_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p2_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p2_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p2_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p2_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p2_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p2_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p2_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p2_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p2_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p2_rx_st3_prefix_o),             

          .rx_par_err_i                         (p2_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p2_rx_st_ready_i		),        
		  .rx_st0_data_par_i 					(p2_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p2_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p2_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p2_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p2_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p2_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p2_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p2_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p2_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p2_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p2_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p2_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p2_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p2_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p2_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p2_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p2_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p2_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p2_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p2_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p2_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p2_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p2_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p2_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p2_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p2_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p2_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p2_tx_st3_eop_i),                

          .tx_st0_header_o                      (p2_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p2_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p2_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p2_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p2_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p2_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p2_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p2_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p2_tx_st0_data_i),               
          .tx_st1_payload_o                     (p2_tx_st1_data_i),               
          .tx_st2_payload_o                     (p2_tx_st2_data_i),               
          .tx_st3_payload_o                     (p2_tx_st3_data_i),               

          .tx_st0_sop_o                         (p2_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p2_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p2_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p2_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p2_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p2_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p2_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p2_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p2_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p2_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p2_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p2_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p2_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p2_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p2_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p2_tx_st3_pvalid_i),             

          .tx_par_err_i                         ( p2_tx_st_par_err_o         ),
          .tx_st_ready_i                        ( p2_tx_st_ready_o),               

          .dl_timer_update_i                    ( p2_dl_timer_update_o       ),
          .dl_up_i                              ( p2_dl_up_o                 ),   
          .link_up_i                            ( p2_link_up_o               ),   

          .app_rst_n 							(	),
	  	  .pin_perst_n                          ( p2_pin_perst_n                   ),	
    	  .app_clk 								(	),

		  .hip_reconfig_read_o                  ( p2_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p2_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p2_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p2_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p2_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p2_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p2_hip_reconfig_waitrequest_o        ),

           
		  .cpl_timeout_i                        ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core4_0_enable_cpl_timeout_hwtcl ? p2_cpl_timeout_cpl_tag_o       : '0  ),
		  
		  .app_err_valid_o                      ( p2_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p2_app_err_hdr_i                       ),
          .app_err_info_o                       ( p2_app_err_info_i                      ),
          .app_err_func_num_o                   ( p2_app_err_func_num_i                  ),
          
		  .serr_i                               ( p2_serr_out_o                          ),
          .app_err_ready_i                      ( p2_app_err_ready_o                     ),
		  
			  .surprise_down_err_i                  (p2_surprise_down_err_o             ),
          .ltssm_state_i                        (p2_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p2_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p2_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p2_pm_curnt_state_o                ),
          .pm_dstate_i                          ({28'd0,p2_pm_dstate_o}                   ),
          .pld_gp_ctrl_i                        (p2_pld_gp_ctrl_o                   ),
      
		.pld_in_use_i							(p2_pld_in_use_o	),	
        .user_mode_to_pld_i						(p2_user_mode_to_pld_o	),	
              .apps_pm_xmt_pme_o						(p2_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p2_app_xfer_pending_i	),	
        .app_init_rst_o							(p2_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p2_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p2_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p2_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p2_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p2_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p2_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p2_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p2_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p2_sys_eml_interlock_engaged_i	),	
      
		.pld_gp_status_o						(p2_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p2_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p2_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p2_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p2_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(/*p2_app_req_retry_en_i*/	),	
        .prs_event_valid_o						(p2_prs_event_valid_i	),	
        .prs_event_func_o						(p2_prs_event_func_i	),	
        .prs_event_o							(p2_prs_event_i		 	),	
		
		.hip_reconfig_clk_o   					(	),
		
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(p2_virtio_pcicfg_vfaccess_o),	
        .virtio_pcicfg_vfnum_i					(p2_virtio_pcicfg_vfnum_o	),	
        .virtio_pcicfg_pfnum_i					(p2_virtio_pcicfg_pfnum_o	),	
        .virtio_pcicfg_bar_i					(p2_virtio_pcicfg_bar_o	),	
        .virtio_pcicfg_length_i					(p2_virtio_pcicfg_length_o	),	
        .virtio_pcicfg_baroffset_i				(p2_virtio_pcicfg_baroffset_o	),	
        .virtio_pcicfg_cfgdata_i				(p2_virtio_pcicfg_cfgdata_o	),	
        .virtio_pcicfg_cfgwr_i					(p2_virtio_pcicfg_cfgwr_o	),	
        .virtio_pcicfg_cfgrd_i					(p2_virtio_pcicfg_cfgrd_o	)	

      );

intel_pciess_rtile_rp_wrapper #(
      .device_family                   (device_family),
      .TILE                            (TILE),
      .CPL_BUFF_HDR_DOUBLE_DEPTH       (CPL_BUFF_HDR_DOUBLE_DEPTH),
      .device_type                     ("RP"),
      .FUNC_MODE                       (core4_1_FUNC_MODE),
      .HEADER_SCHEME                   (core4_1_HEADER_SCHEME),
      .Header_Packing_scheme           (core4_1_Header_Packing_scheme),
      .DWIDTH                          (core4_1_DWIDTH),
      .NUM_OF_SEG                      (core4_1_NUM_OF_SEG),
      
	  .ST_readyLatency                 (core4_1_ST_readyLatency),
      .LiteSlvAWD                      (core4_1_LiteSlvAWD),
      .LiteSlvDWD                      (core4_1_LiteSlvDWD),
      .LiteMstrAWD                     (core4_1_LiteMstrAWD),
      .LiteMstrDWD                     (core4_1_LiteMstrDWD),
      .LiteMstr_readyLatency           (core4_1_LiteMstr_readyLatency),
      .MMAWD                           (core4_1_MMAWD),
      .MMBLWD                          (core4_1_MMBLWD),
      .MMDWD                           (core4_1_MMDWD),
      .MM_readyLatency                 (core4_1_MM_readyLatency),
      .autonomous_pm_enter_l23         (core4_1_autonomous_pm_enter_l23),
      .debug_toolkit_mode              (rtile_debug_toolkit_hwtcl),
      .perfmon_clk_freq                (core4_1_perfmon_clk_freq),
      .SS_PWIDTH                       (SS_PWIDTH),
      
	  .hssi_ctp_func_mode              (hssi_ctp_func_mode),
      .hssi_ctp_topology               (hssi_ctp_topology),
      .payload_width                   (core4_1_payload_width_integer_hwtcl),
      .hdr_width                       (core4_1_hdr_width_integer_hwtcl),
      .pfx_width                       (core4_1_pfx_width_integer_hwtcl),
      .double_width                    (core4_1_double_width_integer_hwtcl),
      .empty_width                     (core4_1_empty_width_integer_hwtcl),
      
      .virtual_tlp_bypass_en_user_hwtcl(virtual_tlp_bypass_en_user_hwtcl),
      .virtio_pci_cfg_acc_intf_en_hwtcl(0),
      .seg_width_hwtcl                 (seg_width_hwtcl),
      .PORT_ID                         (3),
      .ENABLE_VIRTIO                   (0),
  	  
      .DFL_MIF_DIRECTORY               (DFL_MIF_DIRECTORY),
      .PERFMON_EN                      (PERFMON_EN),
      .BP_DEBUG_MON_EN                 (BP_DEBUG_MON_EN),
	  .HIGH_SPEED                      (HIGH_SPEED),
 	  
	 	  .PF0_SLOT_IMP                    (	),   
	      .inst_id_hwtcl                   (	)    
	 
	) u_pciess_rp_p3 (
    	  .ninit_done 					   		(ninit_done),
          .slow_clk                        		( slow_clk                       ),
          .slow_rst_n                      		(p3_slow_reset_status_n         ),
    	  .axi_st_clk                      		(p3_axi_st_clk),
    	  .axi_lite_clk                    		(p3_axi_lite_clk),
    	  .axi_st_areset_n                 		(p3_axi_st_areset_n),
    	  .axi_lite_areset_n               		(p3_axi_lite_areset_n),
    	  .axi_mm_clk                      		(p3_axi_mm_clk),
    	  .axi_mm_areset_n                 		(p3_axi_mm_areset_n),
    	  
    	  .subsystem_cold_rst_n            		(p3_subsystem_cold_rst_n),
    	  .subsystem_warm_rst_n            		(p3_subsystem_warm_rst_n),
    	  .subsystem_cold_rst_ack_n        		(p3_subsystem_cold_rst_ack_n),
    	  .subsystem_warm_rst_ack_n        		(p3_subsystem_warm_rst_ack_n),
    	  .subsystem_rst_req               		(p3_subsystem_rst_req),
    	  .subsystem_rst_rdy               		(p3_subsystem_rst_rdy),
    	  .initiate_warmrst_req            		(p3_initiate_warmrst_req),
    	  .initiate_rst_req_rdy            		(p3_initiate_rst_req_rdy),
		  
          .ss_app_st_rx_tvalid             		(p3_ss_app_st_rx_tvalid),
    	  .app_ss_st_rx_tready             		(p3_app_ss_st_rx_tready),
    	  .ss_app_st_rx_tdata              		(p3_ss_app_st_rx_tdata),
    	  .ss_app_st_rx_tkeep              		(p3_ss_app_st_rx_tkeep),
    	  .ss_app_st_rx_tlast              		(p3_ss_app_st_rx_tlast),
    	  .ss_app_st_rx_tuser_vendor       		(p3_ss_app_st_rx_tuser_vendor),
    	  .ss_app_st_rx_tuser_last_segment 		(p3_ss_app_st_rx_tuser_last_segment),	      
          .ss_app_st_rx_tuser_hvalid                    (p3_ss_app_st_rx_tuser_hvalid ),					
          .ss_app_st_rx_tuser_transaction_abort         (p3_ss_app_st_rx_tuser_transaction_abort ),
          .ss_app_st_rx_tuser_hdr                       (p3_ss_app_st_rx_tuser_hdr  ),

	  .app_ss_st_tx_tvalid             		(p3_app_ss_st_tx_tvalid),
    	  .ss_app_st_tx_tready             		(p3_ss_app_st_tx_tready),
    	  .app_ss_st_tx_tdata              		(p3_app_ss_st_tx_tdata),
    	  .app_ss_st_tx_tkeep              		(p3_app_ss_st_tx_tkeep),
    	  .app_ss_st_tx_tlast              		(p3_app_ss_st_tx_tlast),
    	  .app_ss_st_tx_tuser_vendor       		(p3_app_ss_st_tx_tuser_vendor),
    	  .app_ss_st_tx_tuser_last_segment 		(p3_app_ss_st_tx_tuser_last_segment),
          .app_ss_st_tx_tuser_hvalid                    (p3_app_ss_st_tx_tuser_hvalid),
          .app_ss_st_tx_tuser_transaction_abort         (p3_app_ss_st_tx_tuser_transaction_abort),
          .app_ss_st_tx_tuser_hdr                       (p3_app_ss_st_tx_tuser_hdr),

	    	  
		  .ss_app_st_txcrdt_tvalid         		(p3_ss_app_st_txcrdt_tvalid),
    	  .ss_app_st_txcrdt_tdata          		(p3_ss_app_st_txcrdt_tdata),
    	  .ss_app_st_rxcrdt_tvalid 		   		(p3_ss_app_st_rxcrdt_tvalid), 		
    	  .ss_app_st_rxcrdt_tdata  		   		(p3_ss_app_st_rxcrdt_tdata),

    	  .ss_app_st_cplto_tvalid          		(p3_ss_app_st_cplto_tvalid),
    	  .ss_app_st_cplto_tdata           		(p3_ss_app_st_cplto_tdata),

          .app_ss_st_err_tvalid                         (p3_app_ss_st_err_tvalid),
          .app_ss_st_err_tdata	                        (p3_app_ss_st_err_tdata),
          .app_ss_st_err_tuser_error_type               (p3_app_ss_st_err_tuser_error_type),
          .app_ss_st_err_tlast                          (p3_app_ss_st_err_tlast),
          .ss_app_st_err_tready                         (p3_ss_app_st_err_tready),

		  .app_ss_lite_csr_awvalid         		(p3_lite_csr_awvalid),
    	  .ss_app_lite_csr_awready         		(p3_lite_csr_awready),
    	  .app_ss_lite_csr_awaddr          		(p3_lite_csr_awaddr),
              	  
		  .app_ss_lite_csr_wvalid          		(p3_lite_csr_wvalid),
    	  .ss_app_lite_csr_wready          		(p3_lite_csr_wready),
    	  .app_ss_lite_csr_wdata           		(p3_lite_csr_wdata),
    	  .app_ss_lite_csr_wstrb           		(p3_lite_csr_wstrb),
    	  
		  .ss_app_lite_csr_bvalid          		(p3_lite_csr_bvalid),
    	  .app_ss_lite_csr_bready          		(p3_lite_csr_bready),
    	  .ss_app_lite_csr_bresp           		(p3_lite_csr_bresp),
    	  
		  .app_ss_lite_csr_arvalid         		(p3_lite_csr_arvalid),
    	  .ss_app_lite_csr_arready         		(p3_lite_csr_arready),
    	  .app_ss_lite_csr_araddr          		(p3_lite_csr_araddr),
              	  
		  .ss_app_lite_csr_rvalid          		(p3_lite_csr_rvalid),
    	  .app_ss_lite_csr_rready          		(p3_lite_csr_rready),
    	  .ss_app_lite_csr_rdata           		(p3_lite_csr_rdata),
    	  .ss_app_lite_csr_rresp           		(p3_lite_csr_rresp),

		  .ss_app_virtio_pcicfgreq_tvalid  		(p3_ss_app_virtio_pcicfgreq_tvalid),
    	  .ss_app_virtio_pcicfgreq_tdata   		(p3_ss_app_virtio_pcicfgreq_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tdata  		(p3_app_ss_virtio_pcicfgcmpl_tdata),
    	  .app_ss_virtio_pcicfgcmpl_tvalid 		(p3_app_ss_virtio_pcicfgcmpl_tvalid),
    	  

 		  .tx_st_hcrdt_update_i            		(p3_tx_st_hcrdt_update_o),        
   		  .tx_st_hcrdt_update_cnt_i        		(p3_tx_st_hcrdt_update_cnt_o),    
    	  .tx_st_hcrdt_init_i              		(p3_tx_st_hcrdt_init_o),          
   		  .tx_st_hcrdt_init_ack_o          		(p3_tx_st_hcrdt_init_ack_i),      
   		  .tx_st_dcrdt_update_i            		(p3_tx_st_dcrdt_update_o),        
   		  .tx_st_dcrdt_update_cnt_i        		(p3_tx_st_dcrdt_update_cnt_o),    
   		  .tx_st_dcrdt_init_i              		(p3_tx_st_dcrdt_init_o),          
   		  .tx_st_dcrdt_init_ack_o          		(p3_tx_st_dcrdt_init_ack_i),  

		  .rx_st_hcrdt_update_o            		(p3_rx_st_hcrdt_update_i),        
    	  .rx_st_hcrdt_update_cnt_o        		(p3_rx_st_hcrdt_update_cnt_i),    
    	  .rx_st_hcrdt_init_o              		(p3_rx_st_hcrdt_init_i),          
    	  .rx_st_hcrdt_init_ack_i          		(p3_rx_st_hcrdt_init_ack_o),      
    	  .rx_st_dcrdt_update_o            		(p3_rx_st_dcrdt_update_i),        
    	  .rx_st_dcrdt_update_cnt_o        		(p3_rx_st_dcrdt_update_cnt_i),    
    	  .rx_st_dcrdt_init_o              		(p3_rx_st_dcrdt_init_i),          
    	  .rx_st_dcrdt_init_ack_i          		(p3_rx_st_dcrdt_init_ack_o),      
         
		  .coreclkout_hip                       (p3_coreclkout_hip_i     ),
          .rst_n                                (p3_reset_status_n_i     ),

          .rx_st0_bar_i                         (p3_rx_st0_bar_o),                
          .rx_st1_bar_i                         (p3_rx_st1_bar_o),                
          .rx_st2_bar_i                         (p3_rx_st2_bar_o),                
          .rx_st3_bar_i                         (p3_rx_st3_bar_o),                
          .rx_st0_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st0_pfnum_o  :  '0  ),
          .rx_st1_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st1_pfnum_o  :  '0  ),
          .rx_st2_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st2_pfnum_o  :  '0  ),
          .rx_st3_pfnum_i                       ( (core4_1_total_pf_count_hwtcl != 1)  ? p3_rx_st3_pfnum_o  :  '0  ),

          .rx_st0_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st0_vfactive_o  :  '0     ),
          .rx_st1_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st1_vfactive_o  :  '0     ),
          .rx_st2_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st2_vfactive_o  :  '0     ),
          .rx_st3_vfactive_i                    (  core4_1_enable_sriov_hwtcl     ? p3_rx_st3_vfactive_o  :  '0     ),

          .rx_st0_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st0_vfnum_o     :  '0     ),
          .rx_st1_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st1_vfnum_o     :  '0     ),
          .rx_st2_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st2_vfnum_o     :  '0     ),
          .rx_st3_vfnum_i                       (  core4_1_enable_sriov_hwtcl     ? p3_rx_st3_vfnum_o     :  '0     ),

          .rx_st0_eop_i                         (p3_rx_st0_eop_o),                
          .rx_st1_eop_i                         (p3_rx_st1_eop_o),                
          .rx_st2_eop_i                         (p3_rx_st2_eop_o),                
          .rx_st3_eop_i                         (p3_rx_st3_eop_o),                

          .rx_st0_header_i                      (p3_rx_st0_hdr_o),                
          .rx_st1_header_i                      (p3_rx_st1_hdr_o),                
          .rx_st2_header_i                      (p3_rx_st2_hdr_o),                
          .rx_st3_header_i                      (p3_rx_st3_hdr_o),                

          .rx_st0_payload_i                     (p3_rx_st0_data_o),               
          .rx_st1_payload_i                     (p3_rx_st1_data_o),               
          .rx_st2_payload_i                     (p3_rx_st2_data_o),               
          .rx_st3_payload_i                     (p3_rx_st3_data_o),               

          .rx_st0_sop_i                         (p3_rx_st0_sop_o),                
          .rx_st1_sop_i                         (p3_rx_st1_sop_o),                
          .rx_st2_sop_i                         (p3_rx_st2_sop_o),                
          .rx_st3_sop_i                         (p3_rx_st3_sop_o),                

          .rx_st0_hvalid_i                      (p3_rx_st0_hvalid_o),             
          .rx_st1_hvalid_i                      (p3_rx_st1_hvalid_o),             
          .rx_st2_hvalid_i                      (p3_rx_st2_hvalid_o),             
          .rx_st3_hvalid_i                      (p3_rx_st3_hvalid_o),             

          .rx_st0_dvalid_i                      (p3_rx_st0_dvalid_o),             
          .rx_st1_dvalid_i                      (p3_rx_st1_dvalid_o),             
          .rx_st2_dvalid_i                      (p3_rx_st2_dvalid_o),             
          .rx_st3_dvalid_i                      (p3_rx_st3_dvalid_o),             

          .rx_st0_pvalid_i                      (p3_rx_st0_pvalid_o),             
          .rx_st1_pvalid_i                      (p3_rx_st1_pvalid_o),             
          .rx_st2_pvalid_i                      (p3_rx_st2_pvalid_o),             
          .rx_st3_pvalid_i                      (p3_rx_st3_pvalid_o),             

          .rx_st0_empty_i                       (p3_rx_st0_empty_o),              
          .rx_st1_empty_i                       (p3_rx_st1_empty_o),              
          .rx_st2_empty_i                       (p3_rx_st2_empty_o),              
          .rx_st3_empty_i                       (p3_rx_st3_empty_o),              

          .rx_st0_tlp_prfx_i                    (p3_rx_st0_prefix_o),             
          .rx_st1_tlp_prfx_i                    (p3_rx_st1_prefix_o),             
          .rx_st2_tlp_prfx_i                    (p3_rx_st2_prefix_o),             
          .rx_st3_tlp_prfx_i                    (p3_rx_st3_prefix_o),             

          .rx_par_err_i                         (p3_rx_st_par_err_o     ),
          .rx_st_ready_o                        (p3_rx_st_ready_i		),        
		  .rx_st0_data_par_i 					(p3_rx_st0_data_par_o   ),
		  .rx_st1_data_par_i					(p3_rx_st1_data_par_o	),
		  .rx_st2_data_par_i					(p3_rx_st2_data_par_o	),
		  .rx_st3_data_par_i					(p3_rx_st3_data_par_o	),
		  .rx_st0_hdr_par_i						(p3_rx_st0_hdr_par_o	),
		  .rx_st1_hdr_par_i						(p3_rx_st1_hdr_par_o	),
		  .rx_st2_hdr_par_i						(p3_rx_st2_hdr_par_o	),
		  .rx_st3_hdr_par_i  					(p3_rx_st3_hdr_par_o	),	
		  .rx_st0_prefix_par_i					(p3_rx_st0_prefix_par_o	),
		  .rx_st1_prefix_par_i					(p3_rx_st1_prefix_par_o	),
		  .rx_st2_prefix_par_i					(p3_rx_st2_prefix_par_o	),
		  .rx_st3_prefix_par_i					(p3_rx_st3_prefix_par_o	),
		  .tx_st0_data_par_o 					(p3_tx_st0_data_par_i	),    
          .tx_st1_data_par_o 					(p3_tx_st1_data_par_i	),
          .tx_st2_data_par_o 					(p3_tx_st2_data_par_i	),
          .tx_st3_data_par_o 					(p3_tx_st3_data_par_i	),
          .tx_st0_hdr_par_o						(p3_tx_st0_hdr_par_i	),
          .tx_st1_hdr_par_o						(p3_tx_st1_hdr_par_i	),
          .tx_st2_hdr_par_o						(p3_tx_st2_hdr_par_i	),
          .tx_st3_hdr_par_o						(p3_tx_st3_hdr_par_i	),
          .tx_st0_prefix_par_o					(p3_tx_st0_prefix_par_i	),
          .tx_st1_prefix_par_o					(p3_tx_st1_prefix_par_i	),
          .tx_st2_prefix_par_o					(p3_tx_st2_prefix_par_i	),
          .tx_st3_prefix_par_o					(p3_tx_st3_prefix_par_i	),

          .tx_st0_eop_o                         (p3_tx_st0_eop_i),                
          .tx_st1_eop_o                         (p3_tx_st1_eop_i),                
          .tx_st2_eop_o                         (p3_tx_st2_eop_i),                
          .tx_st3_eop_o                         (p3_tx_st3_eop_i),                

          .tx_st0_header_o                      (p3_tx_st0_hdr_i),                
          .tx_st1_header_o                      (p3_tx_st1_hdr_i),                
          .tx_st2_header_o                      (p3_tx_st2_hdr_i),                
          .tx_st3_header_o                      (p3_tx_st3_hdr_i),                

          .tx_st0_prefix_o                      (p3_tx_st0_prefix_i),             
          .tx_st1_prefix_o                      (p3_tx_st1_prefix_i),             
          .tx_st2_prefix_o                      (p3_tx_st2_prefix_i),             
          .tx_st3_prefix_o                      (p3_tx_st3_prefix_i),             

          .tx_st0_payload_o                     (p3_tx_st0_data_i),               
          .tx_st1_payload_o                     (p3_tx_st1_data_i),               
          .tx_st2_payload_o                     (p3_tx_st2_data_i),               
          .tx_st3_payload_o                     (p3_tx_st3_data_i),               

          .tx_st0_sop_o                         (p3_tx_st0_sop_i),                
          .tx_st1_sop_o                         (p3_tx_st1_sop_i),                
          .tx_st2_sop_o                         (p3_tx_st2_sop_i),                
          .tx_st3_sop_o                         (p3_tx_st3_sop_i),                

          .tx_st0_dvalid_o                      (p3_tx_st0_dvalid_i),             
          .tx_st1_dvalid_o                      (p3_tx_st1_dvalid_i),             
          .tx_st2_dvalid_o                      (p3_tx_st2_dvalid_i),             
          .tx_st3_dvalid_o                      (p3_tx_st3_dvalid_i),             

          .tx_st0_hvalid_o                      (p3_tx_st0_hvalid_i),             
          .tx_st1_hvalid_o                      (p3_tx_st1_hvalid_i),             
          .tx_st2_hvalid_o                      (p3_tx_st2_hvalid_i),             
          .tx_st3_hvalid_o                      (p3_tx_st3_hvalid_i),             

          .tx_st0_pvalid_o                      (p3_tx_st0_pvalid_i),             
          .tx_st1_pvalid_o                      (p3_tx_st1_pvalid_i),             
          .tx_st2_pvalid_o                      (p3_tx_st2_pvalid_i),             
          .tx_st3_pvalid_o                      (p3_tx_st3_pvalid_i),             

          .tx_par_err_i                         ( p3_tx_st_par_err_o         ),
          .tx_st_ready_i                        ( p3_tx_st_ready_o),               

          .dl_timer_update_i                    ( p3_dl_timer_update_o       ),
          .dl_up_i                              ( p3_dl_up_o                 ),   
          .link_up_i                            ( p3_link_up_o               ),   

          .app_rst_n 							(	),
	  	  .pin_perst_n                          ( p3_pin_perst_n                   ),	
    	  .app_clk 								(	),

		  .hip_reconfig_read_o                  ( p3_hip_reconfig_read_i               ),
          .hip_reconfig_address_o               ( p3_hip_reconfig_address_i            ),
          .hip_reconfig_write_o                 ( p3_hip_reconfig_write_i              ),
          .hip_reconfig_writedata_o             ( p3_hip_reconfig_writedata_i          ),
          .hip_reconfig_readdatavalid_i         ( p3_hip_reconfig_readdatavalid_o      ),
          .hip_reconfig_readdata_i              ( p3_hip_reconfig_readdata_o           ),
          .hip_reconfig_waitrequest_i           ( p3_hip_reconfig_waitrequest_o        ),

 		          
		  .cpl_timeout_i                        ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_o               : '0  ), 
          .cpl_timeout_func_num_i               ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_func_num_o      : '0  ),
          .cpl_timeout_vfunc_num_i              ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_vfunc_num_o     : '0  ),
          .cpl_timeout_vfunc_active_i           ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_vfunc_active_o  : '0  ),
          .cpl_timeout_cpl_tc_i                 ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_tc_o        : '0  ),
          .cpl_timeout_cpl_attr_i               ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_attr_o      : '0  ),
          .cpl_timeout_cpl_len_i                ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_len_o       : '0  ),
          .cpl_timeout_cpl_tag_i                ( core4_1_enable_cpl_timeout_hwtcl ? p3_cpl_timeout_cpl_tag_o       : '0  ),
		  
		  .app_err_valid_o                      ( p3_app_err_valid_i                     ),
          .app_err_hdr_o                        ( p3_app_err_hdr_i                       ),
          .app_err_info_o                       ( p3_app_err_info_i                      ),
          .app_err_func_num_o                   ( p3_app_err_func_num_i                  ),
          
		  .serr_i                               ( p3_serr_out_o                          ),
          .app_err_ready_i                      ( p3_app_err_ready_o                     ),
		  
 
		  .surprise_down_err_i                  (p3_surprise_down_err_o             ),
          .ltssm_state_i                        (p3_ltssm_state_delay_o             ),
          .pld_warm_rst_rdy_o                   (p3_pld_warm_rst_rdy_i              ),  
          .pld_link_req_rst_i                   (p3_pld_link_req_rst_o              ),
          .pm_curnt_state_i                     (p3_pm_curnt_state_o                ),
          .pm_dstate_i                          ({28'd0,p2_pm_dstate_o}                    ),
          .pld_gp_ctrl_i                        (p3_pld_gp_ctrl_o                   ),
      		.pld_in_use_i							(p3_pld_in_use_o	),	
        .user_mode_to_pld_i						(p3_user_mode_to_pld_o	),	
     
        .apps_pm_xmt_pme_o						(p3_apps_pm_xmt_pme_i	),	
        .app_xfer_pending_o						(p3_app_xfer_pending_i	),	
        .app_init_rst_o							(p3_app_init_rst_i	),	
        .apps_pm_xmt_turnoff_o					(p3_apps_pm_xmt_turnoff_i	),	
        .app_ready_entr_l23_o					(p3_apps_ready_entr_l23_i	),	
		.sys_pwr_fault_det_o					(p3_sys_pwr_fault_det_i	),	
        .sys_pre_det_chged_o					(	),	
        .sys_mrl_sensor_chged_o					(	),	
        .sys_aux_pwr_det_o						(p3_sys_aux_pwr_det_i	),	
        .sys_cmd_cpled_int_o					(p3_sys_cmd_cpled_int_i	),	
        .sys_mrl_sensor_state_o					(p3_sys_mrl_sensor_state_i	),	
        .sys_pre_det_state_o					(p3_sys_pre_det_state_i	),	
        .sys_atten_button_pressed_o				(p3_sys_atten_button_pressed_i	),	
        .sys_eml_interlock_engaged_o			(p3_sys_eml_interlock_engaged_i	),	
       		.pld_gp_status_o						(p3_pld_gp_status_i	),		  
        .user_vfnonfatalmsg_func_num_o			(p3_user_vfnonfatalmsg_func_num_i	),	
        .user_vfnonfatalmsg_vfnum_o				(p3_user_vfnonfatalmsg_vfnum_i	),	
        .user_sent_vfnonfatalmsg_o				(p3_user_sent_vfnonfatalmsg_i	),
        .user_vfnonfatalmsg_ready_i             (p3_user_vfnonfatalmsg_ready_o  ),
        .app_req_retry_en_o						(/*p3_app_req_retry_en_i*/	),	
        .prs_event_valid_o						(p3_prs_event_valid_i	),	
        .prs_event_func_o						(p3_prs_event_func_i	),	
        .prs_event_o							(p3_prs_event_i		 	),	
		
		.hip_reconfig_clk_o   					(	),
		
		.tx_st_data_par_o						(	),
		.tx_st_hdr_par_o						(	),
		.tx_st_tlp_prfx_par_o					(	),

		.virtio_pcicfg_vfaccess_i				(p3_virtio_pcicfg_vfaccess_o),	
        .virtio_pcicfg_vfnum_i					(p3_virtio_pcicfg_vfnum_o	),	
        .virtio_pcicfg_pfnum_i					(p3_virtio_pcicfg_pfnum_o	),	
        .virtio_pcicfg_bar_i					(p3_virtio_pcicfg_bar_o	),	
        .virtio_pcicfg_length_i					(p3_virtio_pcicfg_length_o	),	
        .virtio_pcicfg_baroffset_i				(p3_virtio_pcicfg_baroffset_o	),	
        .virtio_pcicfg_cfgdata_i				(p3_virtio_pcicfg_cfgdata_o	),	
        .virtio_pcicfg_cfgwr_i					(p3_virtio_pcicfg_cfgwr_o	),	
        .virtio_pcicfg_cfgrd_i					(p3_virtio_pcicfg_cfgrd_o	)	

           );
    end
end 

  endgenerate


 generate
    if (pciess_topology=="pcie_x4x4x4x4") begin : gen_tie_off

      altera_std_synchronizer u_p0_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_coreclk_n                )
      );

      altera_std_synchronizer u_p1_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p1_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p1_warm_rst_coreclk_n                )
      );

      altera_std_synchronizer u_p2_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p2_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p2_warm_rst_coreclk_n                )
      );

      altera_std_synchronizer u_p3_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p3_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p3_warm_rst_coreclk_n                )
      );

      altera_std_synchronizer u_p0_warm_rst_stclk_n_sync
      (
        .clk      ( p0_axi_st_clk                        ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_stclk_n                  )
      );

      altera_std_synchronizer u_p1_warm_rst_stclk_n_sync
      (
        .clk      ( p1_axi_st_clk                        ),
        .reset_n  ( p1_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p1_warm_rst_stclk_n                  )
      );

      altera_std_synchronizer u_p2_warm_rst_stclk_n_sync
      (
        .clk      ( p2_axi_st_clk                        ),
        .reset_n  ( p2_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p2_warm_rst_stclk_n                  )
      );

      altera_std_synchronizer u_p3_warm_rst_stclk_n_sync
      (
        .clk      ( p3_axi_st_clk                        ),
        .reset_n  ( p3_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p3_warm_rst_stclk_n                  )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_serr_out_o                       ),
        .data_out  ( p0_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_serr_out_o                       ),
        .data_out  ( p1_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p2_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p2_warm_rst_coreclk_n               ),
        .rd_clk    ( p2_axi_st_clk                       ),
        .rd_rst_n  ( p2_warm_rst_stclk_n                 ),
        .data_in   ( p2_serr_out_o                       ),
        .data_out  ( p2_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p3_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p3_warm_rst_coreclk_n               ),
        .rd_clk    ( p3_axi_st_clk                       ),
        .rd_rst_n  ( p3_warm_rst_stclk_n                 ),
        .data_in   ( p3_serr_out_o                       ),
        .data_out  ( p3_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_link_up_o                        ),
        .data_out  ( p0_ss_app_linkup_sync               )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_link_up_o                        ),
        .data_out  ( p1_ss_app_linkup_sync               )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p2_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p2_warm_rst_coreclk_n               ),
        .rd_clk    ( p2_axi_st_clk                       ),
        .rd_rst_n  ( p2_warm_rst_stclk_n                 ),
        .data_in   ( p2_link_up_o                        ),
        .data_out  ( p2_ss_app_linkup_sync               )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p3_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p3_warm_rst_coreclk_n               ),
        .rd_clk    ( p3_axi_st_clk                       ),
        .rd_rst_n  ( p3_warm_rst_stclk_n                 ),
        .data_in   ( p3_link_up_o                        ),
        .data_out  ( p3_ss_app_linkup_sync               )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_dl_up_o                          ),
        .data_out  ( p0_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_dl_up_o                          ),
        .data_out  ( p1_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p2_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p2_warm_rst_coreclk_n               ),
        .rd_clk    ( p2_axi_st_clk                       ),
        .rd_rst_n  ( p2_warm_rst_stclk_n                 ),
        .data_in   ( p2_dl_up_o                          ),
        .data_out  ( p2_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p3_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p3_warm_rst_coreclk_n               ),
        .rd_clk    ( p3_axi_st_clk                       ),
        .rd_rst_n  ( p3_warm_rst_stclk_n                 ),
        .data_in   ( p3_dl_up_o                          ),
        .data_out  ( p3_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_surprise_down_err_o              ),
        .data_out  ( p0_ss_app_surprise_down_err_sync    )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_surprise_down_err_o              ),
        .data_out  ( p1_ss_app_surprise_down_err_sync    )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p2_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p2_warm_rst_coreclk_n               ),
        .rd_clk    ( p2_axi_st_clk                       ),
        .rd_rst_n  ( p2_warm_rst_stclk_n                 ),
        .data_in   ( p2_surprise_down_err_o              ),
        .data_out  ( p2_ss_app_surprise_down_err_sync    )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p3_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p3_warm_rst_coreclk_n               ),
        .rd_clk    ( p3_axi_st_clk                       ),
        .rd_rst_n  ( p3_warm_rst_stclk_n                 ),
        .data_in   ( p3_surprise_down_err_o              ),
        .data_out  ( p3_ss_app_surprise_down_err_sync    )
      );

      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p0_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_ltssm_state_delay_o              ),
        .data_out  ( p0_ss_app_ltssmstate_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p1_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_ltssm_state_delay_o              ),
        .data_out  ( p1_ss_app_ltssmstate_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p2_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p2_warm_rst_coreclk_n               ),
        .rd_clk    ( p2_axi_st_clk                       ),
        .rd_rst_n  ( p2_warm_rst_stclk_n                 ),
        .data_in   ( p2_ltssm_state_delay_o              ),
        .data_out  ( p2_ss_app_ltssmstate_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p3_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p3_warm_rst_coreclk_n               ),
        .rd_clk    ( p3_axi_st_clk                       ),
        .rd_rst_n  ( p3_warm_rst_stclk_n                 ),
        .data_in   ( p3_ltssm_state_delay_o              ),
        .data_out  ( p3_ss_app_ltssmstate_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_rx_st_par_err_o                  ),
        .data_out  ( p0_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_rx_st_par_err_o                  ),
        .data_out  ( p1_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p2_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p2_warm_rst_coreclk_n               ),
        .rd_clk    ( p2_axi_st_clk                       ),
        .rd_rst_n  ( p2_warm_rst_stclk_n                 ),
        .data_in   ( p2_rx_st_par_err_o                  ),
        .data_out  ( p2_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p3_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p3_warm_rst_coreclk_n               ),
        .rd_clk    ( p3_axi_st_clk                       ),
        .rd_rst_n  ( p3_warm_rst_stclk_n                 ),
        .data_in   ( p3_rx_st_par_err_o                  ),
        .data_out  ( p3_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tx_st_par_err_o                  ),
        .data_out  ( p0_ss_app_tx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_tx_st_par_err_o                  ),
        .data_out  ( p1_ss_app_tx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p2_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p2_warm_rst_coreclk_n               ),
        .rd_clk    ( p2_axi_st_clk                       ),
        .rd_rst_n  ( p2_warm_rst_stclk_n                 ),
        .data_in   ( p2_tx_st_par_err_o                  ),
        .data_out  ( p2_ss_app_tx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p3_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p3_warm_rst_coreclk_n               ),
        .rd_clk    ( p3_axi_st_clk                       ),
        .rd_rst_n  ( p3_warm_rst_stclk_n                 ),
        .data_in   ( p3_tx_st_par_err_o                  ),
        .data_out  ( p3_ss_app_tx_par_err_sync           )
      );

      assign p0_ss_app_serr = p0_ss_app_serr_sync;
      assign p1_ss_app_serr = p1_ss_app_serr_sync;
      assign p2_ss_app_serr = p2_ss_app_serr_sync;
      assign p3_ss_app_serr = p3_ss_app_serr_sync;

      assign p0_ss_app_linkup = p0_ss_app_linkup_sync;
      assign p1_ss_app_linkup = p1_ss_app_linkup_sync;
      assign p2_ss_app_linkup = p2_ss_app_linkup_sync;
      assign p3_ss_app_linkup = p3_ss_app_linkup_sync;

      assign p0_ss_app_dlup = p0_ss_app_dlup_sync;
      assign p1_ss_app_dlup = p1_ss_app_dlup_sync;
      assign p2_ss_app_dlup = p2_ss_app_dlup_sync;
      assign p3_ss_app_dlup = p3_ss_app_dlup_sync;

      assign p0_ss_app_surprise_down_err = p0_ss_app_surprise_down_err_sync;
      assign p1_ss_app_surprise_down_err = p1_ss_app_surprise_down_err_sync;
      assign p2_ss_app_surprise_down_err = p2_ss_app_surprise_down_err_sync;
      assign p3_ss_app_surprise_down_err = p3_ss_app_surprise_down_err_sync;

      assign p0_ss_app_ltssmstate = p0_ss_app_ltssmstate_sync;
      assign p1_ss_app_ltssmstate = p1_ss_app_ltssmstate_sync;
      assign p2_ss_app_ltssmstate = p2_ss_app_ltssmstate_sync;
      assign p3_ss_app_ltssmstate = p3_ss_app_ltssmstate_sync;

      assign p0_ss_app_rx_par_err = p0_ss_app_rx_par_err_sync;
      assign p1_ss_app_rx_par_err = p1_ss_app_rx_par_err_sync;
      assign p2_ss_app_rx_par_err = p2_ss_app_rx_par_err_sync;
      assign p3_ss_app_rx_par_err = p3_ss_app_rx_par_err_sync;

      assign p0_ss_app_tx_par_err = p0_ss_app_tx_par_err_sync;
      assign p1_ss_app_tx_par_err = p1_ss_app_tx_par_err_sync;
      assign p2_ss_app_tx_par_err = p2_ss_app_tx_par_err_sync;
      assign p3_ss_app_tx_par_err = p3_ss_app_tx_par_err_sync;

    end
    else if (pciess_topology=="pcie_x8x8") begin : gen_tie_off
      assign p2_subsystem_cold_rst_ack_n = 0;
      assign p2_subsystem_warm_rst_ack_n = 0;
      assign p2_subsystem_rst_rdy        = 1;
      assign p2_initiate_warmrst_req     = 0;
      assign p3_subsystem_cold_rst_ack_n = 0;
      assign p3_subsystem_warm_rst_ack_n = 0;
      assign p3_subsystem_rst_rdy        = 1;
      assign p3_initiate_warmrst_req     = 0;
			assign p2_ltssm_state_delay_o      = '0;
			assign p2_serr_out_o               = '0;
			assign p2_rx_st_par_err_o          = '0;
			assign p2_tx_st_par_err_o          = '0;
			assign p3_ltssm_state_delay_o      = '0;
			assign p3_serr_out_o               = '0;
			assign p3_rx_st_par_err_o          = '0;
			assign p3_tx_st_par_err_o          = '0;
		  assign p2_lite_csr_awready         = '0;
      assign p2_lite_csr_wready          = '0;
      assign p2_lite_csr_bresp           = '0;
      assign p2_lite_csr_bvalid          = '0;
      assign p2_lite_csr_arready         = '0;
      assign p2_lite_csr_rdata           = '0;
      assign p2_lite_csr_rresp           = '0;
      assign p2_lite_csr_rvalid          = '0;
      assign p3_lite_csr_awready         = '0;
      assign p3_lite_csr_wready          = '0;
      assign p3_lite_csr_bresp           = '0;
      assign p3_lite_csr_bvalid          = '0;
      assign p3_lite_csr_arready         = '0;
      assign p3_lite_csr_rdata           = '0;
      assign p3_lite_csr_rresp           = '0;
      assign p3_lite_csr_rvalid          = '0;
      assign p2_surprise_down_err_o      = '0;
      assign p3_surprise_down_err_o      = '0;
      assign p2_link_up_o                = '0;
      assign p3_link_up_o                = '0;
      assign p2_dl_up_o                  = '0;
      assign p3_dl_up_o                  = '0;
	

      altera_std_synchronizer u_p0_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_coreclk_n                )
      );

      altera_std_synchronizer u_p1_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p1_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p1_warm_rst_coreclk_n                )
      );   
         
      altera_std_synchronizer u_p0_warm_rst_stclk_n_sync
      (
        .clk      ( p0_axi_st_clk                        ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_stclk_n                  )
      );

      altera_std_synchronizer u_p1_warm_rst_stclk_n_sync
      (
        .clk      ( p1_axi_st_clk                        ),
        .reset_n  ( p1_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p1_warm_rst_stclk_n                  )
      );
            
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_serr_out_o                  ),
        .data_out  ( p0_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_serr_out_o                  ),
        .data_out  ( p1_ss_app_serr_sync                 )
      );
      
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_link_up_o                     ),
        .data_out  ( p0_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_link_up_o                     ),
        .data_out  ( p1_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_dl_up_o                     ),
        .data_out  ( p0_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_dl_up_o                     ),
        .data_out  ( p1_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_surprise_down_err_o         ),
        .data_out  ( p0_ss_app_surprise_down_err_sync    )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_surprise_down_err_o         ),
        .data_out  ( p1_ss_app_surprise_down_err_sync    )
      );

     pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p0_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_ltssm_state_delay_o              ),
        .data_out  ( p0_ss_app_ltssmstate_sync           )
      );

    pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p1_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_ltssm_state_delay_o                 ),
        .data_out  ( p1_ss_app_ltssmstate_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_rx_st_par_err_o                ),
        .data_out  ( p0_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_rx_st_par_err_o                ),
        .data_out  ( p1_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tx_st_par_err_o                ),
        .data_out  ( p0_ss_app_tx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_tx_st_par_err_o                ),
        .data_out  ( p1_ss_app_tx_par_err_sync           )
      );

   /*   pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_int_status_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.int_status                ),
        .data_out  ( p0_ss_app_int_status_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_int_status_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_tileif.int_status                ),
        .data_out  ( p1_ss_app_int_status_sync           )
      );
*/
      assign p0_ss_app_serr = p0_ss_app_serr_sync;
      assign p1_ss_app_serr = p1_ss_app_serr_sync;
      assign p2_ss_app_serr = p2_serr_out_o;
      assign p3_ss_app_serr = p3_serr_out_o;

      assign p0_ss_app_linkup = p0_ss_app_linkup_sync;
      assign p1_ss_app_linkup = p1_ss_app_linkup_sync;
      assign p2_ss_app_linkup = p2_link_up_o;
      assign p3_ss_app_linkup = p3_link_up_o;

      assign p0_ss_app_dlup = p0_ss_app_dlup_sync;
      assign p1_ss_app_dlup = p1_ss_app_dlup_sync;
      assign p2_ss_app_dlup = p2_dl_up_o;
      assign p3_ss_app_dlup = p3_dl_up_o;

      assign p0_ss_app_surprise_down_err = p0_ss_app_surprise_down_err_sync;
      assign p1_ss_app_surprise_down_err = p1_ss_app_surprise_down_err_sync;
      assign p2_ss_app_surprise_down_err = p2_surprise_down_err_o;
      assign p3_ss_app_surprise_down_err = p3_surprise_down_err_o;

      assign p0_ss_app_ltssmstate = p0_ss_app_ltssmstate_sync;
      assign p1_ss_app_ltssmstate = p1_ss_app_ltssmstate_sync;
      assign p2_ss_app_ltssmstate = p2_ltssm_state_delay_o;
      assign p3_ss_app_ltssmstate = p3_ltssm_state_delay_o;

      assign p0_ss_app_rx_par_err = p0_ss_app_rx_par_err_sync;
      assign p1_ss_app_rx_par_err = p1_ss_app_rx_par_err_sync;
      assign p2_ss_app_rx_par_err = p2_rx_st_par_err_o;
      assign p3_ss_app_rx_par_err = p3_rx_st_par_err_o;

      assign p0_ss_app_tx_par_err = p0_ss_app_tx_par_err_sync;
      assign p1_ss_app_tx_par_err = p1_ss_app_tx_par_err_sync;
      assign p2_ss_app_tx_par_err = p2_tx_st_par_err_o;
      assign p3_ss_app_tx_par_err = p3_tx_st_par_err_o;

    end
    else if (pciess_topology=="pcie_x4x4" ) begin : gen_tie_off
	  assign p2_subsystem_cold_rst_ack_n = 0;
      assign p2_subsystem_warm_rst_ack_n = 0;
      assign p2_subsystem_rst_rdy        = 1;
      assign p2_initiate_warmrst_req     = 0;
      assign p3_subsystem_cold_rst_ack_n = 0;
      assign p3_subsystem_warm_rst_ack_n = 0;
      assign p3_subsystem_rst_rdy        = 1;
      assign p3_initiate_warmrst_req     = 0;
	  assign p2_rx_st_par_err_o          = '0;
	  assign p2_tx_st_par_err_o          = '0;
	  assign p3_rx_st_par_err_o          = '0;
	  assign p3_tx_st_par_err_o          = '0;
	  assign p2_lite_csr_awready         = '0;
      assign p2_lite_csr_wready          = '0;
      assign p2_lite_csr_bresp           = '0;
      assign p2_lite_csr_bvalid          = '0;
      assign p2_lite_csr_arready         = '0;
      assign p2_lite_csr_rdata           = '0;
      assign p2_lite_csr_rresp           = '0;
      assign p2_lite_csr_rvalid          = '0;
      assign p3_lite_csr_awready         = '0;
      assign p3_lite_csr_wready          = '0;
      assign p3_lite_csr_bresp           = '0;
      assign p3_lite_csr_bvalid          = '0;
      assign p3_lite_csr_arready         = '0;
      assign p3_lite_csr_rdata           = '0;
      assign p3_lite_csr_rresp           = '0;
      assign p3_lite_csr_rvalid          = '0;

      altera_std_synchronizer u_p0_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_coreclk_n                )
      );

      altera_std_synchronizer u_p1_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p1_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p1_warm_rst_coreclk_n                )
      );   
         
      altera_std_synchronizer u_p0_warm_rst_stclk_n_sync
      (
        .clk      ( p0_axi_st_clk                        ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_stclk_n                  )
      );

      altera_std_synchronizer u_p1_warm_rst_stclk_n_sync
      (
        .clk      ( p1_axi_st_clk                        ),
        .reset_n  ( p1_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p1_warm_rst_stclk_n                  )
      );
            
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_serr_out_o                  ),
        .data_out  ( p0_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_serr_out_o                  ),
        .data_out  ( p1_ss_app_serr_sync                 )
      );
      
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_link_up_o                     ),
        .data_out  ( p0_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_link_up_o                     ),
        .data_out  ( p1_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_dl_up_o                     ),
        .data_out  ( p0_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_dl_up_o                     ),
        .data_out  ( p1_ss_app_dlup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_surprise_down_err_o         ),
        .data_out  ( p0_ss_app_surprise_down_err_sync    )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_surprise_down_err_o         ),
        .data_out  ( p1_ss_app_surprise_down_err_sync    )
      );

     pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p0_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_ltssm_state_delay_o              ),
        .data_out  ( p0_ss_app_ltssmstate_sync           )
      );

    pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p1_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_ltssm_state_delay_o                 ),
        .data_out  ( p1_ss_app_ltssmstate_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_rx_st_par_err_o                ),
        .data_out  ( p0_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_rx_st_par_err_o                ),
        .data_out  ( p1_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tx_st_par_err_o                ),
        .data_out  ( p0_ss_app_tx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p1_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p1_warm_rst_coreclk_n               ),
        .rd_clk    ( p1_axi_st_clk                       ),
        .rd_rst_n  ( p1_warm_rst_stclk_n                 ),
        .data_in   ( p1_tx_st_par_err_o                ),
        .data_out  ( p1_ss_app_tx_par_err_sync           )
      );

      assign p0_ss_app_serr = p0_ss_app_serr_sync;
      assign p1_ss_app_serr = p1_ss_app_serr_sync;
      assign p2_ss_app_serr = p2_serr_out_o;
      assign p3_ss_app_serr = p3_serr_out_o;

      assign p0_ss_app_linkup = p0_ss_app_linkup_sync;
      assign p1_ss_app_linkup = p1_ss_app_linkup_sync;
      assign p2_ss_app_linkup = p2_link_up_o;
      assign p3_ss_app_linkup = p3_link_up_o;

      assign p0_ss_app_dlup = p0_ss_app_dlup_sync;
      assign p1_ss_app_dlup = p1_ss_app_dlup_sync;
      assign p2_ss_app_dlup = p2_dl_up_o;
      assign p3_ss_app_dlup = p3_dl_up_o;

      assign p0_ss_app_surprise_down_err = p0_ss_app_surprise_down_err_sync;
      assign p1_ss_app_surprise_down_err = p1_ss_app_surprise_down_err_sync;
      assign p2_ss_app_surprise_down_err = p2_surprise_down_err_o;
      assign p3_ss_app_surprise_down_err = p3_surprise_down_err_o;

      assign p0_ss_app_ltssmstate = p0_ss_app_ltssmstate_sync;
      assign p1_ss_app_ltssmstate = p1_ss_app_ltssmstate_sync;
      assign p2_ss_app_ltssmstate = p2_ltssm_state_delay_o;
      assign p3_ss_app_ltssmstate = p3_ltssm_state_delay_o;

      assign p0_ss_app_rx_par_err = p0_ss_app_rx_par_err_sync;
      assign p1_ss_app_rx_par_err = p1_ss_app_rx_par_err_sync;
      assign p2_ss_app_rx_par_err = p2_rx_st_par_err_o;
      assign p3_ss_app_rx_par_err = p3_rx_st_par_err_o;

      assign p0_ss_app_tx_par_err = p0_ss_app_tx_par_err_sync;
      assign p1_ss_app_tx_par_err = p1_ss_app_tx_par_err_sync;
      assign p2_ss_app_tx_par_err = p2_tx_st_par_err_o;
      assign p3_ss_app_tx_par_err = p3_tx_st_par_err_o;

	end
    else if (pciess_topology=="pcie_x16") begin : gen_tie_off
      assign p1_subsystem_cold_rst_ack_n = 0;
      assign p1_subsystem_warm_rst_ack_n = 0;
      assign p1_subsystem_rst_rdy        = 1;
      assign p1_initiate_warmrst_req     = 0;
      assign p2_subsystem_cold_rst_ack_n = 0;
      assign p2_subsystem_warm_rst_ack_n = 0;
      assign p2_subsystem_rst_rdy        = 1;
      assign p2_initiate_warmrst_req     = 0;
      assign p3_subsystem_cold_rst_ack_n = 0;
      assign p3_subsystem_warm_rst_ack_n = 0;
      assign p3_subsystem_rst_rdy        = 1;
      assign p3_initiate_warmrst_req     = 0;
			assign p1_ltssm_state_delay_o      = '0;
			assign p1_serr_out_o               = '0;
			assign p1_rx_st_par_err_o          = '0;
			assign p1_tx_st_par_err_o          = '0;
			assign p2_ltssm_state_delay_o      = '0;
			assign p2_serr_out_o               = '0;
			assign p2_rx_st_par_err_o          = '0;
			assign p2_tx_st_par_err_o          = '0;
			assign p3_ltssm_state_delay_o      = '0;
			assign p3_serr_out_o               = '0;
			assign p3_rx_st_par_err_o          = '0;
			assign p3_tx_st_par_err_o          = '0;
      assign p1_lite_csr_awready         = '0;
      assign p1_lite_csr_wready          = '0;
      assign p1_lite_csr_bresp           = '0;
      assign p1_lite_csr_bvalid          = '0;
      assign p1_lite_csr_arready         = '0;
      assign p1_lite_csr_rdata           = '0;
      assign p1_lite_csr_rresp           = '0;
      assign p1_lite_csr_rvalid          = '0;
      assign p2_lite_csr_awready         = '0;
      assign p2_lite_csr_wready          = '0;
      assign p2_lite_csr_bresp           = '0;
      assign p2_lite_csr_bvalid          = '0;
      assign p2_lite_csr_arready         = '0;
      assign p2_lite_csr_rdata           = '0;
      assign p2_lite_csr_rresp           = '0;
      assign p2_lite_csr_rvalid          = '0;
      assign p3_lite_csr_awready         = '0;
      assign p3_lite_csr_wready          = '0;
      assign p3_lite_csr_bresp           = '0;
      assign p3_lite_csr_bvalid          = '0;
      assign p3_lite_csr_arready         = '0;
      assign p3_lite_csr_rdata           = '0;
      assign p3_lite_csr_rresp           = '0;
      assign p3_lite_csr_rvalid          = '0;
      assign p1_surprise_down_err_o      = '0;
      assign p2_surprise_down_err_o      = '0;
      assign p3_surprise_down_err_o      = '0;
      assign p1_link_up_o                = '0;
      assign p2_link_up_o                = '0;
      assign p3_link_up_o                = '0;
      assign p1_dl_up_o                  = '0;
      assign p2_dl_up_o                  = '0;
      assign p3_dl_up_o                  = '0;



      altera_std_synchronizer u_p0_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_coreclk_n                )
      );
      
      altera_std_synchronizer u_p0_warm_rst_stclk_n_sync
      (
        .clk      ( p0_axi_st_clk                        ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_stclk_n                  )
      );
      
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_serr_out_o                  ),
        .data_out  ( p0_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_link_up_o                     ),
        .data_out  ( p0_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_dl_up_o                     ),
        .data_out  ( p0_ss_app_dlup_sync                 )
      );


      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_surprise_down_err_o         ),
        .data_out  ( p0_ss_app_surprise_down_err_sync    )
      );
     
      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p0_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_ltssm_state_delay_o                     ),
        .data_out  ( p0_ss_app_ltssmstate_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_rx_st_par_err_o                ),
        .data_out  ( p0_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tx_st_par_err_o                ),
        .data_out  ( p0_ss_app_tx_par_err_sync           )
      );

     /* pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_int_status_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tileif.int_status                ),
        .data_out  ( p0_ss_app_int_status_sync           )
      );
  */
      assign p0_ss_app_serr = p0_ss_app_serr_sync;
      assign p1_ss_app_serr = p1_serr_out_o;
      assign p2_ss_app_serr = p2_serr_out_o;
      assign p3_ss_app_serr = p3_serr_out_o;

      assign p0_ss_app_linkup = p0_ss_app_linkup_sync;
      assign p1_ss_app_linkup = p1_link_up_o;
      assign p2_ss_app_linkup = p2_link_up_o;
      assign p3_ss_app_linkup = p3_link_up_o;

      assign p0_ss_app_dlup = p0_ss_app_dlup_sync;
      assign p1_ss_app_dlup = p1_dl_up_o;
      assign p2_ss_app_dlup = p2_dl_up_o;
      assign p3_ss_app_dlup = p3_dl_up_o;

      assign p0_ss_app_surprise_down_err = p0_ss_app_surprise_down_err_sync;
      assign p1_ss_app_surprise_down_err = p1_surprise_down_err_o;
      assign p2_ss_app_surprise_down_err = p2_surprise_down_err_o;
      assign p3_ss_app_surprise_down_err = p3_surprise_down_err_o;
      
      assign p0_ss_app_ltssmstate = p0_ss_app_ltssmstate_sync;
      assign p1_ss_app_ltssmstate = p1_ltssm_state_delay_o;
      assign p2_ss_app_ltssmstate = p2_ltssm_state_delay_o;
      assign p3_ss_app_ltssmstate = p3_ltssm_state_delay_o;

      assign p0_ss_app_rx_par_err = p0_ss_app_rx_par_err_sync;
      assign p1_ss_app_rx_par_err = p1_rx_st_par_err_o;
      assign p2_ss_app_rx_par_err = p2_rx_st_par_err_o;
      assign p3_ss_app_rx_par_err = p3_rx_st_par_err_o;

      assign p0_ss_app_tx_par_err = p0_ss_app_tx_par_err_sync;
      assign p1_ss_app_tx_par_err = p1_tx_st_par_err_o;
      assign p2_ss_app_tx_par_err = p2_tx_st_par_err_o;
      assign p3_ss_app_tx_par_err = p3_tx_st_par_err_o;

    end
	else if ( pciess_topology == "pcie_x8") begin : gen_tie_off
	  assign p1_subsystem_cold_rst_ack_n = 0;
      assign p1_subsystem_warm_rst_ack_n = 0;
      assign p1_subsystem_rst_rdy        = 1;
      assign p1_initiate_warmrst_req     = 0;
      assign p2_subsystem_cold_rst_ack_n = 0;
      assign p2_subsystem_warm_rst_ack_n = 0;
      assign p2_subsystem_rst_rdy        = 1;
      assign p2_initiate_warmrst_req     = 0;
      assign p3_subsystem_cold_rst_ack_n = 0;
      assign p3_subsystem_warm_rst_ack_n = 0;
      assign p3_subsystem_rst_rdy        = 1;
      assign p3_initiate_warmrst_req     = 0;
	  assign p1_rx_st_par_err_o          = '0;
	  assign p1_tx_st_par_err_o          = '0;
	  assign p2_ltssm_state_delay_o      = '0;
	  assign p2_serr_out_o               = '0;
	  assign p2_rx_st_par_err_o          = '0;
	  assign p2_tx_st_par_err_o          = '0;
	  assign p3_ltssm_state_delay_o      = '0;
	  assign p3_serr_out_o               = '0;
	  assign p3_rx_st_par_err_o          = '0;
	  assign p3_tx_st_par_err_o          = '0;
      assign p1_lite_csr_awready         = '0;
      assign p1_lite_csr_wready          = '0;
      assign p1_lite_csr_bresp           = '0;
      assign p1_lite_csr_bvalid          = '0;
      assign p1_lite_csr_arready         = '0;
      assign p1_lite_csr_rdata           = '0;
      assign p1_lite_csr_rresp           = '0;
      assign p1_lite_csr_rvalid          = '0;
      assign p2_lite_csr_awready         = '0;
      assign p2_lite_csr_wready          = '0;
      assign p2_lite_csr_bresp           = '0;
      assign p2_lite_csr_bvalid          = '0;
      assign p2_lite_csr_arready         = '0;
      assign p2_lite_csr_rdata           = '0;
      assign p2_lite_csr_rresp           = '0;
      assign p2_lite_csr_rvalid          = '0;
      assign p3_lite_csr_awready         = '0;
      assign p3_lite_csr_wready          = '0;
      assign p3_lite_csr_bresp           = '0;
      assign p3_lite_csr_bvalid          = '0;
      assign p3_lite_csr_arready         = '0;
      assign p3_lite_csr_rdata           = '0;
      assign p3_lite_csr_rresp           = '0;
      assign p3_lite_csr_rvalid          = '0;
      assign p2_surprise_down_err_o      = '0;
      assign p3_surprise_down_err_o      = '0;
      assign p2_link_up_o                = '0;
      assign p3_link_up_o                = '0;
      assign p2_dl_up_o                  = '0;
      assign p3_dl_up_o                  = '0;

      altera_std_synchronizer u_p0_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_coreclk_n                )
      );
      
      altera_std_synchronizer u_p0_warm_rst_stclk_n_sync
      (
        .clk      ( p0_axi_st_clk                        ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_stclk_n                  )
      );
      
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_serr_out_o                  ),
        .data_out  ( p0_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_link_up_o                     ),
        .data_out  ( p0_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_dl_up_o                     ),
        .data_out  ( p0_ss_app_dlup_sync                 )
      );


      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_surprise_down_err_o         ),
        .data_out  ( p0_ss_app_surprise_down_err_sync    )
      );
     
      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p0_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_ltssm_state_delay_o                     ),
        .data_out  ( p0_ss_app_ltssmstate_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_rx_st_par_err_o                ),
        .data_out  ( p0_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tx_st_par_err_o                ),
        .data_out  ( p0_ss_app_tx_par_err_sync           )
      );

      assign p0_ss_app_serr = p0_ss_app_serr_sync;
      assign p1_ss_app_serr = p1_serr_out_o;
      assign p2_ss_app_serr = p2_serr_out_o;
      assign p3_ss_app_serr = p3_serr_out_o;

      assign p0_ss_app_linkup = p0_ss_app_linkup_sync;
      assign p1_ss_app_linkup = p1_link_up_o;
      assign p2_ss_app_linkup = p2_link_up_o;
      assign p3_ss_app_linkup = p3_link_up_o;

      assign p0_ss_app_dlup = p0_ss_app_dlup_sync;
      assign p1_ss_app_dlup = p1_dl_up_o;
      assign p2_ss_app_dlup = p2_dl_up_o;
      assign p3_ss_app_dlup = p3_dl_up_o;

      assign p0_ss_app_surprise_down_err = p0_ss_app_surprise_down_err_sync;
      assign p1_ss_app_surprise_down_err = p1_surprise_down_err_o;
      assign p2_ss_app_surprise_down_err = p2_surprise_down_err_o;
      assign p3_ss_app_surprise_down_err = p3_surprise_down_err_o;
      
      assign p0_ss_app_ltssmstate = p0_ss_app_ltssmstate_sync;
      assign p1_ss_app_ltssmstate = p1_ltssm_state_delay_o;
      assign p2_ss_app_ltssmstate = p2_ltssm_state_delay_o;
      assign p3_ss_app_ltssmstate = p3_ltssm_state_delay_o;

      assign p0_ss_app_rx_par_err = p0_ss_app_rx_par_err_sync;
      assign p1_ss_app_rx_par_err = p1_rx_st_par_err_o;
      assign p2_ss_app_rx_par_err = p2_rx_st_par_err_o;
      assign p3_ss_app_rx_par_err = p3_rx_st_par_err_o;

      assign p0_ss_app_tx_par_err = p0_ss_app_tx_par_err_sync;
      assign p1_ss_app_tx_par_err = p1_tx_st_par_err_o;
      assign p2_ss_app_tx_par_err = p2_tx_st_par_err_o;
      assign p3_ss_app_tx_par_err = p3_tx_st_par_err_o;
  end
  else if ( pciess_topology == "pcie_x4") begin : gen_tie_off
	  assign p1_subsystem_cold_rst_ack_n = 0;
      assign p1_subsystem_warm_rst_ack_n = 0;
      assign p1_subsystem_rst_rdy        = 1;
      assign p1_initiate_warmrst_req     = 0;
      assign p2_subsystem_cold_rst_ack_n = 0;
      assign p2_subsystem_warm_rst_ack_n = 0;
      assign p2_subsystem_rst_rdy        = 1;
      assign p2_initiate_warmrst_req     = 0;
      assign p3_subsystem_cold_rst_ack_n = 0;
      assign p3_subsystem_warm_rst_ack_n = 0;
      assign p3_subsystem_rst_rdy        = 1;
      assign p3_initiate_warmrst_req     = 0;
	  assign p1_rx_st_par_err_o          = '0;
	  assign p1_tx_st_par_err_o          = '0;
	  assign p2_rx_st_par_err_o          = '0;
	  assign p2_tx_st_par_err_o          = '0;
	  assign p3_rx_st_par_err_o          = '0;
	  assign p3_tx_st_par_err_o          = '0;
      assign p1_lite_csr_awready         = '0;
      assign p1_lite_csr_wready          = '0;
      assign p1_lite_csr_bresp           = '0;
      assign p1_lite_csr_bvalid          = '0;
      assign p1_lite_csr_arready         = '0;
      assign p1_lite_csr_rdata           = '0;
      assign p1_lite_csr_rresp           = '0;
      assign p1_lite_csr_rvalid          = '0;
      assign p2_lite_csr_awready         = '0;
      assign p2_lite_csr_wready          = '0;
      assign p2_lite_csr_bresp           = '0;
      assign p2_lite_csr_bvalid          = '0;
      assign p2_lite_csr_arready         = '0;
      assign p2_lite_csr_rdata           = '0;
      assign p2_lite_csr_rresp           = '0;
      assign p2_lite_csr_rvalid          = '0;
      assign p3_lite_csr_awready         = '0;
      assign p3_lite_csr_wready          = '0;
      assign p3_lite_csr_bresp           = '0;
      assign p3_lite_csr_bvalid          = '0;
      assign p3_lite_csr_arready         = '0;
      assign p3_lite_csr_rdata           = '0;
      assign p3_lite_csr_rresp           = '0;
      assign p3_lite_csr_rvalid          = '0;
   
      altera_std_synchronizer u_p0_warm_rst_coreclk_n_sync
      (
        .clk      ( coreclkout_hip_toapp                 ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_coreclk_n                )
      );
      
      altera_std_synchronizer u_p0_warm_rst_stclk_n_sync
      (
        .clk      ( p0_axi_st_clk                        ),
        .reset_n  ( p0_subsystem_warm_rst_n              ),
        .din      ( 1'b1                                 ),
        .dout     ( p0_warm_rst_stclk_n                  )
      );
      
      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_serr_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_serr_out_o                  ),
        .data_out  ( p0_ss_app_serr_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_linkup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_link_up_o                     ),
        .data_out  ( p0_ss_app_linkup_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_dlup_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_dl_up_o                     ),
        .data_out  ( p0_ss_app_dlup_sync                 )
      );


      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_surprise_down_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_surprise_down_err_o         ),
        .data_out  ( p0_ss_app_surprise_down_err_sync    )
      );
     
      pciess_vecsync #(
        .DWIDTH    ( 6                                   )
      ) u_p0_ss_app_ltssmstate_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_ltssm_state_delay_o                     ),
        .data_out  ( p0_ss_app_ltssmstate_sync                 )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_rx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_rx_st_par_err_o                ),
        .data_out  ( p0_ss_app_rx_par_err_sync           )
      );

      pciess_vecsync #(
        .DWIDTH    ( 1                                   )
      ) u_p0_ss_app_tx_par_err_sync (
        .wr_clk    ( coreclkout_hip_toapp                ),
        .wr_rst_n  ( p0_warm_rst_coreclk_n               ),
        .rd_clk    ( p0_axi_st_clk                       ),
        .rd_rst_n  ( p0_warm_rst_stclk_n                 ),
        .data_in   ( p0_tx_st_par_err_o                ),
        .data_out  ( p0_ss_app_tx_par_err_sync           )
      );

      assign p0_ss_app_serr = p0_ss_app_serr_sync;
      assign p1_ss_app_serr = p1_serr_out_o;
      assign p2_ss_app_serr = p2_serr_out_o;
      assign p3_ss_app_serr = p3_serr_out_o;

      assign p0_ss_app_linkup = p0_ss_app_linkup_sync;
      assign p1_ss_app_linkup = p1_link_up_o;
      assign p2_ss_app_linkup = p2_link_up_o;
      assign p3_ss_app_linkup = p3_link_up_o;

      assign p0_ss_app_dlup = p0_ss_app_dlup_sync;
      assign p1_ss_app_dlup = p1_dl_up_o;
      assign p2_ss_app_dlup = p2_dl_up_o;
      assign p3_ss_app_dlup = p3_dl_up_o;

      assign p0_ss_app_surprise_down_err = p0_ss_app_surprise_down_err_sync;
      assign p1_ss_app_surprise_down_err = p1_surprise_down_err_o;
      assign p2_ss_app_surprise_down_err = p2_surprise_down_err_o;
      assign p3_ss_app_surprise_down_err = p3_surprise_down_err_o;
      
      assign p0_ss_app_ltssmstate = p0_ss_app_ltssmstate_sync;
      assign p1_ss_app_ltssmstate = p1_ltssm_state_delay_o;
      assign p2_ss_app_ltssmstate = p2_ltssm_state_delay_o;
      assign p3_ss_app_ltssmstate = p3_ltssm_state_delay_o;

      assign p0_ss_app_rx_par_err = p0_ss_app_rx_par_err_sync;
      assign p1_ss_app_rx_par_err = p1_rx_st_par_err_o;
      assign p2_ss_app_rx_par_err = p2_rx_st_par_err_o;
      assign p3_ss_app_rx_par_err = p3_rx_st_par_err_o;

      assign p0_ss_app_tx_par_err = p0_ss_app_tx_par_err_sync;
      assign p1_ss_app_tx_par_err = p1_tx_st_par_err_o;
      assign p2_ss_app_tx_par_err = p2_tx_st_par_err_o;
      assign p3_ss_app_tx_par_err = p3_tx_st_par_err_o;
  end
 endgenerate

      
    platform_intel_pcie_ss_axi_0_intel_pcie_ss_axi_intel_rtile_pcie_ast_310_b6i7coq u_rtile (
      .coreclkout_hip                   (coreclkout_hip),
      .*
    );

assign coreclkout_hip_toapp = coreclkout_hip;

  
endmodule


