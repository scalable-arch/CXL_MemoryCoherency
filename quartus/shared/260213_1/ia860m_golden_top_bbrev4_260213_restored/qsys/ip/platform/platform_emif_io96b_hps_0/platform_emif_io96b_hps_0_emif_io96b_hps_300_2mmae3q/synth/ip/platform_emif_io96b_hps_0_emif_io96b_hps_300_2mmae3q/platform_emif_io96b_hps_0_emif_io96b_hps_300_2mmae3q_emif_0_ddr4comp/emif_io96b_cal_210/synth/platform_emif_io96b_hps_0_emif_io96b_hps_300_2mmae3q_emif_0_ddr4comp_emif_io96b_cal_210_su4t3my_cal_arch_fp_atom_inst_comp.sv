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


module cal_arch_fp_atom_inst_comp #(
   parameter IS_USED  = 0,

   parameter BASE_ADDRESS                                    = 0,

   localparam PORT_I_AVM_ADDRESS_WIDTH                        = 22,
   localparam PORT_I_AVM_WRITEDATA_WIDTH                      = 32,
   localparam PORT_O_AVM_READDATA_COMP_WIDTH                  = 32
) (
);
   timeunit 1ns;
   timeprecision 1ps;

   logic                                                      avm_clk;
   logic                                                      avm_rst_n;
   logic [PORT_I_AVM_ADDRESS_WIDTH-1:0]                       i_avm_address;
   logic                                                      i_avm_read;
   logic                                                      i_avm_write;
   logic [PORT_I_AVM_WRITEDATA_WIDTH-1:0]                     i_avm_writedata;
   logic [PORT_O_AVM_READDATA_COMP_WIDTH-1:0]                 o_avm_readdata_comp;

   tennm_compensation_block # (
      .base_address                                         (BASE_ADDRESS)
   ) comp (
      .avm_clk                                              (avm_clk),
      .avm_rst_n                                            (avm_rst_n),
      .i_avm_address                                        (i_avm_address),
      .i_avm_read                                           (i_avm_read),
      .i_avm_write                                          (i_avm_write),
      .i_avm_writedata                                      (i_avm_writedata),
      .o_avm_readdata_comp                                  (o_avm_readdata_comp)
   );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "h/iChvxs1BqfjCvpkkJPYvhSyoexz9FnJDZVTIO5lu4JQXqq2zA2zgvU4XUFIeUaspH3pVSXDqAt1zDtj0pnJvSsBYN1vXKXvJgJbipdV2cWNbJwAzoqyz4d52bbneU7dZwyXGLq7j66sBqfbjcD19fcQrHLLZVIFVJ99lJAOuVYNHkW1nicOMqEXTRwhHFvEzNITCKHr6Lm5PjCaA+dAuM3eqAQw7qxLNemioqgtfWzWMXf1AWcNi9zkdR+0RSC8L/DkIjiX1FBqDorjErsCs5Dbjo+4Eg/ONOYnXWE041/nBxEp9xAQVAX/848WYXd1oOtenF3KLUzl8CKbUv/PbU3n5arIrebCZ8MApMP9PzsHTNMA/jYPJbqFv7nlp/sAzvVx9XqLgzJFuAbxe3SLdsptd47QlAkPLGpv8T2nyZIw0GOLsNOxhqJKYH2VvMV9rz4/eA+ezyrCcSaXg7r1r9MefSOK7gjkTibtQ7YmCzOGKIM4N1w+tUk7nZzNJ4Qk2ofd53znNSarEZ+R75sep2FXGqLcj7K3eXmWGhAVL285BPfQead4hGVA153VjJcuQGAafX51fl/BJGRmeQRN9WbfBsTkudRLeKtfO7g+1bTOavMjCn5WBO5JvXz2TDgfMcnkSLsignzGZAP0PFH+gHujYerKJFlYqfJrNBgSBiLC8sFwva0G38/1OMydyxAkYnR7OQ5+rZABcRO+VH9nxtAA5mrR2VSdbzWa71Vr2SX4Q6JNAE4ElUmQoO8vWAdAWLjkkOnKvn9pPVa2ehomnhKLIXzhlOco2nPGs3RoYxn+ks5mryk/HYVPFi5elj4819zjNRGJrGIh0AGmvxQkUrQCJXDQe13kelSiVklssZC7aLnG9+YDlpgBURssZuTYRMbccBDO6YX/DcvTJck83SQLWEga0IlzRabJYbm1rPpYmEkfDJM9+jbsK49qIoLdjyU02wJn5o0EOXwR7y9aEzWAmQB3aOJkMBXmJ2Php9VXpoYQvKC8eTEQJiZzVJJ"
`endif