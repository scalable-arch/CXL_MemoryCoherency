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


// $Id: //acds/rel/25.1/ip/iconnect/merlin/altera_irq_mapper/altera_irq_mapper.sv.terp#1 $
// $Revision: #1 $
// $Date: 2025/02/06 $

// -------------------------------------------------------
// Altera IRQ Mapper
//
// Parameters
//   NUM_RCVRS        : 0
//   SENDER_IRW_WIDTH : 32
//   IRQ_MAP          : 
//
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module platform_altera_irq_mapper_2001_zncqspa
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,
    // -------------------
    // IRQ Receivers
    // -------------------

    // -------------------
    // Command Source (Output)
    // -------------------
    output reg [31 : 0] sender_irq
);

`ifndef ETOOLS_RESERVED_DC 
    initial sender_irq = 0;
`endif

    always @* begin
      sender_irq = 0;

    end

endmodule

