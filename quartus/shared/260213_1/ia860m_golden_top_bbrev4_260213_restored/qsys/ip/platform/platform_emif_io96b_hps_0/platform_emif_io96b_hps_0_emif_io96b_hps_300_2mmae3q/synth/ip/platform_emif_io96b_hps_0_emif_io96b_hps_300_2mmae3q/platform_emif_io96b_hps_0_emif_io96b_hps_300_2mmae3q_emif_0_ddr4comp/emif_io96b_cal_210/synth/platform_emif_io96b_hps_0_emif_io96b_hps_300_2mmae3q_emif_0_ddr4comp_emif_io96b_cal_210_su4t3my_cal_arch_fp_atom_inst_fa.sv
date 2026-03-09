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



module stdfn_inst_fa_c2p_ssm #(
   parameter IS_USED  = 0,

   parameter SSM_C2P_DATA_MODE                               = "SSM_C2P_DATA_MODE_BYPASS",
   parameter FA_CORE_PERIPH_CLK_SEL_DATA_MODE                = "FA_CORE_PERIPH_CLK_SEL_DATA_MODE_UNUSED",
   parameter SSM_P2C_DATA_MODE                               = "SSM_P2C_DATA_MODE_BYPASS",
   localparam PORT_I_SSM_C2P_WIDTH                            = 40,
   localparam PORT_O_SSM_C2P_WIDTH                            = 40,
   localparam PORT_I_SSM_P2C_WIDTH                            = 20,
   localparam PORT_O_SSM_P2C_WIDTH                            = 20
) (
   input                                                      i_core_clk,
   input [PORT_I_SSM_C2P_WIDTH-1:0]                           i_ssm_c2p,
   output [PORT_O_SSM_C2P_WIDTH-1:0]                           o_ssm_c2p,
   input                                                      i_phy_clk_fr,
   input                                                      i_phy_clk_sync,
   input [PORT_I_SSM_P2C_WIDTH-1:0]                           i_ssm_p2c,
   output [PORT_O_SSM_P2C_WIDTH-1:0]                           o_ssm_p2c
);
   timeunit 1ns;
   timeprecision 1ps;

   tennm_ssm_c2p_fabric_adaptor # (
      .ssm_c2p_data_mode                                    (SSM_C2P_DATA_MODE),
      .fa_core_periph_clk_sel_data_mode                     (FA_CORE_PERIPH_CLK_SEL_DATA_MODE)
   ) fa_c2p_ssm (
      .i_core_clk                                           (i_core_clk),
      .i_phy_clk_fr                                         (i_phy_clk_fr),
      .i_phy_clk_sync                                       (i_phy_clk_sync),
      .i_ssm_c2p                                            (i_ssm_c2p),
      .o_ssm_c2p                                            (o_ssm_c2p)
   );
   tennm_ssm_p2c_fabric_adaptor # (
      .ssm_p2c_data_mode                                    (SSM_P2C_DATA_MODE),
      .fa_core_periph_clk_sel_data_mode                     (FA_CORE_PERIPH_CLK_SEL_DATA_MODE)
   ) fa_p2c_ssm (
      .i_core_clk                                           (i_core_clk),
      .i_phy_clk_fr                                         (i_phy_clk_fr),
      .i_phy_clk_sync                                       (i_phy_clk_sync),
      .i_ssm_p2c                                            (i_ssm_p2c),
      .o_ssm_p2c                                            (o_ssm_p2c)
   );

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "h/iChvxs1BqfjCvpkkJPYvhSyoexz9FnJDZVTIO5lu4JQXqq2zA2zgvU4XUFIeUaspH3pVSXDqAt1zDtj0pnJvSsBYN1vXKXvJgJbipdV2cWNbJwAzoqyz4d52bbneU7dZwyXGLq7j66sBqfbjcD19fcQrHLLZVIFVJ99lJAOuVYNHkW1nicOMqEXTRwhHFvEzNITCKHr6Lm5PjCaA+dAuM3eqAQw7qxLNemioqgtfUlmaTtnQlQEtfOdXXIV8zNQQkS9bh9LcXvJ6yBO9f+UMW+Cl1VU85J5gSTpvViK9bhISy+ZMlefPKMuLjJQi7Ljk4wJC5zvP49i/K2nH3F76wLXTEjYdbe70wV2qzZ6tpwMy6dXzSLehBqu+nBLIzMIEED7TYv6iYPhL/BzWkPsfD1mCyvQ6NdE8t5o72sqUttUBMwVDzALrPiFZw0ruysob8J7KJkDlyJFU4pbl0JQ+r5Yi6iyQBU4MwGGn7SRi/gOa1BM7DmGzBQa6qxznTF5TM/Aw1m6997+rIOnfUrVNRrtvbDssqYn73Drn3Z+xL3R1idX9p2L46+pUL/S9hf/Oq6CfNPoCamOyygKjZCQ1f/o9Us+BlkMW9gdusmCcddqV84Ns+2SUsiGkCLGIGoNaOzX3gvmzs7IscbR674NyfuTlVbLEegAdEqCsh9TScdMTtufn7c6uPJyl3mflC/ODO3o+ZK+03+24egIjl5cnSnKuE9rWO9h9IoNvBvT132GwP0OmWXDlQ+20q0BGWzQjxp6d6UAn7QTjatVvBqV4vAJ1rtSNL4vA9GD6dXBHppX0jT4sG9G1iIRjr5fFOksg7XAqab70QOEi7/aSvBbo2IFGzEkuElz1kY+NehGkNBxqlSt6dDqJkAdMkJswR/fBzrG2vOKdaxWXtnDMjB4VX/GXJpeVVEdObUnhDADHLMm0P3fwfsWP91DTqlru6fbOhXt2WmSfy2vDI6ciNYBNf6k+adhCukmxcd5IW2C5jEL3Lky4hdFF5XoY3WkKxx"
`endif