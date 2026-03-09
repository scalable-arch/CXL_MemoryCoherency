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





`timescale 1ns / 1ns

module ed_synth_dut_hs_clk_xer_1940_4s7hdhy
#(
    parameter DATA_WIDTH       = 8,
              BITS_PER_SYMBOL  = 8,
              USE_PACKETS      = 0,

              USE_CHANNEL      = 0,
              CHANNEL_WIDTH    = 1,
              USE_ERROR        = 0,
              ERROR_WIDTH      = 1,

              VALID_SYNC_DEPTH = 2,
              READY_SYNC_DEPTH = 2,

              USE_OUTPUT_PIPELINE = 1,
              SYNC_RESET          = 0,
              SYMBOLS_PER_BEAT = DATA_WIDTH / BITS_PER_SYMBOL,
              EMPTY_WIDTH = log2ceil(SYMBOLS_PER_BEAT)
)
(
    input in_clk,
    input in_reset,
    input out_clk,
    input out_reset,

    output in_ready,
    input  in_valid,
    input [DATA_WIDTH - 1 : 0]      in_data,
    input [CHANNEL_WIDTH - 1 : 0]   in_channel,
    input [ERROR_WIDTH - 1 : 0]     in_error,
    input in_startofpacket,
    input in_endofpacket,
    input [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0] in_empty,

    input  out_ready,
    output out_valid,
    output [DATA_WIDTH - 1 : 0]     out_data,
    output [CHANNEL_WIDTH - 1 : 0]  out_channel,
    output [ERROR_WIDTH - 1 : 0]    out_error,
    output out_startofpacket,
    output out_endofpacket,
    output [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0] out_empty
);

    localparam PACKET_WIDTH = (USE_PACKETS) ? 2 + EMPTY_WIDTH : 0;
    localparam PCHANNEL_W   = (USE_CHANNEL) ? CHANNEL_WIDTH : 0;
    localparam PERROR_W     = (USE_ERROR) ? ERROR_WIDTH : 0;

    localparam PAYLOAD_WIDTH = DATA_WIDTH + 
        PACKET_WIDTH +
        PCHANNEL_W +
        EMPTY_WIDTH +
        PERROR_W;

   
    wire [PAYLOAD_WIDTH - 1: 0] in_payload;
    wire [PAYLOAD_WIDTH - 1: 0] out_payload;
   
    assign in_payload[DATA_WIDTH - 1 : 0] = in_data;
    generate
        if (PACKET_WIDTH) begin
            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH - 1 : 
                DATA_WIDTH
            ] = {in_startofpacket, in_endofpacket};
        end
        if (USE_CHANNEL) begin
            assign in_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W - 1 : 
              DATA_WIDTH + PACKET_WIDTH
            ] = in_channel;
        end
        if (EMPTY_WIDTH) begin
            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH - 1 : 
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W
            ] = in_empty;
        end
        if (USE_ERROR) begin
            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH + PERROR_W - 1 : 
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH
            ] = in_error;
        end
    endgenerate

    generate
    if (SYNC_RESET == 0) begin : async_clock_crosser
       altera_avalon_st_clock_crosser
       #(
           .SYMBOLS_PER_BEAT    (1),
           .BITS_PER_SYMBOL     (PAYLOAD_WIDTH),
           .FORWARD_SYNC_DEPTH  (VALID_SYNC_DEPTH),
           .BACKWARD_SYNC_DEPTH (READY_SYNC_DEPTH),
           .USE_OUTPUT_PIPELINE (USE_OUTPUT_PIPELINE)
       ) clock_xer (
           .in_clk    (in_clk      ),
           .in_reset  (in_reset    ),
           .in_ready  (in_ready    ),
           .in_valid  (in_valid    ),
           .in_data   (in_payload  ),
           .out_clk   (out_clk     ),
           .out_reset (out_reset   ),
           .out_ready (out_ready   ),
           .out_valid (out_valid   ),
           .out_data  (out_payload )
       );
    end 
    else begin 
       alt_hiconnect_clock_crosser
       #(
           .SYMBOLS_PER_BEAT    (1),
           .BITS_PER_SYMBOL     (PAYLOAD_WIDTH),
           .FORWARD_SYNC_DEPTH  (VALID_SYNC_DEPTH),
           .BACKWARD_SYNC_DEPTH (READY_SYNC_DEPTH),
           .USE_OUTPUT_PIPELINE (USE_OUTPUT_PIPELINE)
       ) clock_xer (
           .in_clk    (in_clk      ),
           .in_reset  (in_reset    ),
           .in_ready  (in_ready    ),
           .in_valid  (in_valid    ),
           .in_data   (in_payload  ),
           .out_clk   (out_clk     ),
           .out_reset (out_reset   ),
           .out_ready (out_ready   ),
           .out_valid (out_valid   ),
           .out_data  (out_payload )
       );
    end 
    endgenerate 
    assign out_data = out_payload[DATA_WIDTH - 1 : 0];

    generate
        if (USE_PACKETS) begin
            assign {out_startofpacket, out_endofpacket} = 
                out_payload[DATA_WIDTH + PACKET_WIDTH - 1 : DATA_WIDTH];
        end else begin
            assign {out_startofpacket, out_endofpacket} = 2'b0;
        end
   
        if (USE_CHANNEL) begin
            assign out_channel = out_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W - 1 : 
              DATA_WIDTH + PACKET_WIDTH
            ];
        end else begin
            assign out_channel = 1'b0;
        end

        if (EMPTY_WIDTH) begin
            assign out_empty = out_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH - 1 : 
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W
            ];
        end else begin
            assign out_empty = 1'b0;
        end

        if (USE_ERROR) begin
            assign out_error = out_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH + PERROR_W - 1 : 
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH
            ];
        end else begin
            assign out_error = 1'b0;
        end
    endgenerate

    function integer log2ceil;
        input integer val;
        integer i;

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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxz8t3bpmLej0hwOxjkX/esFBbB/prOeemTuml+ZPwWerPEftkloBrbMPloLqC6Im9IHLJlEfT8Vm5X0Vgv8yawNAsCY9zTw/XX76GVa7qFvpMetPErZtZ/DaYB1YVPKsApz3iDsTScFwb4O0joNZky6Fgis+eZd+abm5EMipfr2V4wZKnNhtNjdlnqjPkQ9TWPc9f7EmYWVSap00Q1ZDLYoMa9UL1bSxMIRRzvMXlJ44PZTGd4T4WpZsqiJyYo2vRVa9jkizwqHRH8BUsxIYgf/1rcY64WWBwNYndEgk+F7cLWZxDZPUiLRQDRJkAFPxeyugpMKpDOYU/pCtgZF10eGb2eundNJjYS3t7lc3Iv+taadQubjTliGn5vHY0Iy93KMDMuKmbDO8c1jAmluCloTqzKdemAalzrY8qp4+Bzce/Zg5tjB5AY7e94N72C+Nh5lERk1MUYSrhvk1m9NeQ4aYbZewE4qWajIaQgTlzAFDovG9YrHUj3dfGqA6wlbU0vMdvRVs82ITIjaS/KUF9ZUYUoppvzkXsUXapAj1h6mQ8m4M6JyY24nAHyurhUH2cRA938Z1LHpeSxcgS8TOHt/mBQxiecYPHzC8KHZvoqJEUZg/PnWd45BxdFn6SWr/EW7+Im/eA0TEjA1EiyTa9BSrAs+JczNKgCn2cwO7l3mTE3u3Es8jJ/ULbDGjvn30b94nQbbV5Ue89Tc2aiAT19iq5TPmX2gb/ODF91ob4WVwKE9Y9agXCk+GmsP7xpNGOEOO4MM+h/5GNf4GFfWV1a5"
`endif