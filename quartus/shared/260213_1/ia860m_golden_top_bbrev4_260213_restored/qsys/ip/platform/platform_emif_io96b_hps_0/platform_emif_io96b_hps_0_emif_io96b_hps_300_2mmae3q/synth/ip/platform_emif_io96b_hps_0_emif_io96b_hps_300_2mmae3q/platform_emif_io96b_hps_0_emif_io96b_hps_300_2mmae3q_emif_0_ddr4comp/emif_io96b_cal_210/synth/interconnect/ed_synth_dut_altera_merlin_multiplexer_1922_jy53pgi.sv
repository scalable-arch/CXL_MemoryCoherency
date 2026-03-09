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








// altera message_off 13448

`timescale 1 ns / 1 ns



module ed_synth_dut_altera_merlin_multiplexer_1922_jy53pgi
(
    input                       sink0_valid,
    input [440-1   : 0]  sink0_data,
    input [2-1: 0]  sink0_channel,
    input                       sink0_startofpacket,
    input                       sink0_endofpacket,
    output                      sink0_ready,


    output reg                  src_valid,
    output [440-1    : 0] src_data,
    output [2-1 : 0] src_channel,
    output                      src_startofpacket,
    output                      src_endofpacket,
    input                       src_ready,

    input clk,
    input reset
);
    localparam PAYLOAD_W        = 440 + 2 + 2;
    localparam NUM_INPUTS       = 1;
    localparam SHARE_COUNTER_W  = 1;
    localparam PIPELINE_ARB     = 1;
    localparam ST_DATA_W        = 440;
    localparam ST_CHANNEL_W     = 2;
    localparam PKT_TRANS_LOCK   = 324;
    localparam SYNC_RESET       = 0;

    assign	src_valid			=  sink0_valid;
    assign	src_data			=  sink0_data;
    assign	src_channel			=  sink0_channel;
    assign	src_startofpacket  	        =  sink0_startofpacket;
    assign	src_endofpacket		        =  sink0_endofpacket;
    assign	sink0_ready			=  src_ready;
endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZJN3FA12AxdTZJVAYu+tcnK0E2CXXxPfW/KDkYYpZcQf0GIE9YmHSET+ScfkoShK7xF81OWxIKzXKOtsheTLtP7SYP5qeM8gRP3kR/uZ9O4QeoxafhVjaycWrlPwRt4T1cFsAdQr+N6+DMMO5ZOitaXvDxlwY9csEVBfEFjQYFJWlLpwel2hdpgOoKbnLIqoOyxaPN3io2QjK/mXJ4Bv8QbbngyETaqx9Qh+a5srQL6VV9GlJ/lebA3MnhOEIWzhL9YWPS9f2gHWscx/wAuit5/Yt7xoEfNYUGXcHIUVB4zGZt1ZvlJfke9/bkhBZV72YZsFGn9uvmh7w/tHtKWCor9cOxfzrlaCHGHYdZRfvoknEvmitkNk92YwZMTIX0g6avX36K+Vfc3bPWqhyxPGG62rVO7J+D3z97vhCS25sh0aT7AeFhCclpHGKio8n5GU1oK6Cq7LtxkxiZ9PQWM/XKuDjWtgZ50W0qDPpL8q/ajQFh/T5rJ/6Zhx2yjVtW4c652JCQwIkb/Y3r8Z36gnrxV6CwIClUUZtVtAtauNf8CpLB8Ssr8CbKWKikgnTI7ampx7Zt9SYJoeuaGoGqELrpDOzNwtgCQUvBUl1kt3FWfGwqIJCOAn6fFsaHA6BOteG7lFsO1mKIm8RfrS/KOv9GXSr9ZN/KX/WNzxtLutP8oKrSJJ+N3sbc+qpFmPJUbre2Fdx4fpykKoHoFOcvzYruZQPDrV0bGJvGXHg73dXZdZK3Ac/mFWrrZGULrHyX0GY+j5kxjl+pDVHL0BTiupEAc"
`endif