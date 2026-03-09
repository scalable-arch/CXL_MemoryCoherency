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

module wr_comp_sel_cwyib4q #(
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

wr_pri_mux_cwyib4q pri_mux (
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxwQmqLiYhwLKCkQLgqg5+FSvGcpuzDmk9vq3Dq8680wHKk7zKgRkUVNOLqrvSFb5AXLrtagv0mHmt8qaqs9QTgRXbblbC8YuwP9k6c5rCgw7NVfwZaXvfuj6760eUkeknCl1jjqTMr6361UMCsqXETEREkzLUFuG7+IpU64BHgUltT4qewQwlmD371IwnQMRcFjfqj6ULR0DkapQaL/IRIEt4dsMCdnClfpUKYeWcV1YrhWV4DrwZ2RSbk1m6lSBRx4jYxO+1ZpiclHzt1UFRVerzVmAMZg7o24ETz2fhbOARTuriQys0X9iLBYlMzZ5zjJL7+STTBu7qlRNQZiheZTIGYBRZ0nEklZ3T2vBc++WdiHW2WHk9BMRw67I4G8ngEvUpay/IfZwm9iBxPkRZWlreYHAdgmcd27L+K8RdPA2DvM9zXiEZPHCiwFZEtokIHDZvW9bZNl0yuFD4ETJKJ31CNnC9D4iZrcG2FyEvsTZLpSXY7pbKjDeBiP5hdLiM/z6Q3CxTwXzDGedsBsScC/Of9oiFJi9koowNTYgk4UYz1G6r9rRVPeVfhEZSxCESXlAm5nK18qHDQ5HsPNFoOAyOFtG4KXIspiVx5HFHcqOieCVEJNC27wLaoTcpYAiicf0sBrucLUWBvsfvEQ0AvtzGYbJ6x1MDeehUlFzdBxeIQfE0PJMz5pmacJpj3mvLQj0OsjveVDko6y5MC4lfdhvRDbjOe29fge0LsAoqXbUdCBruQ22uUhGUWUKt7XxNXaY/vyeEaiR4twfm6X1n3p"
`endif