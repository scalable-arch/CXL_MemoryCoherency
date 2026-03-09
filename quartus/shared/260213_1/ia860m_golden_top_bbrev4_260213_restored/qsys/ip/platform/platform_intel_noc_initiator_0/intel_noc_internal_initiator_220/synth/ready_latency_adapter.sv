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
   logic [LOG_DEPTH-1:0]      fifo_fill;
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
`pragma questa_oem_00 "HVwoXV44HvrqLCcyrRLKSPYKBkDWFb/QkVjwDEQ824LbpdY1lpyfSDRh2R2XXI3HT559WzzSGaylMrfix9K0v8D4bP8N/5F2s7q2IVIU3Zbvvtm48IozW/C3YtteWjdzPbWSHrpgM8/tQexSu730vbHbwtI/7bmZ6hVhmDj7iMt/1xxbYHvxq//o4LrluwXjtRNow/nPFObAl3yz5rR4pw9RiExjXrLroBGh1KHp3ENwvvZRzYHGhWsWG9tA4YtPIl0jk16gxVVve4PYD1cTxWNSjlstVIKfYsjEFCdK65jIJAzll21HlTS4elXbYmNitbOu4EvcO2eIGbq/c0B8ezZ/6vEPIfNQ3LUA0Ni34GrJZXNphOetOSDQmgxsGEOXyOskM+UDNsgUMJ+oShuD5es7mLlb/C/J78w8BMdEb934+29NLoMQrt8i5wrB1/+1n3Eg5HVEsOXIaIm+UytTVwWeHxczvGzpODovhUz7knf0VrloHXAohuhNn6oGka8ucd+42MEn6niLmBuv/SoMpGK0zF2j4AfafStU4OiDZLKfbOVyyeL5N6z0OQKptVnRGtXhXMzgn8p9njEamG9R7/zRkjNn+43pRaA+aW0GwJJVqnMtzgcNz6Nx760cZ11Y/tblO+Vdi0EgCeGAyxkdllb4e+E9ara+52ghjBsFo4rerToD45zPkbt75/imrz3118k3VjBdrx7slRDgVJN1QMOx18VynYOWu45LQKIRVT9u+bAwj/AP2psChrp5zroZMfjBl0gp4tPMln7jVjQUR7dCs7Yq2a3I145mZBY3/ffKfNDuBM4dTd8SraCPW3FYnVef5WSiRhl8yCxB7MjoT21iJbRuuDwaUEUw8rkO3aYIL6scPiNvuJPNt0sl59gV69+za/86MQZUHewbk3hCJHF6yQZaw9tmfl7IASd0upMJwa+taA65jMWIav4tbfl+bvU2KPeBmA3HA+ixOPmY3rvSt1kp9KCtUCrRyIfbNP2bJKAzwUS8xlkk+9zLR26z"
`endif