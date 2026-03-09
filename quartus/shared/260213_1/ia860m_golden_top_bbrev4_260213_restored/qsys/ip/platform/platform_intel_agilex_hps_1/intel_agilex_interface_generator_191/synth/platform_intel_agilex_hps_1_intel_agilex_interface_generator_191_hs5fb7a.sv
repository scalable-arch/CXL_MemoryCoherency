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


module platform_intel_agilex_hps_1_intel_agilex_interface_generator_191_hs5fb7a #(
	parameter F2S_DATA_WIDTH = 128 ,
	parameter F2S_ADDRESS_WIDTH = 32 ,
	parameter S2F_DATA_WIDTH = 128 ,
	parameter S2F_ADDRESS_WIDTH = 32 ,
	parameter LWH2S_DATA_WIDTH = 0 ,
	parameter LWH2S_ADDRESS_WIDTH = 21  
) (
// h2f_reset
  output wire [1 - 1 : 0 ] h2f_rst
// h2n_csr_axi_clk
 ,output wire [1 - 1 : 0 ] hnoc_csr_axi_clk
// h2n_csr_axi_rst
 ,output wire [1 - 1 : 0 ] h2n_csr_axi_rst
// h2n_csr_axi
 ,input wire [1 - 1 : 0 ] h2n_mem_cfg_arready
 ,input wire [1 - 1 : 0 ] h2n_mem_cfg_awready
 ,input wire [2 - 1 : 0 ] h2n_mem_cfg_bresp
 ,input wire [1 - 1 : 0 ] h2n_mem_cfg_bvalid
 ,input wire [32 - 1 : 0 ] h2n_mem_cfg_rdata
 ,input wire [2 - 1 : 0 ] h2n_mem_cfg_rresp
 ,input wire [1 - 1 : 0 ] h2n_mem_cfg_rvalid
 ,input wire [1 - 1 : 0 ] h2n_mem_cfg_wready
 ,output wire [32 - 1 : 0 ] h2n_mem_cfg_araddr
 ,output wire [1 - 1 : 0 ] h2n_mem_cfg_arvalid
 ,output wire [32 - 1 : 0 ] h2n_mem_cfg_awaddr
 ,output wire [1 - 1 : 0 ] h2n_mem_cfg_awvalid
 ,output wire [1 - 1 : 0 ] h2n_mem_cfg_bready
 ,output wire [1 - 1 : 0 ] h2n_mem_cfg_rready
 ,output wire [32 - 1 : 0 ] h2n_mem_cfg_wdata
 ,output wire [4 - 1 : 0 ] h2n_mem_cfg_wstrb
 ,output wire [1 - 1 : 0 ] h2n_mem_cfg_wvalid
 ,output wire [3 - 1 : 0 ] emif_mem_cfg_arprot
 ,output wire [3 - 1 : 0 ] emif_mem_cfg_awprot
// h2n_ch0_axi_clk
 ,output wire [1 - 1 : 0 ] h2n_ch0_axi_clk
// h2n_ch0_axi_rst
 ,output wire [1 - 1 : 0 ] h2n_ch0_axi_rst
// h2n_ch0_axi
 ,input wire [1 - 1 : 0 ] h2n0_arready
 ,input wire [1 - 1 : 0 ] h2n0_awready
 ,input wire [7 - 1 : 0 ] h2n0_bid
 ,input wire [2 - 1 : 0 ] h2n0_bresp
 ,input wire [1 - 1 : 0 ] h2n0_bvalid
 ,input wire [256 - 1 : 0 ] h2n0_rdata
 ,input wire [7 - 1 : 0 ] h2n0_rid
 ,input wire [1 - 1 : 0 ] h2n0_rlast
 ,input wire [2 - 1 : 0 ] h2n0_rresp
 ,input wire [1 - 1 : 0 ] h2n0_rvalid
 ,input wire [1 - 1 : 0 ] h2n0_wready
 ,output wire [44 - 1 : 0 ] h2n0_araddr
 ,output wire [2 - 1 : 0 ] h2n0_arburst
 ,output wire [7 - 1 : 0 ] h2n0_arid
 ,output wire [8 - 1 : 0 ] h2n0_arlen
 ,output wire [1 - 1 : 0 ] h2n0_arlock
 ,output wire [4 - 1 : 0 ] h2n0_arqos
 ,output wire [3 - 1 : 0 ] h2n0_arsize
 ,output wire [1 - 1 : 0 ] h2n0_arvalid
 ,output wire [44 - 1 : 0 ] h2n0_awaddr
 ,output wire [2 - 1 : 0 ] h2n0_awburst
 ,output wire [7 - 1 : 0 ] h2n0_awid
 ,output wire [8 - 1 : 0 ] h2n0_awlen
 ,output wire [1 - 1 : 0 ] h2n0_awlock
 ,output wire [4 - 1 : 0 ] h2n0_awqos
 ,output wire [3 - 1 : 0 ] h2n0_awsize
 ,output wire [1 - 1 : 0 ] h2n0_awvalid
 ,output wire [1 - 1 : 0 ] h2n0_bready
 ,output wire [1 - 1 : 0 ] h2n0_rready
 ,output wire [256 - 1 : 0 ] h2n0_wdata
 ,output wire [1 - 1 : 0 ] h2n0_wlast
 ,output wire [32 - 1 : 0 ] h2n0_wstrb
 ,output wire [1 - 1 : 0 ] h2n0_wvalid
 ,output wire [3 - 1 : 0 ] h2n0_arprot
 ,output wire [3 - 1 : 0 ] h2n0_awprot
// h2f_axi_clock
 ,input wire [1 - 1 : 0 ] h2f_axi_clk
// h2f_axi_reset
 ,input wire [1 - 1 : 0 ] h2f_axi_rst_n
// h2f_axi_master
 ,output wire [4 - 1 : 0 ] h2f_AWID
 ,output wire [32 - 1 : 0 ] h2f_AWADDR
 ,output wire [8 - 1 : 0 ] h2f_AWLEN
 ,output wire [3 - 1 : 0 ] h2f_AWSIZE
 ,output wire [2 - 1 : 0 ] h2f_AWBURST
 ,output wire [1 - 1 : 0 ] h2f_AWLOCK
 ,output wire [4 - 1 : 0 ] h2f_AWCACHE
 ,output wire [3 - 1 : 0 ] h2f_AWPROT
 ,output wire [1 - 1 : 0 ] h2f_AWVALID
 ,input wire [1 - 1 : 0 ] h2f_AWREADY
 ,output wire [128 - 1 : 0 ] h2f_WDATA
 ,output wire [16 - 1 : 0 ] h2f_WSTRB
 ,output wire [1 - 1 : 0 ] h2f_WLAST
 ,output wire [1 - 1 : 0 ] h2f_WVALID
 ,input wire [1 - 1 : 0 ] h2f_WREADY
 ,input wire [4 - 1 : 0 ] h2f_BID
 ,input wire [2 - 1 : 0 ] h2f_BRESP
 ,input wire [1 - 1 : 0 ] h2f_BVALID
 ,output wire [1 - 1 : 0 ] h2f_BREADY
 ,output wire [4 - 1 : 0 ] h2f_ARID
 ,output wire [32 - 1 : 0 ] h2f_ARADDR
 ,output wire [8 - 1 : 0 ] h2f_ARLEN
 ,output wire [3 - 1 : 0 ] h2f_ARSIZE
 ,output wire [2 - 1 : 0 ] h2f_ARBURST
 ,output wire [1 - 1 : 0 ] h2f_ARLOCK
 ,output wire [4 - 1 : 0 ] h2f_ARCACHE
 ,output wire [3 - 1 : 0 ] h2f_ARPROT
 ,output wire [1 - 1 : 0 ] h2f_ARVALID
 ,input wire [1 - 1 : 0 ] h2f_ARREADY
 ,input wire [4 - 1 : 0 ] h2f_RID
 ,input wire [128 - 1 : 0 ] h2f_RDATA
 ,input wire [2 - 1 : 0 ] h2f_RRESP
 ,input wire [1 - 1 : 0 ] h2f_RLAST
 ,input wire [1 - 1 : 0 ] h2f_RVALID
 ,output wire [1 - 1 : 0 ] h2f_RREADY
// hps_io
 ,output wire [1 - 1 : 0 ] NAND_ALE
 ,output wire [1 - 1 : 0 ] NAND_CE_N
 ,output wire [1 - 1 : 0 ] NAND_CLE
 ,output wire [1 - 1 : 0 ] NAND_RE_N
 ,input wire [1 - 1 : 0 ] NAND_RB
 ,inout wire [1 - 1 : 0 ] NAND_ADQ0
 ,inout wire [1 - 1 : 0 ] NAND_ADQ1
 ,inout wire [1 - 1 : 0 ] NAND_ADQ2
 ,inout wire [1 - 1 : 0 ] NAND_ADQ3
 ,inout wire [1 - 1 : 0 ] NAND_ADQ4
 ,inout wire [1 - 1 : 0 ] NAND_ADQ5
 ,inout wire [1 - 1 : 0 ] NAND_ADQ6
 ,inout wire [1 - 1 : 0 ] NAND_ADQ7
 ,output wire [1 - 1 : 0 ] NAND_WP_N
 ,output wire [1 - 1 : 0 ] NAND_WE_N
 ,input wire [1 - 1 : 0 ] UART0_RX
 ,output wire [1 - 1 : 0 ] UART0_TX
 ,input wire [1 - 1 : 0 ] hps_osc_clk
);

wire [7:0] awuser_term;
wire [4:0] wsb_ssd_term;
wire [9:0] wsb_sid_term;

wire [7:0] aruser_term;
wire [4:0] rsb_ssd_term;
wire [9:0] rsb_sid_term;

wire [ 0:0] hps_mpfe_at_clock;
wire [ 0:0] hps_mpfe_at_reset;
wire [ 0:0] atb_clock;
wire [ 0:0] atb_reset;
wire [ 0:0] hps_afready;
wire [ 0:0] hps_afvalid;
wire [ 1:0] hps_atbytes;
wire [31:0] hps_atdata;
wire [ 6:0] hps_atid;
wire [ 0:0] hps_atready;
wire [ 0:0] hps_atvalid;
wire [ 0:0] hps_syncreq;
wire [ 0:0] mpfe_afready;
wire [ 0:0] mpfe_afvalid;
wire [ 1:0] mpfe_atbytes;
wire [31:0] mpfe_atdata;
wire [ 6:0] mpfe_atid;
wire [ 0:0] mpfe_atready;
wire [ 0:0] mpfe_atvalid;
wire [ 0:0] mpfe_syncreq;
wire [ 0:0] atb_afready_m;
wire [ 0:0] atb_afready_s;
wire [ 0:0] atb_afvalid_m;
wire [ 0:0] atb_afvalid_s;
wire [ 1:0] atb_atbytes_m;
wire [ 1:0] atb_atbytes_s;
wire [31:0] atb_atdata_m;
wire [31:0] atb_atdata_s;
wire [ 6:0] atb_atid_m;
wire [ 6:0] atb_atid_s;
wire [ 0:0] atb_atready_m;
wire [ 0:0] atb_atready_s;
wire [ 0:0] atb_atvalid_m;
wire [ 0:0] atb_atvalid_s;
wire [ 0:0] atb_syncreq_m;
wire [ 0:0] atb_syncreq_s;

wire [0:0] NAND_ALE_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ALE_obuf(
    .i(NAND_ALE_out),
    .o(NAND_ALE),
    .oe(1'b1)
);

wire [0:0] NAND_CE_N_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_CE_N_obuf(
    .i(NAND_CE_N_out),
    .o(NAND_CE_N),
    .oe(1'b1)
);

wire [0:0] NAND_CLE_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_CLE_obuf(
    .i(NAND_CLE_out),
    .o(NAND_CLE),
    .oe(1'b1)
);

wire [0:0] NAND_RE_N_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_RE_N_obuf(
    .i(NAND_RE_N_out),
    .o(NAND_RE_N),
    .oe(1'b1)
);

wire [0:0] NAND_RB_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_RB_ibuf(
    .i(NAND_RB),
    .o(NAND_RB_in)
);

wire [0:0] NAND_ADQ0_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ0_ibuf(
    .i(NAND_ADQ0),
    .o(NAND_ADQ0_in)
);

wire [0:0] NAND_ADQ0_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ0_obuf(
    .i(NAND_ADQ0_out),
    .o(NAND_ADQ0),
    .oe(1'b1)
);

wire [0:0] NAND_ADQ1_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ1_ibuf(
    .i(NAND_ADQ1),
    .o(NAND_ADQ1_in)
);

wire [0:0] NAND_ADQ1_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ1_obuf(
    .i(NAND_ADQ1_out),
    .o(NAND_ADQ1),
    .oe(1'b1)
);

wire [0:0] NAND_ADQ2_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ2_ibuf(
    .i(NAND_ADQ2),
    .o(NAND_ADQ2_in)
);

wire [0:0] NAND_ADQ2_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ2_obuf(
    .i(NAND_ADQ2_out),
    .o(NAND_ADQ2),
    .oe(1'b1)
);

wire [0:0] NAND_ADQ3_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ3_ibuf(
    .i(NAND_ADQ3),
    .o(NAND_ADQ3_in)
);

wire [0:0] NAND_ADQ3_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ3_obuf(
    .i(NAND_ADQ3_out),
    .o(NAND_ADQ3),
    .oe(1'b1)
);

wire [0:0] NAND_ADQ4_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ4_ibuf(
    .i(NAND_ADQ4),
    .o(NAND_ADQ4_in)
);

wire [0:0] NAND_ADQ4_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ4_obuf(
    .i(NAND_ADQ4_out),
    .o(NAND_ADQ4),
    .oe(1'b1)
);

wire [0:0] NAND_ADQ5_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ5_ibuf(
    .i(NAND_ADQ5),
    .o(NAND_ADQ5_in)
);

wire [0:0] NAND_ADQ5_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ5_obuf(
    .i(NAND_ADQ5_out),
    .o(NAND_ADQ5),
    .oe(1'b1)
);

wire [0:0] NAND_ADQ6_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ6_ibuf(
    .i(NAND_ADQ6),
    .o(NAND_ADQ6_in)
);

wire [0:0] NAND_ADQ6_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ6_obuf(
    .i(NAND_ADQ6_out),
    .o(NAND_ADQ6),
    .oe(1'b1)
);

wire [0:0] NAND_ADQ7_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_NAND_ADQ7_ibuf(
    .i(NAND_ADQ7),
    .o(NAND_ADQ7_in)
);

wire [0:0] NAND_ADQ7_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_ADQ7_obuf(
    .i(NAND_ADQ7_out),
    .o(NAND_ADQ7),
    .oe(1'b1)
);

wire [0:0] NAND_WP_N_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_WP_N_obuf(
    .i(NAND_WP_N_out),
    .o(NAND_WP_N),
    .oe(1'b1)
);

wire [0:0] NAND_WE_N_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_NAND_WE_N_obuf(
    .i(NAND_WE_N_out),
    .o(NAND_WE_N),
    .oe(1'b1)
);

wire [0:0] UART0_RX_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_UART0_RX_ibuf(
    .i(UART0_RX),
    .o(UART0_RX_in)
);

wire [0:0] UART0_TX_out;
tennm_ph2_io_obuf #(.buffer_usage("HSSI"),
          .dynamic_pull_up_enabled("false"),
          .equalization("EQUALIZATION_OFF"),
          .io_standard("IO_STANDARD_IOSTD_OFF"),
          .open_drain("OPEN_DRAIN_OFF"),
          .rzq_id("RZQ_ID_RZQ0"),
          .slew_rate("SLEW_RATE_SLOW"),
          .termination("TERMINATION_SERIES_OFF"),
          .toggle_speed("TOGGLE_SPEED_SLOW"),
          .usage_mode("USAGE_MODE_GPIO")
          ) hps_UART0_TX_obuf(
    .i(UART0_TX_out),
    .o(UART0_TX),
    .oe(1'b1)
);

wire [0:0] hps_osc_clk_in;
tennm_ph2_io_ibuf #(
    .buffer_usage("HSSI"),
    .bus_hold("BUS_HOLD_OFF"),
    .equalization("EQUALIZATION_OFF"),
    .io_standard("IO_STANDARD_IOSTD_OFF"),
    .rzq_id("RZQ_ID_RZQ0"),
    .schmitt_trigger("SCHMITT_TRIGGER_OFF"),
    .termination("TERMINATION_RT_OFF"),
    .toggle_speed("TOGGLE_SPEED_SLOW"),
    .usage_mode("USAGE_MODE_GPIO"),
    .vref("VREF_OFF"),
    .weak_pull_down("WEAK_PULL_DOWN_OFF"),
    .weak_pull_up("WEAK_PULL_UP_OFF")
) hps_hps_osc_clk_ibuf(
    .i(hps_osc_clk),
    .o(hps_osc_clk_in)
);



tennm_hps_hps_wrapper hps_inst(
 .HPS_IOA_1_O({
    NAND_ADQ0_out[0:0] // 0:0
  })
,.tpiu_trace_ctl({
    1'b1 // 0:0
  })
,.HPS_IOA_9_I({
    NAND_ADQ4_in[0:0] // 0:0
  })
,.s2f_rst({
    h2f_rst[0:0] // 0:0
  })
,.HPS_IOA_10_I({
    NAND_ADQ5_in[0:0] // 0:0
  })
,.HPS_IOB_3_O({
    UART0_TX_out[0:0] // 0:0
  })
,.HPS_IOA_5_O({
    NAND_WP_N_out[0:0] // 0:0
  })
,.soc2fpga_port_size_config_0({
    1'b0 // 0:0
  })
,.HPS_IOA_14_I({
    NAND_RB_in[0:0] // 0:0
  })
,.soc2fpga_aw_cache({
    h2f_AWCACHE[3:0] // 3:0
  })
,.soc2fpga_port_size_config_1({
    1'b1 // 0:0
  })
,.HPS_IOA_9_O({
    NAND_ADQ4_out[0:0] // 0:0
  })
,.HPS_IOA_10_O({
    NAND_ADQ5_out[0:0] // 0:0
  })
,.pclkendbg({
    1'b0 // 0:0
  })
,.soc2fpga_b_id({
    h2f_BID[3:0] // 3:0
  })
,.soc2fpga_aw_burst({
    h2f_AWBURST[1:0] // 1:0
  })
,.HPS_IOA_2_I({
    NAND_ADQ1_in[0:0] // 0:0
  })
,.soc2fpga_w_data({
    h2f_WDATA[127:0] // 127:0
  })
,.HPS_IOB_4_I({
    UART0_RX_in[0:0] // 0:0
  })
,.HPS_IOA_6_I({
    NAND_ADQ2_in[0:0] // 0:0
  })
,.soc2fpga_r_last({
    h2f_RLAST[0:0] // 0:0
  })
,.HPS_IOA_2_O({
    NAND_ADQ1_out[0:0] // 0:0
  })
,.soc2fpga_ar_cache({
    h2f_ARCACHE[3:0] // 3:0
  })
,.HPS_IOA_11_I({
    NAND_ADQ6_in[0:0] // 0:0
  })
,.HPS_IOA_6_O({
    NAND_ADQ2_out[0:0] // 0:0
  })
,.soc2fpga_ar_burst({
    h2f_ARBURST[1:0] // 1:0
  })
,.soc2fpga_b_resp({
    h2f_BRESP[1:0] // 1:0
  })
,.soc2fpga_ar_lock({
    h2f_ARLOCK[0:0] // 0:0
  })
,.soc2fpga_ar_addr({
    h2f_ARADDR[31:0] // 31:0
  })
,.HPS_IOA_11_O({
    NAND_ADQ6_out[0:0] // 0:0
  })
,.soc2fpga_r_id({
    h2f_RID[3:0] // 3:0
  })
,.soc2fpga_rst_n({
    h2f_axi_rst_n[0:0] // 0:0
  })
,.soc2fpga_aw_valid({
    h2f_AWVALID[0:0] // 0:0
  })
,.soc2fpga_b_valid({
    h2f_BVALID[0:0] // 0:0
  })
,.HPS_IOA_15_O({
    NAND_CE_N_out[0:0] // 0:0
  })
,.soc2fpga_w_last({
    h2f_WLAST[0:0] // 0:0
  })
,.HPS_IOA_7_I({
    NAND_ADQ3_in[0:0] // 0:0
  })
,.soc2fpga_aw_len({
    h2f_AWLEN[7:0] // 7:0
  })
,.soc2fpga_w_valid({
    h2f_WVALID[0:0] // 0:0
  })
,.HPS_IOA_3_O({
    NAND_WE_N_out[0:0] // 0:0
  })
,.soc2fpga_ar_prot({
    h2f_ARPROT[2:0] // 2:0
  })
,.soc2fpga_aw_lock({
    h2f_AWLOCK[0:0] // 0:0
  })
,.f2s_pending_rst_ack({
    1'b1 // 0:0
  })
,.HPS_IOA_12_I({
    NAND_ADQ7_in[0:0] // 0:0
  })
,.soc2fpga_aw_addr({
    h2f_AWADDR[31:0] // 31:0
  })
,.soc2fpga_ar_valid({
    h2f_ARVALID[0:0] // 0:0
  })
,.HPS_IOA_7_O({
    NAND_ADQ3_out[0:0] // 0:0
  })
,.soc2fpga_r_resp({
    h2f_RRESP[1:0] // 1:0
  })
,.soc2fpga_aw_ready({
    h2f_AWREADY[0:0] // 0:0
  })
,.soc2fpga_ar_size({
    h2f_ARSIZE[2:0] // 2:0
  })
,.soc2fpga_b_ready({
    h2f_BREADY[0:0] // 0:0
  })
,.HPS_IOA_12_O({
    NAND_ADQ7_out[0:0] // 0:0
  })
,.dbgapbdisable({
    1'b0 // 0:0
  })
,.soc2fpga_r_valid({
    h2f_RVALID[0:0] // 0:0
  })
,.HPS_IOA_21_I({
    hps_osc_clk_in[0:0] // 0:0
  })
,.soc2fpga_w_ready({
    h2f_WREADY[0:0] // 0:0
  })
,.soc2fpga_aw_prot({
    h2f_AWPROT[2:0] // 2:0
  })
,.soc2fpga_ar_ready({
    h2f_ARREADY[0:0] // 0:0
  })
,.HPS_IOA_4_O({
    NAND_RE_N_out[0:0] // 0:0
  })
,.soc2fpga_w_strb({
    h2f_WSTRB[15:0] // 15:0
  })
,.soc2fpga_aw_size({
    h2f_AWSIZE[2:0] // 2:0
  })
,.soc2fpga_aw_id({
    h2f_AWID[3:0] // 3:0
  })
,.HPS_IOA_8_O({
    NAND_CLE_out[0:0] // 0:0
  })
,.soc2fpga_r_ready({
    h2f_RREADY[0:0] // 0:0
  })
,.soc2fpga_ar_id({
    h2f_ARID[3:0] // 3:0
  })
,.HPS_IOA_1_I({
    NAND_ADQ0_in[0:0] // 0:0
  })
,.HPS_IOA_13_O({
    NAND_ALE_out[0:0] // 0:0
  })
,.soc2fpga_ar_len({
    h2f_ARLEN[7:0] // 7:0
  })
,.f2s_free_clk({
    1'b0 // 0:0
  })
,.soc2fpga_clk({
    h2f_axi_clk[0:0] // 0:0
  })
,.soc2fpga_r_data({
    h2f_RDATA[127:0] // 127:0
  })
);

defparam hps_inst.mpu_free_clk_hz = 32'b01000111100001101000110000000000;
defparam hps_inst.H2F_ADDR = 32;
defparam hps_inst.H2F_WDTH = 128;
defparam hps_inst.SWDTH = 16;

tennm_fp_soc_mpfe_wrapper mpfe_inst(
 .s2n0_araddr({
    h2n0_araddr[43:0] // 43:0
  })
,.s2n_mem_cfg_rst({
    h2n_csr_axi_rst[0:0] // 0:0
  })
,.s2n0_awburst({
    h2n0_awburst[1:0] // 1:0
  })
,.s2n0_arvalid({
    h2n0_arvalid[0:0] // 0:0
  })
,.s2n_mem_cfg_bready({
    h2n_mem_cfg_bready[0:0] // 0:0
  })
,.s2n0_awid({
    h2n0_awid[6:0] // 6:0
  })
,.s2n_mem_cfg_rvalid({
    h2n_mem_cfg_rvalid[0:0] // 0:0
  })
,.s2n_mem_cfg_wstrb({
    h2n_mem_cfg_wstrb[3:0] // 3:0
  })
,.s2n0_arprot({
    h2n0_arprot[2:0] // 2:0
  })
,.s2n_mem_cfg_awaddr({
    h2n_mem_cfg_awaddr[31:0] // 31:0
  })
,.s2n0_wstrb({
    h2n0_wstrb[31:0] // 31:0
  })
,.s2n0_clk({
    h2n_ch0_axi_clk[0:0] // 0:0
  })
,.s2n0_arsize({
    h2n0_arsize[2:0] // 2:0
  })
,.s2n0_rlast({
    h2n0_rlast[0:0] // 0:0
  })
,.s2n0_awvalid({
    h2n0_awvalid[0:0] // 0:0
  })
,.s2n_mem_cfg_arvalid({
    h2n_mem_cfg_arvalid[0:0] // 0:0
  })
,.s2n0_arready({
    h2n0_arready[0:0] // 0:0
  })
,.s2n0_rst({
    h2n_ch0_axi_rst[0:0] // 0:0
  })
,.s2n_mem_cfg_bresp({
    h2n_mem_cfg_bresp[1:0] // 1:0
  })
,.s2n0_bvalid({
    h2n0_bvalid[0:0] // 0:0
  })
,.s2n_mem_cfg_awprot({
    emif_mem_cfg_awprot[2:0] // 2:0
  })
,.s2n_mem_cfg_wvalid({
    h2n_mem_cfg_wvalid[0:0] // 0:0
  })
,.s2n0_bresp({
    h2n0_bresp[1:0] // 1:0
  })
,.s2n_mem_cfg_rready({
    h2n_mem_cfg_rready[0:0] // 0:0
  })
,.s2n0_bid({
    h2n0_bid[6:0] // 6:0
  })
,.s2n0_awqos({
    h2n0_awqos[3:0] // 3:0
  })
,.f2s_port_size_config({
    2'b11 // 1:0
  })
,.s2n0_awready({
    h2n0_awready[0:0] // 0:0
  })
,.s2n_mem_cfg_arready({
    h2n_mem_cfg_arready[0:0] // 0:0
  })
,.s2n_mem_cfg_awvalid({
    h2n_mem_cfg_awvalid[0:0] // 0:0
  })
,.s2n_mem_cfg_wdata({
    h2n_mem_cfg_wdata[31:0] // 31:0
  })
,.s2n0_arqos({
    h2n0_arqos[3:0] // 3:0
  })
,.s2n0_bready({
    h2n0_bready[0:0] // 0:0
  })
,.s2n0_wdata({
    h2n0_wdata[255:0] // 255:0
  })
,.s2n_mem_cfg_wready({
    h2n_mem_cfg_wready[0:0] // 0:0
  })
,.s2n0_awlock({
    h2n0_awlock[0:0] // 0:0
  })
,.s2n_mem_cfg_rresp({
    h2n_mem_cfg_rresp[1:0] // 1:0
  })
,.s2n0_rvalid({
    h2n0_rvalid[0:0] // 0:0
  })
,.s2n0_awaddr({
    h2n0_awaddr[43:0] // 43:0
  })
,.s2n_mem_cfg_araddr({
    h2n_mem_cfg_araddr[31:0] // 31:0
  })
,.s2n0_rresp({
    h2n0_rresp[1:0] // 1:0
  })
,.s2n0_rid({
    h2n0_rid[6:0] // 6:0
  })
,.s2n0_awlen({
    h2n0_awlen[7:0] // 7:0
  })
,.s2n_mem_cfg_awready({
    h2n_mem_cfg_awready[0:0] // 0:0
  })
,.s2n0_arlen({
    h2n0_arlen[7:0] // 7:0
  })
,.s2n0_awprot({
    h2n0_awprot[2:0] // 2:0
  })
,.s2n_mem_cfg_arprot({
    emif_mem_cfg_arprot[2:0] // 2:0
  })
,.s2n0_wvalid({
    h2n0_wvalid[0:0] // 0:0
  })
,.s2n0_rready({
    h2n0_rready[0:0] // 0:0
  })
,.s2n0_arid({
    h2n0_arid[6:0] // 6:0
  })
,.s2n0_awsize({
    h2n0_awsize[2:0] // 2:0
  })
,.s2n0_wlast({
    h2n0_wlast[0:0] // 0:0
  })
,.s2n0_arburst({
    h2n0_arburst[1:0] // 1:0
  })
,.s2n_mem_cfg_bvalid({
    h2n_mem_cfg_bvalid[0:0] // 0:0
  })
,.s2n_mem_cfg_clk({
    hnoc_csr_axi_clk[0:0] // 0:0
  })
,.s2n_mem_cfg_rdata({
    h2n_mem_cfg_rdata[31:0] // 31:0
  })
,.s2n0_rdata({
    h2n0_rdata[255:0] // 255:0
  })
,.s2n0_arlock({
    h2n0_arlock[0:0] // 0:0
  })
,.s2n0_wready({
    h2n0_wready[0:0] // 0:0
  })
);

endmodule

