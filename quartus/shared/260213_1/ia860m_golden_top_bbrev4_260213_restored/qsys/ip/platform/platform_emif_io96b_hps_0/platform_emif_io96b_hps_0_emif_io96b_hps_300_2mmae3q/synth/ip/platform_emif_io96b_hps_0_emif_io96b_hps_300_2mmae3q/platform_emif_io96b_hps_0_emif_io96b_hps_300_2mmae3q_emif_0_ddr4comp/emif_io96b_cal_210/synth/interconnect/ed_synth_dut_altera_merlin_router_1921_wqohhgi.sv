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


module ed_synth_dut_altera_merlin_router_1921_wqohhgi_default_decode
  #(
     parameter DEFAULT_CHANNEL = -1,
               DEFAULT_WR_CHANNEL = 0,
               DEFAULT_RD_CHANNEL = 1,
               DEFAULT_DESTID = 0 
   )
  (output [88 - 88 : 0] default_destination_id,
   output [2-1 : 0] default_wr_channel,
   output [2-1 : 0] default_rd_channel,
   output [2-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[88 - 88 : 0];

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


module ed_synth_dut_altera_merlin_router_1921_wqohhgi
(
    input clk,
    input reset,

    input                       sink_valid,
    input  [124-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    output                          src_valid,
    output reg [124-1    : 0] src_data,
    output reg [2-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 88;
    localparam PKT_DEST_ID_L = 88;
    localparam PKT_PROTECTION_H = 92;
    localparam PKT_PROTECTION_L = 90;
    localparam ST_DATA_W = 124;
    localparam ST_CHANNEL_W = 2;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    localparam ADDR_RANGE = 64'h100000000;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [2-1 : 0] default_rd_channel;
    wire [2-1 : 0] default_wr_channel;




    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    ed_synth_dut_altera_merlin_router_1921_wqohhgi_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (default_wr_channel),
      .default_rd_channel   (default_rd_channel),
      .default_src_channel  ()
    );

    always @* begin
        src_data    = sink_data;
        src_channel = write_transaction ? default_wr_channel : default_rd_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

           
         if (write_transaction) begin
          src_channel = 2'b01;
          src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
	     end
        
           
         if (read_transaction) begin
          src_channel = 2'b10;
          src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
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
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZKrIlp3nVNdifbd38kT1M2Jqskvz8q0DzG+3whILz0SDsmqZHV16S206lySA9qe/vjm3m3rgmcO4/rbH/Zr6HOQaT9JmwzX7KVR9rc/z8/8JY0FKTiXUKzS6Xs0pzCf+qr5VwcmHP2JJq1pbJxmhm74PhUKx4uv5tHuVeEMbsmYJPgcpjn3BJrrWrys0x3oSa5G3I3CRCbMe3dE9BBK8A3hw94Ffz7T/Rxlz4jhCgn2hfFUbbAbr0lxUwSPLYYtbIRB6Zak7C/cgRH5epBRxhnxMq8zan3anHnJyyN1Q8rI7kroPINhd1TJVIoMOTJUHWn273Nm0U84eotokx0Fc08bfG3MYDcRHE94NW37piZAjbU0eFZco5zM75e98pTZn0tTr/Mx2DGuzPBPTDhMt+OoLJDhV2SFU/gEokIhMQwwXNYXW4Xd3eTbJq9Y5+RruVufs5rE98ZRs/xLyhy2xstL81NZHZLAeuHcgVTJoeIur4tWjTlbsnhoAaU7DHhcEj8a6dpKBEeN3S78RyrsX/eFRNZFDRuylTuwWoFD0VfxPlimlCwPdOpJ1EEhxzRPUdhH52Iv3cx5QtU/BCAJ8NRGsWVXXzFEAY1puHFZge4kXccJwPgsvnCcNyzAaiV6CLhXF4ZqRRN/VTIT+IVrTwnyHDpEG75ZKFGwajJLg5Y5Pj9sXqztn1I8NL87o2yGMG9YdLjC9tq0WYXosnkF8tljYkbyREKro34QR9iviTGIngAtkyvX7rXPmR1VuuAMTbI+pnbFey3ViyevQAQEMqkJ"
`endif