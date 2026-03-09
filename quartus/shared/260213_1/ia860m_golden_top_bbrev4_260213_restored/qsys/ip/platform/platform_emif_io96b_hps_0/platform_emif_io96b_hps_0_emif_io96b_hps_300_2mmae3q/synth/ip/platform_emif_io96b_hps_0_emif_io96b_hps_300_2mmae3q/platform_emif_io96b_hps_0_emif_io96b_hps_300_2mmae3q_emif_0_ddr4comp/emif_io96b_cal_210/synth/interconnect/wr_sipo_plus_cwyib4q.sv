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

module wr_sipo_plus_cwyib4q #(
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxzIx3rFb14vn2/fdkhYtDK0GAGqZmUALPIgvfHbfxJGaIHcLcYngUgQn1LaijDZ05rj42bYFZguKs+gpwocyb/ceApThUYSUEz5zNxFFsUXOtARHSTObuSIy/vbm5q1x9C9GYUkoh6rMCD7Szsnj2NDYCKLGX/1rlVa5/geEuMd69IGVppk2ftDiYNLLdn6DTsVc5rZ6D4JuOufoA9mlKJjmL3Qa6KTRwRp036c8TvpUdeWFlWzImostQ0fF3j+El1b6K/FVciwTqUeqUIPT5gbW+S9ouyJM5Q43A/zvYSiOwNAZfsn5euCqPTZf8W8GSeT3frec7PoqJzc7I4HW8mnEwkHiGkw8iJ8iTrAYzIfprbWzU23ZETEZnQ0n+6z1IlKi+7qtiSb4TF5kAPBXTj9uvkA03HDqgU9eUuReZmjfyIvUqvzhpS+I/qPhfUPqIIlCl3/UJ42KzxRT3iYxYa7aTSSoJuvyn9uxP6sphM66OVlWuVClzYTkhGuo6m3X/cCtCnVf5PrHRsx23nmdOMWhYvdSLTZ6O8GCsFRebqTKHqgB7lDUeCZM6+p+sVEk90niBDEWULnR70FG5e/Cc081ogxRbltVwQPxt0GufNb1JNFU3agmae+cw0g5bW+No/7YVrqpZ5SaeAtdvuWYdyQd2n2+m9EdY6O4Er6uMbpzPQvWvrQ0B3bJbUAMa0EQkq6cpsSv+2ebmqFrdjShuTm5cW0n5Q6c3+0NM062gCvpvf9Uc3KgAQfmXyCH7pryjd8evdg6NHefeMDGZPMI/KD"
`endif