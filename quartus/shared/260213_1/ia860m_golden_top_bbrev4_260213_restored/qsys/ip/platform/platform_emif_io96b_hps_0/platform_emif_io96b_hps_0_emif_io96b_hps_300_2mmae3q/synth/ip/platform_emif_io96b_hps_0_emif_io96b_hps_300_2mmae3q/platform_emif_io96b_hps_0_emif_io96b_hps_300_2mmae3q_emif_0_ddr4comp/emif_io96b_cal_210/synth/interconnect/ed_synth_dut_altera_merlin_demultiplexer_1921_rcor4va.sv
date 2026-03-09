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






`timescale 1 ns / 1 ns



// altera message_off 16753
module ed_synth_dut_altera_merlin_demultiplexer_1921_rcor4va
(
    input  [1-1      : 0]   sink_valid,
    input  [124-1    : 0]   sink_data, 
    input  [2-1 : 0]   sink_channel, 
    input                         sink_startofpacket,
    input                         sink_endofpacket,
    output                        sink_ready,

    output reg                      src0_valid,
    output reg [124-1    : 0] src0_data, 
    output reg [2-1 : 0] src0_channel, 
    output reg                      src0_startofpacket,
    output reg                      src0_endofpacket,
    input                           src0_ready,


    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) 
    input clk,
    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) 
    input reset

);

    localparam NUM_OUTPUTS = 1;
    wire [NUM_OUTPUTS - 1 : 0] ready_vector;

    always @* begin
        src0_data          = sink_data;
        src0_startofpacket = sink_startofpacket;
        src0_endofpacket   = sink_endofpacket;
        src0_channel       = sink_channel >> NUM_OUTPUTS;

        src0_valid         = sink_channel[0] && sink_valid;

    end

    assign ready_vector[0] = src0_ready;

    assign sink_ready = |(sink_channel & {{1{1'b0}},{ready_vector[NUM_OUTPUTS - 1 : 0]}});

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZIp3firEDiPhT/TsP/QvFtXAshgliAts0qQ048d3RY4BB/nNZFSn+a9DDiFGP57ZMEJSNQmavjah7b3DrjuIVHi8qbZSqOl0qfNyZfX5SiM4uLZ2KbcLo4W7CIWagxllKT5sUJhRB0xTCHSJOFCpnk+UZghx7tH1S8GN3HnkJL3jHutwJkWpY40oRTfl/eiJuBPyYbgxHSsL1L7ySD572CzkJry1iKQpaGkGWexstkBxgcRN49jsns91NnoEYcuTuURU5vySJedgYJevTSL+BRN2tKlD0l/mQAxQHYcR573teGqHMcOTZUcZsfJd9kLAk85gnjIspYSV1l/oKqeLXfFB85E6nWdFsbRDPhdEx9GTmq1PYOIZ6ZsWgfFVVOIVLWxsvp8+pMk6xSgnaOwRoQcFilGNY+Oep50gZCh9AXoV0jIkPPmfuTE9i2rbvgZ7LWyYxjf6+bxl5b+sFTId0lfLOG6DiO/9Dxhfdhm2gEXNdr06LQQywpAOcQjM7nSn8rwRF1d8j/YN95gLFBFUB2LpykB3oPv9jnefAG74azJ35V3jXrqlgTn/sOhOJkP2G9Choa1Ppy48O4mUnUBq2k6OeaOlz1Ch1rrCdSDKh3vpsmskL1gXspVt9oMUlwGUyTDITee0u2bygtywwlYdb+rk9zimfsqoYgCgXzlCJ10BfpcLiMjZtJowuEslhJBGGTQm6PcVdgfEZ6W8PdSaJHgNJvJSSVq8/DSxjn0aJdwxkCUMM5ecTpW8AYtVXtB45pqs/SmT0BChs5IVr4BXec1"
`endif