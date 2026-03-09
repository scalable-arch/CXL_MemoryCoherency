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


module ff_macro_c2p # (
 parameter DATA_WIDTH = 256,
 parameter NUM_FLOPS = 1 // based on number of flops you need in 1 dir 
 ) (
 input logic clk,

 input [DATA_WIDTH -1:0] in_data ,

 output [DATA_WIDTH -1:0] out_data

);


 (* altera_attribute = {"-name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON; -name HYPER_REGISTER_DELAY_CHAIN 350"} *)
    reg [DATA_WIDTH-1:0] in_data_reg [NUM_FLOPS:0];    

    assign in_data_reg[0] = in_data;


    genvar i;
    
    generate 
    for (i=0 ; i<NUM_FLOPS ; i=i+1 ) begin
      always @(posedge clk) begin
          in_data_reg[i+1] <= in_data_reg[i];
      end
    end
    endgenerate

    assign out_data = in_data_reg[NUM_FLOPS];



    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "7MBsfGNfLBj+3Zi0T+jPOOUG+uBbozaZWVDc4xAFLKvkE7uHMcMX/Sb/YzYLVWEO4dPcV49X5MnL3Ek9SCr5TxAoL3kAbmnHB0r2kq59JrxDdeZquVD0c1SUF14wlg3eyf66c5j3gg8NQDtmre7iyEUOtx0c6jRrIT9v7LBW/+u5RCTAfPF6zxCuM2/BFtpOIcKwM+ejcvpE3I08RyJgOSecDgBO8M6JsXsm1V3AwfIkZfGGbLZB6KaPrxqdNHSK7pGrpO7xDfljax0CWD3dtG2fjqzrNIfEVEwFS87xOw2eLOu/dv5G+13ngf/ReT4ZLtEkhSWlUYqhsMIpUrbOvbARaWw1pFmF3JslsxmAvmUsxv1TTG4ja0nvhi2arMkfq/NkKjV3+YeyV5Kk0vjIgdmoe9cQMZfR4zpiv3NFhP4+Vv+OR9zMIlBqAnLq/CDgtxPPuQ6rpIn1irmkLRQM6G9JuIkb8YqBhOtF3tv5gX8AsKVr3GApWJkDoY+CsqLR2NiQu7UmyWjI7Ej/Yed7i6DicNtXHXes1eSoLH3buk0q0r7DkBHQALzqMuKNqRNuGGRF/UCwLNQN6ooT5sk0U/+upNMq35fh9TwKRb9VX60qfiEGjg3uxuiHYksPe3EABymI7bcWeoiGaHt7prl49T6q3Ts8hb/2lXkG78f7UnraZqwK0XtLp3oA/XiHIdmgvz/92Tmnnk2nYOEGiyNWcR6cgxh1Kz/3lhRcUn4NJd167cQC87b/phAm43cUL0mzYQrRd1sRHpDA/55GaiFcIas9+kbENcmuLkECC/VH8U0zLZo4sHF/fxk+t4rUcIN4oGCUmTdqB/gjp8QzI25ITjkOX1q4/s5F6vVRbfl0nSjQAoQFLwsJW7MXxHBeSS053BLsOlZzRLJuIg1XknU/VH1gO2Xbv0KhfZllJJy2FM/edafyflXnBMW/iXPpx3a7Ef07pRtIUudcqyrdlkkwC8vSXm2E344neHsDcsmyLQ7qMWR4mOOutslbB/HZLEqD"
`endif