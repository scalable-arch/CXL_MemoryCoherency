module platform_intel_agilex_hps_1 (
		output wire         NAND_ALE,      //              hps_io.NAND_ALE
		output wire         NAND_CE_N,     //                    .NAND_CE_N
		output wire         NAND_CLE,      //                    .NAND_CLE
		output wire         NAND_RE_N,     //                    .NAND_RE_N
		input  wire         NAND_RB,       //                    .NAND_RB
		inout  wire         NAND_ADQ0,     //                    .NAND_ADQ0
		inout  wire         NAND_ADQ1,     //                    .NAND_ADQ1
		inout  wire         NAND_ADQ2,     //                    .NAND_ADQ2
		inout  wire         NAND_ADQ3,     //                    .NAND_ADQ3
		inout  wire         NAND_ADQ4,     //                    .NAND_ADQ4
		inout  wire         NAND_ADQ5,     //                    .NAND_ADQ5
		inout  wire         NAND_ADQ6,     //                    .NAND_ADQ6
		inout  wire         NAND_ADQ7,     //                    .NAND_ADQ7
		output wire         NAND_WP_N,     //                    .NAND_WP_N
		output wire         NAND_WE_N,     //                    .NAND_WE_N
		input  wire         UART0_RX,      //                    .UART0_RX
		output wire         UART0_TX,      //                    .UART0_TX
		input  wire         hps_osc_clk,   //                    .hps_osc_clk
		output wire         h2f_rst,       //           h2f_reset.reset
		input  wire         h2f_axi_clk,   //       h2f_axi_clock.clk
		input  wire         h2f_axi_rst_n, //       h2f_axi_reset.reset_n
		output wire [3:0]   h2f_AWID,      //      h2f_axi_master.awid
		output wire [31:0]  h2f_AWADDR,    //                    .awaddr
		output wire [7:0]   h2f_AWLEN,     //                    .awlen
		output wire [2:0]   h2f_AWSIZE,    //                    .awsize
		output wire [1:0]   h2f_AWBURST,   //                    .awburst
		output wire         h2f_AWLOCK,    //                    .awlock
		output wire [3:0]   h2f_AWCACHE,   //                    .awcache
		output wire [2:0]   h2f_AWPROT,    //                    .awprot
		output wire         h2f_AWVALID,   //                    .awvalid
		input  wire         h2f_AWREADY,   //                    .awready
		output wire [127:0] h2f_WDATA,     //                    .wdata
		output wire [15:0]  h2f_WSTRB,     //                    .wstrb
		output wire         h2f_WLAST,     //                    .wlast
		output wire         h2f_WVALID,    //                    .wvalid
		input  wire         h2f_WREADY,    //                    .wready
		input  wire [3:0]   h2f_BID,       //                    .bid
		input  wire [1:0]   h2f_BRESP,     //                    .bresp
		input  wire         h2f_BVALID,    //                    .bvalid
		output wire         h2f_BREADY,    //                    .bready
		output wire [3:0]   h2f_ARID,      //                    .arid
		output wire [31:0]  h2f_ARADDR,    //                    .araddr
		output wire [7:0]   h2f_ARLEN,     //                    .arlen
		output wire [2:0]   h2f_ARSIZE,    //                    .arsize
		output wire [1:0]   h2f_ARBURST,   //                    .arburst
		output wire         h2f_ARLOCK,    //                    .arlock
		output wire [3:0]   h2f_ARCACHE,   //                    .arcache
		output wire [2:0]   h2f_ARPROT,    //                    .arprot
		output wire         h2f_ARVALID,   //                    .arvalid
		input  wire         h2f_ARREADY,   //                    .arready
		input  wire [3:0]   h2f_RID,       //                    .rid
		input  wire [127:0] h2f_RDATA,     //                    .rdata
		input  wire [1:0]   h2f_RRESP,     //                    .rresp
		input  wire         h2f_RLAST,     //                    .rlast
		input  wire         h2f_RVALID,    //                    .rvalid
		output wire         h2f_RREADY     //                    .rready
	);
endmodule

