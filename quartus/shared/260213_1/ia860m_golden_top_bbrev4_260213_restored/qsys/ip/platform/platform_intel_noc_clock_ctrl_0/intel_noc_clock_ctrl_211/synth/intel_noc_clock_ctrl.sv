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


module intel_noc_clock_ctrl # (
    parameter REFCLK_FREQ = "NOC_PLL_REFCLK_FREQ_100_MHZ",
    parameter NOC_BIN = "NOC_BIN_BIN1",
    parameter SCHMITT_TRIGGER_MODE = "SCHMITT_TRIGGER_OFF",
    parameter WEAK_PULL_DOWN_MODE = "WEAK_PULL_DOWN_ON",
    parameter WEAK_PULL_UP_MODE = "WEAK_PULL_UP_OFF"
)(
    input refclk,
    output pll_lock_o
);
    wire pll2ssm;
    wire refclk_buf;
    wire pll_lock;
    (* altera_attribute = "-name PRESERVE_FANOUT_FREE_WYSIWYG ON" *) tennm_ph2_io_ibuf #(
        .buffer_usage("REGULAR"),                    
        .equalization("EQUALIZATION_OFF"),           
        .toggle_speed("TOGGLE_SPEED_SLOW"),          
        .bus_hold( "BUS_HOLD_OFF" ),                 
        .io_standard( "IO_STANDARD_IOSTD_LVCMOS18" ),
        .rx_equalization( "EQUALIZATION_OFF" ),    
        .rzq_id( "RZQ_ID_RZQ0" ),
        .schmitt_trigger(SCHMITT_TRIGGER_MODE),
        .termination( "TERMINATION_RT_OFF" ),
        .usage_mode( "USAGE_MODE_GPIO" ),
        .vref( "VREF_OFF" ),
        .weak_pull_down(WEAK_PULL_DOWN_MODE),
        .weak_pull_up(WEAK_PULL_UP_MODE)
        ) nocpll_refclk_ibuf (
            .i(refclk),
            .o(refclk_buf)
        );
    
    (* altera_attribute = "-name PRESERVE_FANOUT_FREE_WYSIWYG ON; -name NOC_PLL ON" *) tennm_noc_pll #(
        .NOC_PLL_REFCLK_FREQ(REFCLK_FREQ), 
        .NOC_BIN(NOC_BIN)
    ) 
        pll_inst (
            .nocpll_refclk(refclk_buf), 
            .pll_pllc1_clk(pll2ssm)
        );
    
    (* altera_attribute = "-name PRESERVE_FANOUT_FREE_WYSIWYG ON; -name NOC_SSM ON" *) tennm_noc_ssm #() ssm_inst (
        .pll_pllc1_clk(pll2ssm), 
        .noc_clk_serv__clk(), 
        .nocpll_iniuclk(),
        .pll_lock_o(pll_lock)
    );
    assign pll_lock_o=pll_lock;
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HVwoXV44HvrqLCcyrRLKSPYKBkDWFb/QkVjwDEQ824LbpdY1lpyfSDRh2R2XXI3HT559WzzSGaylMrfix9K0v8D4bP8N/5F2s7q2IVIU3Zbvvtm48IozW/C3YtteWjdzPbWSHrpgM8/tQexSu730vbHbwtI/7bmZ6hVhmDj7iMt/1xxbYHvxq//o4LrluwXjtRNow/nPFObAl3yz5rR4pw9RiExjXrLroBGh1KHp3ENeRgZpCV3XFPBMDNFmKe/AMOvbMzANYMyjdQfNQJYh/ONiGhT5hq8qFbQNLLOzCY747jCOewnuF18GzWVsz6jr7kaHu+UwStRNx6otijYX5104j8vLtnY9I4V2p4Yi8vz3kLedYjuLEhO5AY3I6ICCMmp/uIYJGNEVLmD2oOg8AXVdJQh2AXdK+4EgxfTGGIg9lfQVpFANuRMreZBAxAYRXS9bE4T3RgGcmsymeyFxER1x4M7kYBBw06YASOLhTAJFOR2mXtJPEMU6ysh14PvQW7poahd8dNCb91W+0VYiMJLksKS8p13ADqZCWoNWx+BY1T84i2MtR/4hc6MUbDM0c3RvhoLPawusvl7tSDjkjLRjbBUKTPCbfISrqzxwPMqPrHGqAtrYM7xZxfboBjp3UgxVnewtyiyCagaAbL9OVSdM95gpX5ieKATsfQ02aERo3RcNy7c3mqRnOVsV7AJzWK30bme22n8/5kVLFBq/6950ByX/DxwaE55ODGGHHauzesJ4CWU1SxAg9syHnRsKUdHLBOxmEj19LQz5JoOqnH+AlVPcWKF1kgP32TGFEQtAWOBjSh02J3JECNIWfIY7Me4RXI2IQP6DlA2q30CDlvkdvH9k8g/N9be16Ksbbe0oa9ydVJRuwYQT+S7KT13KH3h/zqtCwo3HPWQP4fn7kXZxINtLDz+PP8y9ilecgQ/JuFlXfmuJn3cc12SrDGDksIDiYvHiSHk+Ii65B50+m5oqUsNoObNRaZOyPbeGM6ch+TXjH1vqTdVqKiY0cj5j"
`endif