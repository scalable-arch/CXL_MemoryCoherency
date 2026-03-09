module platform_intel_pcie_axi_mcdma_0 (
		input  wire          axi_st_clk,                      //                     axi_st_clk.clk,                             AXI-ST Clock
		input  wire          axi_mm_clk,                      //                     axi_mm_clk.clk,                             AXI-MM Clock
		input  wire          axi_lite_clk,                    //                   axi_lite_clk.clk,                             AXI-Lite Clock
		input  wire          axi_st_areset_n,                 //                axi_st_areset_n.reset_n,                         AXI-ST Reset
		input  wire          axi_mm_areset_n,                 //                axi_mm_areset_n.reset_n,                         AXI-MM Reset
		input  wire          axi_lite_areset_n,               //              axi_lite_areset_n.reset_n,                         AXI-Lite Reset
		input  wire          ss_app_st_rx_tvalid,             //                       ss_rx_st.tvalid,                          Rx AXI-ST Slave Interface
		input  wire [1023:0] ss_app_st_rx_tdata,              //                               .tdata,                           Rx AXI-ST Slave Interface
		input  wire [127:0]  ss_app_st_rx_tkeep,              //                               .tkeep,                           Rx AXI-ST Slave Interface
		input  wire          ss_app_st_rx_tlast,              //                               .tlast,                           Rx AXI-ST Slave Interface
		input  wire [3:0]    ss_app_st_rx_tuser_vendor,       //          ss_rx_st_tuser_vendor.ss_app_st_rx_tuser_vendor,       Rx AXI-ST Slave Interface
		input  wire [3:0]    ss_app_st_rx_tuser_last_segment, //    ss_rx_st_tuser_last_segment.ss_app_st_rx_tuser_last_segment, Rx AXI-ST Slave Interface
		input  wire [3:0]    ss_app_st_rx_tuser_hvalid,       //          ss_rx_st_tuser_hvalid.ss_app_st_rx_tuser_hvalid,       Rx AXI-ST Slave Interface
		input  wire [1023:0] ss_app_st_rx_tuser_hdr,          //             ss_rx_st_tuser_hdr.ss_app_st_rx_tuser_hdr,          Rx AXI-ST Slave Interface
		output wire          app_ss_st_tx_tvalid,             //                       ss_tx_st.tvalid,                          Tx AXI-ST Master Interface
		input  wire          ss_app_st_tx_tready,             //                               .tready,                          Tx AXI-ST Master Interface
		output wire [1023:0] app_ss_st_tx_tdata,              //                               .tdata,                           Tx AXI-ST Master Interface
		output wire [127:0]  app_ss_st_tx_tkeep,              //                               .tkeep,                           Tx AXI-ST Master Interface
		output wire          app_ss_st_tx_tlast,              //                               .tlast,                           Tx AXI-ST Master Interface
		output wire [3:0]    app_ss_st_tx_tuser_last_segment, //    ss_tx_st_tuser_last_segment.app_ss_st_tx_tuser_last_segment, Tx AXI-ST Master Interface
		output wire [3:0]    app_ss_st_tx_tuser_hvalid,       //          ss_tx_st_tuser_hvalid.app_ss_st_tx_tuser_hvalid,       Tx AXI-ST Master Interface
		output wire [1023:0] app_ss_st_tx_tuser_hdr,          //             ss_tx_st_tuser_hdr.app_ss_st_tx_tuser_hdr,          Tx AXI-ST Master Interface
		output wire          app_ss_lite_csr_awvalid,         //                    ss_csr_lite.awvalid,                         CSR AXI-Lite Master Interface
		input  wire          ss_app_lite_csr_awready,         //                               .awready,                         CSR AXI-Lite Master Interface
		output wire [19:0]   app_ss_lite_csr_awaddr,          //                               .awaddr,                          CSR AXI-Lite Master Interface
		output wire          app_ss_lite_csr_wvalid,          //                               .wvalid,                          CSR AXI-Lite Master Interface
		input  wire          ss_app_lite_csr_wready,          //                               .wready,                          CSR AXI-Lite Master Interface
		output wire [31:0]   app_ss_lite_csr_wdata,           //                               .wdata,                           CSR AXI-Lite Master Interface
		output wire [3:0]    app_ss_lite_csr_wstrb,           //                               .wstrb,                           CSR AXI-Lite Master Interface
		input  wire          ss_app_lite_csr_bvalid,          //                               .bvalid,                          CSR AXI-Lite Master Interface
		output wire          app_ss_lite_csr_bready,          //                               .bready,                          CSR AXI-Lite Master Interface
		input  wire [1:0]    ss_app_lite_csr_bresp,           //                               .bresp,                           CSR AXI-Lite Master Interface
		output wire          app_ss_lite_csr_arvalid,         //                               .arvalid,                         CSR AXI-Lite Master Interface
		input  wire          ss_app_lite_csr_arready,         //                               .arready,                         CSR AXI-Lite Master Interface
		output wire [19:0]   app_ss_lite_csr_araddr,          //                               .araddr,                          CSR AXI-Lite Master Interface
		input  wire          ss_app_lite_csr_rvalid,          //                               .rvalid,                          CSR AXI-Lite Master Interface
		output wire          app_ss_lite_csr_rready,          //                               .rready,                          CSR AXI-Lite Master Interface
		input  wire [31:0]   ss_app_lite_csr_rdata,           //                               .rdata,                           CSR AXI-Lite Master Interface
		input  wire [1:0]    ss_app_lite_csr_rresp,           //                               .rresp,                           CSR AXI-Lite Master Interface
		output wire [2:0]    ss_app_lite_csr_awprot,          //                               .awprot,                          CSR AXI-Lite Master Interface
		output wire [2:0]    ss_app_lite_csr_arprot,          //                               .arprot,                          CSR AXI-Lite Master Interface
		output wire          h2d_axi_st_tvalid,               //                 h2d_st_initatr.tvalid,                          h2d AXI-ST Master Interface
		input  wire          h2d_axi_st_tready,               //                               .tready,                          h2d AXI-ST Master Interface
		output wire [1023:0] h2d_axi_st_tdata,                //                               .tdata,                           h2d AXI-ST Master Interface
		output wire [127:0]  h2d_axi_st_tkeep,                //                               .tkeep,                           h2d AXI-ST Master Interface
		output wire          h2d_axi_st_tlast,                //                               .tlast,                           h2d AXI-ST Master Interface
		output wire [63:0]   h2d_axi_st_tuser_metadata,       //                               .tuser,                           h2d AXI-ST Master Interface
		output wire [11:0]   h2d_axi_st_tid,                  //                               .tid,                             h2d AXI-ST Master Interface
		output wire          h2d_axi_st_tuser_error,          //     h2d_st_initatr_tuser_error.tuser_error,                     h2d AXI-ST Master Interface
		input  wire          d2h_axi_st_tvalid,               //                 d2h_st_respndr.tvalid,                          d2h AXI-ST Master Interface
		output wire          d2h_axi_st_tready,               //                               .tready,                          d2h AXI-ST Master Interface
		input  wire [1023:0] d2h_axi_st_tdata,                //                               .tdata,                           d2h AXI-ST Master Interface
		input  wire [127:0]  d2h_axi_st_tkeep,                //                               .tkeep,                           d2h AXI-ST Master Interface
		input  wire          d2h_axi_st_tlast,                //                               .tlast,                           d2h AXI-ST Master Interface
		input  wire [63:0]   d2h_axi_st_tuser_metadata,       //                               .tuser,                           d2h AXI-ST Master Interface
		input  wire [11:0]   d2h_axi_st_tid,                  //                               .tid,                             d2h AXI-ST Master Interface
		input  wire          d2h_axi_st_tuser_error,          //     d2h_st_respndr_tuser_error.tuser_error,                     d2h AXI-ST Master Interface
		output wire          rx_pio_axi_lite_awvalid,         //               pio_lite_initatr.awvalid,                         PIO AXI-Lite Master Interface
		input  wire          rx_pio_axi_lite_awready,         //                               .awready,                         PIO AXI-Lite Master Interface
		output wire [24:0]   rx_pio_axi_lite_awaddr,          //                               .awaddr,                          PIO AXI-Lite Master Interface
		output wire          rx_pio_axi_lite_wvalid,          //                               .wvalid,                          PIO AXI-Lite Master Interface
		input  wire          rx_pio_axi_lite_wready,          //                               .wready,                          PIO AXI-Lite Master Interface
		output wire [63:0]   rx_pio_axi_lite_wdata,           //                               .wdata,                           PIO AXI-Lite Master Interface
		output wire [7:0]    rx_pio_axi_lite_wstrb,           //                               .wstrb,                           PIO AXI-Lite Master Interface
		input  wire          rx_pio_axi_lite_bvalid,          //                               .bvalid,                          PIO AXI-Lite Master Interface
		output wire          rx_pio_axi_lite_bready,          //                               .bready,                          PIO AXI-Lite Master Interface
		input  wire [1:0]    rx_pio_axi_lite_bresp,           //                               .bresp,                           PIO AXI-Lite Master Interface
		output wire          rx_pio_axi_lite_arvalid,         //                               .arvalid,                         PIO AXI-Lite Master Interface
		input  wire          rx_pio_axi_lite_arready,         //                               .arready,                         PIO AXI-Lite Master Interface
		output wire [24:0]   rx_pio_axi_lite_araddr,          //                               .araddr,                          PIO AXI-Lite Master Interface
		input  wire          rx_pio_axi_lite_rvalid,          //                               .rvalid,                          PIO AXI-Lite Master Interface
		output wire          rx_pio_axi_lite_rready,          //                               .rready,                          PIO AXI-Lite Master Interface
		input  wire [63:0]   rx_pio_axi_lite_rdata,           //                               .rdata,                           PIO AXI-Lite Master Interface
		input  wire [1:0]    rx_pio_axi_lite_rresp,           //                               .rresp,                           PIO AXI-Lite Master Interface
		output wire [2:0]    rx_pio_axi_lite_awprot,          //                               .awprot,                          PIO AXI-Lite Master Interface
		output wire [2:0]    rx_pio_axi_lite_arprot,          //                               .arprot,                          PIO AXI-Lite Master Interface
		input  wire          ss_app_st_ciireq_tvalid,         //                     ss_cii_req.tvalid,                          CII Requestor AXI-ST Slave Interface
		output wire          app_ss_st_ciireq_tready,         //                               .tready,                          CII Requestor AXI-ST Slave Interface
		input  wire [71:0]   ss_app_st_ciireq_tdata,          //                               .tdata,                           CII Requestor AXI-ST Slave Interface
		output wire          app_ss_st_ciiresp_tvalid,        //                    ss_cii_resp.tvalid,                          CII Responder AXI-ST Slave Interface
		output wire [32:0]   app_ss_st_ciiresp_tdata,         //                               .tdata,                           CII Responder AXI-ST Slave Interface
		input  wire          ss_app_st_txcrdt_tvalid,         //                      ss_txcrdt.tvalid,                          Check User Guide for details
		input  wire [18:0]   ss_app_st_txcrdt_tdata,          //                               .tdata,                           Check User Guide for details
		output wire          app_ss_st_rxcrdt_tvalid,         //                      ss_rxcrdt.tvalid,                          Check User Guide for details
		output wire [18:0]   app_ss_st_rxcrdt_tdata,          //                               .tdata,                           Check User Guide for details
		input  wire          ss_app_st_ctrlshadow_tvalid,     //                  ss_ctrlshadow.tvalid,                          Check User Guide for details
		input  wire [39:0]   ss_app_st_ctrlshadow_tdata,      //                               .tdata,                           Check User Guide for details
		input  wire          ss_app_st_flrrcvd_tvalid,        //                     ss_flrrcvd.tvalid,                          Check User Guide for details
		input  wire [19:0]   ss_app_st_flrrcvd_tdata,         //                               .tdata,                           Check User Guide for details
		output wire          app_ss_st_flrcmpl_tvalid,        //                     ss_flrcmpl.tvalid,                          Check User Guide for details
		output wire [19:0]   app_ss_st_flrcmpl_tdata,         //                               .tdata,                           Check User Guide for details
		input  wire          ss_app_st_flrcmpl_tready,        //                               .tready,                          Check User Guide for details
		input  wire          ss_app_st_cplto_tvalid,          //                       ss_cplto.tvalid,                          Check User Guide for details
		input  wire [29:0]   ss_app_st_cplto_tdata,           //                               .tdata,                           Check User Guide for details
		output wire          app_ss_st_err_tvalid,            //                     ss_app_err.tvalid,                          Check User Guide for details
		output wire [31:0]   app_ss_st_err_tdata,             //                               .tdata,                           Check User Guide for details
		output wire          app_ss_st_err_tlast,             //                               .tlast,                           Check User Guide for details
		input  wire          ss_app_st_err_tready,            //                               .tready,                          Check User Guide for details
		output wire [13:0]   app_ss_st_err_tuser_error_type   // app_ss_st_err_tuser_error_type.app_ss_st_err_tuser_error_type,  Check User Guide for details
	);
endmodule

