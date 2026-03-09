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


// a generic clock divider to be used in simulation
module clk_div #(
  parameter RATIO = 2
) (
  input wire clk_input,
  output wire clk_output
);
  localparam WIDTH = $clog2(RATIO);
  logic [WIDTH-1:0] r_reg;

  initial r_reg = 0;

  always @(posedge clk_input)
    r_reg <= r_reg + 1;

  assign clk_output = r_reg[WIDTH-1];
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxzxYFbwQGqmLS5V+1lyIm6KSIWcRgaYb6j0UvIVIhheqsmSYhnTEMnLL+ifFNnAtwdUL5mYtkIe1W7keIRTi7OaAOnDtk7oYBuHFc1Pw6q1zioRpjsWk+jLKxdGqF15+RqUc8k1/IDn0tZ0gZuliDyWBd39tU1jx/c/3zSLxBusgr8/PwrhZKXm0JqJjOFWNmdbgEMMq9muQkD+PgJqRKbnquKP2PzM2sdsTyZKBo0SpU2uT0POa1CWHE/WsPL14mD9j9Zzwzp80Cjwu5qYOGkLL0gqi4fa2pHvF5McboolQBAfB+rDgpWTVr0I3i3VScvjXBFFZsDO36U9kcOObpMm54rpNGYRnaVKpF6pU8KsKls7ppErheKmbLp5t3Y/ToDWKdlSXGLDmFRZQO6Jr3vOhtH1jLaRRfhhMRAQAbewWfCG3WbNN0S+7d47Bh3CH8ZPqHYpJOK+2EreAR87FV1WgfdDSkKJV+sbY8+Ky+W6zJ0fGAo5d653a27rrCymDc/mesGyqLOINPqmDXu40oneaf6HITSI1TRVrQKRN/CJWk0UnChlOv4SBuZvdSk2igB1RRvF98HTrQGKxFADvtE+SBCcr/OeSt7HMcGZuBQ+o+qDbuRRNNGV+8Gyo/7XQ1P4rdr5yERQditUJk4qIDir7RsmPqCY9FjNtqWL65qwNU/xkrhp95rg7jJXCoB++Tja7yWlwYX5y6ceqb8XxF/zzILZil+pjvlbzUwQxoki30X+oK5oBm1YOO+HTIEqR01mXhlGbhATfsaZm/D7XfkL"
`endif