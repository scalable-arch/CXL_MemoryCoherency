module platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_emif_0_ddr4comp (
		output wire [0:0]  mem_0_cke,     //              mem_0.mem_cke,     Clock Enable channel 0.
		output wire [0:0]  mem_0_odt,     //                   .mem_odt,     On-Die Termination channel 0.
		output wire [0:0]  mem_0_cs_n,    //                   .mem_cs_n,    Chip Select channel 0.
		output wire [16:0] mem_0_a,       //                   .mem_a,       Address channel 0.
		output wire [1:0]  mem_0_ba,      //                   .mem_ba,      Bank Address channel 0.
		output wire [0:0]  mem_0_bg,      //                   .mem_bg,      Bank Group channel 0.
		output wire        mem_0_act_n,   //                   .mem_act_n,   Activation Command channel 0.
		output wire        mem_0_par,     //                   .mem_par,     Command/Address Parity channel 0.
		inout  wire [39:0] mem_0_dq,      //                   .mem_dq,      Data (read/write) channel 0.
		inout  wire [4:0]  mem_0_dqs_t,   //                   .mem_dqs_t,   Data Strobe (true) channel 0.
		inout  wire [4:0]  mem_0_dqs_c,   //                   .mem_dqs_c,   Data Strobe (complement) channel 0.
		input  wire        mem_0_alert_n, //                   .mem_alert_n, Indicates Write CRC Error channel 0.
		inout  wire [4:0]  mem_0_dbi_n,   //                   .mem_dbi_n,   Acts as either the data bus inversion pin, or the data mask pin, depending on the configuration and whether it's a read or write transactionData (channel 0).
		output wire [0:0]  mem_0_ck_t,    //           mem_ck_0.mem_ck_t,    CK Clock (true) channel 0.
		output wire [0:0]  mem_0_ck_c,    //                   .mem_ck_c,    CK Clock (complement) channel 0.
		output wire        mem_0_reset_n, //        mem_reset_n.mem_reset_n, Asynchronous Reset channel 0.
		input  wire        oct_rzqin_0,   //              oct_0.oct_rzqin,   Calibrated On-Chip Termination (OCT) input pin channel 0.
		input  wire        ref_clk        //            ref_clk.clk,         PLL reference clock input.
	);
endmodule

