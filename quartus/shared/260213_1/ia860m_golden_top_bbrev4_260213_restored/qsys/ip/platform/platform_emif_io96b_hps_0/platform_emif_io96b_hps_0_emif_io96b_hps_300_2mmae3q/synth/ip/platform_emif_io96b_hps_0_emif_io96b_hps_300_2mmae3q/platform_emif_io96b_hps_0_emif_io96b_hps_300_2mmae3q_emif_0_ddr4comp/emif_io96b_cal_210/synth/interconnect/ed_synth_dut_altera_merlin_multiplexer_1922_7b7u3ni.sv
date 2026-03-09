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



module ed_synth_dut_altera_merlin_multiplexer_1922_7b7u3ni
(
    input                       sink0_valid,
    input [124-1   : 0]  sink0_data,
    input [2-1: 0]  sink0_channel,
    input                       sink0_startofpacket,
    input                       sink0_endofpacket,
    output                      sink0_ready,


    output reg                  src_valid,
    output [124-1    : 0] src_data,
    output [2-1 : 0] src_channel,
    output                      src_startofpacket,
    output                      src_endofpacket,
    input                       src_ready,

    input clk,
    input reset
);
    localparam PAYLOAD_W        = 124 + 2 + 2;
    localparam NUM_INPUTS       = 1;
    localparam SHARE_COUNTER_W  = 1;
    localparam PIPELINE_ARB     = 1;
    localparam ST_DATA_W        = 124;
    localparam ST_CHANNEL_W     = 2;
    localparam PKT_TRANS_LOCK   = 72;
    localparam SYNC_RESET       = 0;

    assign	src_valid			=  sink0_valid;
    assign	src_data			=  sink0_data;
    assign	src_channel			=  sink0_channel;
    assign	src_startofpacket  	        =  sink0_startofpacket;
    assign	src_endofpacket		        =  sink0_endofpacket;
    assign	sink0_ready			=  src_ready;
endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZK+BEQlzFG/B/GCnaRRsHJcrPGxapMgMpRjSyKmPgDrA0TmSXlAbSyC6X+KheHz0mlE34O6B5UQsxqV5pudr2VT+e4DW0dgFvECCxZA8f5A0ii7BqvKezVbrxifle4E/o8V25Fy0e4XzLL6DiztGb8GNLC/BFOMtNkqiMlXWp+Rkd9FEV8TFC7rr3AoLwAyFq6MP/iyAQ+qSfw6nmu8gLjFCc2J03YtmImiVoJzshBgjwnMn/VkJv3HFoFSy1ssJsFtCCi0Q/DFnSoYxZMZ3PXyX10k8j0GFdUQk1djug/WVT5zuLa203e8ndwYcENakkv3CKyGrFtRbc5Jhg9ddaI40ImNo5l6hcnnhgi85SNMYW7wtlEoGMurN1qQYv+cY16zQrBv5QA9Eb7XFMjoixgVLYbubk+HQ5JhJtOT09exLhOQZm1SkdZPkAcV7IHBHIcdn2MDqhDqJh6QB4jqvcVwZeKfbz+6oDj6TKd2r9TS3K9/2mleV4pmG0OSOeeItuG8M4sTZ2/62FhO9cRu+WalN0FawnJfBJQGahzEpud2SPsnyVxcjh2G759yww8wUwh8p+ICNGOF/ZIBEXnpyNEBPo63MyuI4It0TXxGUPXgg7IxJD94w7FNnihmKQNf/LFXtCc1X7N877SoQhxfiBUsAkQ0FCG+U+2lzb4BqeE1QGbKvZo6EGK7ARKXTf2AjlUJEFgWxnmU/7lEUOEEi+yPhO5Tb3GLdym7XHx2tHEooj3dDvsmConIwt9wlc41nyY3DsY0pJKjZK3HnpEsSfe5"
`endif