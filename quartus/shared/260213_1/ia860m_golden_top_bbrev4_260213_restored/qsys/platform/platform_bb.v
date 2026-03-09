module platform (
		output wire [0:0]  ddr4_mem_0_mem_cke,                             //                          ddr4_mem_0.mem_cke
		output wire [0:0]  ddr4_mem_0_mem_odt,                             //                                    .mem_odt
		output wire [0:0]  ddr4_mem_0_mem_cs_n,                            //                                    .mem_cs_n
		output wire [16:0] ddr4_mem_0_mem_a,                               //                                    .mem_a
		output wire [1:0]  ddr4_mem_0_mem_ba,                              //                                    .mem_ba
		output wire [0:0]  ddr4_mem_0_mem_bg,                              //                                    .mem_bg
		output wire        ddr4_mem_0_mem_act_n,                           //                                    .mem_act_n
		output wire        ddr4_mem_0_mem_par,                             //                                    .mem_par
		inout  wire [39:0] ddr4_mem_0_mem_dq,                              //                                    .mem_dq
		inout  wire [4:0]  ddr4_mem_0_mem_dqs_t,                           //                                    .mem_dqs_t
		inout  wire [4:0]  ddr4_mem_0_mem_dqs_c,                           //                                    .mem_dqs_c
		input  wire        ddr4_mem_0_mem_alert_n,                         //                                    .mem_alert_n
		inout  wire [4:0]  ddr4_mem_0_mem_dbi_n,                           //                                    .mem_dbi_n
		output wire [0:0]  ddr4_mem_ck_0_mem_ck_t,                         //                       ddr4_mem_ck_0.mem_ck_t
		output wire [0:0]  ddr4_mem_ck_0_mem_ck_c,                         //                                    .mem_ck_c
		output wire        ddr4_mem_reset_n_mem_reset_n,                   //                    ddr4_mem_reset_n.mem_reset_n
		input  wire        ddr4_oct_0_oct_rzqin,                           //                          ddr4_oct_0.oct_rzqin
		input  wire        ddr4_ref_clk_clk,                               //                        ddr4_ref_clk.clk
		input  wire        hbm_hbm_reset_n_reset_n,                        //                     hbm_hbm_reset_n.reset_n
		input  wire        hbm_cattrip_i_conduit,                          //                       hbm_cattrip_i.conduit
		input  wire [2:0]  hbm_temp_i_conduit,                             //                          hbm_temp_i.conduit
		input  wire        hbm_uibpll_refclk_clk,                          //                   hbm_uibpll_refclk.clk
		output wire        intel_agilex_hps_0_hps_io_NAND_ALE,             //           intel_agilex_hps_0_hps_io.NAND_ALE
		output wire        intel_agilex_hps_0_hps_io_NAND_CE_N,            //                                    .NAND_CE_N
		output wire        intel_agilex_hps_0_hps_io_NAND_CLE,             //                                    .NAND_CLE
		output wire        intel_agilex_hps_0_hps_io_NAND_RE_N,            //                                    .NAND_RE_N
		input  wire        intel_agilex_hps_0_hps_io_NAND_RB,              //                                    .NAND_RB
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ0,            //                                    .NAND_ADQ0
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ1,            //                                    .NAND_ADQ1
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ2,            //                                    .NAND_ADQ2
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ3,            //                                    .NAND_ADQ3
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ4,            //                                    .NAND_ADQ4
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ5,            //                                    .NAND_ADQ5
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ6,            //                                    .NAND_ADQ6
		inout  wire        intel_agilex_hps_0_hps_io_NAND_ADQ7,            //                                    .NAND_ADQ7
		output wire        intel_agilex_hps_0_hps_io_NAND_WP_N,            //                                    .NAND_WP_N
		output wire        intel_agilex_hps_0_hps_io_NAND_WE_N,            //                                    .NAND_WE_N
		input  wire        intel_agilex_hps_0_hps_io_UART0_RX,             //                                    .UART0_RX
		output wire        intel_agilex_hps_0_hps_io_UART0_TX,             //                                    .UART0_TX
		input  wire        intel_agilex_hps_0_hps_io_hps_osc_clk,          //                                    .hps_osc_clk
		input  wire        intel_noc_clock_ctrl_0_refclk_clk,              //       intel_noc_clock_ctrl_0_refclk.clk
		input  wire        intel_noc_clock_ctrl_1_refclk_clk,              //       intel_noc_clock_ctrl_1_refclk.clk
		input  wire        ninit_done_out_1_reset,                         //                    ninit_done_out_1.reset
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in0,   // intel_pcie_rtile_mcdma_0_hip_serial.rx_n_in0
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in1,   //                                    .rx_n_in1
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in2,   //                                    .rx_n_in2
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in3,   //                                    .rx_n_in3
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in4,   //                                    .rx_n_in4
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in5,   //                                    .rx_n_in5
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in6,   //                                    .rx_n_in6
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in7,   //                                    .rx_n_in7
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in8,   //                                    .rx_n_in8
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in9,   //                                    .rx_n_in9
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in10,  //                                    .rx_n_in10
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in11,  //                                    .rx_n_in11
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in12,  //                                    .rx_n_in12
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in13,  //                                    .rx_n_in13
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in14,  //                                    .rx_n_in14
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in15,  //                                    .rx_n_in15
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in0,   //                                    .rx_p_in0
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in1,   //                                    .rx_p_in1
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in2,   //                                    .rx_p_in2
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in3,   //                                    .rx_p_in3
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in4,   //                                    .rx_p_in4
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in5,   //                                    .rx_p_in5
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in6,   //                                    .rx_p_in6
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in7,   //                                    .rx_p_in7
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in8,   //                                    .rx_p_in8
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in9,   //                                    .rx_p_in9
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in10,  //                                    .rx_p_in10
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in11,  //                                    .rx_p_in11
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in12,  //                                    .rx_p_in12
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in13,  //                                    .rx_p_in13
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in14,  //                                    .rx_p_in14
		input  wire        intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in15,  //                                    .rx_p_in15
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out0,  //                                    .tx_n_out0
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out1,  //                                    .tx_n_out1
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out2,  //                                    .tx_n_out2
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out3,  //                                    .tx_n_out3
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out4,  //                                    .tx_n_out4
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out5,  //                                    .tx_n_out5
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out6,  //                                    .tx_n_out6
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out7,  //                                    .tx_n_out7
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out8,  //                                    .tx_n_out8
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out9,  //                                    .tx_n_out9
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out10, //                                    .tx_n_out10
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out11, //                                    .tx_n_out11
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out12, //                                    .tx_n_out12
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out13, //                                    .tx_n_out13
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out14, //                                    .tx_n_out14
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out15, //                                    .tx_n_out15
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out0,  //                                    .tx_p_out0
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out1,  //                                    .tx_p_out1
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out2,  //                                    .tx_p_out2
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out3,  //                                    .tx_p_out3
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out4,  //                                    .tx_p_out4
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out5,  //                                    .tx_p_out5
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out6,  //                                    .tx_p_out6
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out7,  //                                    .tx_p_out7
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out8,  //                                    .tx_p_out8
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out9,  //                                    .tx_p_out9
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out10, //                                    .tx_p_out10
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out11, //                                    .tx_p_out11
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out12, //                                    .tx_p_out12
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out13, //                                    .tx_p_out13
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out14, //                                    .tx_p_out14
		output wire        intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out15, //                                    .tx_p_out15
		input  wire        intel_pcie_rtile_mcdma_0_pin_perst_reset_n,     //  intel_pcie_rtile_mcdma_0_pin_perst.reset_n
		input  wire        noc_ref_clock_in_in_clk_clk,                    //             noc_ref_clock_in_in_clk.clk
		input  wire        pcie_ref0_clock_in_in_clk_clk,                  //           pcie_ref0_clock_in_in_clk.clk
		input  wire        pcie_ref1_clock_in_in_clk_clk,                  //           pcie_ref1_clock_in_in_clk.clk
		output wire        reset_bridge_0_out_reset_reset_n,               //            reset_bridge_0_out_reset.reset_n
		input  wire        sys_reset_h_in_reset,                           //                      sys_reset_h_in.reset
		input  wire        sys_reset_n_in_reset_n,                         //                      sys_reset_n_in.reset_n
		input  wire        sysclk_in_clk                                   //                           sysclk_in.clk
	);
endmodule

