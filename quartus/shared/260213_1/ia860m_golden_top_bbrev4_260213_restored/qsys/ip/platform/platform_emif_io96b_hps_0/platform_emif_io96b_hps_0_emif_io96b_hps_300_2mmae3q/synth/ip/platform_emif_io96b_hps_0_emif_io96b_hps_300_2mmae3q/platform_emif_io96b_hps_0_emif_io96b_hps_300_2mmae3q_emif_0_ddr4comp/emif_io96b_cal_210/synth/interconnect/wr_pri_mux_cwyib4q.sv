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


module wr_pri_mux_cwyib4q (
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxzdgeC9/c+0/MUKW5ESX3Y5Cq9kX1MTM2QB+EewMt9S4gHiBNPNBKkRosfdBAKFsOn/Yi5RO0mLBGsQZwaLTjL9QIhlWoajrhONcpiyFQ0JO8YR0Er/omGUSvIHgjxa1Nnp37u2aCO9UTyrdNp4Ojs/7EG1YUDERkqJ+yKz2cwUDN5ulL0LJTGGhxZlYepnxq5Tx+XaiHQXqS/anM+PxN87M7MsdFFX4x59XYmuiYYu6Z8fNz4y0Hj6qDgwxLavy8K8dPYzrcFG/726f2bh7H+kLp9VooPNEffDoctNHGOdI9o2GFooUcJ9rIfu2vK00FkxBBNJhaiCWJaIP6PNOJyLNM8CK+UCnNFN+zHyuWE2obsCESIGivomq7kRCJQy8ZohDa3nVHW1Yh/Ulpm0U4K54tItZIKvhk2K3FQSIpILIY20OkioeZ5nS4gDKE0qT9ZeqHTHVcTt5xNu5hUaLCEQFgV5nchWTNaDJT+GDOJkjJlFBp37lLBVeO5N03k5Ehuh4VUXJ3DVmFCnrrI86MaoengpOTIQ5VImDCVAeSmPKG/Xc1brGSvmxB8/ij+//kYxcMGQIe3xNCzDOKouNlBEAOL/QxoPioxrWBvlRY+7mUI8Uzd3vXUZx6BGJ4ztMRXXGOruyY6gWSjNFhUMkmBkHjyghXsEE0EX292fBiDSz/vBwUbjTH6u+ioON/qVLN+CDRFj0WQ7Sk6l4Lqwj9POaFlD39l66v66qQalfg/wsFmVQRWiMM0cQMfMT/406PyXbgFrpv9iGQS8EZAsMwgN"
`endif