module platform_emif_io96b_hps_0 (
		output wire [0:0]  mem_0_cke,     //              mem_0.mem_cke
		output wire [0:0]  mem_0_odt,     //                   .mem_odt
		output wire [0:0]  mem_0_cs_n,    //                   .mem_cs_n
		output wire [16:0] mem_0_a,       //                   .mem_a
		output wire [1:0]  mem_0_ba,      //                   .mem_ba
		output wire [0:0]  mem_0_bg,      //                   .mem_bg
		output wire        mem_0_act_n,   //                   .mem_act_n
		output wire        mem_0_par,     //                   .mem_par
		inout  wire [39:0] mem_0_dq,      //                   .mem_dq
		inout  wire [4:0]  mem_0_dqs_t,   //                   .mem_dqs_t
		inout  wire [4:0]  mem_0_dqs_c,   //                   .mem_dqs_c
		input  wire        mem_0_alert_n, //                   .mem_alert_n
		inout  wire [4:0]  mem_0_dbi_n,   //                   .mem_dbi_n
		output wire [0:0]  mem_0_ck_t,    //           mem_ck_0.mem_ck_t
		output wire [0:0]  mem_0_ck_c,    //                   .mem_ck_c
		output wire        mem_0_reset_n, //        mem_reset_n.mem_reset_n
		input  wire        oct_rzqin_0,   //              oct_0.oct_rzqin
		input  wire        ref_clk        //            ref_clk.clk
	);
endmodule

