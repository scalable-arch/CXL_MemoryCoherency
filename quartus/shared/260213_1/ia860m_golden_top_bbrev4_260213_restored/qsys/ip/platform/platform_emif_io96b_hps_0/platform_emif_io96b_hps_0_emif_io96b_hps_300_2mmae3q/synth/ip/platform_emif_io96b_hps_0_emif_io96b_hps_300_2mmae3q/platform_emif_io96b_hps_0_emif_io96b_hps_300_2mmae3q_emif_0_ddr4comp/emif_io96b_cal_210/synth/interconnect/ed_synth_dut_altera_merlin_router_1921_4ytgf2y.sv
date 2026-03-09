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


module ed_synth_dut_altera_merlin_router_1921_4ytgf2y_default_decode
  #(
     parameter DEFAULT_CHANNEL = 0,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 0 
   )
  (output [152 - 152 : 0] default_destination_id,
   output [2-1 : 0] default_wr_channel,
   output [2-1 : 0] default_rd_channel,
   output [2-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[152 - 152 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 2'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 2'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 2'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module ed_synth_dut_altera_merlin_router_1921_4ytgf2y
(
    input clk,
    input reset,

    input                       sink_valid,
    input  [188-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    output                          src_valid,
    output reg [188-1    : 0] src_data,
    output reg [2-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 152;
    localparam PKT_DEST_ID_L = 152;
    localparam PKT_PROTECTION_H = 162;
    localparam PKT_PROTECTION_L = 160;
    localparam ST_DATA_W = 188;
    localparam ST_CHANNEL_W = 2;
    localparam DECODER_TYPE = 1;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    localparam ADDR_RANGE = 64'h0;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

    reg [PKT_DEST_ID_W-1 : 0] destid;

    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [2-1 : 0] default_src_channel;




    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    ed_synth_dut_altera_merlin_router_1921_4ytgf2y_default_decode the_default_decode(
      .default_destination_id (),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;

        destid      = sink_data[PKT_DEST_ID_H : PKT_DEST_ID_L];



        if (destid == 0  && read_transaction) begin
            src_channel = 2'b1;
        end

    end


    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZKCRZDunxp11pcZ7jRi3lHqzfCUIVK+vvDRC68X7qSCbpckm0OWq4ejqr4Tsesb8n2LN0m7W6w26MWy0Rm5b7UcfrZU9B6ozEzm+aGVgaactY/KRSXBqT6A2ZPcn3TA6ezzSVJyV5Vy40YN7rCQF+8sJDQt7sl17au6qOxh7TIPbXlhvr4KBKGysppP4mzOliwj8Jwd7MR2is8WOddvvLO4srwbrfy0CXXo3xiM82odruCChOELgCXhh3Kb6pxLbEB1lWvkYFYxCSvJkBx7Td8Qy6/vHwlub6ZJNHWfGLXf1pnCB42QRRb+00v7qWgpSv4N6G88aXvfFvH/Za5/hQc0tNMq9xCZz+gSvSq2DmgBm//+5cepJ00xoSVGx0O8Y8Qt8jR/S8oAgnIk9NvYv8MhUwX+E3YxYAXSC0Ymldn57rStexq6oESNy16jI0u6qI5sRsvVR0kBEre2FdudvrLVT3oIk3SLwS6IWcNBD3oQ2gSuKAYRdgOnEausM/3hieFa9wPw01E9Ddbt4gEQOwv4n2idpX5+LDWJDqkVJEIH0vIyB5w8+I4qyHpkPWZwm11DeU/7zGk94FdW0IbpqQt8RPoozss4NrvoR9ChpTEtCkI5rqfjkeiJaF0/DJKF2UhbQEB/2+kQSG+Y+jgZyU29UyFkzMpVrnr7WKs5WNnscl2q8TIvvc+U59+z6U9TdzN5hAYpu/OAGC06K3RxOZhxM9FbZEK/FtW6yePgdrkXcjt2wBUJezrfxudu3nisFcgWS8WUABW06PWPge8gXHRx"
`endif