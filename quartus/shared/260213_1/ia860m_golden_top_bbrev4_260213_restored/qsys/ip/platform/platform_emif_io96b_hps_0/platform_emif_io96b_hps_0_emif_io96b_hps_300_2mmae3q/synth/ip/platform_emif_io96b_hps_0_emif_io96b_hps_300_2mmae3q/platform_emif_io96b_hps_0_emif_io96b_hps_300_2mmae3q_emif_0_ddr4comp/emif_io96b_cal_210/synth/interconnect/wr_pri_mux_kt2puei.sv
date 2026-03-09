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


module wr_pri_mux_kt2puei (
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxwNaYyfeUfhIBLvxmclnE11BRSwI+t37BFm5A7WlE0wB8ipWGiN8O4xapTqm+KxdUkq59/AUvGzLvLRR71pMPHv+khlSnTDe5DmF9FlDYB+9bPmiryt2rs+LAWzhgvxi3dlOy4qHA2ZvGyo/KOr0uIBgC+RGdvS47EDB4MwAaAdAWV0H6uIoezwyxQnA9tZAxuQWeVYJPWHUUgxoUpxjyk7TYg1b/xseCTxefCn2rcJPpPVZ39Nly28XvXebC5Bg195Z3PradOyC7dRMzpUD8GCgsJeVIS/MSUBQaNeK/fUAaTt3if9zX1mAByhPNf6zfiWQSNZyV4jbqdNFZ/cdJVSkoau2PZgtKmf4dxw/IHfxZfrNXxZMyyQbT+eqc0J5k+k/tAn22iu21dJe6frS0hx/p51etOgOnAScZ3sla2WXTPlP0luyyrfiXeabmdLS1G8YnKIc9whYWEB29t7Ml9bSRiSt75vPr5wEqrOM1WRIDXykp6MfNEYvQ8DvgpfN0HJ0iJiDCdl3rWPryTqqGzaspQMfrE8cgxLHyEyIMdoEQsPiPJlOuXY7IVfpqdiKRQBIVKgS5XG0gKM2Ezc+hpSMP32RW5EDgQfjQOzSCjCVZULuiMrhrq5DUTE6uIk1v6zgGGXeo+UD73SeoSGL9tc7ABMFuEv6Kc8Ikqzr3z03kqkDzOeZzRgLHN4kxzyboXJ1HvBXMU2eQaW19Gi5FTDQ0tMwCNU5TVD8lgKxQ1oNyy6pBgUcp37OfHpHqobhIJaG+0azAZErh6qpQWyiApm"
`endif