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


module rd_pri_mux_kt2puei (
input in0,
input [1-1:0] clr, 
input [1-1:0] shift_index_out, 
output logic sel,
output logic [1-1:0] sel_index
);

always @ * begin
    if (in0 && !clr[0]) begin
        sel = in0;
        sel_index=0;
    end
end

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxxImA8eyFHBMwzXQPh3y1P5+2gi056XH+tRF18PBU5gk5iIn05IHR5P2YJmDxz9FrxOdukS5zRzHbdC9/k7o4lneAf9h0pOgS7tlSSaCzXyTGbKV2MbpqBsWglr3C/MD848Z+woCsEBGIr6nimQfqOLR9l/vVaUmve4oe5t+ge3+o7T2wXt7Cp4p2cwo7zADA8RWWqI2UCZ3DLYQoGIthpC1YBEsRC3rjj17qs7OUaRFyar/o7jaK91IMSTUl51+Qm31frgZ34Jz9GB+ChagKufXWl5h7NCabk+pmF8lLqMHHN0bofgBxA51GCTkZFG2ZOIVdP/2BdVi6W2oN9NH7OWsuA/vff79qvrbxffUhXC65FMvCXQSEIA72PVc9kjnbQZD6kBr80/QJVv7hXfQeQrYED42s8WIXjArcKTLIqX0Ac7EVw27hh/zmL4XKFvUtPBSDto9aYJhDd9OguazpYO5j6I0OzOXtzdS/+TXip9J0oHXrt5x3erumikWmLqLIqNCC4KsbHN9Cx/08bP/642eqsgurkc2wDWIPL176cpstROmq+UIBMMVYTr/s5eOivqJvTO7qslQd/YcNzQQuD2LYrSfymyM1ePtcVvjo9EzEhxxUcz8lBHCBNw6PrbhdArzNYjwXCyfFxYlPhoioEeZa5FXMf7HmM8mFJgdPreNablR9Z6NdI8LzIsl155UByDcEtW3jreloP3Uiuygqk/QW9Sz5MSnHS0EtCp+kRkKQQWJvN+FIpn89YH7g8nPfhW2syuyAJoKwxaRbI3MQty"
`endif