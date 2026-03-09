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




module emif_ph2_gen_ff_init_1 (
    input wire clk,
    input wire d,
    output reg q 
    );
    
    initial
        q <= 1'b1;
        
    always @(posedge clk)
        q <= d;
    
    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxwrqbNMre5uNBXyWOI97Lp1lIMCuxDnNYl3q7aWD6Dpg4END37rlXcAdFbh33OXMe5wCqur34efzAuOTT0ISwnC+Mks/FutdARbUnt/0MgIbhEGMgDrp6UFmN9lDdUQyIVlmsHBIVbIM76yRF5A5hVyDsHlaKDBA4z5zqV8uwJU0V7jbrWrIEOB5JdWN0QGx24LV+yxlz51uLRH2dsomPb39mclULYfjk4CAsnuRaFxBLOhuYJQiaaE4dALwBPBCuHWKQaCz4XNWvzwIhd/U7PjV5MHDvb/nO2Ymx2ZhoW2PinmDODN+yL8gOxcxVsL4Itb051vwl1lF36cVrKhMgCCcJ8OzVwhlgeEWZG/iN+wgXMT1omLvWhtN0TQj6Aggj0BzYFBMugJwGe7ONab6qMp94HX0oV7i8NaZh9bO9pPL95Jup1bX6gvbU0eGWFnefhlQq5pBLiJ5s3czybxehwzQeXJDd4L+WHhbGQVmbWZr0K4o4GRBN2DnGV+KpLG4DnUd+AvZsE4E7Iu+ATWZG/fhi5xguS60d2E0EZQKayMli2EDB4uvn7zASwJCtWh941PQmJ3onCxWYZj/0t8+/rSS35z6vXxSG9D0M3gjnrywFOUvhs7MiNsYIuvDvvBTJ8PSY87OvAjzkyj1fFYTFlu7ITCXccluqU7jrM6XmYOHwDtQyDLdHSrNIvWkEyGW6ht6wnHaU/r71liZ4VZc8SvssTOIMDMSxwyo+/RNXmKd/WJA98YkCbNr5ugVsk/CJVqiDvYGSJ15obMTXDFWvFa"
`endif