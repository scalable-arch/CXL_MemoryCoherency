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



module ed_synth_dut_altera_merlin_multiplexer_1922_252f2xa
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
    localparam PIPELINE_ARB     = 0;
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
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZIuNKHpsodR4eglfSuUxzR8LoeL3vz3WZShjAkcv6A0JiylwtQApYIpkYqk12QF58ShFNpA0DhUMl0DCEKVzYX1lUwNstODRa59YeHnlabLw1m/M5DCfHKdg349LSyPbiC/l6wnHLrHi3yKR8GcBB0z5Qoa5Bb1pvZRPiawgb6pvFUt3IL46Y3Z7zhgLgBO2GXCXKQZmxqOpdWLw3JiHRjI/EEQnK1ZfAz8iNo0bTp6qL8mINarwSdyWGy6OY8g5BGq2KPpRGWoVcIc4ljtoBKK0ClHPNr4fZDae8lInbIhsiEWGnmbTdI/e6eHajHMrzo1us3UcOgE3Z7+D/nI2F4U8+xa2dmSDqILlZbR4VDubPQ+SHYOCtz5T5eR7PSXdC5FSM0K6gWZxlfwe7Ghh/Lnad/G3dfgS5YXUlDWhHajb5TT95L+jvXvR/9Qwg0vIqqRI6ogoblm1FQaFY9OIB7THujoJT1OMtwvUoUAnVrPnVJoSP1ZPNgQU4WJ3RA4m6l+/5Y4R+3UQqjKieNjW4l3hVihzfN682u89H5nwBaQnEpizoTEz2RAOpkUT54H7ZBpgmWlArVE4MpL0eQhQOrmLPwr4CiSEC/mwAPQEdkBRmnVuBLIBA8ZeJnarQtcWZ67APvnkZEpJvrHriy7wVOSBYqsRi/yG0pFGq8WaKEHF+tgeWxCeMO41F62DFq4eBE5vF0l72sZcrm21bq/yFgiMp3AAhFAS5WBJgAOl4hBKfN7J/8f+wJT9X32NZt8OOBoJT0tTC7duqs+l6mYjwyw"
`endif