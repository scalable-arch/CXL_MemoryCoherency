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


`timescale 1ns / 100ps

// this module has zero ready latency input and non zero latency output


module ready_latency_adapter # (
 parameter READY_LATENCY_OUT = 2,
 parameter PAYLOAD_WIDTH = 256,
 parameter LOG_DEPTH = 3


) (  
 output logic         in_ready,
 input  logic            in_valid,
 input  logic   [PAYLOAD_WIDTH-1: 0]  in_data,
 // Interface: out
 input  logic             out_ready,
 output logic          out_valid,
 output logic [PAYLOAD_WIDTH-1: 0] out_data,
  // Interface: clk
 input logic          clk,
 // Interface: reset
 input logic           reset

 /*AUTOARG*/);

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   
   logic [PAYLOAD_WIDTH-1:0]   in_payload;
   logic [PAYLOAD_WIDTH-1:0]   out_payload;
   logic            in_ready_wire;
   logic            out_valid_wire;
   logic [2:0]      fifo_fill;
   logic    rdreq;
   logic empty;   

   logic [READY_LATENCY_OUT-1:0] in_ready_dly_reg;
   logic in_ready_dly;
   assign in_ready_dly = (READY_LATENCY_OUT > 0) ? in_ready_dly_reg[0] : in_ready;
 
   localparam DEPTH = 2 ** LOG_DEPTH -1 ;

   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data};
     {out_data} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| FIFO
   // ---------------------------------------------------------------------                           
    scfifo_s # (
      .LOG_DEPTH (LOG_DEPTH),
      .WIDTH (PAYLOAD_WIDTH),
      .ALMOST_FULL_VALUE (DEPTH-1),
      .SHOW_AHEAD (1),
      .FAMILY ("Agilex")
    ) fifo_inst ( 
       .clock        (clk),
       .aclr       (reset),
       .sclr (1'b0),
       //.in_ready   (),
       .wrreq  (in_valid && in_ready_dly),      
       .data    (in_payload),
      //.out_ready  (out_ready),
       .rdreq      (rdreq),
       .q (out_payload),
       .usedw (fifo_fill),
       .empty (empty),
       .full (full),
       .almost_empty (),
       .almost_full ()
       );

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
      in_ready = ( DEPTH- fifo_fill > READY_LATENCY_OUT);
   end

    always @(posedge clk) begin
        in_ready_dly_reg[READY_LATENCY_OUT-1] <= in_ready;
        for (int i = 0; i < READY_LATENCY_OUT - 1; i++) begin
            in_ready_dly_reg[i] <= in_ready_dly_reg[i+1];
        end
    end

assign rdreq = out_ready && !empty;

assign out_valid = !empty;


endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "7MBsfGNfLBj+3Zi0T+jPOOUG+uBbozaZWVDc4xAFLKvkE7uHMcMX/Sb/YzYLVWEO4dPcV49X5MnL3Ek9SCr5TxAoL3kAbmnHB0r2kq59JrxDdeZquVD0c1SUF14wlg3eyf66c5j3gg8NQDtmre7iyEUOtx0c6jRrIT9v7LBW/+u5RCTAfPF6zxCuM2/BFtpOIcKwM+ejcvpE3I08RyJgOSecDgBO8M6JsXsm1V3AwfLH5mhjsReZMwgWPzZHq55Smoiz42+ZCpCxdQKSh6lJegY+vATEoFXJXzepqOvJxkqhGPO1P7wDqqJzMMEN3PZJtNYaCmfz9MubeH7kZ9HH3FAok89JwB9Ur5zouyswf7fgeFcwa2weyZFqGS6OyfsyzyjPdJh8h7PChlrq2mIKyt0cahrqB1T+l3sOFymcDXrYjf9xB9RYGL+UjryWCP8GxctxYd4zOYY5jObg27DrBdJZ6cxd+L3Xj0oxzhqhDDAD4U7dd2PzzFq36ebKd0iREfqA/qcAtxI0cGbx0CLlycELpMFmtFZ5JaQmgIm5iY5S2XVessXOy0OsEq4El4DaX7qQmNTUm/4sYdDYl7qRldgNFDfSm783BcWcg8+XO5xZ7QOumAM2bMK2kSB1WqFj2mfLJIjMgpEBjKk3CP2voGvD6GzpCp30Wu071oVs/nDXV/46M8zhGqZvgPkbyBACm3iOjBCWouC9wRf8YxagGHB4rRmUiOOBV1JXRfpzEfHUnLYLU9LHOVC/cOg8Js3lEtCA/iYESaQKd8V1qplhwH7TvuY4mmnr8BB0Wp7xwj4IE+SEKm/s3wlw435nlRgsiZBvphuWTm0JfphVTn6QxNJC7c9O18hK/B0EzMRQoF2rJyJ7m0qNIYqdlV49tIQDs6xDFD6IQu8GKjM83TXqOgTzBoEdAOqzwIRKTy+/nowpn0v8QHyrhyv6DIpoe/X7v6R1NZskiKxqvmVQ2QbRWmSuBIF4tVzVVFmN1u+2qYKpPZRAuEKlRE8o4kYMIOz9"
`endif