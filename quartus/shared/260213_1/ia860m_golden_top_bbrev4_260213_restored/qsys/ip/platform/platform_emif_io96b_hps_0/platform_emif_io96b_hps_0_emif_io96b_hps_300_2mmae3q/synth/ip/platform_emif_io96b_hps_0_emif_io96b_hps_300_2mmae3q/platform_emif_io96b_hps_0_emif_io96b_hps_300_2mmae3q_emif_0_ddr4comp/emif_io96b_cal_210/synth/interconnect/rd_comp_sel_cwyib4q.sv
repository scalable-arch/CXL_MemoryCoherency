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




`timescale 1ps/1ps

module rd_comp_sel_cwyib4q #(
    parameter WIDTH=10,
    parameter PIPELINE_OUT=0,
    parameter PIPELINE_CMP=0
) (
    input           clk,
input [WIDTH:0] in_0, 

    input [WIDTH-1:0] base,
    input [1-1:0] shift_occurred, 
    input [1-1:0] clr,    
    output logic sel,
    output logic [1-1:0] sel_index
);
logic [1-1:0] equal,equal_reg;
logic sel_int;
logic [1-1:0] sel_index_int;
logic [1-1:0] shift_occurred_reg;


compare_eq #( .WIDTH (WIDTH) ) com0 ( .in_a(in_0[WIDTH-1:0]), .in_b(base), .equal(equal[0]) );



generate 
    if (PIPELINE_CMP) begin : PIPELINE_CMP_OUT
        always @ (posedge clk) begin
            equal_reg <= equal;
            shift_occurred_reg <= shift_occurred;
        end
    end
    else begin : NO_PIPELINE_CMP_OUT
        assign equal_reg = equal;
        assign shift_occurred_reg = shift_occurred;
    end
endgenerate

rd_pri_mux_cwyib4q pri_mux (
.in0             (equal_reg[0] && in_0[WIDTH]),

    .shift_index_out (shift_occurred_reg),
    .sel             (sel_int),
    .sel_index       (sel_index_int),
    .clr             (clr)

);

generate
    if (PIPELINE_OUT) begin
        always @ (posedge clk) begin
            sel       <= sel_int;
            sel_index <= sel_index_int;
        end
    end
    else begin
        assign sel = sel_int;
        assign sel_index = sel_index_int;
    end
endgenerate 
endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxxnZ3smvI6vIm6FnmwmqmOJi0J1czzbHtLWzBdNaCEBwUyMA3DjddMG7YulAVVIdVHTG6SNXm1BeGl4cJbaLYn9maK+IR29YPL7V3zGI7wu/M19sa17XvUZ7fp5yPTFEYD8D9b2hHpunwCsPCvZrlh+8FlL0iKteo2TA85OqXwEN5WUjzSnER6f19g5CK8WTWp1j1Ubq7/aeUXB+He3UNf6+aaXingOt9kFUZdREBe4+VMbK5aEVuva1vow/NMw/tf5c2/bUTiPl/pgZ2hsFxFgdu6vYuKCSRGrfhiFPLMF8XQuUxogAOqIdKkzKVE8lAY6RcRh5Kn6G84leJDSqwkSCvVGxMIIMesFjBREimPxxeyewVXmmIzV2G0TXCkB6ePJV53SEcbquKFuLaeAxH/PsoTRQjMTBdlNt3wtHLuNwClg/KPJDjD62lx5EqLSrVkD/TEZt0TR3A2kZai+qqhtvpOl5bquBHAj1l7V+fiCXCb2YybQIHxUP62AXleeFn2ob43+UvIhXRK8W5/Uq3FZC/NLhoAgCB+urIlTQwtV35ooxA+5KH2gwxHeyv22dAteMQD1SVZb1Npnfq1y7kbTDMMpf6C1RbZNwPL1ctbGEOYBdiWFq0Jb8UH2yy1taPN8//eUUyJzlYIFl8gnjyBOoyDf/4NkLMFvWF5KLA+0Pm8mhnkYo4WzKzMm0GnZhwHX3uIll67Z12Lq6W8++V4Bi43suft9nATQCvxMAeV8jlHGCEG/9UbfCq9btxpOidv0a/9+3oURiZtBmWrfBQtG"
`endif