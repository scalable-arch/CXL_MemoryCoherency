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
module ed_synth_dut_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_cgpn6xq #(
		parameter SYMBOLS_PER_BEAT = 1,
		parameter BITS_PER_SYMBOL  = 188,
		parameter USE_PACKETS      = 1,
		parameter USE_EMPTY        = 0,
		parameter EMPTY_WIDTH      = 0,
		parameter CHANNEL_WIDTH    = 0,
		parameter PACKET_WIDTH     = 2,
		parameter ERROR_WIDTH      = 0,
		parameter PIPELINE_READY   = 1,
		parameter SYNC_RESET       = 0
	) (
		input  wire         clk,               
		input  wire         reset,             
		output wire         in_ready,          
		input  wire         in_valid,          
		input  wire         in_startofpacket,  
		input  wire         in_endofpacket,    
		input  wire [187:0] in_data,           
		input  wire         out_ready,         
		output wire         out_valid,         
		output wire         out_startofpacket, 
		output wire         out_endofpacket,   
		output wire [187:0] out_data           
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
	) my_altera_avalon_st_pipeline_stage_rp (
		.clk               (clk),               
		.reset             (reset),             
		.in_ready          (in_ready),          
		.in_valid          (in_valid),          
		.in_startofpacket  (in_startofpacket),  
		.in_endofpacket    (in_endofpacket),    
		.in_data           (in_data),           
		.out_ready         (out_ready),         
		.out_valid         (out_valid),         
		.out_startofpacket (out_startofpacket), 
		.out_endofpacket   (out_endofpacket),   
		.out_data          (out_data),          
		.in_empty          (1'b0),              
		.out_empty         (),                  
		.out_error         (),                  
		.in_error          (1'b0),              
		.out_channel       (),                  
		.in_channel        (1'b0)               
	);

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZJIQTRQVn/5GX7iZuadGyr0webcEbCGbtreYXc5KHUxFkA1cGB4KbcJwz8UtjXrIfBtInlM6OoT/0M49HB3nt/WxEqhsbV0Jwt/jtfAmPauSO3t16BpoBvnSItuEVj61GIpODnBuuTs1JTuyzH2ZGYCjvzSylWQ6oV+lJLs+IIksq33oN4F9/kzGvJQtfi78JyuOg+/CA8Z6kpfH9hgyY6QPRDm9etEbUUHEMGgWDwbmdQbOZwJkx1LbX3O1ftoI4rHTRbSqrZnlA3Gq+Q0pJuLCHI6gDuOzs8la+y5KeHDDSw1+VZtA2lWw1eHe7sNUz59Te/UvsLqf2K2izkADHrCP1PzXTQrDnQ5+fG5edHu0sKnNUKdmBY7vm0GAfC7uF2acrF06hMEOuzIjGMkELoDw1KVldRsKSJwnuNQ8Wn6P9tbMuwYIGD8bellvipfCY8CVdFPW3EB8p7JBMGPvUWL3ti7NCHiV1BKehS9zFfBQcI5EGB8BJDJZDUsnRupkzSzyYKhFeZDnWusKDkh9pRqmoWojx4CgnGbxSCbgta3InkOIbhjLD6TH27mfBOBz42YWNmYNKYZlyAYkejabnwKQOzDlOyJqzEcEM/Pi7X6zt6w90QYTBWvV3E0lCV5kgezSrznO5+934/DOMW/YPtx1KR+PyHldcLIKNWDD6JvpRlCmgZJsqiw/RTw9axNUUxSELf4zzmd6VO3+fo17GdJ+fUIa5FRp+LFJT6ACRsqIQRdbCzC7F/dqsctATGPobFZp//bBkBgT+Sva8LAZJi+"
`endif