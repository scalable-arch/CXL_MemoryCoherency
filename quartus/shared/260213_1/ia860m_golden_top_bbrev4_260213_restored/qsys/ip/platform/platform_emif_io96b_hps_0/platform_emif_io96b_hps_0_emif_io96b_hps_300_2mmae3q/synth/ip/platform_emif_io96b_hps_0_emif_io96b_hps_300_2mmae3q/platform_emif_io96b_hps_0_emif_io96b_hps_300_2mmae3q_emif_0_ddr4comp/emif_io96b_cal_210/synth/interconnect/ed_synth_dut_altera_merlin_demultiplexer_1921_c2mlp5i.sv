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
module ed_synth_dut_altera_merlin_demultiplexer_1921_c2mlp5i
(
    input  [1-1      : 0]   sink_valid,
    input  [440-1    : 0]   sink_data, 
    input  [2-1 : 0]   sink_channel, 
    input                         sink_startofpacket,
    input                         sink_endofpacket,
    output                        sink_ready,

    output reg                      src0_valid,
    output reg [440-1    : 0] src0_data, 
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
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZIwfVt4lIRchxsRV9VrlIuWuuUXWyZJcyg4y984oXNgdHjDWXBZEG5BmcWw58T5UGxiaSZ7UXZxz34iSRzjgX8Qy+feI3FMKq6ODYPqLdt6B8vV9GCW84SJMk+AKqj75TCCLZF+0plhqAnBMKMwAuW5YgJLhHFskgrJ1B0+whmcycyhXeUykEz2mqs20yQnll7ayKBDLT1sB6reC17kxT+VzIQHz/kC640GRlD+gBV5rQz9rt9IZZE5qk/FN1d3N6trMvnHePMuBORuqlzt1V8z7UnbGAr/pVsB9OmnwlYU3Mq2RTWGXGu7MR2nt/kCrasUjcSSoj+InCMPp0wY5PATdA8Tz63CBj+aPUdvU7mWRfs/ft8kF8Lyu4fBOJ17l1xLUK8XqZdKV7ouZt+NxTpLuexDRqrH5105krI/smKLoutyWs/eDG+oVKhgLmyF1rgz03EeopxbucFsOoLJhqn24OAQg+wxQRm6GeP6+70ZT14vV2P8QU9wfgXtZZkBw3AOaPyrD/+v6OWHB+mmTzll19omZsYb1iSvD5cpeguahs4nOzS/m/NbvPY7G47/8QmMXD+bNQDgBzW/Kt7pcN5kTNSt/V/hl2pNs3yV8r8ACu9qqVjYbPyYdJHUe9SKh/Y9So8/UgsCY9nR4B2a7lYFiaYTGLW00jPePjfG4v3gtuDM7OSJ6weWF5TJRwMshJgCXe/lwRe4dGPj2tzgtLhRGd7aefvN0W3GfgBn/WFDyxsWUEZveVgfttE5YIdPM4SudJoCCi8r8/WjvppsuTk6"
`endif