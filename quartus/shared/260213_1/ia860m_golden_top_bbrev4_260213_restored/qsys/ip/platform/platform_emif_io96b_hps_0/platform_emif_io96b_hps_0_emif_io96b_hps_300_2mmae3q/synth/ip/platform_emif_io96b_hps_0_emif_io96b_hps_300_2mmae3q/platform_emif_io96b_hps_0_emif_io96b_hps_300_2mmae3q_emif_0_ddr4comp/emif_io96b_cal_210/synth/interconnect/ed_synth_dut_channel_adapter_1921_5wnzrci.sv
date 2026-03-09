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

module ed_synth_dut_channel_adapter_1921_5wnzrci 
(
 output reg         in_ready,
 input              in_valid,
 input     [8-1: 0] in_data,
 input [8-1: 0] in_channel,
 input              in_startofpacket,
 input              in_endofpacket,
 input               out_ready,
 output reg          out_valid,
 output reg [8-1: 0] out_data,
 output reg          out_startofpacket,
 output reg          out_endofpacket,
 input              clk,
 input              reset_n
 
 
);

    reg out_channel;

   always @* begin
      in_ready = out_ready;
      out_valid = in_valid;
      out_data = in_data;
      out_startofpacket = in_startofpacket;
      out_endofpacket = in_endofpacket;

      out_channel = in_channel; 

      if (in_channel > 0) begin
         out_valid = 0;
      end
   end

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZIGvuNXE9wNF3nZZDe+3I0/gTcf4lAZ/1PYpBL8AEkMbBF1ha0uh/5KQl4jnDgMdazvr7w+wt4HWJTwXN8CU6vrWHyoNDL/Jo4p34aClcPbwlYSl/q1SZgTR4cWIMcIp6e9ouQBjAEdQcP5HeuQmAOOlS33nVHIdqZFxXeGLM9a9Q7fVXv4s2b03+RqCLFqEwf3PcV05DtZuMp3mn7oUHPk+xBgPqSenQN1wz7gjj1Zh8z83RijFkku64Z4O2M8DVAKGFkyBFXAyWLUijb8+CUUiMysfiNIgdzw5lFPAfcfECkLnc5LUes6kQeS7rucAGxo8LkFB3pqcDapaVOsDYsKGTD82Q+Oda04c9Hmg8B2jcb5ZfOZQ5kSgaMeWi7THnCPHnkPFyEqQ9aThoN17fXSUDEvLB69lmrUXNSeK6WZLND2nIO+mDhLGWFkrTjK8jwSm1mk7i0CaK50NWmig4rwZ+SmuAvfTvHoemWFp0osY8t1GBlK3bEbxcYcLKeI1VPbaroEKT6YiNHNqEGXY4HWQKurAx99Z9uOuS7YX1q5qRDXC1lPwk0LChOJZSSkvAvZATnPrN31IYktiEZRntk4mEEpwf4oJSSSQGY20qeuwxLu+WcR2IoRet6leHS80KkGVMS0K6pNgxssKbWCOelKALhcK/7prTyUrfeJ13F9kzOBZP7nqpobuudOUrWO8Ow32oXSfpibf8/sF0Xz5XoBT1dYyJFe2Ht1qG9SU1dXTlTv3Rg0hJ1fWFPijETTOrrlPiN3wUFtg2P/KObsnFeq"
`endif