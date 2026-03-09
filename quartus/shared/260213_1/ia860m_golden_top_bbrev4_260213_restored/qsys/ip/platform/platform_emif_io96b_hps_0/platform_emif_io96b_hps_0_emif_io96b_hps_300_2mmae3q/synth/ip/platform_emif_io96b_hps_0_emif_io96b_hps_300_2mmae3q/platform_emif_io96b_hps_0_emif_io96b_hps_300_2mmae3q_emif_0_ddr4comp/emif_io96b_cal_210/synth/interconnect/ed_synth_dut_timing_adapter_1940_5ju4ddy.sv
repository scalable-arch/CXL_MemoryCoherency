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





 


`timescale 1ns / 100ps



module ed_synth_dut_timing_adapter_1940_5ju4ddy #(parameter SYNC_RESET = 0)
(  
 input               in_valid,
 input     [8-1: 0]  in_data,
 input               out_ready,
 output reg          out_valid,
 output reg [8-1: 0] out_data,
 input              clk,
 input              reset_n

 /*AUTOARG*/);

   
   reg [8-1:0]   in_payload;
   reg [8-1:0]   out_payload;
   reg [1-1:0]   ready;   
   reg           in_ready;
   // synthesis translate_off
   always @(negedge in_ready) begin
      $display("%m: The downstream component is backpressuring by deasserting ready, but the upstream component can't be backpressured.");
   end
   // synthesis translate_on   

   always @* begin
     in_payload = {in_data};
     {out_data} = out_payload;
   end

   always_comb begin
     ready[0]    = out_ready;
     out_valid = in_valid;
     out_payload = in_payload;
     in_ready    = ready[0];
   end

generate if(SYNC_RESET == 0) begin

end
else begin
reg internal_sclr;
always @ (posedge clk) begin
internal_sclr <= reset_n;
end

end
endgenerate

endmodule


`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxzYlKfTb6Up41qVmIbK7zy1n852xvOS5uG+7o5x4l2LWA3x0r407umEdTa3kN/AvbbXGlsZx1yMOeEX6bT+hQTtefCD6kAh+dYwChqbcJWzPMP2IKYKlWj4QYEvIlTfioW2I6Q6ciqc/pCatsQqfarcmYc/T5zuqsAcwvITQZ0M3hRGJGA2L8+NuSIL9kidL7//9rdEVkRrJpSfO8IKOdCWjGJzS3bd/PrY1NmM7XU5V5jGhKo4GDgyMe2IMLU3gZDyJN3nezFrL8q3C/Mr1ymr8nOdphbWIk1hwBFIHnx56wjSjNOfwGpcl7rlBY3NCa3WzCb7taY3NS4CjDGMyxNGYHbbqdCB7lu1IIYBz4YMEDRbm03HFUKiepsomWD1EKNkLBIUataOU/zGuetq6NLwZI8rWEP+3doza02H7twsIhLyYlDadKApGHFqprhWyMovOksLAQkTSWNDWY2R871m3CP4oqkzemJNZcGNUttJClSkzXrTDtguCmhEQIXsNLw6jacEsxT/mUwkF12VgUp7sTOeDa78w/Co15cKUlCmpndJawA+dvalet3+ybF3MBU+/VnetFTvDXvDEKf2xokwp7nMtubY/jVPKtdbwYewTNBjZyVouCO3gQF1Qd8tSbwOJJn7PPK0I1rpVLE7jP3EvJG0pveRulMggnbAzlItx+fcnPZwTWdz4ALfrBQsQ77F6RdN1AgKUXBkAn7KcbhwcpASA97E/vWloiUdOKvku8llx2009XuLTukTKCKLbfeprI/eNqZv+jPAU1Ja5L/V"
`endif