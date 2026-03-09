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

module wr_comp_sel_kt2puei #(
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

wr_pri_mux_kt2puei pri_mux (
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxyayka+ImtulV0T60GhWj9tv1wwtXnw1t3USUmppYYJDOczebM7iGHMDNkQNuwg4Lj5eMkqOvzYodgAOfWcYxv41gNY0ymIj9XCNokdBImYjRyO/IV2KVKiyN7E2w/AnnRkSv4ieoJHZFAMh46ciAPD2bKenfbMUVKC2G1+q4xtxPZl2HJlRAf1/Oh3iL0I3FOz18rvJVipuJUqNaoy+0Jha93nHJpdV7M1lGFGi+QTgImyqVSAtycDJVVTTWV5laYFXPYVo4bxzLU8r66knk06LkL+RH3kBNVrX3ymg77/vioqoNPd8TFfqgDFowd1vbaJMKGFn1RddGnpNCAgnA9bUU1OSYo0aHbVK71Cc2vFBXy8NYnXuZplo17Nds6D78xDagJcCd8Uu6ofbBEg6Ld12KZXWhpNKefO7ZElQ1AV925aSfwQ6+uabZH0v5tkYKY1IMCj5GSCIxX1CVuXYcAW1kXfaODEJioic1Ptove+wWc+8V+rcvgUWUgUFVutCqb+f0OGvShWdYybb2O0PQdqp1gehUji7fHTIOEJSLDQ0eUfcXSnzWlcFieZpQZZ/Od2iBUVMqK8wH8zIbq3Vp7l9Tjx6nlGpk+0S7aWj5hswk/zzUEOLoNRbb3VIMGiUonhfAOq4gqBsfQK0hm815OstrpNjhyt/4ZibTRc0eJ+TpDnmtkmZ0zOnYr0MtTkhm91XXfTwzlVjUCLxzhpqD53JRXSLeiN4mWcbjoD7O4/w/NCq3rQR59rbUy80QcHVXAd/lN1nGiYQIqQ4W9TTXmI"
`endif