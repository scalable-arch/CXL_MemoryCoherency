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


module platform_hbm_fp_0_hbm_arch_fp_10_n6lpfga_uibssm #(
   parameter SSM_FW_CONTENTS          = "INVALID",
   parameter SSM_MEM_CONTENTS_0       = "INVALID",
   parameter SSM_MEM_CONTENTS_1       = "INVALID",
   parameter SSM_MEM_CONTENTS_2       = "INVALID",
   parameter SSM_MEM_CONTENTS_3       = "INVALID",
   parameter SSM_MEM_CONTENTS_VALID   = "False",
   parameter SSM_PARAM_TABLE_CONTENTS = "INVALID",
   parameter SSM_NIOS_FW_FILE         = "INVALID",
   parameter SSM_NIOS_CALIBRATION_CODE_HEX_FILE = "",
   parameter SSM_PARAM_TABLE_HEX_FILE = ""
) (
   output wire        uibssm_sb_aclk,     
   input  wire [26:0] uibssm_sb_awaddr,  
   input  wire        uibssm_sb_awvalid, 
   output wire        uibssm_sb_awready, 
   input  wire [31:0] uibssm_sb_wdata,   
   input  wire  [3:0] uibssm_sb_wstrb,   
   input  wire        uibssm_sb_wvalid,  
   output wire        uibssm_sb_wready,  
   output wire  [1:0] uibssm_sb_bresp,   
   output wire        uibssm_sb_bvalid,  
   input  wire        uibssm_sb_bready,  
   input  wire [26:0] uibssm_sb_araddr,  
   input  wire        uibssm_sb_arvalid, 
   output wire        uibssm_sb_arready, 
   output wire [31:0] uibssm_sb_rdata,   
   output wire  [1:0] uibssm_sb_rresp,   
   output wire        uibssm_sb_rvalid,  
   input  wire        uibssm_sb_rready,    
   output wire        uibssm_to_hbmc_early_reset_n,
   output wire        uibssm_to_hbmc_reset_n,
   output wire        uibssm_to_hbmc_axilite_reset_n,
   output wire        uibssm_to_hbmc_reset_n_iso,
   input  wire        hbmc_to_uibssm_reset_irq,
   input  wire        hbmc_to_uibssm_reset_exit_irq,
   input  wire uibphy_to_ssm_vsshi_comp_fsm_clk,
   output wire        uibssm_to_uibphy_cal_clk,
   output wire        uibssm_to_uibphy_cal_wr,
   output wire        uibssm_to_uibphy_cal_rd,
   output wire [19:0] uibssm_to_uibphy_cal_addr,
   output wire [31:0] uibssm_to_uibphy_cal_wrdata,
   input  wire        uibphy_to_uibssm_cal_rdval,
   input  wire [31:0] uibphy_to_uibssm_cal_rddata
);    


wire        left_fabricpll_to_uibssm_freqcal_req;
wire        right_fabricpll_to_uibssm_freqcal_req;
wire        uibssm_to_right_fabricpll_cal_clk;
wire        uibssm_to_right_fabricpll_cal_wr;
wire        uibssm_to_right_fabricpll_cal_rd;
wire [19:0] uibssm_to_right_fabricpll_cal_addr;
wire [31:0] uibssm_to_right_fabricpll_cal_wrdata;
wire        right_fabricpll_to_uibssm_cal_rdval;
wire [31:0] right_fabricpll_to_uibssm_cal_rddata;

assign left_fabricpll_to_uibssm_freqcal_req  =  1'b0;
assign right_fabricpll_to_uibssm_cal_rdval   =  1'b0;
assign right_fabricpll_to_uibssm_cal_rddata  = 32'b0;
assign right_fabricpll_to_uibssm_freqcal_req =  1'b0;

tennm_uib_ssm #(
   .a_uib_mode                    ("A_UIB_MODE_HBM2E"),
   .fw_contents                   (SSM_FW_CONTENTS),
   .mem_contents_0                (SSM_MEM_CONTENTS_0),
   .mem_contents_1                (SSM_MEM_CONTENTS_1),
   .mem_contents_2                (SSM_MEM_CONTENTS_2),
   .mem_contents_3                (SSM_MEM_CONTENTS_3),
   .mem_contents_valid            (SSM_MEM_CONTENTS_VALID),
   .param_table_contents          (SSM_PARAM_TABLE_CONTENTS),
   .nios_fw_file                  (SSM_NIOS_FW_FILE),
   .nios_calibration_code_hex_file(SSM_NIOS_CALIBRATION_CODE_HEX_FILE),
   .parameter_table_hex_file      (SSM_PARAM_TABLE_HEX_FILE)
) xssm (
    .o_ssm2hnoc_o_axi_bridge_0_s0_aclk   (uibssm_sb_aclk),     
    .i_hnoc2ssm_i_axi_bridge_0_s0_awaddr (uibssm_sb_awaddr),  
    .i_hnoc2ssm_i_axi_bridge_0_s0_awvalid(uibssm_sb_awvalid), 
    .o_ssm2hnoc_o_axi_bridge_0_s0_awready(uibssm_sb_awready), 
    .i_hnoc2ssm_i_axi_bridge_0_s0_wdata  (uibssm_sb_wdata),   
    .i_hnoc2ssm_i_axi_bridge_0_s0_wstrb  (uibssm_sb_wstrb),   
    .i_hnoc2ssm_i_axi_bridge_0_s0_wvalid (uibssm_sb_wvalid),  
    .o_ssm2hnoc_o_axi_bridge_0_s0_wready (uibssm_sb_wready),  
    .o_ssm2hnoc_o_axi_bridge_0_s0_bresp  (uibssm_sb_bresp),   
    .o_ssm2hnoc_o_axi_bridge_0_s0_bvalid (uibssm_sb_bvalid),  
    .i_hnoc2ssm_i_axi_bridge_0_s0_bready (uibssm_sb_bready),  
    .i_hnoc2ssm_i_axi_bridge_0_s0_araddr (uibssm_sb_araddr),  
    .i_hnoc2ssm_i_axi_bridge_0_s0_arvalid(uibssm_sb_arvalid), 
    .o_ssm2hnoc_o_axi_bridge_0_s0_arready(uibssm_sb_arready), 
    .o_ssm2hnoc_o_axi_bridge_0_s0_rdata  (uibssm_sb_rdata),   
    .o_ssm2hnoc_o_axi_bridge_0_s0_rresp  (uibssm_sb_rresp),   
    .o_ssm2hnoc_o_axi_bridge_0_s0_rvalid (uibssm_sb_rvalid),  
    .i_hnoc2ssm_i_axi_bridge_0_s0_rready (uibssm_sb_rready),    
    .o_ssm2hbmc_hbmc_early_reset_n       (uibssm_to_hbmc_early_reset_n),
    .o_ssm2hbmc_hbmc_reset_n             (uibssm_to_hbmc_reset_n),
    .o_ssm2hbmc_hbmc_axilite_reset_n     (uibssm_to_hbmc_axilite_reset_n),
    .o_ssm2hbmc_hbmc_reset_n_iso         (uibssm_to_hbmc_reset_n_iso),
    .i_hbmc2ssm_hbm_reset_irq            (hbmc_to_uibssm_reset_irq),
    .i_hbmc2ssm_hbmc_reset_exit_irq      (hbmc_to_uibssm_reset_exit_irq),
    .i_lfpll2ssm_freqcal_req_flag_lf     (left_fabricpll_to_uibssm_freqcal_req),
    .i_rfpll2ssm_freqcal_req_flag_rf     (right_fabricpll_to_uibssm_freqcal_req),
    .i_uibio2sstack_phy_ioclk            (uibphy_to_ssm_vsshi_comp_fsm_clk),
    .o_ssm2uibphy_pri_cal_clk            (uibssm_to_uibphy_cal_clk),
    .o_ssm2uibphy_pri_cal_wr             (uibssm_to_uibphy_cal_wr),
    .o_ssm2uibphy_pri_cal_rd             (uibssm_to_uibphy_cal_rd),
    .o_ssm2uibphy_pri_cal_addr           (uibssm_to_uibphy_cal_addr),
    .o_ssm2uibphy_pri_cal_wrdata         (uibssm_to_uibphy_cal_wrdata),
    .i_uibphy2ssm_pri_cal_rd_val         (uibphy_to_uibssm_cal_rdval),
    .i_uibphy2ssm_pri_cal_rddata         (uibphy_to_uibssm_cal_rddata),
    .o_ssm2fpll_fpll_cal_clk             (uibssm_to_right_fabricpll_cal_clk),
    .o_ssm2fpll_fpll_cal_wr              (uibssm_to_right_fabricpll_cal_wr),
    .o_ssm2fpll_fpll_cal_rd              (uibssm_to_right_fabricpll_cal_rd),
    .o_ssm2fpll_fpll_cal_addr            (uibssm_to_right_fabricpll_cal_addr),
    .o_ssm2fpll_fpll_cal_wrdata          (uibssm_to_right_fabricpll_cal_wrdata),
    .i_fpll2ssm_fpll_cal_rd_val          (right_fabricpll_to_uibssm_cal_rdval),
    .i_fpll2ssm_fpll_cal_rddata          (right_fabricpll_to_uibssm_cal_rddata)
);  

endmodule

`default_nettype wire
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "VF+6zJhzQcCAX406V7bH+4aZ5NbyiNhELrPlOEsC6XRpLmLDGmEiuUTFZG3eje6xcRKlcNE4eNzmJKGQ0x2nbseGGe0IrQpovELPstDK76uv3CMqQz1tBNZuRamzE6ZyLDsW6OBF97GSr/P9qB6DGJqH/ZZoxIKVLSj8n4Q58pBzjy/PqT3kgXL4ZhR58cQX4OvvYYyxK6UTErGzJ0EiOTCrRYO3Ulxd/S/57kJOQ710dk2eeaNQPMrnRIhNyQe/BBn0H33a5rgjY1rHsTbf23EPjCu8N+hchwK+aE/46bPhYx2YUVLekVeGGDU0TZTNK3SaqRXHznJqf3ZPGeq0zE2tg9CFqfh4Cw11E2Kwu4yP2sG5/rPNosJ3mzA+9gdwQor4K0TqTi0F9016Z253OvHtsYF/QXI9mY4BXxmTCcv3oklIPTm2XVxt1+ybvsQmgwASzu8r61kWFz76E7L2gQu96bXufWIPTb/i8tGcam03VBPxZaPGtyoNj0Vhf5sbpeFkn6MaZtIQtrBgvesGi/ofQf6UXDAnWPxfAFZz59oP8wuSIhKqC+Q0RqDuP/ZwOEblqLBZNwDfmB3kE8Wrm9yw+9Ql/AOZzP7JXZgd3yS0MzhbtVwMDurHYzI10CI0xARNjH3y5yoLxDESEUOVscLNPi1iH3FsW4Erk8v0cY9PmmEN7QUqV6r5P1fyW+KBbtZ5KM0r/7Tx4baDluGNrW+XseMpXC5b9Zot2dx/6U9p02SylPfSrMtJ3ATuIyDFm77o1m0aPbE5etKwrFUyhzVnZ2Jihudx2M+/yTeqizc0yj2VPGIVWhkabwKmJqqoikkgF3Ym7Om0NDWoYUNqqdI46ExD+Tu5AHnUCXOSHe+TY2GuiYkzffhneNkcc7J+ff81Ve3W6QfQx/AC6F7cGt/wHDxJXcAwJ/Wqqbvhl0axhFBZyaS7b8BUe7KQ5ktlEXRZ07cr0wChRuI0qGPQzEn5ZOuZwDzmgzf19SA4VGuwMmxE2wqyusW/srq57ae1"
`endif
