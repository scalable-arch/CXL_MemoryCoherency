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



// altera message_off 13469

module ed_synth_dut_channel_adapter_1921_fkajlia 
(
 output reg         in_ready,
 input              in_valid,
 input     [8-1: 0] in_data,
 input              in_startofpacket,
 input              in_endofpacket,
 input               out_ready,
 output reg          out_valid,
 output reg [8-1: 0] out_data,
 output reg [8-1: 0] out_channel,
 output reg          out_startofpacket,
 output reg          out_endofpacket,
 input              clk,
 input              reset_n
 
 
);

    wire in_channel;
    assign in_channel =0 ;

   always @* begin
      in_ready = out_ready;
      out_valid = in_valid;
      out_data = in_data;
      out_startofpacket = in_startofpacket;
      out_endofpacket = in_endofpacket;

      out_channel = 0;
      out_channel = in_channel;

   end

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZKqThzit7DnpgQaq/p9Hk7D3bUgB49TqbpyWRqNfvPiY6BagID0Ffv01Q3pE0we1wozurqqKffT879woe7hX2NtbBLjQEpsgtOOp1ZMxNZ6BgAtx4PoMw4hkF0Y2UFiD25KX5xkrkLi04slNNQjj11c39pk42JJiNVgXNbxb6ldn9gdd6D4OobDYbWOjqQ2Bq2/1vhKh0GE40lWnVjCmjNhau5IoStuqIOkrjx8ic0CfOzxGuEhbt/8664iV4PCKKD3OZSUcwZ8i3Fzg33fLwCCtZDX+F2G+s2iLwdIsYGeJNtErGnjFDE0Qjo5H3qCajAyPea3Dt9lDy7LwcrWXR2w7W22dx7wiSPzxQALb9ZSbWhnFfaPwmESLaP/tbKKpkHD6CmCpVGp/aKzTqHvmzUMBor9A133BfOu3Qxt1h75RmNTxKQNOJMgPI8YDpHETTZOLUox2/T1JlxxM5J/OoB/V+kp2qWwAa+hVHfvpHaFTRzqhztroMwx4X19lo6oL5+yhGD0kol+cYRNGK7pJM+XF0h2WpcAg2cmUrYT8WXDJu59R6KUSJBZ+tbmBEPIOA0+WrssO4BhigxDkPLt+U0WBwN04SWWINDdKzNO4xXQWS7+O1ilgBY5HGblWrCc3SXgfSljHsR555yJwNPC+fM2Vatz132j2xPInRHYb+lZ0DHzePbMl8SIBm6Z8K3LUhISTk4CXIr0s6LKnLxfO0J7VlEHrxp9oFaqJXRZYoYnpeoqK/Uf/9l5pszdjZNXfOVeaHGkFJDNMSQXiUW2wr94"
`endif