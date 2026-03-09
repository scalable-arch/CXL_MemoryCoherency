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


// Copyright 2021 Intel Corporation. 
//
// This reference design file is subject licensed to you by the terms and 
// conditions of the applicable License Terms and Conditions for Hardware 
// Reference Designs and/or Design Examples (either as signed by you or 
// found at https://www.altera.com/common/legal/leg-license_agreement.html ).  
//
// As stated in the license, you agree to only use this reference design 
// solely in conjunction with Intel FPGAs or Intel CPLDs.  
//
// THE REFERENCE DESIGN IS PROVIDED "AS IS" WITHOUT ANY EXPRESS OR IMPLIED
// WARRANTY OF ANY KIND INCLUDING WARRANTIES OF MERCHANTABILITY, 
// NONINFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE. Intel does not 
// warrant or assume responsibility for the accuracy or completeness of any
// information, links or other items within the Reference Design and any 
// accompanying materials.
//
// In the event that you do not agree with such terms and conditions, do not
// use the reference design file.
/////////////////////////////////////////////////////////////////////////////

module add_a_b_s0_s1 #(
    parameter SIZE = 5
)(
    input [SIZE-1:0] a,
    input [SIZE-1:0] b,
    input s0,
    input s1,
    output [SIZE-1:0] out
);
    wire [SIZE:0] left;
    wire [SIZE:0] right;
    wire temp;
    
    assign left = {a ^ b, s0};
    assign right = {a[SIZE-2:0] & b[SIZE-2:0], s1, s0};
    assign {out, temp} = left + right;
    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "7MBsfGNfLBj+3Zi0T+jPOOUG+uBbozaZWVDc4xAFLKvkE7uHMcMX/Sb/YzYLVWEO4dPcV49X5MnL3Ek9SCr5TxAoL3kAbmnHB0r2kq59JrxDdeZquVD0c1SUF14wlg3eyf66c5j3gg8NQDtmre7iyEUOtx0c6jRrIT9v7LBW/+u5RCTAfPF6zxCuM2/BFtpOIcKwM+ejcvpE3I08RyJgOSecDgBO8M6JsXsm1V3AwfKZZQWFT4ZSQg3eF2Y/P4hbLVPCNxnSTAWLauwUNuTPj1DVQmmUs4Zjtk2vd0XtD+rJgR6r7ZtgWq5ewII7oQTmzKo+94z2KVedeEo0IVF4nHjNF3ouEpIFJkKgo6I7uZH2PZs3yAL1cMyvT83dVM/0mJeE97+d/d2proHxcQYfYp3lbs49/GQy1agkomYGP7OOr6ZNYC22ASRQswPcnyIbBZz/mHySavxkyadTdosGk8rzKRaTzdcwQXOYk+cBSPSpxKHzbRJXmKHakwCCZgPr+1BEYt3iPevoO0ZBJ1OcKAcBTfENAta75T7Dl/Ba/AcL3X1BrWt+xF/SbvE5q0poolLN0uIrRW9oAKLNNsrqfOLRMD7cglOrCRlMMs0kGTQcP8+ZbcrsmHgCWb07QCiIpRGGOpjJbMowI+mqbR7fhY7mQdEj20zfopXRY4v22eUmRH+p7gzyeOHqCxoi2pYdviCrs8Vy8U90Zxd0jDH3agxAH1VxO7VroQJorRoGkp6unI8+4ugcBfXPf5tO4MguvrZi8Iqw36wRBiOSYVenK7P8tSxVkh22uay8CKAFxJKluXncQ6MogawB5fvyh/RdB3cEgEPjASsevSzccnG6HoW8O2t/zdrG6a48oSloNmAGI3W/ycTp/y1vdfMHz6USOifpZCSR8qcI7Ho1qr4XreALZhL1lemhVVXIuKcnADw55yvOtlqNMDmNB1W3IpsL9ZVIS/AnUYwtkKoUM7M15dQAri9vevjPmcJBFcQ7TVzFfClpTDz7TAnedP9iSosi"
`endif