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
module ed_synth_dut_altera_merlin_axi_slave_ni_altera_avalon_st_pipeline_stage_1971_vnonqiy #(
		parameter SYMBOLS_PER_BEAT = 1,
		parameter BITS_PER_SYMBOL  = 124,
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
		input  wire [123:0] in_data,           
		input  wire         out_ready,         
		output wire         out_valid,         
		output wire         out_startofpacket, 
		output wire         out_endofpacket,   
		output wire [123:0] out_data           
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
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZKvbGaNBUwkZQH8Y4Qe8rWAagwGqb08zXVfdMkH+j3hTzx+tBbWTNOz+z4a5V9i3S3NbvMMY9h7v60lP+YVFZNbL5WijxIzxVv/1x345YVbIXvz+5iVQbDVcSCGkRNnji8fXHuCk6GInPwt+s6fh0OTRv1a/y48/xvVn7ospU6SijG3+Wc6ndd562zB/8xyoZCJORpdzHWzpKzzCuhRAzDFiRV0TKfZU5XcYyl0q3ai2EasnsIi/2pzggNtDmxKmQ3TWd40QsVUZqH8Ynp32+CBxB092rasfqs6beugPkN77qi5OcGB7Srgnked+Ps9IhGWfYNVWElx9PDXeT4OOWRzSuvk8LJx8/CepL6rGj9ZWIAq0fEmx/ashbNdqUSmTt3r/IQWRVTjafOlVnY2L7rEoA4SHrXjLQs2PgBB7+YnLbmx+NzPiov+doma/zL4aEnlxOSldsvk3ZTB+hTCfHmGD65sQXEf8Rpks7CgC0R3uCBg93RcjD2QEZz8Hu58lQUblL6pFh3f6H1lmdwR4dGDNcNWp4xFiy1rp6KeH16DixFMQGJJUpNudvMYdVh+6ijMOmgZ+zMTZtJt3/9JPohPHtxqlW4Qzolqxdx4gQmGLXjH1Y/NZPF4O+QUQ0B4fLCHMXANKEKYNXbmEQfTdZ1ARoSCWoQW6RSXY2DIE7PazpF0XdGYzPxKqirfy5Kr7X+86EDwvj/TeqgjrxPenJE/Eg1VdETshNGZO7dFfm5lYCH9VmA3t4+LaJK2CHukm3c+X8sXbFxJahEde2T3k8v4"
`endif