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
module ed_synth_dut_altera_merlin_traffic_limiter_altera_avalon_sc_fifo_1921_7ekoqry #(
		parameter SYMBOLS_PER_BEAT    = 1,
		parameter BITS_PER_SYMBOL     = 4,
		parameter FIFO_DEPTH          = 6,
		parameter CHANNEL_WIDTH       = 0,
		parameter ERROR_WIDTH         = 0,
		parameter USE_PACKETS         = 0,
		parameter USE_FILL_LEVEL      = 0,
		parameter EMPTY_LATENCY       = 1,
		parameter USE_MEMORY_BLOCKS   = 0,
		parameter USE_STORE_FORWARD   = 0,
		parameter USE_ALMOST_FULL_IF  = 0,
		parameter USE_ALMOST_EMPTY_IF = 0,
		parameter EMPTY_WIDTH         = 1,
		parameter SYNC_RESET          = 0
	) (
		input  wire       clk,       
		input  wire       reset,     
		input  wire [3:0] in_data,   
		input  wire       in_valid,  
		output wire       in_ready,  
		output wire [3:0] out_data,  
		output wire       out_valid, 
		input  wire       out_ready  
	);

	generate
		if (EMPTY_WIDTH != 1)
		begin
		// synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		//  synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					empty_width_check ( .error(1'b1) );
		end
		if (SYNC_RESET != 0)
		begin
		//  synthesis translate_off
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
		//  synthesis translate_on
			instantiated_with_wrong_parameters_error_see_comment_above
					sync_reset_check ( .error(1'b1) );
		end
	endgenerate

	ed_synth_dut_altera_avalon_sc_fifo_1931_fzgstwy #(
		.SYMBOLS_PER_BEAT    (SYMBOLS_PER_BEAT),
		.BITS_PER_SYMBOL     (BITS_PER_SYMBOL),
		.FIFO_DEPTH          (FIFO_DEPTH),
		.CHANNEL_WIDTH       (CHANNEL_WIDTH),
		.ERROR_WIDTH         (ERROR_WIDTH),
		.USE_PACKETS         (USE_PACKETS),
		.USE_FILL_LEVEL      (USE_FILL_LEVEL),
		.EMPTY_LATENCY       (EMPTY_LATENCY),
		.USE_MEMORY_BLOCKS   (USE_MEMORY_BLOCKS),
		.USE_STORE_FORWARD   (USE_STORE_FORWARD),
		.USE_ALMOST_FULL_IF  (USE_ALMOST_FULL_IF),
		.USE_ALMOST_EMPTY_IF (USE_ALMOST_EMPTY_IF),
		.EMPTY_WIDTH         (1),
		.SYNC_RESET          (0)
	) my_altera_avalon_sc_fifo_dest_id_fifo (
		.clk               (clk),                                  
		.reset             (reset),                                
		.in_data           (in_data),                              
		.in_valid          (in_valid),                             
		.in_ready          (in_ready),                             
		.out_data          (out_data),                             
		.out_valid         (out_valid),                            
		.out_ready         (out_ready),                            
		.csr_address       (2'b00),                                
		.csr_read          (1'b0),                                 
		.csr_write         (1'b0),                                 
		.csr_readdata      (),                                     
		.csr_writedata     (32'b00000000000000000000000000000000), 
		.almost_full_data  (),                                     
		.almost_empty_data (),                                     
		.in_startofpacket  (1'b0),                                 
		.in_endofpacket    (1'b0),                                 
		.out_startofpacket (),                                     
		.out_endofpacket   (),                                     
		.in_empty          (1'b0),                                 
		.out_empty         (),                                     
		.in_error          (1'b0),                                 
		.out_error         (),                                     
		.in_channel        (1'b0),                                 
		.out_channel       ()                                      
	);

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZLuMdBi/QnvmUY89wCGbloy9EhDslwzVu65U0m05e4ZU21zkJTFeWIKGuMH0sj5/9iyfNz/rbJD7aqq/0yExBi0YUi3VzakDDIws/j/wu1hs2kvDI5F9u8Mx1NlKb5r7BpazKWTMFVp3OdPOJcPFHIejJYxd7gY/r/9Zqw6bztIX04zCX0Jiz396JZUbYZnPd6EQnHi1dMCAnW4+7aR6/9zLW3h56b0wWF8D9C+aUNr0PE0IUfCn0fHJcLsH24peK4wZlPSEqaWivXFNRRWGwKtsfzmh8EUw0fB/8C3RdGF6zp4gKPVTx41LrkGunFzNGf1bVTZ6mTI8We/Ie450SiYo+qaNaVQABhaiBAbzmRHoXSvV25x+0uWa4tT/nI7wbXpuqLKMnRYsaaFF8oLIT47uurpiPo68iePa6RJQkSeMxefu3ayBQtT3rxWqMZQtt1g5BVXUUMjgI85HDKKJ+KVjxKj8PL+81dEh7X2hs1RFfalFZ4N6/qOJlKikDlM3WMJqwfFupsJB7imQLJptW1xLyuW51gNEVgL30201XIyQdx/lttqQByyOOcOIiG9pqSyzAOdyx8fDaf4nlr4HjlzrlpRRusgJzZ4FsJtovfZLMskeRUZ/EEzr+EfBaGs853KiaPO8Voh3PfWj7jQYgKWPVlV8oEg85RVG1QLDBMBAE0hK+x6gc/pjbHDZuq/GX29nYhCyZ/6ErKWDW2BBQ8KQExqroWfoD/mLNtylHW8VredeRBQ48/7oMUQFEqORH47bvbfhilCiCtPYEsv2K4H"
`endif