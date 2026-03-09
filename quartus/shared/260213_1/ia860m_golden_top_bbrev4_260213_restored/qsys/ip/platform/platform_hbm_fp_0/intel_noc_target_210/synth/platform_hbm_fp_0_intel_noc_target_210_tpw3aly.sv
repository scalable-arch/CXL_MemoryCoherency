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


module platform_hbm_fp_0_intel_noc_target_210_tpw3aly # (
    parameter NOC_TARGET_ECC_EN =  "NOC_TARGET_ECC_EN_ENABLE",
    parameter NOC_SECURE_FILTER_ENA = "NOC_SECURE_FILTER_ENA_DISABLE",
    parameter NOC_TARGET_DFD_EN = "NOC_TARGET_DFD_EN_DISABLE",

    parameter NOC_NON_USER_NIU = "DISABLE",

    parameter NOC_ISOLATION_GROUP = "DEFAULT",

    // AXI parameters 
    parameter AXI_ADDR_WIDTH = 44,
    parameter AXI_WSTRB_WIDTH = 32,
    parameter AXI_AUSER_WIDTH = 8,
    parameter AXI_USER_WIDTH = 32,
    parameter AXI_ID_WIDTH = 7,
    parameter AXI_DATA_WIDTH = 256,
    parameter CHOOSE_AXI = "AXI4lite",

    // Memory size
    parameter NOC_EMIF_ADDR_MASK = "NOC_EMIF_ADDR_MASK_4_GB",
    parameter NOC_TARGET_SIZE = "128_MB",

    // powermode
    parameter POWERMODE_FREQ_HZ_NOC_TNIU_CLK = 32'b00000000000000000000000000000000,


    // Security parameters
    parameter NOC_SECURE_RANGE0_BASE = 64'b0,
    parameter NOC_SECURE_RANGE0_SPAN = "NOC_SECURE_RANGE0_MASK_1024_GB",
    parameter NOC_SECURE_RANGE0_VALID = "NOC_SECURE_RANGE0_VALID_INVALID",
    parameter NOC_SECURE_RANGE0_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE0_WRITE_ACCESS_PRIV = 64'b0,
    
    parameter NOC_SECURE_RANGE1_BASE = 64'b0,
    parameter NOC_SECURE_RANGE1_SPAN = "NOC_SECURE_RANGE1_MASK_1024_GB",
    parameter NOC_SECURE_RANGE1_VALID = "NOC_SECURE_RANGE1_VALID_INVALID",
    parameter NOC_SECURE_RANGE1_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE1_WRITE_ACCESS_PRIV = 64'b0,

    parameter NOC_SECURE_RANGE2_BASE = 64'b0,
    parameter NOC_SECURE_RANGE2_SPAN = "NOC_SECURE_RANGE2_MASK_1024_GB",
    parameter NOC_SECURE_RANGE2_VALID = "NOC_SECURE_RANGE2_VALID_INVALID",
    parameter NOC_SECURE_RANGE2_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE2_WRITE_ACCESS_PRIV = 64'b0,
    
    parameter NOC_SECURE_RANGE3_BASE = 64'b0,
    parameter NOC_SECURE_RANGE3_SPAN = "NOC_SECURE_RANGE3_MASK_1024_GB",
    parameter NOC_SECURE_RANGE3_VALID = "NOC_SECURE_RANGE3_VALID_INVALID",
    parameter NOC_SECURE_RANGE3_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE3_WRITE_ACCESS_PRIV = 64'b0,

    parameter NOC_SECURE_RANGE4_BASE = 64'b0,
    parameter NOC_SECURE_RANGE4_SPAN = "NOC_SECURE_RANGE4_MASK_1024_GB",
    parameter NOC_SECURE_RANGE4_VALID = "NOC_SECURE_RANGE4_VALID_INVALID",
    parameter NOC_SECURE_RANGE4_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE4_WRITE_ACCESS_PRIV = 64'b0,

    parameter NOC_SECURE_RANGE5_BASE = 64'b0,
    parameter NOC_SECURE_RANGE5_SPAN = "NOC_SECURE_RANGE5_MASK_1024_GB",
    parameter NOC_SECURE_RANGE5_VALID = "NOC_SECURE_RANGE5_VALID_INVALID",
    parameter NOC_SECURE_RANGE5_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE5_WRITE_ACCESS_PRIV = 64'b0,

    parameter NOC_SECURE_RANGE6_BASE = 64'b0,
    parameter NOC_SECURE_RANGE6_SPAN = "NOC_SECURE_RANGE6_MASK_1024_GB",
    parameter NOC_SECURE_RANGE6_VALID = "NOC_SECURE_RANGE6_VALID_INVALID",
    parameter NOC_SECURE_RANGE6_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE6_WRITE_ACCESS_PRIV = 64'b0,

    parameter NOC_SECURE_RANGE7_BASE = 64'b0,
    parameter NOC_SECURE_RANGE7_SPAN = "NOC_SECURE_RANGE7_MASK_1024_GB",
    parameter NOC_SECURE_RANGE7_VALID = "NOC_SECURE_RANGE7_VALID_INVALID",
    parameter NOC_SECURE_RANGE7_READ_ACCESS_PRIV = 64'b0,
    parameter NOC_SECURE_RANGE7_WRITE_ACCESS_PRIV = 64'b0

 ) (

        //clk reset 
        input logic clk,
        input logic reset,

    output logic [AXI_WSTRB_WIDTH-1:0] response_wstrb,
    output logic response_arvalid,
    output logic [AXI_ADDR_WIDTH-1:0] response_araddr,
    output logic response_awvalid,
    output logic [AXI_AUSER_WIDTH-1:0] response_aruser,
    output logic response_wlast,
    output logic [7:0] response_awlen,
    output logic response_arlock,
    output logic response_wvalid,
    output logic [2:0] response_arsize,
    output logic [2:0] response_awsize,
    output logic [AXI_ID_WIDTH-1:0] response_awid,
    output logic [3:0] response_awqos,
    output logic [AXI_ADDR_WIDTH-1:0] response_awaddr,
    output logic [3:0] response_arqos,
    output logic [AXI_ID_WIDTH-1:0] response_arid,
    output logic response_awlock,
    output logic response_rready,
    output logic [AXI_DATA_WIDTH-1:0] response_wdata,
    output logic response_bready,
    output logic [1:0] response_arburst,
    output logic [7:0] response_arlen,
    output logic [AXI_USER_WIDTH-1:0] response_wuser,
    output logic [AXI_AUSER_WIDTH-1:0] response_awuser,
    output logic [1:0] response_awburst,

    input logic response_rlast,
    input logic [1:0] response_rresp,
    input logic response_awready,
    input logic [AXI_ID_WIDTH-1:0] response_bid,
    input logic response_rvalid,
    input logic response_wready,
    input logic [AXI_USER_WIDTH-1:0] response_ruser,
    input logic [AXI_ID_WIDTH-1:0] response_rid,
    input logic [1:0] response_bresp,
    input logic [AXI_DATA_WIDTH-1:0] response_rdata,
    input logic response_bvalid,
    input logic response_arready,

        output logic [2:0] response_awprot,
        output logic [2:0] response_arprot

 );
     assign response_awprot = 3'h0;
     assign response_arprot = 3'h0;

 if (CHOOSE_AXI=="AXI4") begin : target_0

     assign response_awlen[7] = 1'b0;
     assign response_arlen[7] = 1'b0;
     assign response_awqos[1:0] = 2'h0;
     assign response_arqos[1:0] = 2'h0;

    (* altera_attribute = {"-name PRESERVE_FANOUT_FREE_WYSIWYG ON; -name NOC_TARGET ON; -name NOC_TARGET_ADDRESS_RANGE 30; -name NOC_ISOLATION_GROUP DEFAULT"} *) tennm_noc_target # (
    .NOC_TARGET_ECC_EN (NOC_TARGET_ECC_EN),
    .NOC_SECURE_FILTER_ENA (NOC_SECURE_FILTER_ENA),
    .NOC_TARGET_DFD_EN(NOC_TARGET_DFD_EN),
    
    //Memory size
    .NOC_EMIF_ADDR_MASK(NOC_EMIF_ADDR_MASK),

    // PowerMode    
    .POWERMODE_FREQ_HZ_NOC_TNIU_CLK(POWERMODE_FREQ_HZ_NOC_TNIU_CLK),
    
    // Security parameters
    .NOC_SECURE_RANGE0_BASE (NOC_SECURE_RANGE0_BASE),
    .NOC_SECURE_RANGE0_MASK (NOC_SECURE_RANGE0_SPAN),
    .NOC_SECURE_RANGE0_VALID (NOC_SECURE_RANGE0_VALID),
    .NOC_SECURE_RANGE0_READ_ACCESS_PRIV (NOC_SECURE_RANGE0_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE0_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE0_WRITE_ACCESS_PRIV),
    
    .NOC_SECURE_RANGE1_BASE (NOC_SECURE_RANGE1_BASE),
    .NOC_SECURE_RANGE1_MASK (NOC_SECURE_RANGE1_SPAN),
    .NOC_SECURE_RANGE1_VALID (NOC_SECURE_RANGE1_VALID),
    .NOC_SECURE_RANGE1_READ_ACCESS_PRIV (NOC_SECURE_RANGE1_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE1_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE1_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE2_BASE (NOC_SECURE_RANGE2_BASE),
    .NOC_SECURE_RANGE2_MASK (NOC_SECURE_RANGE2_SPAN),
    .NOC_SECURE_RANGE2_VALID (NOC_SECURE_RANGE2_VALID),
    .NOC_SECURE_RANGE2_READ_ACCESS_PRIV (NOC_SECURE_RANGE2_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE2_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE2_WRITE_ACCESS_PRIV),
    
    .NOC_SECURE_RANGE3_BASE (NOC_SECURE_RANGE3_BASE),
    .NOC_SECURE_RANGE3_MASK (NOC_SECURE_RANGE3_SPAN),
    .NOC_SECURE_RANGE3_VALID (NOC_SECURE_RANGE3_VALID),
    .NOC_SECURE_RANGE3_READ_ACCESS_PRIV (NOC_SECURE_RANGE3_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE3_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE3_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE4_BASE (NOC_SECURE_RANGE4_BASE),
    .NOC_SECURE_RANGE4_MASK (NOC_SECURE_RANGE4_SPAN),
    .NOC_SECURE_RANGE4_VALID (NOC_SECURE_RANGE4_VALID),
    .NOC_SECURE_RANGE4_READ_ACCESS_PRIV (NOC_SECURE_RANGE4_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE4_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE4_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE5_BASE (NOC_SECURE_RANGE5_BASE),
    .NOC_SECURE_RANGE5_MASK (NOC_SECURE_RANGE5_SPAN),
    .NOC_SECURE_RANGE5_VALID (NOC_SECURE_RANGE5_VALID),
    .NOC_SECURE_RANGE5_READ_ACCESS_PRIV (NOC_SECURE_RANGE5_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE5_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE5_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE6_BASE (NOC_SECURE_RANGE6_BASE),
    .NOC_SECURE_RANGE6_MASK (NOC_SECURE_RANGE6_SPAN),
    .NOC_SECURE_RANGE6_VALID (NOC_SECURE_RANGE6_VALID),
    .NOC_SECURE_RANGE6_READ_ACCESS_PRIV (NOC_SECURE_RANGE6_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE6_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE6_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE7_BASE (NOC_SECURE_RANGE7_BASE),
    .NOC_SECURE_RANGE7_MASK (NOC_SECURE_RANGE7_SPAN),
    .NOC_SECURE_RANGE7_VALID (NOC_SECURE_RANGE7_VALID),
    .NOC_SECURE_RANGE7_READ_ACCESS_PRIV (NOC_SECURE_RANGE7_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE7_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE7_WRITE_ACCESS_PRIV),
    
    .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
    .AXI_WSTRB_WIDTH (AXI_WSTRB_WIDTH),
    .AXI_AUSER_WIDTH (AXI_AUSER_WIDTH),
    .AXI_USER_WIDTH (AXI_USER_WIDTH),
    .AXI_ID_WIDTH (AXI_ID_WIDTH),
    .AXI_DATA_WIDTH (AXI_DATA_WIDTH)

 ) target_inst_0 (
        // Out
        .response_clk(clk),

        .response_wstrb(response_wstrb),
        .response_arvalid(response_arvalid),
        .response_araddr(response_araddr),
        .response_awvalid(response_awvalid),
        .response_aruser(response_aruser),
        .response_wlast(response_wlast),
        .response_awlen(response_awlen[6:0]),
        .response_arlock(response_arlock),
        .response_wvalid(response_wvalid),
        .response_arsize(response_arsize),
        .response_awsize(response_awsize),
        .response_awid(response_awid),
        .response_awqos(response_awqos[3:2]),
        .response_awaddr(response_awaddr),
        .response_arqos(response_arqos[3:2]),
        .response_arid(response_arid),
        .response_awlock(response_awlock),
        .response_rready(response_rready),
        .response_wdata(response_wdata),
        .response_bready(response_bready),
        .response_arburst(response_arburst),
        .response_arlen(response_arlen[6:0]),
        .response_wuser(response_wuser),
        .response_awuser(response_awuser),
        .response_awburst(response_awburst),

        // In
        .response_rlast(response_rlast),
        .response_rresp(response_rresp),
        .response_awready(response_awready),
        .response_bid(response_bid),
        .response_rvalid(response_rvalid),
        .response_wready(response_wready),
        .response_ruser(response_ruser),
        .response_rid(response_rid),
        .response_bresp(response_bresp),
        .response_rdata(response_rdata),
        .response_bvalid(response_bvalid),
        .response_arready(response_arready)
    ); 

 end
 else begin : target_0
    (* altera_attribute = {"-name PRESERVE_FANOUT_FREE_WYSIWYG ON; -name NOC_TARGET ON; -name NOC_TARGET_ADDRESS_RANGE 27; -name AXI_LITE_NOC_BRIDGE ON; -name NOC_ISOLATION_GROUP DEFAULT"} *) tennm_noc_axilite_target # (
    .NOC_TARGET_ECC_EN (NOC_TARGET_ECC_EN),
    .NOC_SECURE_FILTER_ENA (NOC_SECURE_FILTER_ENA),
    .NOC_TARGET_DFD_EN(NOC_TARGET_DFD_EN),

    // PowerMode    
    .POWERMODE_FREQ_HZ_NOC_TNIU_CLK(POWERMODE_FREQ_HZ_NOC_TNIU_CLK),

    // Security parameters
    .NOC_SECURE_RANGE0_BASE (NOC_SECURE_RANGE0_BASE),
    .NOC_SECURE_RANGE0_MASK (NOC_SECURE_RANGE0_SPAN),
    .NOC_SECURE_RANGE0_VALID (NOC_SECURE_RANGE0_VALID),
    .NOC_SECURE_RANGE0_READ_ACCESS_PRIV (NOC_SECURE_RANGE0_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE0_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE0_WRITE_ACCESS_PRIV),
    
    .NOC_SECURE_RANGE1_BASE (NOC_SECURE_RANGE1_BASE),
    .NOC_SECURE_RANGE1_MASK (NOC_SECURE_RANGE1_SPAN),
    .NOC_SECURE_RANGE1_VALID (NOC_SECURE_RANGE1_VALID),
    .NOC_SECURE_RANGE1_READ_ACCESS_PRIV (NOC_SECURE_RANGE1_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE1_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE1_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE2_BASE (NOC_SECURE_RANGE2_BASE),
    .NOC_SECURE_RANGE2_MASK (NOC_SECURE_RANGE2_SPAN),
    .NOC_SECURE_RANGE2_VALID (NOC_SECURE_RANGE2_VALID),
    .NOC_SECURE_RANGE2_READ_ACCESS_PRIV (NOC_SECURE_RANGE2_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE2_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE2_WRITE_ACCESS_PRIV),
    
    .NOC_SECURE_RANGE3_BASE (NOC_SECURE_RANGE3_BASE),
    .NOC_SECURE_RANGE3_MASK (NOC_SECURE_RANGE3_SPAN),
    .NOC_SECURE_RANGE3_VALID (NOC_SECURE_RANGE3_VALID),
    .NOC_SECURE_RANGE3_READ_ACCESS_PRIV (NOC_SECURE_RANGE3_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE3_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE3_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE4_BASE (NOC_SECURE_RANGE4_BASE),
    .NOC_SECURE_RANGE4_MASK (NOC_SECURE_RANGE4_SPAN),
    .NOC_SECURE_RANGE4_VALID (NOC_SECURE_RANGE4_VALID),
    .NOC_SECURE_RANGE4_READ_ACCESS_PRIV (NOC_SECURE_RANGE4_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE4_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE4_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE5_BASE (NOC_SECURE_RANGE5_BASE),
    .NOC_SECURE_RANGE5_MASK (NOC_SECURE_RANGE5_SPAN),
    .NOC_SECURE_RANGE5_VALID (NOC_SECURE_RANGE5_VALID),
    .NOC_SECURE_RANGE5_READ_ACCESS_PRIV (NOC_SECURE_RANGE5_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE5_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE5_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE6_BASE (NOC_SECURE_RANGE6_BASE),
    .NOC_SECURE_RANGE6_MASK (NOC_SECURE_RANGE6_SPAN),
    .NOC_SECURE_RANGE6_VALID (NOC_SECURE_RANGE6_VALID),
    .NOC_SECURE_RANGE6_READ_ACCESS_PRIV (NOC_SECURE_RANGE6_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE6_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE6_WRITE_ACCESS_PRIV),

    .NOC_SECURE_RANGE7_BASE (NOC_SECURE_RANGE7_BASE),
    .NOC_SECURE_RANGE7_MASK (NOC_SECURE_RANGE7_SPAN),
    .NOC_SECURE_RANGE7_VALID (NOC_SECURE_RANGE7_VALID),
    .NOC_SECURE_RANGE7_READ_ACCESS_PRIV (NOC_SECURE_RANGE7_READ_ACCESS_PRIV),
    .NOC_SECURE_RANGE7_WRITE_ACCESS_PRIV (NOC_SECURE_RANGE7_WRITE_ACCESS_PRIV),
    
    .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH),
    .AXI_WSTRB_WIDTH(AXI_WSTRB_WIDTH),
    .AXI_AUSER_WIDTH(AXI_AUSER_WIDTH),
    .AXI_USER_WIDTH (AXI_USER_WIDTH),
    .AXI_ID_WIDTH   (AXI_ID_WIDTH),
    .AXI_DATA_WIDTH (AXI_DATA_WIDTH)

    ) target_lite_inst_0 (
        .response_clk(clk),

        .response_wstrb(response_wstrb),
        .response_arvalid(response_arvalid),
        .response_awvalid(response_awvalid),
        .response_wvalid(response_wvalid),
        .response_rready(response_rready),
        .response_wdata(response_wdata),
        .response_bready(response_bready),
        .response_awaddr (response_awaddr),
        .response_araddr (response_araddr),

        // In
        .response_rresp(response_rresp),
        .response_awready(response_awready),
        .response_rvalid(response_rvalid),
        .response_wready(response_wready),
        .response_bresp(response_bresp),
        .response_rdata(response_rdata),
        .response_bvalid(response_bvalid),
        .response_arready(response_arready)

 );
end
 
// end

endmodule
 

