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
module ed_synth_dut_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_alj3kza #(
		parameter SYMBOLS_PER_BEAT = 1,
		parameter BITS_PER_SYMBOL  = 37,
		parameter USE_PACKETS      = 0,
		parameter USE_EMPTY        = 0,
		parameter EMPTY_WIDTH      = 0,
		parameter CHANNEL_WIDTH    = 0,
		parameter PACKET_WIDTH     = 0,
		parameter ERROR_WIDTH      = 0,
		parameter PIPELINE_READY   = 0,
		parameter SYNC_RESET       = 0
	) (
		input  wire        clk,       
		input  wire        reset,     
		output wire        in_ready,  
		input  wire        in_valid,  
		input  wire [36:0] in_data,   
		input  wire        out_ready, 
		output wire        out_valid, 
		output wire [36:0] out_data   
	);

	ed_synth_dut_altera_avalon_st_pipeline_stage_1930_bv2ucky #(
		.SYMBOLS_PER_BEAT (SYMBOLS_PER_BEAT),
		.BITS_PER_SYMBOL  (BITS_PER_SYMBOL),
		.USE_PACKETS      (USE_PACKETS),
		.USE_EMPTY        (USE_EMPTY),
		.EMPTY_WIDTH      (EMPTY_WIDTH),
		.CHANNEL_WIDTH    (CHANNEL_WIDTH),
		.PACKET_WIDTH     (PACKET_WIDTH),
		.ERROR_WIDTH      (ERROR_WIDTH),
		.PIPELINE_READY   (PIPELINE_READY),
		.SYNC_RESET       (SYNC_RESET)
	) my_altera_avalon_st_pipeline_stage_rd (
		.clk               (clk),       
		.reset             (reset),     
		.in_ready          (in_ready),  
		.in_valid          (in_valid),  
		.in_data           (in_data),   
		.out_ready         (out_ready), 
		.out_valid         (out_valid), 
		.out_data          (out_data),  
		.in_startofpacket  (1'b0),      
		.in_endofpacket    (1'b0),      
		.out_startofpacket (),          
		.out_endofpacket   (),          
		.in_empty          (1'b0),      
		.out_empty         (),          
		.out_error         (),          
		.in_error          (1'b0),      
		.out_channel       (),          
		.in_channel        (1'b0)       
	);

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZKGzK61Ur8QH6z23Ey+foYZldk7wxZJaqiGGs7kFaJaq52ezp4z7RNzHZCMW0CXPFFB/bGTSctQpkUpiqi8pZiZ8fff9Tt/YVxT0j//kWxFb3V2RwkEeQSYrUDv/egZYCOLrGStCKwWwNAQUjYQ6PEImgEKQGrbnUdKLMHGsdWmXotxJuoKTFat6hwYB7AQdb/7IbDsJwI10HXjl3BH7KvgftB9DLU96wd93KyZL7Jq/fHmjRSF0ka8gD1f4wMSTGu5viNDzQBGcnLsHDwDf3FU3qvmQ7KlZMBMi0auVO//jWPyUfVtYCsTOe3mUNU8JwiBENtCg/9hlyXVBjEAYY4vqHc9zOyeZWdfJ7lHHHtgofu3dGfaEB14h3iYtWpWZVUt6ZxtCvzdiNj47766JaKZLoar6W3P3rwgi3eUDepoL1Vcmq8u14SlK+mAJVjL58Ar6DqBCkS3hUVVLDl5E3+Xk9wRYSotndehD9ZCtuEDBfpZLjFVTWttI1UMiHdkMpZygghZzWG7VGKEnxOTDNE18PWV3iUlBEoR+x/BOfPa5+7hHDOAJ1vDT75ES0wvtbgy6rM+SLSpF1V1nnk4wEuUyVSxFSOUR90KGyf551se8RMgL4F7she/b472OIYaMDwUsb1XFhJ/eeLYWO40ZQ/ejcqgZpHGXVfcrvOyp/zHXMimXMPgRc0V2UwYCEv3/e56By1lM1M00sBBIbck/evJSIDtMrn5P4PzU5f5DUHtHBfqbS1tiYEi2uMCTn7MERGRaUqhlTxrOy+g920aA4mE"
`endif