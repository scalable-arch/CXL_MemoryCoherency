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

module ed_synth_dut_altera_avalon_st_pipeline_stage_1930_bv2ucky #(
    parameter 
      USE_FIFO_IP = 0, 
      SYMBOLS_PER_BEAT = 1,
      BITS_PER_SYMBOL = 8,
      USE_PACKETS = 0,
      USE_EMPTY = 0,
      PIPELINE_READY = 1,
      SYNC_RESET     = 0,
      CHANNEL_WIDTH = 0,
      ERROR_WIDTH = 0,

      DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL,
      PACKET_WIDTH = 0,
      EMPTY_WIDTH = 0
  )
  (
    input clk,
    input reset,

    output in_ready,
    input in_valid,
    input [DATA_WIDTH - 1 : 0] in_data,
    input [(CHANNEL_WIDTH ? (CHANNEL_WIDTH - 1) : 0) : 0] in_channel,
    input [(ERROR_WIDTH ? (ERROR_WIDTH - 1) : 0) : 0] in_error,
    input in_startofpacket,
    input in_endofpacket,
    input [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0] in_empty,

    input out_ready,
    output out_valid,
    output [DATA_WIDTH - 1 : 0] out_data,
    output [(CHANNEL_WIDTH ? (CHANNEL_WIDTH - 1) : 0) : 0] out_channel,
    output [(ERROR_WIDTH ? (ERROR_WIDTH - 1) : 0) : 0] out_error,
    output out_startofpacket,
    output out_endofpacket,
    output [(EMPTY_WIDTH ? (EMPTY_WIDTH - 1) : 0) : 0] out_empty
);
  localparam 
    PAYLOAD_WIDTH = 
      DATA_WIDTH +
      PACKET_WIDTH +
      CHANNEL_WIDTH +
      EMPTY_WIDTH +
      ERROR_WIDTH;

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
    if (CHANNEL_WIDTH) begin
      assign in_payload[
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH - 1 : 
        DATA_WIDTH + PACKET_WIDTH
      ] = in_channel;
    end
    if (EMPTY_WIDTH) begin
      assign in_payload[
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH + EMPTY_WIDTH - 1 : 
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH
      ] = in_empty;
    end
    if (ERROR_WIDTH) begin
      assign in_payload[
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH + EMPTY_WIDTH + ERROR_WIDTH - 1 : 
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH + EMPTY_WIDTH
      ] = in_error;
    end
  endgenerate

  localparam NUM_128BIT_SLOTS = (PAYLOAD_WIDTH / 128) + (((PAYLOAD_WIDTH % 128) == 0) ? 0 : 1);
  localparam LAST_PAYLOAD_W = ((PAYLOAD_WIDTH % 128) == 0) ? 128 : (PAYLOAD_WIDTH % 128); 
  genvar i;
  generate 
  for (i = 0; i < NUM_128BIT_SLOTS; i = i + 1) begin : gen_inst
      if (i == NUM_128BIT_SLOTS - 1) begin
         altera_avalon_st_pipeline_base #(
           .SYMBOLS_PER_BEAT (LAST_PAYLOAD_W),
           .BITS_PER_SYMBOL (1),
           .PIPELINE_READY (PIPELINE_READY),
           .SYNC_RESET (SYNC_RESET)
          ) core (
            .clk (clk),
            .reset (reset),
            .in_ready (in_ready),
            .in_valid (in_valid),
            .in_data (in_payload[(i*128)+LAST_PAYLOAD_W-1:i*128]),
            .out_ready (out_ready),
           .out_valid (out_valid),
           .out_data (out_payload[(i*128)+LAST_PAYLOAD_W-1:i*128])
	  );
      end
      else begin
         altera_avalon_st_pipeline_base #(
           .SYMBOLS_PER_BEAT (128),
           .BITS_PER_SYMBOL (1),
           .PIPELINE_READY (PIPELINE_READY),
           .SYNC_RESET (SYNC_RESET)
         ) core (
           .clk (clk),
           .reset (reset),
           .in_ready (),
           .in_valid (in_valid),
           .in_data (in_payload[(i+1)*128-1:i*128]),
           .out_ready (out_ready),
           .out_valid (),
           .out_data (out_payload[(i+1)*128-1:i*128])
         );
      end
  end
  endgenerate

  assign out_data = out_payload[DATA_WIDTH - 1 : 0];
  generate
    if (PACKET_WIDTH) begin
      assign {out_startofpacket, out_endofpacket} = 
        out_payload[DATA_WIDTH + PACKET_WIDTH - 1 : DATA_WIDTH];
    end else begin
      assign {out_startofpacket, out_endofpacket} = 2'b0;
    end

    if (CHANNEL_WIDTH) begin
      assign out_channel = out_payload[
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH - 1 : 
        DATA_WIDTH + PACKET_WIDTH
      ];
    end else begin
      assign out_channel = 1'b0;
    end
    if (EMPTY_WIDTH) begin
      assign out_empty = out_payload[
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH + EMPTY_WIDTH - 1 : 
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH
      ];
    end else begin
      assign out_empty = 1'b0;
    end
    if (ERROR_WIDTH) begin
      assign out_error = out_payload[
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH + EMPTY_WIDTH + ERROR_WIDTH - 1 : 
        DATA_WIDTH + PACKET_WIDTH + CHANNEL_WIDTH + EMPTY_WIDTH
      ];
    end else begin
      assign out_error = 1'b0;
    end
  endgenerate

endmodule



`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZLKIox+sLSYghQZSan45PGrGaKsIWag5/ONQKNoXXcuVecwJ9KQuzZ3KbuZjI7oQVx/+nzHO6eTvJBKifhrjoCsas2DyoBzqqgInLpIjffpru39K4pRypZJif2iFarGUIKNlgmzrnCxCtd8LXRE7qNdVgBkoKmTiyZ4ZZFp15qNjVzDSnNp/dWGjp4WA1kCuZUgS7hkns528a7zaezgKNrYLc3afVK3voGlX7XRPlcmap39ZvAvCjF6Y18RPiCiZKksqlcO5qTcVtssDI2lodcVOpHH8lexz7StfZ2q/u9jjq+SrEgC0vCjQhRYQ6IoQbbAdmggDk8koaOVikar+KxBqOREUbFKGSNa8bFcrRufI0DG1JeAdwRZuwHDNS3Pfeiuv7eYtlz5FFgZm5dZ3NzIj5GUZ5qdh7wutPM3CndP7TCk6biziZOLjMH+G+ojhnoJEg63YKX3Qs0vSrkvHYIJE9ene52I1Fe/fOnERZJSWc6kFjbdzgro47nXFA+1CedUXqLsbqOqxKEEfZYDATQVZgJhQTnO4PQ1/KN/Z9mckFmIQuKpVeQ7GMHbXr6rclCFgdmxzxB83ZO3oDBYR/Je0oXyFcjkOGvQcvoovOfiB8t0moxp1z/H5KLQJKdGx3SspMWzh8c1zUc9d53rbK/cu9EtBkw1DOTmHw8CXcWwpPPl13/0WLrLQITe1eLYjb8lXrPKdrVuOOPsMMW6HhYJcnpiV6ruter38XhMKqU8xHIEB9ZWJkEm95LypK+rXYYhY1h2CEMtCQERXE+azvPu"
`endif