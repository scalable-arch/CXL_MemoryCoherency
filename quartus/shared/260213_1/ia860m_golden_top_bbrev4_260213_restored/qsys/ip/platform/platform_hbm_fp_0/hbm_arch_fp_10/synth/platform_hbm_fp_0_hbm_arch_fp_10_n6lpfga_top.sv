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



`timescale 1 ps / 1 ps
`default_nettype none


`define HBMSS_PH2_TOP_DECL_AXI4_S_PORTS(PORT_PREFIX)  \
    input  wire   [6:0] PORT_PREFIX``_awid,           \
    input  wire  [39:0] PORT_PREFIX``_awaddr,         \
    input  wire   [7:0] PORT_PREFIX``_awlen,          \
    input  wire   [2:0] PORT_PREFIX``_awsize,         \
    input  wire   [1:0] PORT_PREFIX``_awburst,        \
    input  wire         PORT_PREFIX``_awlock,         \
    input  wire   [2:0] PORT_PREFIX``_awprot,         \
    input  wire   [3:0] PORT_PREFIX``_awqos,          \
    input  wire  [13:0] PORT_PREFIX``_awuser,         \
    input  wire         PORT_PREFIX``_awvalid,        \
    output wire         PORT_PREFIX``_awready,        \
    input  wire [255:0] PORT_PREFIX``_wdata,          \
    input  wire  [31:0] PORT_PREFIX``_wstrb,          \
    input  wire         PORT_PREFIX``_wlast,          \
    input  wire  [31:0] PORT_PREFIX``_wuser,          \
    input  wire         PORT_PREFIX``_wvalid,         \
    output wire         PORT_PREFIX``_wready,         \
    output wire   [6:0] PORT_PREFIX``_bid,            \
    output wire   [1:0] PORT_PREFIX``_bresp,          \
    output wire         PORT_PREFIX``_bvalid,         \
    input  wire         PORT_PREFIX``_bready,         \
    input  wire   [6:0] PORT_PREFIX``_arid,           \
    input  wire  [39:0] PORT_PREFIX``_araddr,         \
    input  wire   [7:0] PORT_PREFIX``_arlen,          \
    input  wire   [2:0] PORT_PREFIX``_arsize,         \
    input  wire   [1:0] PORT_PREFIX``_arburst,        \
    input  wire         PORT_PREFIX``_arlock,         \
    input  wire   [2:0] PORT_PREFIX``_arprot,         \
    input  wire   [3:0] PORT_PREFIX``_arqos,          \
    input  wire  [13:0] PORT_PREFIX``_aruser,         \
    input  wire         PORT_PREFIX``_arvalid,        \
    output wire         PORT_PREFIX``_arready,        \
    output wire   [6:0] PORT_PREFIX``_rid,            \
    output wire [255:0] PORT_PREFIX``_rdata,          \
    output wire   [1:0] PORT_PREFIX``_rresp,          \
    output wire         PORT_PREFIX``_rlast,          \
    output wire  [31:0] PORT_PREFIX``_ruser,          \
    output wire         PORT_PREFIX``_rvalid,         \
    input  wire         PORT_PREFIX``_rready   

`define HBMSS_PH2_TOP_DECL_AXILITE_S_PORTS(PORT_PREFIX) \
    input  wire [26:0] PORT_PREFIX``_awaddr,            \
    input  wire        PORT_PREFIX``_awvalid,           \
    output wire        PORT_PREFIX``_awready,           \
    input  wire [31:0] PORT_PREFIX``_wdata,             \
    input  wire  [3:0] PORT_PREFIX``_wstrb,             \
    input  wire        PORT_PREFIX``_wvalid,            \
    output wire        PORT_PREFIX``_wready,            \
    output wire  [1:0] PORT_PREFIX``_bresp,             \
    output wire        PORT_PREFIX``_bvalid,            \
    input  wire        PORT_PREFIX``_bready,            \
    input  wire [26:0] PORT_PREFIX``_araddr,            \
    input  wire        PORT_PREFIX``_arvalid,           \
    output wire        PORT_PREFIX``_arready,           \
    output wire [31:0] PORT_PREFIX``_rdata,             \
    output wire  [1:0] PORT_PREFIX``_rresp,             \
    output wire        PORT_PREFIX``_rvalid,            \
    input  wire        PORT_PREFIX``_rready,            \
    input  wire  [2:0] PORT_PREFIX``_awprot,            \
    input  wire  [2:0] PORT_PREFIX``_arprot

`define HBMSS_PH2_TOP_DECL_CH_PARAMS(CH_PREFIX)                      \
   parameter CH_PREFIX``_EN                             = "INVALID", \
   parameter CH_PREFIX``_ADDR_ORDERING                  = "INVALID", \
   parameter CH_PREFIX``_ADDR_SCRAMBLING                = "INVALID", \
   parameter CH_PREFIX``_CMD_INORDER_EN                 = "INVALID", \
   parameter CH_PREFIX``_RDATA_REORDERING_EN            = "INVALID", \
   parameter CH_PREFIX``_POWER_DOWN_EN                  = "INVALID", \
   parameter CH_PREFIX``_PSEUDO_BL8_EN                  = "INVALID", \
   parameter CH_PREFIX``_USER_DATA_WIDTH                = -1,        \
   parameter CH_PREFIX``_WDATA_USER_DATA_EN             = "INVALID", \
   parameter CH_PREFIX``_RDATA_USER_DATA_EN             = "INVALID", \
   parameter CH_PREFIX``_ECC_EN                         = "INVALID", \
   parameter CH_PREFIX``_DATA_MASK_EN                   = "INVALID", \
   parameter CH_PREFIX``_VIRAL_I_EN                     = "INVALID", \
   parameter CH_PREFIX``_VIRAL_O_EN                     = "INVALID", \
   parameter CH_PREFIX``_WCMD_PARITY_EN                 = "INVALID", \
   parameter CH_PREFIX``_RCMD_PARITY_EN                 = "INVALID", \
   parameter CH_PREFIX``_WDATA_PARITY_EN                = "INVALID", \
   parameter CH_PREFIX``_RDATA_PARITY_EN                = "INVALID", \
   parameter CH_PREFIX``_WSTRB_PARITY_EN                = "INVALID", \
   parameter CH_PREFIX``_WDATA_POISON_EN                = "INVALID", \
   parameter CH_PREFIX``_RDATA_POISON_EN                = "INVALID", \
   parameter CH_PREFIX``_WCMD_USER_AP_EN                = "INVALID", \
   parameter CH_PREFIX``_RCMD_USER_AP_EN                = "INVALID", \
   parameter CH_PREFIX``_WCMD_USER_AP_POLICY            = "INVALID", \
   parameter CH_PREFIX``_RCMD_USER_AP_POLICY            = "INVALID", \
   parameter CH_PREFIX``_REFRESH_MODE                   = "INVALID", \
   parameter CH_PREFIX``_WCMD_USER_REFRESH_ALL_BANKS_EN = "INVALID", \
   parameter CH_PREFIX``_RCMD_USER_REFRESH_ALL_BANKS_EN = "INVALID", \
   parameter CH_PREFIX``_WCMD_USER_REFRESH_PER_BANK_EN  = "INVALID", \
   parameter CH_PREFIX``_RCMD_USER_REFRESH_PER_BANK_EN  = "INVALID", \
   parameter CH_PREFIX``_REFRESH_POLICY                 = "INVALID", \
   parameter CH_PREFIX``_REFRESH_POSTPAY_LOWER_LIMIT    = -1,        \
   parameter CH_PREFIX``_REFRESH_POSTPAY_UPPER_LIMIT    = -1,        \
   parameter CH_PREFIX``_REFRESH_PREPAY_UPPER_LIMIT     = -1,        \
   parameter CH_PREFIX``_REFRESH_IDLE_THRESHOLD         = -1,        \
   parameter CH_PREFIX``_TEMP_THROTTLE_EN               = "INVALID", \
   parameter CH_PREFIX``_TEMP_THROTTLE_THRESHOLD        = -1,        \
   parameter CH_PREFIX``_TEMP000_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_TEMP001_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_TEMP011_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_TEMP010_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_TEMP110_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_TEMP111_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_TEMP101_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_TEMP100_THROTTLE_RATIO         = -1,        \
   parameter CH_PREFIX``_IRQ_O_EN                       = "INVALID", \
   parameter CH_PREFIX``_INITSTS_INT_EVNT_EN            = "INVALID", \
   parameter CH_PREFIX``_ERRSTS1_INT_EVNT_EN            = "INVALID", \
   parameter CH_PREFIX``_ERRSTS2_INT_EVNT_EN            = "INVALID", \
   parameter CH_PREFIX``_ERRSTS3_INT_EVNT_EN            = "INVALID", \
   parameter CH_PREFIX``_TMCTLSTS_CATTRIP_INT_EVNT_EN   = "INVALID", \
   parameter CH_PREFIX``_ERRSTS1_VRL_EVNT_EN            = "INVALID", \
   parameter CH_PREFIX``_ERRSTS2_VRL_EVNT_EN            = "INVALID", \
   parameter CH_PREFIX``_ERRSTS3_VRL_EVNT_EN            = "INVALID", \
   parameter CH_PREFIX``_POWER_EST_POWER_STATE          = "INVALID", \
   parameter CH_PREFIX``_PC0_POWER_EST_BANDWIDTH_PCT    = -1,        \
   parameter CH_PREFIX``_PC0_POWER_EST_READ_PCT         = -1,        \
   parameter CH_PREFIX``_PC0_POWER_EST_PAGE_HIT_PCT     = -1,        \
   parameter CH_PREFIX``_PC1_POWER_EST_BANDWIDTH_PCT    = -1,        \
   parameter CH_PREFIX``_PC1_POWER_EST_READ_PCT         = -1,        \
   parameter CH_PREFIX``_PC1_POWER_EST_PAGE_HIT_PCT     = -1       

`define HBMSS_PH2_TOP_INST_CH_PARAMS(CH_PREFIX)                                             \
   .CH_PREFIX``_EN                            (CH_PREFIX``_EN),                             \
   .CH_PREFIX``_ADDR_ORDERING                 (CH_PREFIX``_ADDR_ORDERING),                  \
   .CH_PREFIX``_ADDR_SCRAMBLING               (CH_PREFIX``_ADDR_SCRAMBLING),                \
   .CH_PREFIX``_CMD_INORDER_EN                (CH_PREFIX``_CMD_INORDER_EN),                 \
   .CH_PREFIX``_RDATA_REORDERING_EN           (CH_PREFIX``_RDATA_REORDERING_EN),            \
   .CH_PREFIX``_POWER_DOWN_EN                 (CH_PREFIX``_POWER_DOWN_EN),                  \
   .CH_PREFIX``_PSEUDO_BL8_EN                 (CH_PREFIX``_PSEUDO_BL8_EN),                  \
   .CH_PREFIX``_USER_DATA_WIDTH               (CH_PREFIX``_USER_DATA_WIDTH),                \
   .CH_PREFIX``_WDATA_USER_DATA_EN            (CH_PREFIX``_WDATA_USER_DATA_EN),             \
   .CH_PREFIX``_RDATA_USER_DATA_EN            (CH_PREFIX``_RDATA_USER_DATA_EN),             \
   .CH_PREFIX``_ECC_EN                        (CH_PREFIX``_ECC_EN),                         \
   .CH_PREFIX``_DATA_MASK_EN                  (CH_PREFIX``_DATA_MASK_EN),                   \
   .CH_PREFIX``_VIRAL_I_EN                    (CH_PREFIX``_VIRAL_I_EN),                     \
   .CH_PREFIX``_VIRAL_O_EN                    (CH_PREFIX``_VIRAL_O_EN),                     \
   .CH_PREFIX``_WCMD_PARITY_EN                (CH_PREFIX``_WCMD_PARITY_EN),                 \
   .CH_PREFIX``_RCMD_PARITY_EN                (CH_PREFIX``_RCMD_PARITY_EN),                 \
   .CH_PREFIX``_WDATA_PARITY_EN               (CH_PREFIX``_WDATA_PARITY_EN),                \
   .CH_PREFIX``_RDATA_PARITY_EN               (CH_PREFIX``_RDATA_PARITY_EN),                \
   .CH_PREFIX``_WSTRB_PARITY_EN               (CH_PREFIX``_WSTRB_PARITY_EN),                \
   .CH_PREFIX``_WDATA_POISON_EN               (CH_PREFIX``_WDATA_POISON_EN),                \
   .CH_PREFIX``_RDATA_POISON_EN               (CH_PREFIX``_RDATA_POISON_EN),                \
   .CH_PREFIX``_WCMD_USER_AP_EN               (CH_PREFIX``_WCMD_USER_AP_EN),                \
   .CH_PREFIX``_RCMD_USER_AP_EN               (CH_PREFIX``_RCMD_USER_AP_EN),                \
   .CH_PREFIX``_WCMD_USER_AP_POLICY           (CH_PREFIX``_WCMD_USER_AP_POLICY),            \
   .CH_PREFIX``_RCMD_USER_AP_POLICY           (CH_PREFIX``_RCMD_USER_AP_POLICY),            \
   .CH_PREFIX``_REFRESH_MODE                  (CH_PREFIX``_REFRESH_MODE),                   \
   .CH_PREFIX``_WCMD_USER_REFRESH_ALL_BANKS_EN(CH_PREFIX``_WCMD_USER_REFRESH_ALL_BANKS_EN), \
   .CH_PREFIX``_RCMD_USER_REFRESH_ALL_BANKS_EN(CH_PREFIX``_RCMD_USER_REFRESH_ALL_BANKS_EN), \
   .CH_PREFIX``_WCMD_USER_REFRESH_PER_BANK_EN (CH_PREFIX``_WCMD_USER_REFRESH_PER_BANK_EN),  \
   .CH_PREFIX``_RCMD_USER_REFRESH_PER_BANK_EN (CH_PREFIX``_RCMD_USER_REFRESH_PER_BANK_EN),  \
   .CH_PREFIX``_REFRESH_POLICY                (CH_PREFIX``_REFRESH_POLICY),                 \
   .CH_PREFIX``_REFRESH_POSTPAY_LOWER_LIMIT   (CH_PREFIX``_REFRESH_POSTPAY_LOWER_LIMIT),    \
   .CH_PREFIX``_REFRESH_POSTPAY_UPPER_LIMIT   (CH_PREFIX``_REFRESH_POSTPAY_UPPER_LIMIT),    \
   .CH_PREFIX``_REFRESH_PREPAY_UPPER_LIMIT    (CH_PREFIX``_REFRESH_PREPAY_UPPER_LIMIT),     \
   .CH_PREFIX``_REFRESH_IDLE_THRESHOLD        (CH_PREFIX``_REFRESH_IDLE_THRESHOLD),         \
   .CH_PREFIX``_TEMP_THROTTLE_EN              (CH_PREFIX``_TEMP_THROTTLE_EN),               \
   .CH_PREFIX``_TEMP_THROTTLE_THRESHOLD       (CH_PREFIX``_TEMP_THROTTLE_THRESHOLD),        \
   .CH_PREFIX``_TEMP000_THROTTLE_RATIO        (CH_PREFIX``_TEMP000_THROTTLE_RATIO),         \
   .CH_PREFIX``_TEMP001_THROTTLE_RATIO        (CH_PREFIX``_TEMP001_THROTTLE_RATIO),         \
   .CH_PREFIX``_TEMP011_THROTTLE_RATIO        (CH_PREFIX``_TEMP011_THROTTLE_RATIO),         \
   .CH_PREFIX``_TEMP010_THROTTLE_RATIO        (CH_PREFIX``_TEMP010_THROTTLE_RATIO),         \
   .CH_PREFIX``_TEMP110_THROTTLE_RATIO        (CH_PREFIX``_TEMP110_THROTTLE_RATIO),         \
   .CH_PREFIX``_TEMP111_THROTTLE_RATIO        (CH_PREFIX``_TEMP111_THROTTLE_RATIO),         \
   .CH_PREFIX``_TEMP101_THROTTLE_RATIO        (CH_PREFIX``_TEMP101_THROTTLE_RATIO),         \
   .CH_PREFIX``_TEMP100_THROTTLE_RATIO        (CH_PREFIX``_TEMP100_THROTTLE_RATIO),         \
   .CH_PREFIX``_IRQ_O_EN                      (CH_PREFIX``_IRQ_O_EN),                       \
   .CH_PREFIX``_INITSTS_INT_EVNT_EN           (CH_PREFIX``_INITSTS_INT_EVNT_EN),            \
   .CH_PREFIX``_ERRSTS1_INT_EVNT_EN           (CH_PREFIX``_ERRSTS1_INT_EVNT_EN),            \
   .CH_PREFIX``_ERRSTS2_INT_EVNT_EN           (CH_PREFIX``_ERRSTS2_INT_EVNT_EN),            \
   .CH_PREFIX``_ERRSTS3_INT_EVNT_EN           (CH_PREFIX``_ERRSTS3_INT_EVNT_EN),            \
   .CH_PREFIX``_TMCTLSTS_CATTRIP_INT_EVNT_EN  (CH_PREFIX``_TMCTLSTS_CATTRIP_INT_EVNT_EN),   \
   .CH_PREFIX``_ERRSTS1_VRL_EVNT_EN           (CH_PREFIX``_ERRSTS1_VRL_EVNT_EN),            \
   .CH_PREFIX``_ERRSTS2_VRL_EVNT_EN           (CH_PREFIX``_ERRSTS2_VRL_EVNT_EN),            \
   .CH_PREFIX``_ERRSTS3_VRL_EVNT_EN           (CH_PREFIX``_ERRSTS3_VRL_EVNT_EN),            \
   .CH_PREFIX``_POWER_EST_POWER_STATE         (CH_PREFIX``_POWER_EST_POWER_STATE),          \
   .CH_PREFIX``_PC0_POWER_EST_BANDWIDTH_PCT   (CH_PREFIX``_PC0_POWER_EST_BANDWIDTH_PCT),    \
   .CH_PREFIX``_PC0_POWER_EST_READ_PCT        (CH_PREFIX``_PC0_POWER_EST_READ_PCT),         \
   .CH_PREFIX``_PC0_POWER_EST_PAGE_HIT_PCT    (CH_PREFIX``_PC0_POWER_EST_PAGE_HIT_PCT),     \
   .CH_PREFIX``_PC1_POWER_EST_BANDWIDTH_PCT   (CH_PREFIX``_PC1_POWER_EST_BANDWIDTH_PCT),    \
   .CH_PREFIX``_PC1_POWER_EST_READ_PCT        (CH_PREFIX``_PC1_POWER_EST_READ_PCT),         \
   .CH_PREFIX``_PC1_POWER_EST_PAGE_HIT_PCT    (CH_PREFIX``_PC1_POWER_EST_PAGE_HIT_PCT)

`define HBMSS_PH2_TOP_DECL_PC_PORTS(PORT_PREFIX)   \
    `HBMSS_PH2_TOP_DECL_AXI4_S_PORTS(PORT_PREFIX), \
    output wire        PORT_PREFIX``_aclk,         \
    output wire        PORT_PREFIX``_wmc_intr

`define HBMSS_PH2_TOP_DECL_SB_PORTS(PORT_PREFIX)      \
    `HBMSS_PH2_TOP_DECL_AXILITE_S_PORTS(PORT_PREFIX), \
    output wire        PORT_PREFIX``_aclk   



module platform_hbm_fp_0_hbm_arch_fp_10_n6lpfga_top #(
   parameter PHY_MEMCLK_FREQ_MHZ      = -1,
   parameter PHY_REFCLK_FREQ_MHZ      = -1,
   parameter PHY_RESET_TYPE           = "INVALID",
   parameter SSM_FW_CONTENTS          = "INVALID",
   parameter SSM_MEM_CONTENTS_0       = "INVALID",
   parameter SSM_MEM_CONTENTS_1       = "INVALID",
   parameter SSM_MEM_CONTENTS_2       = "INVALID",
   parameter SSM_MEM_CONTENTS_3       = "INVALID",
   parameter SSM_MEM_CONTENTS_VALID   = "False",
   parameter SSM_PARAM_TABLE_CONTENTS = "INVALID",
   parameter SSM_NIOS_FW_FILE         = "INVALID",
   parameter SSM_NIOS_CALIBRATION_CODE_HEX_FILE = "",
   parameter SSM_PARAM_TABLE_HEX_FILE = "",
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH0),
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH1),
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH2),
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH3),
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH4),
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH5),
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH6),
   `HBMSS_PH2_TOP_DECL_CH_PARAMS(HBM2E_CTRL_CH7),
   parameter HBM2E_MEM_DEVICE         = "INVALID",
   parameter HBM2E_MEM_TDQSS_MAX_PS   = -1,
   parameter HBM2E_MEM_TDQSS_MIN_PS   = -1,
   parameter HBM2E_MEM_TDQSCK_MAX_PS  = -1,
   parameter HBM2E_MEM_TDQSQ_MAX_PS   = -1,
   parameter HBM2E_MEM_TRAS_CYC       = -1,
   parameter HBM2E_MEM_TRCDRD_CYC     = -1,
   parameter HBM2E_MEM_TRCDWR_CYC     = -1,
   parameter HBM2E_MEM_TRRDL_CYC      = -1,
   parameter HBM2E_MEM_TRRDS_CYC      = -1,
   parameter HBM2E_MEM_TFAW_CYC       = -1,
   parameter HBM2E_MEM_TRTPL_CYC      = -1,
   parameter HBM2E_MEM_TRTPS_CYC      = -1,
   parameter HBM2E_MEM_TRP_CYC        = -1,
   parameter HBM2E_MEM_TWR_CYC        = -1,
   parameter HBM2E_MEM_TCCDL_CYC      = -1,
   parameter HBM2E_MEM_TCCDS_CYC      = -1,
   parameter HBM2E_MEM_TCCDR_CYC      = -1,
   parameter HBM2E_MEM_TWTRL_CYC      = -1,
   parameter HBM2E_MEM_TWTRS_CYC      = -1,
   parameter HBM2E_MEM_TPD_CYC        = -1,
   parameter HBM2E_MEM_TXP_CYC        = -1,
   parameter HBM2E_MEM_TCKESR_CYC     = -1,
   parameter HBM2E_MEM_TCKSRE_CYC     = -1,
   parameter HBM2E_MEM_TCKSRX_CYC     = -1,
   parameter HBM2E_MEM_TXS_CYC        = -1,
   parameter HBM2E_MEM_TRFC_CYC       = -1,
   parameter HBM2E_MEM_TRFCSB_CYC     = -1,
   parameter HBM2E_MEM_TRREFD_CYC     = -1,
   parameter HBM2E_MEM_TREFI_CYC      = -1,
   parameter HBM2E_MEM_WL_CYC         = -1,
   parameter HBM2E_MEM_RL_CYC         = -1,
   parameter HBM2E_MEM_PL_CYC         = -1,
   parameter DFT_DEBUG_MODE           = "DISABLED_LPBK",
   parameter HBM2E_MEM_MODEL_OPTIONS  = "",
   parameter HBM2E_MEM_MODEL_TDQSCK   = 0
)
(  
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch2_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch2_u1),
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch3_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch3_u1),  
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch6_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch6_u1),
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch7_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch7_u1),
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch0_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch0_u1),
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch1_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch1_u1),
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch4_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch4_u1),
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch5_u0),      
   `HBMSS_PH2_TOP_DECL_PC_PORTS(ch5_u1),
   `HBMSS_PH2_TOP_DECL_SB_PORTS(ch2_ch3_sb),  
   `HBMSS_PH2_TOP_DECL_SB_PORTS(ch6_ch7_sb),  
   `HBMSS_PH2_TOP_DECL_SB_PORTS(ch0_ch1_sb),  
   `HBMSS_PH2_TOP_DECL_SB_PORTS(ch4_ch5_sb),  
   `HBMSS_PH2_TOP_DECL_SB_PORTS(uibssm_sb),   
   input  wire       fabric_clk,
   input  wire       hbm_reset_n,        
   output wire       hbm_reset_in_prog,
   output wire       local_cal_success,
   output wire       local_cal_fail,
   output wire       hbm_cattrip,
   input  wire       hbm_cattrip_i,
   output wire [2:0] hbm_temp,
   input  wire [2:0] hbm_temp_i,
   input  wire       viral_i,
   output wire       viral_o,
   output wire       fake_reset_o,
   input  wire [7:0] uibpll_phout,           
   input  wire       uibpll_locked,
   input  wire       uibpll_refclk,
   output wire       uibpll_refclk_buffered
);


   
wire        uibssm_to_hbmc_early_reset_n;
wire        uibssm_to_hbmc_reset_n;
wire        uibssm_to_hbmc_axilite_reset_n;
wire        uibssm_to_hbmc_reset_n_iso;
wire        hbmc_to_uibssm_reset_irq;
wire        hbmc_to_uibssm_reset_exit_irq;
wire        uibphy_to_ssm_vsshi_comp_fsm_clk;
wire        uibssm_to_uibphy_cal_clk;
wire        uibssm_to_uibphy_cal_wr;
wire        uibssm_to_uibphy_cal_rd;
wire [19:0] uibssm_to_uibphy_cal_addr;
wire [31:0] uibssm_to_uibphy_cal_wrdata;
wire        uibphy_to_uibssm_cal_rdval;
wire [31:0] uibphy_to_uibssm_cal_rddata;


platform_hbm_fp_0_hbm_arch_fp_10_n6lpfga_uibssm #(
   .SSM_FW_CONTENTS                   (SSM_FW_CONTENTS),
   .SSM_MEM_CONTENTS_0                (SSM_MEM_CONTENTS_0),
   .SSM_MEM_CONTENTS_1                (SSM_MEM_CONTENTS_1),
   .SSM_MEM_CONTENTS_2                (SSM_MEM_CONTENTS_2),
   .SSM_MEM_CONTENTS_3                (SSM_MEM_CONTENTS_3),
   .SSM_MEM_CONTENTS_VALID            (SSM_MEM_CONTENTS_VALID),
   .SSM_PARAM_TABLE_CONTENTS          (SSM_PARAM_TABLE_CONTENTS),
   .SSM_NIOS_FW_FILE                  (SSM_NIOS_FW_FILE),
   .SSM_NIOS_CALIBRATION_CODE_HEX_FILE(SSM_NIOS_CALIBRATION_CODE_HEX_FILE),
   .SSM_PARAM_TABLE_HEX_FILE          (SSM_PARAM_TABLE_HEX_FILE)
) ssm_wrapper (
    .uibssm_sb_aclk                       (uibssm_sb_aclk),     
    .uibssm_sb_awaddr                     (uibssm_sb_awaddr),  
    .uibssm_sb_awvalid                    (uibssm_sb_awvalid), 
    .uibssm_sb_awready                    (uibssm_sb_awready), 
    .uibssm_sb_wdata                      (uibssm_sb_wdata),   
    .uibssm_sb_wstrb                      (uibssm_sb_wstrb),   
    .uibssm_sb_wvalid                     (uibssm_sb_wvalid),  
    .uibssm_sb_wready                     (uibssm_sb_wready),  
    .uibssm_sb_bresp                      (uibssm_sb_bresp),   
    .uibssm_sb_bvalid                     (uibssm_sb_bvalid),  
    .uibssm_sb_bready                     (uibssm_sb_bready),  
    .uibssm_sb_araddr                     (uibssm_sb_araddr),  
    .uibssm_sb_arvalid                    (uibssm_sb_arvalid), 
    .uibssm_sb_arready                    (uibssm_sb_arready), 
    .uibssm_sb_rdata                      (uibssm_sb_rdata),   
    .uibssm_sb_rresp                      (uibssm_sb_rresp),   
    .uibssm_sb_rvalid                     (uibssm_sb_rvalid),  
    .uibssm_sb_rready                     (uibssm_sb_rready),    
    .uibssm_to_hbmc_early_reset_n         (uibssm_to_hbmc_early_reset_n),
    .uibssm_to_hbmc_reset_n               (uibssm_to_hbmc_reset_n),
    .uibssm_to_hbmc_axilite_reset_n       (uibssm_to_hbmc_axilite_reset_n),
    .uibssm_to_hbmc_reset_n_iso           (uibssm_to_hbmc_reset_n_iso),
    .hbmc_to_uibssm_reset_irq             (hbmc_to_uibssm_reset_irq),
    .hbmc_to_uibssm_reset_exit_irq        (hbmc_to_uibssm_reset_exit_irq),
    .uibphy_to_ssm_vsshi_comp_fsm_clk     (uibphy_to_ssm_vsshi_comp_fsm_clk),
    .uibssm_to_uibphy_cal_clk             (uibssm_to_uibphy_cal_clk),
    .uibssm_to_uibphy_cal_wr              (uibssm_to_uibphy_cal_wr),
    .uibssm_to_uibphy_cal_rd              (uibssm_to_uibphy_cal_rd),
    .uibssm_to_uibphy_cal_addr            (uibssm_to_uibphy_cal_addr),
    .uibssm_to_uibphy_cal_wrdata          (uibssm_to_uibphy_cal_wrdata),
    .uibphy_to_uibssm_cal_rdval           (uibphy_to_uibssm_cal_rdval),
    .uibphy_to_uibssm_cal_rddata          (uibphy_to_uibssm_cal_rddata)
);  


intel_hbmss_nossm_ph2 #(
    .PHY_MEMCLK_FREQ_MHZ    (PHY_MEMCLK_FREQ_MHZ),
    .PHY_REFCLK_FREQ_MHZ    (PHY_REFCLK_FREQ_MHZ),
    .PHY_RESET_TYPE         (PHY_RESET_TYPE),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH0),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH1),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH2),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH3),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH4),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH5),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH6),
    `HBMSS_PH2_TOP_INST_CH_PARAMS(HBM2E_CTRL_CH7),
    .HBM2E_MEM_DEVICE       (HBM2E_MEM_DEVICE),
    .HBM2E_MEM_TDQSS_MAX_PS (HBM2E_MEM_TDQSS_MAX_PS),
    .HBM2E_MEM_TDQSS_MIN_PS (HBM2E_MEM_TDQSS_MIN_PS),
    .HBM2E_MEM_TDQSCK_MAX_PS(HBM2E_MEM_TDQSCK_MAX_PS),
    .HBM2E_MEM_TDQSQ_MAX_PS (HBM2E_MEM_TDQSQ_MAX_PS),
    .HBM2E_MEM_TRAS_CYC     (HBM2E_MEM_TRAS_CYC),
    .HBM2E_MEM_TRCDRD_CYC   (HBM2E_MEM_TRCDRD_CYC),
    .HBM2E_MEM_TRCDWR_CYC   (HBM2E_MEM_TRCDWR_CYC),
    .HBM2E_MEM_TRRDL_CYC    (HBM2E_MEM_TRRDL_CYC),
    .HBM2E_MEM_TRRDS_CYC    (HBM2E_MEM_TRRDS_CYC),
    .HBM2E_MEM_TFAW_CYC     (HBM2E_MEM_TFAW_CYC),
    .HBM2E_MEM_TRTPL_CYC    (HBM2E_MEM_TRTPL_CYC),
    .HBM2E_MEM_TRTPS_CYC    (HBM2E_MEM_TRTPS_CYC),
    .HBM2E_MEM_TRP_CYC      (HBM2E_MEM_TRP_CYC),
    .HBM2E_MEM_TWR_CYC      (HBM2E_MEM_TWR_CYC),
    .HBM2E_MEM_TCCDL_CYC    (HBM2E_MEM_TCCDL_CYC),
    .HBM2E_MEM_TCCDS_CYC    (HBM2E_MEM_TCCDS_CYC),
    .HBM2E_MEM_TCCDR_CYC    (HBM2E_MEM_TCCDR_CYC),
    .HBM2E_MEM_TWTRL_CYC    (HBM2E_MEM_TWTRL_CYC),
    .HBM2E_MEM_TWTRS_CYC    (HBM2E_MEM_TWTRS_CYC),
    .HBM2E_MEM_TPD_CYC      (HBM2E_MEM_TPD_CYC),
    .HBM2E_MEM_TXP_CYC      (HBM2E_MEM_TXP_CYC),
    .HBM2E_MEM_TCKESR_CYC   (HBM2E_MEM_TCKESR_CYC),
    .HBM2E_MEM_TCKSRE_CYC   (HBM2E_MEM_TCKSRE_CYC),
    .HBM2E_MEM_TCKSRX_CYC   (HBM2E_MEM_TCKSRX_CYC),
    .HBM2E_MEM_TXS_CYC      (HBM2E_MEM_TXS_CYC),
    .HBM2E_MEM_TRFC_CYC     (HBM2E_MEM_TRFC_CYC),
    .HBM2E_MEM_TRFCSB_CYC   (HBM2E_MEM_TRFCSB_CYC),
    .HBM2E_MEM_TRREFD_CYC   (HBM2E_MEM_TRREFD_CYC),
    .HBM2E_MEM_TREFI_CYC    (HBM2E_MEM_TREFI_CYC),
    .HBM2E_MEM_WL_CYC       (HBM2E_MEM_WL_CYC),
    .HBM2E_MEM_RL_CYC       (HBM2E_MEM_RL_CYC),
    .HBM2E_MEM_PL_CYC       (HBM2E_MEM_PL_CYC),
    .DFT_DEBUG_MODE         (DFT_DEBUG_MODE),
    .HBM2E_MEM_MODEL_OPTIONS(HBM2E_MEM_MODEL_OPTIONS),
    .HBM2E_MEM_MODEL_TDQSCK (HBM2E_MEM_MODEL_TDQSCK) 
) hbmss_wrapper (
    .*
);



tennm_ph2_io_ibuf #(
   .buffer_usage    ("UIB"),
   .bus_hold        ("BUS_HOLD_OFF"),
   .toggle_speed    ("TOGGLE_SPEED_SLOW"),          
   .equalization    ("EQUALIZATION_OFF"),
   .io_standard     ("IO_STANDARD_IOSTD_OFF"),
   .rx_equalization ("EQUALIZATION_OFF"),    
   .rzq_id          ("RZQ_ID_RZQ0"),
   .schmitt_trigger ("SCHMITT_TRIGGER_OFF"),
   .termination     ("TERMINATION_RT_DIFF"),
   .usage_mode      ("USAGE_MODE_LVDS"),
   .vref            ("VREF_OFF"),
   .weak_pull_down  ("WEAK_PULL_DOWN_OFF"),
   .weak_pull_up    ("WEAK_PULL_UP_OFF")
) xuibpll_refclk (
   .i(uibpll_refclk),
   .o(uibpll_refclk_buffered)
);


`ifdef INSTANTIATE_HBM_RESET
intel_hbm_reset #( 
   .HBM2E_CTRL_CH0_EN(HBM2E_CTRL_CH0_EN),
   .HBM2E_CTRL_CH1_EN(HBM2E_CTRL_CH1_EN),
   .HBM2E_CTRL_CH2_EN(HBM2E_CTRL_CH2_EN),
   .HBM2E_CTRL_CH3_EN(HBM2E_CTRL_CH3_EN),
   .HBM2E_CTRL_CH4_EN(HBM2E_CTRL_CH4_EN),
   .HBM2E_CTRL_CH5_EN(HBM2E_CTRL_CH5_EN),
   .HBM2E_CTRL_CH6_EN(HBM2E_CTRL_CH6_EN),
   .HBM2E_CTRL_CH7_EN(HBM2E_CTRL_CH7_EN)
) intel_hbm_reset_fp (
   .hbm_reset_in_prog(hbm_reset_in_prog)
);
`endif

assign fake_reset_o = 1'b0;

endmodule

`undef HBMSS_PH2_TOP_DECL_AXI4_S_PORTS
`undef HBMSS_PH2_TOP_DECL_AXILITE_S_PORTS

`undef HBMSS_PH2_TOP_DECL_CH_PARAMS
`undef HBMSS_PH2_TOP_INST_CH_PARAMS

`undef HBMSS_PH2_TOP_DECL_PC_PORTS
`undef HBMSS_PH2_TOP_DECL_SB_PORTS

`default_nettype wire
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "VF+6zJhzQcCAX406V7bH+4aZ5NbyiNhELrPlOEsC6XRpLmLDGmEiuUTFZG3eje6xcRKlcNE4eNzmJKGQ0x2nbseGGe0IrQpovELPstDK76uv3CMqQz1tBNZuRamzE6ZyLDsW6OBF97GSr/P9qB6DGJqH/ZZoxIKVLSj8n4Q58pBzjy/PqT3kgXL4ZhR58cQX4OvvYYyxK6UTErGzJ0EiOTCrRYO3Ulxd/S/57kJOQ70EDTeVz5PJucmGNu7tRzDC59uhZZo0hNvaR+/3S6kwrpY7s7nGghspb6GQW0X54bLUOwZv5bh4mY+wdoSD34Gy5gFXB8/+hUyC/Upw40+qrcZHiZPwbzCIsqRsxHaO9Uz58vdtki5PI5gaX/tkLmERyfSLXOu3ftHJcF0ha9oKeDBB18fTiHM2Ne3geLye0LHGRQPuRzo/lX/l6vxuSyvf2DvzNqfzG4l2E5TeZb9cU1iHeRoOaPHkgJIlf6Bu51E/0Tdx1MIMgE+UdpmrIRqUBwSj3QGjpINNR7CSOTC7lSLHn4/oJwDTDHD044aos30U9IYbNt2k8fFMRxhtWY3upZYYRLjoL5BpPT5Okk0b9pl4twqZgw1SAoKHqw9dwb/3EC/LLeBPtDlD9Bsi7m6Pt6eqhpQvip8/4Ddx8vEb/DBag5AGWPmQejeZA0rrvhuoTHbZh+tEN/gD0COM2f1CM5Lyf+9KIq3DK7BJC9HnxlLzFMdebQArDSobvmaxFXH+HZr4Z+Cfvpb5QhDiUA+KPH+AXEyxJNtoyh5eyRe5Mo7kQETrqjOd+qyLGuxfmrIGFJvIvxxdNx7+O714CStJkUwEVPCL8jiN3wG99dY3+ljWWTV6/qy9r1/YfZ4bgTfOsoABFhi0BZ/o2RQSnhR/8z+RnjDXNVYva8XkRVTxBJOL/tCAps6Wjm5GvbEj55JEk8Aukst7IpeAXWxLc0p0CG+A09X3xQ+JQJhiYCHiTOy6aMnrddUeLMhD73wUqf+7iImCO39C10ZdnJU7IoT6"
`endif
