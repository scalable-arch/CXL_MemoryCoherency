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


module ff_macro_p2c # (
 parameter DATA_WIDTH = 256,
 parameter NUM_FLOPS = 1 // based on number of flops you need in 1 dir 
 ) (
 input logic clk,

 input [DATA_WIDTH -1:0] in_data ,

 output [DATA_WIDTH -1:0] out_data

);


 (* altera_attribute = {"-name FORCE_HYPER_REGISTER_FOR_PERIPHERY_CORE_TRANSFER ON"} *)
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
`pragma questa_oem_00 "7MBsfGNfLBj+3Zi0T+jPOOUG+uBbozaZWVDc4xAFLKvkE7uHMcMX/Sb/YzYLVWEO4dPcV49X5MnL3Ek9SCr5TxAoL3kAbmnHB0r2kq59JrxDdeZquVD0c1SUF14wlg3eyf66c5j3gg8NQDtmre7iyEUOtx0c6jRrIT9v7LBW/+u5RCTAfPF6zxCuM2/BFtpOIcKwM+ejcvpE3I08RyJgOSecDgBO8M6JsXsm1V3AwfKLXSEWC7FiJmyM57LJt3HSi3SvshQxJKyX3xa3Uab4Zpv6rgunkZUZ28EmgURADtqjFZ8oSZWsPB7TOzG/vxGaY4EdtPZGAzKgsfNoIq/P4vS05SP90Bq/uw1DqLkwDlSGF1miAClXBOma+cbFAAxDDe4eG5n+qqyzJxbQxjewdOhVXWa1hvwy8sucowKIUVr6cUJtzt2rkZJRRZkY21BbxmO3zZdDHlMwuLz6znHgiJq6a5Q9xuRE3BG/veDCwVwiNtmcTr3QI4YognNUFFfbpjEizqzTpSm6wofmJL4vFEtuv1lkMepspUUdUjKB5D+1QcLPUHQm0gUijEI5Ke85Z2x45Z0YZeDtuoy73ZXgVyeFcmtdz50VqkPcS3UYga7b1iqRraky/K+BhBgC08AKhZI8ebdgNnQso8MuhJXkSHY0rZf2Gcy0pdNBvwNsk+Xl4iUgHBECP62zxxGi1Pw9+/73gQwn/iK9g3Fvjf7IaFIqZiovlvsnvsHB5LCQdmQIg6Hd9Ssd5yVHCY7jrXZqWjTyu9Gcw2CF8g8qk8OoAemqWomVM1rr5tXRTGXiVHvpcPVuNLkmzPWbYMVYYrx4Z35/2F/3ytGF3SY6a7Yc6EfUVnoBZ3b5VbVPslJYCXi1PjuToJTxcP7k+PVUCCRG2m0gk5m0BDgvTa7+afpLl8Ka5QRca/DGnb6k6GVTne7zO2/EM53LXWUDEj/OL6DKiX5XHBxEkpBDRkqgsCPp48fhf+i4RWTwVkrhBUfUEM6xXv6PquXto5z2BkhrEIRy"
`endif