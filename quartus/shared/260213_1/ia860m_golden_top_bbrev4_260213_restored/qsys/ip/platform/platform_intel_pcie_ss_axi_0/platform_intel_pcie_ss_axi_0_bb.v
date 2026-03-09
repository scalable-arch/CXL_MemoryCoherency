module platform_intel_pcie_ss_axi_0 (
		input  wire          pin_perst_n,                        //                        pin_perst_n.reset_n,                         Check User Guide for details
		output wire          coreclkout_hip_toapp,               //               coreclkout_hip_toapp.clk,                             Check User Guide for details
		output wire          p0_pin_perst_n,                     //                     p0_pin_perst_n.reset_n,                         Check User Guide for details
		input  wire          ninit_done,                         //                         ninit_done.reset,                           Its a Init_done signal should be connected to Reset release IP
		output wire          p0_reset_status_n,                  //                  p0_reset_status_n.reset_n,                         Check User Guide for details
		input  wire          dummy_user_avmm_rst,                //                dummy_user_avmm_rst.reset,                           Check User Guide for details
		input  wire          p0_axi_st_clk,                      //                      p0_axi_st_clk.clk,                             Check User Guide for details
		input  wire          p0_axi_lite_clk,                    //                    p0_axi_lite_clk.clk,                             Check User Guide for details
		input  wire          p0_axi_st_areset_n,                 //                 p0_axi_st_areset_n.reset_n,                         Check User Guide for details
		input  wire          p0_axi_lite_areset_n,               //               p0_axi_lite_areset_n.reset_n,                         Check User Guide for details
		input  wire          p0_subsystem_cold_rst_n,            //            p0_subsystem_cold_rst_n.reset_n,                         Check User Guide for details
		input  wire          p0_subsystem_warm_rst_n,            //            p0_subsystem_warm_rst_n.reset_n,                         Check User Guide for details
		output wire          p0_subsystem_cold_rst_ack_n,        //        p0_subsystem_cold_rst_ack_n.subsystem_cold_rst_ack_n,        Check User Guide for details
		output wire          p0_subsystem_warm_rst_ack_n,        //        p0_subsystem_warm_rst_ack_n.subsystem_warm_rst_ack_n,        Check User Guide for details
		input  wire          p0_subsystem_rst_req,               //               p0_subsystem_rst_req.subsystem_rst_req,               Check User Guide for details
		output wire          p0_subsystem_rst_rdy,               //               p0_subsystem_rst_rdy.subsystem_rst_rdy,               Check User Guide for details
		output wire          p0_initiate_warmrst_req,            //            p0_initiate_warmrst_req.initiate_warmrst_req,            Check User Guide for details
		input  wire          p0_initiate_rst_req_rdy,            //            p0_initiate_rst_req_rdy.initiate_rst_req_rdy,            Check User Guide for details
		output wire          p0_ss_app_st_rx_tvalid,             //                           p0_st_rx.tvalid,                          Check User Guide for details
		output wire [1023:0] p0_ss_app_st_rx_tdata,              //                                   .tdata,                           Check User Guide for details
		output wire [127:0]  p0_ss_app_st_rx_tkeep,              //                                   .tkeep,                           Check User Guide for details
		output wire          p0_ss_app_st_rx_tlast,              //                                   .tlast,                           Check User Guide for details
		output wire [3:0]    p0_ss_app_st_rx_tuser_vendor,       //       p0_ss_app_st_rx_tuser_vendor.ss_app_st_rx_tuser_vendor,       Check User Guide for details
		output wire [3:0]    p0_ss_app_st_rx_tuser_last_segment, // p0_ss_app_st_rx_tuser_last_segment.ss_app_st_rx_tuser_last_segment, Check User Guide for details
		output wire [3:0]    p0_ss_app_st_rx_tuser_hvalid,       //       p0_ss_app_st_rx_tuser_hvalid.ss_app_st_rx_tuser_hvalid,       Check User Guide for details
		output wire [1023:0] p0_ss_app_st_rx_tuser_hdr,          //          p0_ss_app_st_rx_tuser_hdr.ss_app_st_rx_tuser_hdr,          Check User Guide for details
		input  wire          p0_app_ss_st_tx_tvalid,             //                           p0_st_tx.tvalid,                          Check User Guide for details
		output wire          p0_ss_app_st_tx_tready,             //                                   .tready,                          Check User Guide for details
		input  wire [1023:0] p0_app_ss_st_tx_tdata,              //                                   .tdata,                           Check User Guide for details
		input  wire [127:0]  p0_app_ss_st_tx_tkeep,              //                                   .tkeep,                           Check User Guide for details
		input  wire          p0_app_ss_st_tx_tlast,              //                                   .tlast,                           Check User Guide for details
		input  wire [3:0]    p0_app_ss_st_tx_tuser_last_segment, // p0_app_ss_st_tx_tuser_last_segment.app_ss_st_tx_tuser_last_segment, Check User Guide for details
		input  wire [3:0]    p0_app_ss_st_tx_tuser_hvalid,       //       p0_app_ss_st_tx_tuser_hvalid.app_ss_st_tx_tuser_hvalid,       Check User Guide for details
		input  wire [1023:0] p0_app_ss_st_tx_tuser_hdr,          //          p0_app_ss_st_tx_tuser_hdr.app_ss_st_tx_tuser_hdr,          Check User Guide for details
		output wire          p0_ss_app_st_flrrcvd_tvalid,        //                      p0_st_flrrcvd.tvalid,                          Check User Guide for details
		output wire [19:0]   p0_ss_app_st_flrrcvd_tdata,         //                                   .tdata,                           Check User Guide for details
		input  wire          p0_app_ss_st_flrcmpl_tvalid,        //                      p0_st_flrcmpl.tvalid,                          Check User Guide for details
		input  wire [19:0]   p0_app_ss_st_flrcmpl_tdata,         //                                   .tdata,                           Check User Guide for details
		output wire          p0_ss_app_st_flrcmpl_tready,        //                                   .tready,                          Check User Guide for details
		output wire          p0_ss_app_st_txcrdt_tvalid,         //                       p0_st_txcrdt.tvalid,                          Check User Guide for details
		output wire [18:0]   p0_ss_app_st_txcrdt_tdata,          //                                   .tdata,                           Check User Guide for details
		input  wire          p0_ss_app_st_rxcrdt_tvalid,         //                       p0_st_rxcrdt.tvalid,                          Check User Guide for details
		input  wire [18:0]   p0_ss_app_st_rxcrdt_tdata,          //                                   .tdata,                           Check User Guide for details
		input  wire          p0_app_ss_lite_csr_awvalid,         //                        p0_lite_csr.awvalid
		output wire          p0_ss_app_lite_csr_awready,         //                                   .awready
		input  wire [19:0]   p0_app_ss_lite_csr_awaddr,          //                                   .awaddr
		input  wire [2:0]    p0_app_ss_lite_csr_awprot,          //                                   .awprot
		input  wire          p0_app_ss_lite_csr_wvalid,          //                                   .wvalid
		output wire          p0_ss_app_lite_csr_wready,          //                                   .wready
		input  wire [31:0]   p0_app_ss_lite_csr_wdata,           //                                   .wdata
		input  wire [3:0]    p0_app_ss_lite_csr_wstrb,           //                                   .wstrb
		output wire          p0_ss_app_lite_csr_bvalid,          //                                   .bvalid
		input  wire          p0_app_ss_lite_csr_bready,          //                                   .bready
		output wire [1:0]    p0_ss_app_lite_csr_bresp,           //                                   .bresp
		input  wire          p0_app_ss_lite_csr_arvalid,         //                                   .arvalid
		output wire          p0_ss_app_lite_csr_arready,         //                                   .arready
		input  wire [19:0]   p0_app_ss_lite_csr_araddr,          //                                   .araddr
		input  wire [2:0]    p0_app_ss_lite_csr_arprot,          //                                   .arprot
		output wire          p0_ss_app_lite_csr_rvalid,          //                                   .rvalid
		input  wire          p0_app_ss_lite_csr_rready,          //                                   .rready
		output wire [31:0]   p0_ss_app_lite_csr_rdata,           //                                   .rdata
		output wire [1:0]    p0_ss_app_lite_csr_rresp,           //                                   .rresp
		input  wire          p0_app_ss_st_err_tvalid,            //                          p0_st_err.tvalid,                          Check User Guide for details
		input  wire [31:0]   p0_app_ss_st_err_tdata,             //                                   .tdata,                           Check User Guide for details
		input  wire          p0_app_ss_st_err_tlast,             //                                   .tlast,                           Check User Guide for details
		output wire          p0_ss_app_st_err_tready,            //                                   .tready,                          Check User Guide for details
		input  wire [13:0]   p0_app_ss_st_err_tuser_error_type,  //  p0_app_ss_st_err_tuser_error_type.app_ss_st_err_tuser_error_type,  Check User Guide for details
		output wire          p0_ss_app_serr,                     //                     p0_ss_app_serr.ss_app_serr,                     Check User Guide for details
		output wire          p0_ss_app_dlup,                     //                     p0_ss_app_dlup.ss_app_dlup,                     Check User Guide for details
		output wire          p0_ss_app_surprise_down_err,        //        p0_ss_app_surprise_down_err.ss_app_surprise_down_err,        Check User Guide for details
		output wire          p0_ss_app_rx_par_err,               //               p0_ss_app_rx_par_err.ss_app_rx_par_err,               Check User Guide for details
		output wire          p0_ss_app_tx_par_err,               //               p0_ss_app_tx_par_err.ss_app_tx_par_err,               Check User Guide for details
		output wire          tx_n_out0,                          //                         hip_serial.tx_n_out0,                       Check User Guide for details
		output wire          tx_n_out1,                          //                                   .tx_n_out1,                       Check User Guide for details
		output wire          tx_n_out2,                          //                                   .tx_n_out2,                       Check User Guide for details
		output wire          tx_n_out3,                          //                                   .tx_n_out3,                       Check User Guide for details
		output wire          tx_n_out4,                          //                                   .tx_n_out4,                       Check User Guide for details
		output wire          tx_n_out5,                          //                                   .tx_n_out5,                       Check User Guide for details
		output wire          tx_n_out6,                          //                                   .tx_n_out6,                       Check User Guide for details
		output wire          tx_n_out7,                          //                                   .tx_n_out7,                       Check User Guide for details
		output wire          tx_n_out8,                          //                                   .tx_n_out8,                       Check User Guide for details
		output wire          tx_n_out9,                          //                                   .tx_n_out9,                       Check User Guide for details
		output wire          tx_n_out10,                         //                                   .tx_n_out10,                      Check User Guide for details
		output wire          tx_n_out11,                         //                                   .tx_n_out11,                      Check User Guide for details
		output wire          tx_n_out12,                         //                                   .tx_n_out12,                      Check User Guide for details
		output wire          tx_n_out13,                         //                                   .tx_n_out13,                      Check User Guide for details
		output wire          tx_n_out14,                         //                                   .tx_n_out14,                      Check User Guide for details
		output wire          tx_n_out15,                         //                                   .tx_n_out15,                      Check User Guide for details
		output wire          tx_p_out0,                          //                                   .tx_p_out0,                       Check User Guide for details
		output wire          tx_p_out1,                          //                                   .tx_p_out1,                       Check User Guide for details
		output wire          tx_p_out2,                          //                                   .tx_p_out2,                       Check User Guide for details
		output wire          tx_p_out3,                          //                                   .tx_p_out3,                       Check User Guide for details
		output wire          tx_p_out4,                          //                                   .tx_p_out4,                       Check User Guide for details
		output wire          tx_p_out5,                          //                                   .tx_p_out5,                       Check User Guide for details
		output wire          tx_p_out6,                          //                                   .tx_p_out6,                       Check User Guide for details
		output wire          tx_p_out7,                          //                                   .tx_p_out7,                       Check User Guide for details
		output wire          tx_p_out8,                          //                                   .tx_p_out8,                       Check User Guide for details
		output wire          tx_p_out9,                          //                                   .tx_p_out9,                       Check User Guide for details
		output wire          tx_p_out10,                         //                                   .tx_p_out10,                      Check User Guide for details
		output wire          tx_p_out11,                         //                                   .tx_p_out11,                      Check User Guide for details
		output wire          tx_p_out12,                         //                                   .tx_p_out12,                      Check User Guide for details
		output wire          tx_p_out13,                         //                                   .tx_p_out13,                      Check User Guide for details
		output wire          tx_p_out14,                         //                                   .tx_p_out14,                      Check User Guide for details
		output wire          tx_p_out15,                         //                                   .tx_p_out15,                      Check User Guide for details
		input  wire          rx_n_in0,                           //                                   .rx_n_in0,                        Check User Guide for details
		input  wire          rx_n_in1,                           //                                   .rx_n_in1,                        Check User Guide for details
		input  wire          rx_n_in2,                           //                                   .rx_n_in2,                        Check User Guide for details
		input  wire          rx_n_in3,                           //                                   .rx_n_in3,                        Check User Guide for details
		input  wire          rx_n_in4,                           //                                   .rx_n_in4,                        Check User Guide for details
		input  wire          rx_n_in5,                           //                                   .rx_n_in5,                        Check User Guide for details
		input  wire          rx_n_in6,                           //                                   .rx_n_in6,                        Check User Guide for details
		input  wire          rx_n_in7,                           //                                   .rx_n_in7,                        Check User Guide for details
		input  wire          rx_n_in8,                           //                                   .rx_n_in8,                        Check User Guide for details
		input  wire          rx_n_in9,                           //                                   .rx_n_in9,                        Check User Guide for details
		input  wire          rx_n_in10,                          //                                   .rx_n_in10,                       Check User Guide for details
		input  wire          rx_n_in11,                          //                                   .rx_n_in11,                       Check User Guide for details
		input  wire          rx_n_in12,                          //                                   .rx_n_in12,                       Check User Guide for details
		input  wire          rx_n_in13,                          //                                   .rx_n_in13,                       Check User Guide for details
		input  wire          rx_n_in14,                          //                                   .rx_n_in14,                       Check User Guide for details
		input  wire          rx_n_in15,                          //                                   .rx_n_in15,                       Check User Guide for details
		input  wire          rx_p_in0,                           //                                   .rx_p_in0,                        Check User Guide for details
		input  wire          rx_p_in1,                           //                                   .rx_p_in1,                        Check User Guide for details
		input  wire          rx_p_in2,                           //                                   .rx_p_in2,                        Check User Guide for details
		input  wire          rx_p_in3,                           //                                   .rx_p_in3,                        Check User Guide for details
		input  wire          rx_p_in4,                           //                                   .rx_p_in4,                        Check User Guide for details
		input  wire          rx_p_in5,                           //                                   .rx_p_in5,                        Check User Guide for details
		input  wire          rx_p_in6,                           //                                   .rx_p_in6,                        Check User Guide for details
		input  wire          rx_p_in7,                           //                                   .rx_p_in7,                        Check User Guide for details
		input  wire          rx_p_in8,                           //                                   .rx_p_in8,                        Check User Guide for details
		input  wire          rx_p_in9,                           //                                   .rx_p_in9,                        Check User Guide for details
		input  wire          rx_p_in10,                          //                                   .rx_p_in10,                       Check User Guide for details
		input  wire          rx_p_in11,                          //                                   .rx_p_in11,                       Check User Guide for details
		input  wire          rx_p_in12,                          //                                   .rx_p_in12,                       Check User Guide for details
		input  wire          rx_p_in13,                          //                                   .rx_p_in13,                       Check User Guide for details
		input  wire          rx_p_in14,                          //                                   .rx_p_in14,                       Check User Guide for details
		input  wire          rx_p_in15,                          //                                   .rx_p_in15,                       Check User Guide for details
		input  wire          refclk0,                            //                            refclk0.clk,                             Check User Guide for details
		input  wire          refclk1                             //                            refclk1.clk,                             Check User Guide for details
	);
endmodule

