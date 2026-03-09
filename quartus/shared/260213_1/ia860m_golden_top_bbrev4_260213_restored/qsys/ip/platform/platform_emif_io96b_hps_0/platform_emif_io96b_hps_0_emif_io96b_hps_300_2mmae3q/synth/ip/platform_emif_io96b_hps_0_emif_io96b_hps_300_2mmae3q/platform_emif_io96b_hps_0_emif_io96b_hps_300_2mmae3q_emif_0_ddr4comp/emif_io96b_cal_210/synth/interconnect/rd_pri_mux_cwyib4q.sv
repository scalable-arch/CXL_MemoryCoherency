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


module rd_pri_mux_cwyib4q (
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxweIJ0gBM/AEWqfhKRLWzGELrf070HDU7ONTPp1i0I+SL5mhl8aoKZD3ankzHR1wCVnuH942G+vbv0AzPfVEhat9M6X5awLrJRqp0PezeaALrYH6cgIbJiW7JsKDnB8OPIx4bf3iHHWwzNJUSm/H6tngG53msOIQibQTKygQfLVnf9q7a4y1MTZPtLtlpmvLqUQCcvOkC/NB1ZhuQzgNZD+0e51kQbIz2tje2tTLr9k+NjiTH7l1cCCdh9N1sKtzY9bXOoZNEF6baLWC0iK5177L24buzueIeMCPZle5nzPr1Xdln19YZW/GNlfo6n29TjWr4glB8Zqs94dVWjv2nSVHVKVJtgSHAA7EScMDFNVZTrZYNNb58ZlBC652+PQGklmQZQacxRCs5+KQTIhUyBUtO/esguDcydTJ6S6FR/Qh4jYPZY/j9D/DtkKgL1izds2pAMzrjY3fE3mUWg8ca9SOwqWJ12jr8ubkyOgIyXN0Ga+Gz44yj3lFu2hjzxiF7yl4578+XCrpQiyxpo9t5oLfEDER/Q4LMc/qWyaXPVMGbJyIwKY7I+eZ45wtM+dhJNyVFWyAwoQAcYy59zGWTr0UZlxmJ5mm/pdIFxr+va2y8Ui94EXeL7GciZPnvMG5MGeilHV7iCn2rNSGSWsyh5YGC0fUBltxFQlWOf0N2Vyc+uebKKhf47FeLydUOQ8DERvxRmWTHyR2xh3s03QV5KLg64kt5H9kGyq2lv5nrT4t6NRYBTa0bUuI8qEe8YWLZL9WM0YNf/vE7utQ9ew8Ctf"
`endif