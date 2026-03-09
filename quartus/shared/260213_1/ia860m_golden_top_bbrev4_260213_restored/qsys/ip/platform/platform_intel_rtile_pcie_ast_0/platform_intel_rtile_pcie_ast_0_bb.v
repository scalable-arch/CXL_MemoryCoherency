module platform_intel_rtile_pcie_ast_0 (
		output wire         p0_reset_status_n,            //      p0_reset_status_n.reset_n,                 Check User Guide for details
		output wire         p0_slow_reset_status_n,       // p0_slow_reset_status_n.reset_n,                 Check User Guide for details
		output wire         p0_link_up_o,                 //          p0_hip_status.link_up,                 Check User Guide for details
		output wire         p0_dl_up_o,                   //                       .dl_up,                   Check User Guide for details
		output wire         p0_surprise_down_err_o,       //                       .surprise_down_err,       Check User Guide for details
		output wire         p0_dl_timer_update_o,         //                       .dl_timer_update,         Check User Guide for details
		output wire [5:0]   p0_ltssm_state_delay_o,       //                       .ltssm_state_delay,       Check User Guide for details
		output wire         p0_ltssm_st_hipfifo_ovrflw_o, //                       .ltssm_st_hipfifo_ovrflw, Check User Guide for details
		input  wire         p0_app_xfer_pending_i,        //          p0_power_mgnt.app_xfer_pending,        Check User Guide for details
		input  wire [7:0]   p0_pld_gp_status_i,           //              p0_pld_gp.status,                  Check User Guide for details
		output wire [7:0]   p0_pld_gp_ctrl_o,             //                       .ctrl,                    Check User Guide for details
		output wire         p0_pld_gp_status_ready_o,     //                       .status_ready,            Check User Guide for details
		input  wire         rx_n_in0,                     //             hip_serial.rx_n_in0,                Check User Guide for details
		input  wire         rx_n_in1,                     //                       .rx_n_in1,                Check User Guide for details
		input  wire         rx_n_in2,                     //                       .rx_n_in2,                Check User Guide for details
		input  wire         rx_n_in3,                     //                       .rx_n_in3,                Check User Guide for details
		input  wire         rx_n_in4,                     //                       .rx_n_in4,                Check User Guide for details
		input  wire         rx_n_in5,                     //                       .rx_n_in5,                Check User Guide for details
		input  wire         rx_n_in6,                     //                       .rx_n_in6,                Check User Guide for details
		input  wire         rx_n_in7,                     //                       .rx_n_in7,                Check User Guide for details
		input  wire         rx_n_in8,                     //                       .rx_n_in8,                Check User Guide for details
		input  wire         rx_n_in9,                     //                       .rx_n_in9,                Check User Guide for details
		input  wire         rx_n_in10,                    //                       .rx_n_in10,               Check User Guide for details
		input  wire         rx_n_in11,                    //                       .rx_n_in11,               Check User Guide for details
		input  wire         rx_n_in12,                    //                       .rx_n_in12,               Check User Guide for details
		input  wire         rx_n_in13,                    //                       .rx_n_in13,               Check User Guide for details
		input  wire         rx_n_in14,                    //                       .rx_n_in14,               Check User Guide for details
		input  wire         rx_n_in15,                    //                       .rx_n_in15,               Check User Guide for details
		input  wire         rx_p_in0,                     //                       .rx_p_in0,                Check User Guide for details
		input  wire         rx_p_in1,                     //                       .rx_p_in1,                Check User Guide for details
		input  wire         rx_p_in2,                     //                       .rx_p_in2,                Check User Guide for details
		input  wire         rx_p_in3,                     //                       .rx_p_in3,                Check User Guide for details
		input  wire         rx_p_in4,                     //                       .rx_p_in4,                Check User Guide for details
		input  wire         rx_p_in5,                     //                       .rx_p_in5,                Check User Guide for details
		input  wire         rx_p_in6,                     //                       .rx_p_in6,                Check User Guide for details
		input  wire         rx_p_in7,                     //                       .rx_p_in7,                Check User Guide for details
		input  wire         rx_p_in8,                     //                       .rx_p_in8,                Check User Guide for details
		input  wire         rx_p_in9,                     //                       .rx_p_in9,                Check User Guide for details
		input  wire         rx_p_in10,                    //                       .rx_p_in10,               Check User Guide for details
		input  wire         rx_p_in11,                    //                       .rx_p_in11,               Check User Guide for details
		input  wire         rx_p_in12,                    //                       .rx_p_in12,               Check User Guide for details
		input  wire         rx_p_in13,                    //                       .rx_p_in13,               Check User Guide for details
		input  wire         rx_p_in14,                    //                       .rx_p_in14,               Check User Guide for details
		input  wire         rx_p_in15,                    //                       .rx_p_in15,               Check User Guide for details
		output wire         tx_n_out0,                    //                       .tx_n_out0,               Check User Guide for details
		output wire         tx_n_out1,                    //                       .tx_n_out1,               Check User Guide for details
		output wire         tx_n_out2,                    //                       .tx_n_out2,               Check User Guide for details
		output wire         tx_n_out3,                    //                       .tx_n_out3,               Check User Guide for details
		output wire         tx_n_out4,                    //                       .tx_n_out4,               Check User Guide for details
		output wire         tx_n_out5,                    //                       .tx_n_out5,               Check User Guide for details
		output wire         tx_n_out6,                    //                       .tx_n_out6,               Check User Guide for details
		output wire         tx_n_out7,                    //                       .tx_n_out7,               Check User Guide for details
		output wire         tx_n_out8,                    //                       .tx_n_out8,               Check User Guide for details
		output wire         tx_n_out9,                    //                       .tx_n_out9,               Check User Guide for details
		output wire         tx_n_out10,                   //                       .tx_n_out10,              Check User Guide for details
		output wire         tx_n_out11,                   //                       .tx_n_out11,              Check User Guide for details
		output wire         tx_n_out12,                   //                       .tx_n_out12,              Check User Guide for details
		output wire         tx_n_out13,                   //                       .tx_n_out13,              Check User Guide for details
		output wire         tx_n_out14,                   //                       .tx_n_out14,              Check User Guide for details
		output wire         tx_n_out15,                   //                       .tx_n_out15,              Check User Guide for details
		output wire         tx_p_out0,                    //                       .tx_p_out0,               Check User Guide for details
		output wire         tx_p_out1,                    //                       .tx_p_out1,               Check User Guide for details
		output wire         tx_p_out2,                    //                       .tx_p_out2,               Check User Guide for details
		output wire         tx_p_out3,                    //                       .tx_p_out3,               Check User Guide for details
		output wire         tx_p_out4,                    //                       .tx_p_out4,               Check User Guide for details
		output wire         tx_p_out5,                    //                       .tx_p_out5,               Check User Guide for details
		output wire         tx_p_out6,                    //                       .tx_p_out6,               Check User Guide for details
		output wire         tx_p_out7,                    //                       .tx_p_out7,               Check User Guide for details
		output wire         tx_p_out8,                    //                       .tx_p_out8,               Check User Guide for details
		output wire         tx_p_out9,                    //                       .tx_p_out9,               Check User Guide for details
		output wire         tx_p_out10,                   //                       .tx_p_out10,              Check User Guide for details
		output wire         tx_p_out11,                   //                       .tx_p_out11,              Check User Guide for details
		output wire         tx_p_out12,                   //                       .tx_p_out12,              Check User Guide for details
		output wire         tx_p_out13,                   //                       .tx_p_out13,              Check User Guide for details
		output wire         tx_p_out14,                   //                       .tx_p_out14,              Check User Guide for details
		output wire         tx_p_out15,                   //                       .tx_p_out15,              Check User Guide for details
		input  wire         refclk0,                      //                refclk0.clk,                     Check User Guide for details
		input  wire         refclk1,                      //                refclk1.clk,                     Check User Guide for details
		output wire         coreclkout_hip,               //         coreclkout_hip.clk,                     Check User Guide for details
		input  wire         ninit_done,                   //             ninit_done.reset,                   Its a Init_done signal should be connected to Reset release IP
		output wire         slow_clk,                     //               slow_clk.clk,                     Check User Guide for details
		input  wire         p0_rx_st_ready_i,             //              p0_rx_st0.ready,                   Check User Guide for details
		output wire [255:0] p0_rx_st0_data_o,             //                       .data,                    Check User Guide for details
		output wire         p0_rx_st0_sop_o,              //                       .startofpacket,           Check User Guide for details
		output wire         p0_rx_st0_eop_o,              //                       .endofpacket,             Check User Guide for details
		output wire         p0_rx_st0_dvalid_o,           //                       .valid,                   Check User Guide for details
		output wire [2:0]   p0_rx_st0_empty_o,            //                       .empty,                   Check User Guide for details
		output wire [127:0] p0_rx_st0_hdr_o,              //          p0_rx_st_misc.rx_st0_hdr,              Check User Guide for details
		output wire [31:0]  p0_rx_st0_prefix_o,           //                       .rx_st0_prefix,           Check User Guide for details
		output wire         p0_rx_st0_hvalid_o,           //                       .rx_st0_hvalid,           Check User Guide for details
		output wire         p0_rx_st0_pvalid_o,           //                       .rx_st0_pvalid,           Check User Guide for details
		output wire [2:0]   p0_rx_st0_bar_o,              //                       .rx_st0_bar,              Check User Guide for details
		output wire         p0_rx_st0_pt_parity_o,        //                       .rx_st0_pt_parity,        Check User Guide for details
		output wire [127:0] p0_rx_st1_hdr_o,              //                       .rx_st1_hdr,              Check User Guide for details
		output wire [31:0]  p0_rx_st1_prefix_o,           //                       .rx_st1_prefix,           Check User Guide for details
		output wire         p0_rx_st1_hvalid_o,           //                       .rx_st1_hvalid,           Check User Guide for details
		output wire         p0_rx_st1_pvalid_o,           //                       .rx_st1_pvalid,           Check User Guide for details
		output wire [2:0]   p0_rx_st1_bar_o,              //                       .rx_st1_bar,              Check User Guide for details
		output wire         p0_rx_st1_pt_parity_o,        //                       .rx_st1_pt_parity,        Check User Guide for details
		output wire [127:0] p0_rx_st2_hdr_o,              //                       .rx_st2_hdr,              Check User Guide for details
		output wire [31:0]  p0_rx_st2_prefix_o,           //                       .rx_st2_prefix,           Check User Guide for details
		output wire         p0_rx_st2_hvalid_o,           //                       .rx_st2_hvalid,           Check User Guide for details
		output wire         p0_rx_st2_pvalid_o,           //                       .rx_st2_pvalid,           Check User Guide for details
		output wire [2:0]   p0_rx_st2_bar_o,              //                       .rx_st2_bar,              Check User Guide for details
		output wire         p0_rx_st2_pt_parity_o,        //                       .rx_st2_pt_parity,        Check User Guide for details
		output wire [127:0] p0_rx_st3_hdr_o,              //                       .rx_st3_hdr,              Check User Guide for details
		output wire [31:0]  p0_rx_st3_prefix_o,           //                       .rx_st3_prefix,           Check User Guide for details
		output wire         p0_rx_st3_hvalid_o,           //                       .rx_st3_hvalid,           Check User Guide for details
		output wire         p0_rx_st3_pvalid_o,           //                       .rx_st3_pvalid,           Check User Guide for details
		output wire [2:0]   p0_rx_st3_bar_o,              //                       .rx_st3_bar,              Check User Guide for details
		output wire         p0_rx_st3_pt_parity_o,        //                       .rx_st3_pt_parity,        Check User Guide for details
		input  wire [2:0]   p0_rx_st_hcrdt_init_i,        //                       .rx_st_Hcrdt_init,        Check User Guide for details
		input  wire [2:0]   p0_rx_st_hcrdt_update_i,      //                       .rx_st_Hcrdt_update,      Check User Guide for details
		input  wire [5:0]   p0_rx_st_hcrdt_update_cnt_i,  //                       .rx_st_Hcrdt_update_cnt,  Check User Guide for details
		output wire [2:0]   p0_rx_st_hcrdt_init_ack_o,    //                       .rx_st_Hcrdt_init_ack,    Check User Guide for details
		input  wire [2:0]   p0_rx_st_dcrdt_init_i,        //                       .rx_st_Dcrdt_init,        Check User Guide for details
		input  wire [2:0]   p0_rx_st_dcrdt_update_i,      //                       .rx_st_Dcrdt_update,      Check User Guide for details
		input  wire [11:0]  p0_rx_st_dcrdt_update_cnt_i,  //                       .rx_st_Dcrdt_update_cnt,  Check User Guide for details
		output wire [2:0]   p0_rx_st_dcrdt_init_ack_o,    //                       .rx_st_Dcrdt_init_ack,    Check User Guide for details
		output wire [255:0] p0_rx_st1_data_o,             //              p0_rx_st1.data,                    Check User Guide for details
		output wire         p0_rx_st1_sop_o,              //                       .startofpacket,           Check User Guide for details
		output wire         p0_rx_st1_eop_o,              //                       .endofpacket,             Check User Guide for details
		output wire         p0_rx_st1_dvalid_o,           //                       .valid,                   Check User Guide for details
		output wire [2:0]   p0_rx_st1_empty_o,            //                       .empty,                   Check User Guide for details
		output wire [255:0] p0_rx_st2_data_o,             //              p0_rx_st2.data,                    Check User Guide for details
		output wire         p0_rx_st2_sop_o,              //                       .startofpacket,           Check User Guide for details
		output wire         p0_rx_st2_eop_o,              //                       .endofpacket,             Check User Guide for details
		output wire         p0_rx_st2_dvalid_o,           //                       .valid,                   Check User Guide for details
		output wire [2:0]   p0_rx_st2_empty_o,            //                       .empty,                   Check User Guide for details
		output wire [255:0] p0_rx_st3_data_o,             //              p0_rx_st3.data,                    Check User Guide for details
		output wire         p0_rx_st3_sop_o,              //                       .startofpacket,           Check User Guide for details
		output wire         p0_rx_st3_eop_o,              //                       .endofpacket,             Check User Guide for details
		output wire         p0_rx_st3_dvalid_o,           //                       .valid,                   Check User Guide for details
		output wire [2:0]   p0_rx_st3_empty_o,            //                       .empty,                   Check User Guide for details
		output wire [2:0]   p0_tx_st_hcrdt_init_o,        //          p0_tx_st_misc.tx_st_Hcrdt_init,        Check User Guide for details
		output wire [2:0]   p0_tx_st_hcrdt_update_o,      //                       .tx_st_Hcrdt_update,      Check User Guide for details
		output wire [5:0]   p0_tx_st_hcrdt_update_cnt_o,  //                       .tx_st_Hcrdt_update_cnt,  Check User Guide for details
		input  wire [2:0]   p0_tx_st_hcrdt_init_ack_i,    //                       .tx_st_Hcrdtt_init_ack,   Check User Guide for details
		output wire [2:0]   p0_tx_st_dcrdt_init_o,        //                       .tx_st_Dcrdt_init,        Check User Guide for details
		output wire [2:0]   p0_tx_st_dcrdt_update_o,      //                       .tx_st_Dcrdt_update,      Check User Guide for details
		output wire [11:0]  p0_tx_st_dcrdt_update_cnt_o,  //                       .tx_st_Dcrdt_update_cnt,  Check User Guide for details
		input  wire [2:0]   p0_tx_st_dcrdt_init_ack_i,    //                       .tx_st_Dcrdt_init_ack,    Check User Guide for details
		input  wire [127:0] p0_tx_st0_hdr_i,              //                       .tx_st0_hdr,              Check User Guide for details
		input  wire [31:0]  p0_tx_st0_prefix_i,           //                       .tx_st0_prefix,           Check User Guide for details
		input  wire         p0_tx_st0_hvalid_i,           //                       .tx_st0_hvalid,           Check User Guide for details
		input  wire         p0_tx_st0_pvalid_i,           //                       .tx_st0_pvalid,           Check User Guide for details
		input  wire [127:0] p0_tx_st1_hdr_i,              //                       .tx_st1_hdr,              Check User Guide for details
		input  wire [31:0]  p0_tx_st1_prefix_i,           //                       .tx_st1_prefix,           Check User Guide for details
		input  wire         p0_tx_st1_hvalid_i,           //                       .tx_st1_hvalid,           Check User Guide for details
		input  wire         p0_tx_st1_pvalid_i,           //                       .tx_st1_pvalid,           Check User Guide for details
		input  wire [127:0] p0_tx_st2_hdr_i,              //                       .tx_st2_hdr,              Check User Guide for details
		input  wire [31:0]  p0_tx_st2_prefix_i,           //                       .tx_st2_prefix,           Check User Guide for details
		input  wire         p0_tx_st2_hvalid_i,           //                       .tx_st2_hvalid,           Check User Guide for details
		input  wire         p0_tx_st2_pvalid_i,           //                       .tx_st2_pvalid,           Check User Guide for details
		input  wire [127:0] p0_tx_st3_hdr_i,              //                       .tx_st3_hdr,              Check User Guide for details
		input  wire [31:0]  p0_tx_st3_prefix_i,           //                       .tx_st3_prefix,           Check User Guide for details
		input  wire         p0_tx_st3_hvalid_i,           //                       .tx_st3_hvalid,           Check User Guide for details
		input  wire         p0_tx_st3_pvalid_i,           //                       .tx_st3_pvalid,           Check User Guide for details
		output wire         p0_tx_st_ready_o,             //              p0_tx_st0.ready,                   Check User Guide for details
		input  wire [255:0] p0_tx_st0_data_i,             //                       .data,                    Check User Guide for details
		input  wire         p0_tx_st0_sop_i,              //                       .startofpacket,           Check User Guide for details
		input  wire         p0_tx_st0_eop_i,              //                       .endofpacket,             Check User Guide for details
		input  wire         p0_tx_st0_dvalid_i,           //                       .valid,                   Check User Guide for details
		input  wire [255:0] p0_tx_st1_data_i,             //              p0_tx_st1.data,                    Check User Guide for details
		input  wire         p0_tx_st1_sop_i,              //                       .startofpacket,           Check User Guide for details
		input  wire         p0_tx_st1_eop_i,              //                       .endofpacket,             Check User Guide for details
		input  wire         p0_tx_st1_dvalid_i,           //                       .valid,                   Check User Guide for details
		input  wire [255:0] p0_tx_st2_data_i,             //              p0_tx_st2.data,                    Check User Guide for details
		input  wire         p0_tx_st2_sop_i,              //                       .startofpacket,           Check User Guide for details
		input  wire         p0_tx_st2_eop_i,              //                       .endofpacket,             Check User Guide for details
		input  wire         p0_tx_st2_dvalid_i,           //                       .valid,                   Check User Guide for details
		input  wire [255:0] p0_tx_st3_data_i,             //              p0_tx_st3.data,                    Check User Guide for details
		input  wire         p0_tx_st3_sop_i,              //                       .startofpacket,           Check User Guide for details
		input  wire         p0_tx_st3_eop_i,              //                       .endofpacket,             Check User Guide for details
		input  wire         p0_tx_st3_dvalid_i,           //                       .valid,                   Check User Guide for details
		output wire         p0_tx_ehp_deallocate_empty_o, //              p0_tx_ehp.tx_ehp_deallocate_empty, Check User Guide for details
		input  wire         pin_perst_n,                  //              pin_perst.reset_n
		output wire         pin_perst_n_o                 //          pin_perst_n_o.reset_n
	);
endmodule

