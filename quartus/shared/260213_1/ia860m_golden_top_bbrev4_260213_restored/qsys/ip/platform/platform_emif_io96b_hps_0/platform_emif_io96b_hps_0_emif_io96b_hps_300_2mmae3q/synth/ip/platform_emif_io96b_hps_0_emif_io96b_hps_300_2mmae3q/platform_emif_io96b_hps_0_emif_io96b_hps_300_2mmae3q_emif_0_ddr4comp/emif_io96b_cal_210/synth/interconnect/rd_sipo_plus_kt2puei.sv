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

module rd_sipo_plus_kt2puei #(
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxxjH1HC0wge9rbsbBSjwCTedsCOEzMkp6jKOtTiQq8ifS18rY5xEXLsdorLyL8nZKiQEYTo/rHKQEr8b7VC4JvTG9q+/7meoXy4wOpy1YqkFT595Y9VdZxu+2npUWsF7MTSd0MrDH3jYCBof6SpRpdLLmyVEfRtrkuurR2oDc/puXTx53IlUl9kjxtj9+xmqU4Kn5Zc/RAZkyM8vLl3R+2HbKfeq4aRVa0VC7OzTyO9ITrxL0c5YSRWcKfeCCvj/mp4LL1bjhsx5PR+0UI626IhG96x+1OX0FRfRrv0H68slHQY7Bxys0B56hj8asLmd9r+/mNuF2tGMMjQ3LFxf+AJTSe/UFu26+TXALFZbnR62F99lbLJ3R60CJONLChoP5M1BpnU57pv6NnCIHiZ8Zeuks+lXHEZfzdqT1HiijUAv3xrsczgUyC07Q1V8AADzsp5WHVVTcfgGm4DHhX9PpLIUArZ7DXzkc5kV67UWNsEpfFCmvTsI/zy9zbtwF90CyqK19FkFjCeSE/fl4v+6D+HAgDnnkt7KAZt24/mgDbrq6CxP8bJFRoMEejGu80lBVBBMc9DZ9lNfQEvK+jKW4JOpb0VKGuG45Dbh/lN0JdVtMR1ktafenx1I3x2DwISCQFoHuyLaFx4BhDG0W77NFWa1zVNxYjYNgXJFZTuyZo1oH0S1mYc/qYxOMPm5X5USLt/88GdSLs4/leHVWdtIgCtYMaA0yDcniuzszw2ciHvIx8i8tkA8gYfYJ7en8cVQy7ZRblKy69iYWYhOf0Rug2i"
`endif