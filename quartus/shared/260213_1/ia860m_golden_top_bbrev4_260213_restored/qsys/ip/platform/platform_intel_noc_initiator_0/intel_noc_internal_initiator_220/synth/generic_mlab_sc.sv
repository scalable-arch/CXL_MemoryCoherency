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


// Copyright 2021 Intel Corporation. 
//
// This reference design file is subject licensed to you by the terms and 
// conditions of the applicable License Terms and Conditions for Hardware 
// Reference Designs and/or Design Examples (either as signed by you or 
// found at https://www.altera.com/common/legal/leg-license_agreement.html ).  
//
// As stated in the license, you agree to only use this reference design 
// solely in conjunction with Intel FPGAs or Intel CPLDs.  
//
// THE REFERENCE DESIGN IS PROVIDED "AS IS" WITHOUT ANY EXPRESS OR IMPLIED
// WARRANTY OF ANY KIND INCLUDING WARRANTIES OF MERCHANTABILITY, 
// NONINFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE. Intel does not 
// warrant or assume responsibility for the accuracy or completeness of any
// information, links or other items within the Reference Design and any 
// accompanying materials.
//
// In the event that you do not agree with such terms and conditions, do not
// use the reference design file.
/////////////////////////////////////////////////////////////////////////////

(* altera_attribute = "-name SYNCHRONIZER_IDENTIFICATION OFF" *)
module generic_mlab_sc #(
    parameter WIDTH = 8,
    parameter ADDR_WIDTH = 5,
    parameter FAMILY = "Other" // Agilex, S10, or Other
)(
    input clk,
    input [WIDTH-1:0] din,
    input [ADDR_WIDTH-1:0] waddr,
    input we,
    input re,
    input [ADDR_WIDTH-1:0] raddr,
    output [WIDTH-1:0] dout
);

genvar i;
generate
if (FAMILY == "S10") begin    
    reg [WIDTH-1:0] wdata_hipi;
    always @(posedge clk) wdata_hipi <= din;
        
    for (i=0; i<WIDTH; i=i+1)  begin : ml
        wire wclk_w = clk; // fix strange tristate warning
        wire rclk_w = clk; // fix strange tristate warning
        fourteennm_mlab_cell lrm (
            .clk0(wclk_w),
            .ena0(we),
            .clk1(rclk_w),
            .ena1(re),
                
            // synthesis translate off
            .clr(1'b0),
            .devclrn(1'b1),
            .devpor(1'b1),
            // synthesis translate on           

            .portabyteenamasks(1'b1),
            .portadatain(wdata_hipi[i]),
            .portaaddr(waddr),
            .portbaddr(raddr),
            .portbdataout(dout[i])          
        );

        defparam lrm .mixed_port_feed_through_mode = "dont_care";
        defparam lrm .logical_ram_name = "lrm";
        defparam lrm .logical_ram_depth = 1 << ADDR_WIDTH;
        defparam lrm .logical_ram_width = WIDTH;
        defparam lrm .first_address = 0;
        defparam lrm .last_address = (1 << ADDR_WIDTH)-1;
        defparam lrm .first_bit_number = i;
        defparam lrm .data_width = 1;
        defparam lrm .address_width = ADDR_WIDTH;
        defparam lrm .port_b_data_out_clock = "clock1";
    end
    
end else if (FAMILY == "Agilex") begin    
        
    for (i=0; i<WIDTH; i=i+1)  begin : ml
        wire wclk_w = clk; // fix strange tristate warning
        wire rclk_w = clk; // fix strange tristate warning
        tennm_mlab_cell lrm (
            .clk0(wclk_w),
            .ena0(we),
            .clk1(rclk_w),
            .ena1(re),
                
            // synthesis translate off
            .clr(1'b0),
            .devclrn(1'b1),
            .devpor(1'b1),
            // synthesis translate on           

            .portabyteenamasks(1'b1),
            .portadatain(din[i]),
            .portaaddr(waddr),
            .portbaddr(raddr),
            .portbdataout(dout[i])          
        );

        defparam lrm .mixed_port_feed_through_mode = "dont_care";
        defparam lrm .logical_ram_name = "lrm";
        defparam lrm .logical_ram_depth = 1 << ADDR_WIDTH;
        defparam lrm .logical_ram_width = WIDTH;
        defparam lrm .first_address = 0;
        defparam lrm .last_address = (1 << ADDR_WIDTH)-1;
        defparam lrm .first_bit_number = i;
        defparam lrm .data_width = 1;
        defparam lrm .address_width = ADDR_WIDTH;
        defparam lrm .port_b_data_out_clock = "clock1";
    end
    
    
end else begin

    localparam DEPTH = 1 << ADDR_WIDTH;
    (* ramstyle = "mlab" *) reg [WIDTH-1:0] mem[0:DEPTH-1];

    reg [WIDTH-1:0] dout_r;
    always @(posedge clk) begin
        if (we)
            mem[waddr] <= din;
        if (re)
            dout_r <= mem[raddr];
    end
    assign dout = dout_r;

end
endgenerate    

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HVwoXV44HvrqLCcyrRLKSPYKBkDWFb/QkVjwDEQ824LbpdY1lpyfSDRh2R2XXI3HT559WzzSGaylMrfix9K0v8D4bP8N/5F2s7q2IVIU3Zbvvtm48IozW/C3YtteWjdzPbWSHrpgM8/tQexSu730vbHbwtI/7bmZ6hVhmDj7iMt/1xxbYHvxq//o4LrluwXjtRNow/nPFObAl3yz5rR4pw9RiExjXrLroBGh1KHp3ENZlOYSibBqBJlAwnNuS9107Gr0miwhsMiQmfO0+4B2MEJlsuTD/60M30lhurGv4+eDmMdmf3gk/y7iZSu2jfaiV/Dyk0pFFa5D2/JL0XVY5NlRquVxnJgPtEX3hOpt6atnfE3+DOKCQd0q5bYtutbv8yBDfiICAsPhp5qEjmgMOnlQ6xHYFK+WFNGeZ6DP8fbdsjCrXTTtYntGo9tH+SkdKWcsXx82RSR540kOPHs9qAbLLt+Pa8e+PCC5PyvfA4QqN8nMY6LxVnjc5SYZi9YCfInVeLAVeA7mJb8aRwhV2Z5YJteoBMMlOhb2rYnWZDQ663r2OyRBcmvaMaQcaFEhucbnKPFryAE3SUECoOiwAqR6P+HLfQBN3CL51Sl6Qr6xs0BZANYc9oiVR4/Rdd9NUitQdGfjwIn63e42gKiRH31iqsXZtP7+OKC2mWvcB/Z/entbGYnl6N0cKZpq1B8tu1AX7NJye93z9/s1r2uhrM/Hhx6A7bh7vjl/f7cCfxW8VloPA++eOgf+lpwgFHgohBtGe68pp1XWjjxxZunqb+f+fLcrgYUdYqoQ7KUlGv3mIxw6T7TBcUK27QghOjEbMI+rJ0gnzbrgX0BO7RBiFHnLT/sqCt/xoucpE/XmBqBGgEBUor9PjsCrTqMrWCY4QcFy10zCkOJUS2qcnMmz/i5jAlKGoK4Z/oWB8xlUGxdfO7hoKz/ssGILztwxgvYYlPBOvsFvto4r1MTpV3eTpihde8g7wI1BaL25JbOgEanf/qyHvp3eBfohp6/bLGwc"
`endif