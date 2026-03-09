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

module scfifo_s_normal #(
    parameter LOG_DEPTH      = 5,
    parameter WIDTH          = 20,
    parameter ALMOST_FULL_VALUE = 30,
    parameter ALMOST_EMPTY_VALUE = 2,
    parameter FAMILY = "S10", // Agilex, S10, or Other
    parameter NUM_WORDS = 2**LOG_DEPTH - 1,
    parameter MLAB_ALWAYS_READ = 1, // 1 to reduce amount of routing; 0 to reduce power consumption 
    parameter OVERFLOW_CHECKING = 0, // Overflow checking circuitry is using extra area. Use only if you need it
    parameter UNDERFLOW_CHECKING = 0 // Underflow checking circuitry is using extra area. Use only if you need it
)(
    input clock,
    input aclr,
    input sclr,
    input [WIDTH-1:0] data,
    input wrreq,
    input rdreq,
    output [WIDTH-1:0] q,
    output [LOG_DEPTH-1:0] usedw,
    output reg empty,
    output reg full,
    output reg almost_empty,
    output reg almost_full    
);

initial begin
    if ((LOG_DEPTH > 5) || (LOG_DEPTH < 3))
        $error("Invalid parameter value: LOG_DEPTH = %0d; valid range is 2 < LOG_DEPTH < 6", LOG_DEPTH);
        
    if ((ALMOST_FULL_VALUE >= NUM_WORDS) || (ALMOST_FULL_VALUE < 1))
        $error("Incorrect parameter value: ALMOST_FULL_VALUE = %0d; valid range is 0 < ALMOST_FULL_VALUE < %0d", 
            ALMOST_FULL_VALUE, NUM_WORDS);     

    if ((ALMOST_EMPTY_VALUE >= NUM_WORDS) || (ALMOST_EMPTY_VALUE < 1))
        $error("Incorrect parameter value: ALMOST_EMPTY_VALUE = %0d; valid range is 0 < ALMOST_EMPTY_VALUE < %0d", 
            ALMOST_EMPTY_VALUE, NUM_WORDS);  

    if ((NUM_WORDS > 2 ** LOG_DEPTH - 1) || (NUM_WORDS < 1))
        $error("Incorrect parameter value: NUM_WORDS = %0d; valid range is 0 < NUM_WORDS < %0d", 
            NUM_WORDS, 2 ** LOG_DEPTH);  
end

(* altera_attribute = "-name AUTO_CLOCK_ENABLE_RECOGNITION OFF" *) reg [LOG_DEPTH-1:0] write_addr = 0;
(* altera_attribute = "-name AUTO_CLOCK_ENABLE_RECOGNITION OFF" *) reg [LOG_DEPTH-1:0] read_addr = 0;
reg [LOG_DEPTH-1:0] capacity = 0;
wire [LOG_DEPTH-1:0] capacity_w;

wire wrreq_safe;
wire rdreq_safe;
assign wrreq_safe = OVERFLOW_CHECKING ? wrreq & ~full : wrreq;
assign rdreq_safe = UNDERFLOW_CHECKING ? rdreq & ~empty : rdreq;

initial begin 
    empty = 1;
    full = 0;
    almost_empty = 1;
    almost_full = 0;
end

add_a_b_s0_s1 #(LOG_DEPTH) adder(
    .a(write_addr),
    .b(~read_addr),
    .s0(wrreq_safe),
    .s1(~rdreq_safe),
    .out(capacity_w)
);

always @(posedge clock or posedge aclr) begin
    if (aclr) begin
        write_addr <= 0;
        read_addr <= 0;
        capacity <= 0;
        empty <= 1;
        full <= 0;
        almost_empty <= 1;
        almost_full <= 0;  
    
    end else if (sclr) begin
        write_addr <= 0;
        read_addr <= 0;
        capacity <= 0;
        empty <= 1;
        full <= 0;
        almost_empty <= 1;
        almost_full <= 0;  

    end else begin
    
        write_addr <= write_addr + wrreq_safe;
        read_addr <= read_addr + rdreq_safe;

        capacity <= capacity_w;
        
        empty <= (capacity == 0) && (wrreq == 0) || (capacity == 1) && (rdreq == 1) && (wrreq == 0);
            
        full <= (capacity == NUM_WORDS) && (rdreq == 0) || (capacity == NUM_WORDS - 1) && (rdreq == 0) && (wrreq == 1);
        
        almost_empty <=
            (capacity < (ALMOST_EMPTY_VALUE-1)) || 
            (capacity == (ALMOST_EMPTY_VALUE-1)) && ((wrreq == 0) || (rdreq == 1)) || 
            (capacity == ALMOST_EMPTY_VALUE) && (rdreq == 1) && (wrreq == 0);
            
        almost_full <= 
            (capacity > ALMOST_FULL_VALUE) ||
            (capacity == ALMOST_FULL_VALUE) && ((rdreq == 0) || (wrreq == 1)) ||
            (capacity == ALMOST_FULL_VALUE - 1) && (rdreq == 0) && (wrreq == 1);    
    end
end

assign usedw = capacity;

generic_mlab_sc #(.WIDTH(WIDTH), .ADDR_WIDTH(LOG_DEPTH), .FAMILY(FAMILY)) mlab_inst (
    .clk(clock),
    .din(data),
    .waddr(write_addr),
    .we(1'b1),
    .re(MLAB_ALWAYS_READ ? 1'b1 : rdreq_safe),
    .raddr(read_addr),
    .dout(q)
);

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HVwoXV44HvrqLCcyrRLKSPYKBkDWFb/QkVjwDEQ824LbpdY1lpyfSDRh2R2XXI3HT559WzzSGaylMrfix9K0v8D4bP8N/5F2s7q2IVIU3Zbvvtm48IozW/C3YtteWjdzPbWSHrpgM8/tQexSu730vbHbwtI/7bmZ6hVhmDj7iMt/1xxbYHvxq//o4LrluwXjtRNow/nPFObAl3yz5rR4pw9RiExjXrLroBGh1KHp3EMCcPOgo1EisXil0OQrB0T6iqgi/HYL4NXONK4rvBnFaVoYjA+Px7yExP9J5nH8zP4R8zqzD554eCcsCSMAQhUv0EZOLzKTkaORJJmx2g9M726A3mxsQqLbiLszdLGam3TOcxeIeY6gucviZbrqGHBmzHeyBfTFJWX3jx0YveOi25Y+rKKPRvjT+81oa0zDmaCBmiXs8mT79cSguAMgOO1jTGCEEyglIHhciaFbIqXkOk42ZaahJJJ6b3RjSzoiALVQUg+5XjxuQwd0ymCvE4cB3y2HVCs1GZJE1jfa2zGO4njoFYdOkmA3N85YzImpjZF5X1qHsqE9FQ0T7qnNESehSgKCuv7GRm9cFs3a1OO820T1qMotNo9J0b58jhERyx+4yHBYL3+RBvGc2CuLCZViaAQtneVJfOHOQOohXffjnBQHmrbH4YMqB54Mtpxrd3HUtRaVhMCY6nf39ON/gY272AEyjzl3TTxqXpcXd3H3tItiNJFrc1giwBaeVk2gkFLzBIFjYg8Fp//7IQSf1HlQhrPHMXpVTzFZXRtMz6n7dMXUxe0ykJ3PLDGsw/O1O79/0OzTZI9O8IPpmqY1hfAIAJkFVXu8ZJh8BK6p5vhFFqlKz6NLfqqVIpYNaEyWdB2Q+W51Apq39rfTwQ3Z0NCxFB5DAEIW4ACBvPEwCguRl2m41g48VAzR2E+yPKL4Hynf4rMaLGMWasneGSRq16fC1AIfTDIuYBXJhJAbnJWDXiYtABksm/mz7FKcadBtZvlv9eZgRPYwUBw8mz3J8wmJ"
`endif