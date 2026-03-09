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

module wr_sipo_plus_kt2puei #(
    parameter DEPTH = 1, 
    parameter TOTAL_W = 35,
    parameter ID_W    =10
) (
    input clk,
    input rst,
    input in_valid,
    input [TOTAL_W-2:0] in_data, 
    output in_ready,
    input [DEPTH-1:0] clr, 
    output [DEPTH-1:0] shift_occurred, 
    output [TOTAL_W-1:0] dout0

);

logic [TOTAL_W-1:0] mem[DEPTH-1:0];




logic shift_in;



assign shift_in  = in_ready & in_valid;




always @ (posedge clk) begin
    if (shift_in)
        mem[1-1][TOTAL_W-2:0] <= in_data[TOTAL_W-2:0];

end

always @ (posedge clk) begin

    if (rst)
        mem[0][TOTAL_W-1] <= 0;
    else if (shift_in)
        mem[0][TOTAL_W-1] <= 1 & (! clr[0]);
    else if (clr[0])
        mem[0][TOTAL_W-1] <= 0;

end

assign in_ready = !(  mem[0][TOTAL_W-1]  );

assign dout0 = mem[0];

endmodule
    


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxyvEVA9XFzI43NtoWTvdtc4CpeFAUOEuNq9pYvey/X/BHU8zgf92hmjgtQqdkQFU4WcSy1KkzUTluUM0DRtgF2AZit6rN7EYF64DVZ9apXRD+h71rGCzJN/JWrsFulNLkBNJ3Fe9y2oX4KZBPsNUkwKrCDN+Vc99zjptdikeUAoLn0GB0eni5zjrEtz8iPADPpjrOa4/j4SXt5n4rsg3Luyb2EoosKDV51xGOE91HXjKHTkPWcIBOGsDSpwOjVUrWOiKHqprg5QJQezgdTWJV2DkuYhHylFYSctno1v+Jm+WLvIBxuO556Jz2R5UmrvwOgCvTeSmV3aUTLzCokFvmdKxf+no6b5U1dLWG8kDsxCAH7Td27r8jFhF328qhK7B4TQ5otMwACgYYaM0K7INudgsixVvU+4hgy/LrJnp+Q1haN96YrqqWnyFlU4AIax3KY13ql7WIiNgi6HDfCLGBFh8DaYXC44gseV2tJMr27yEEvNmdDFjOJWkgMpucQkVnxfEhc6N+6uoSVL25GHCLDKPHSQ+9H0QTBr/0tgcMezZy4d0u3jUaDGEYyHjaBnF8k/LJOIXdQvMC6Twx9NUyF5THnk9iiejkRVEnGcKF2p3SYYu5SILzcgqKm/sQocqfOCi25Pq8eIzlU7jmO9Mu6f/NAVm03QHSVZzaTXAZf0kB6eW29Vz6og195l7Yby52HdKGUnHK1n8cofd8F9rb9HfhduJnaWyfSPq+Yrve4n6l0phYVtJKJbt9r6CXYqsweMpak3d7Xtm5trcfDBrCBF"
`endif