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

module rd_sipo_plus_cwyib4q #(
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxyU2IFOpEdrVOsEIfzp25XnyPkiD22vnLh5bzTsQB72twbgVullwY7/Ue/JhnVyGSA1/3+GL8mGX/mb60lCo/UHwqfaItNgQW2jG+hlPOzjhTB3L+Tx+51KMn9WvHbq+IEl9THA4Dyx+lEHfI759Irrg4zhdc6S35szUpNGj7FTCvVp71LT8mrwZSWxkP2COac9DXZkQkjXwR8c7RYsMcLa7VmgWjxNA9AXpRIAn5bmMLPOQygXN1fACIJcpA7vtkYDvlUmtg52mcbYDu4GMifJJX/+0cSHbrW5QaZKQV9cKEwsDovqhlzd/xfXRWkRumwr3y5cUvcaQfP8f8J/U2IC/zBxl4CnQckLx0rZHbI2TCPvlxXq34+VsHASQSljmPc1enWHe6Tk3NTGOjs+go9TaHtJlcs0zi/ZyzHey9uofydlERoV/tdCdsYE1jFK2C/akTmiIAV0enPacwD/wMufDhVlhIDgZsxtibXUuicGo16xjTjwjrxLPvU6xfC+b37LeU7chHPlTbeh9uZ5KuPle/UCGBmHRMX895zdG9J5rdeKui+Dme1WFFalk4BHpB2ore/pQK7XiuecJqrLyak71VhlMEY9rvGaTZordKbwJuhki1T6Eox8UF9tFOhzpbyonAmGYK0c3xcyJxUn1xzLWqkTUdd6/Y5SFYEB2y/7ClwoHN1BQoohKnaVzeQ0rcOm02bhvyAi0bPG2T6qx4ii//eqWOb9GvecPXJai6ZG6//J/XzCRNqUjaan9nJkE1Dk8H5knC2BwnYOIVqkkW7y"
`endif