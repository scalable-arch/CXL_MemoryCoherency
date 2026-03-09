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

module scfifo_s_showahead #(
    parameter LOG_DEPTH      = 5,
    parameter WIDTH          = 20,
    parameter ALMOST_FULL_VALUE = 30,
    parameter ALMOST_EMPTY_VALUE = 2,
    parameter FAMILY = "Other", // Agilex, S10 or Other
    parameter OVERFLOW_CHECKING = 0, // Overflow checking circuitry is using extra area. Use only if you need it
    parameter UNDERFLOW_CHECKING = 0 // Underflow checking circuitry is using extra area. Use only if you need it
)(
    input clock,
    input aclr,
    input sclr,
    input [WIDTH-1:0] data,
    input wrreq,
    input rdreq,
    output reg [WIDTH-1:0] q,
    output reg [LOG_DEPTH-1:0] usedw,
    output reg empty,
    output full,
    output reg almost_empty,
    output reg almost_full    
);

initial begin
    if ((LOG_DEPTH > 5) || (LOG_DEPTH < 3))
        $error("Invalid parameter value: LOG_DEPTH = %0d; valid range is 2 < LOG_DEPTH < 6", LOG_DEPTH);
        
    if ((ALMOST_FULL_VALUE > 2 ** LOG_DEPTH - 1) || (ALMOST_FULL_VALUE < 1))
        $error("Incorrect parameter value: ALMOST_FULL_VALUE = %0d; valid range is 0 < ALMOST_FULL_VALUE < %0d", 
            ALMOST_FULL_VALUE, 2 ** LOG_DEPTH);     

    if ((ALMOST_EMPTY_VALUE > 2 ** LOG_DEPTH - 1) || (ALMOST_EMPTY_VALUE < 1))
        $error("Incorrect parameter value: ALMOST_EMPTY_VALUE = %0d; valid range is 0 < ALMOST_EMPTY_VALUE < %0d", 
            ALMOST_EMPTY_VALUE, 2 ** LOG_DEPTH);     
end

wire wrreq_safe;
wire rdreq_safe;
assign wrreq_safe = OVERFLOW_CHECKING ? wrreq & ~full : wrreq;
assign rdreq_safe = UNDERFLOW_CHECKING ? rdreq & ~empty : rdreq;

wire [WIDTH-1:0] w_q;

wire w_empty;
wire w_full;
wire w_almost_empty;
wire w_almost_full;    

wire [LOG_DEPTH-1:0] w_usedw;

reg read_fifo;
reg read_fifo_r; // 1 means that there is a value at fifo output

reg [WIDTH-1:0] r_q2;
reg r_q2_ready;

scfifo_s_normal #(
    .LOG_DEPTH(LOG_DEPTH), 
    .WIDTH(WIDTH), 
    .ALMOST_FULL_VALUE(2**LOG_DEPTH - 5), 
    .ALMOST_EMPTY_VALUE(ALMOST_EMPTY_VALUE),
    .NUM_WORDS(2**LOG_DEPTH - 4),
    .MLAB_ALWAYS_READ(0),
    .FAMILY(FAMILY)
    
) fifo_inst(
    .clock(clock),
    .aclr(aclr),
    .sclr(sclr),
    .data(data),
    .wrreq(wrreq_safe),
    .rdreq(read_fifo),
    .q(w_q),
    .usedw(w_usedw),
    .empty(w_empty),
    .full(full)   
);

wire next_empty;

assign next_empty = (w_usedw == 0) && (wrreq == 0) || (w_usedw == 1) && (read_fifo == 1) && (wrreq == 0);

reg tmp;

always @(posedge clock or posedge aclr) begin

    if (aclr) begin
        q <= 0;
        empty <= 1;
        read_fifo <= 0;
        read_fifo_r <= 0;        
        r_q2 <= 0;
        r_q2_ready <= 0;
        usedw <= 0;
        almost_full <= 0;
        almost_empty <= 1;
    end else if (sclr) begin
        q <= 0;
        empty <= 1;
        read_fifo <= 0;
        read_fifo_r <= 0;        
        r_q2 <= 0;
        r_q2_ready <= 0;
        usedw <= 0;
        almost_full <= 0;
        almost_empty <= 1;
    end else begin

        if (rdreq_safe || empty) begin
            if (r_q2_ready)
                q <= r_q2;
            else
                q <= w_q;
        end
        
        if (rdreq_safe || empty) begin
            empty <= !(r_q2_ready || read_fifo_r); 
        end
        
        if (r_q2_ready) begin
            if (rdreq_safe || empty)
                r_q2 <= w_q;
        end else begin
            r_q2 <= w_q;
        end

        if (r_q2_ready) begin
            if (rdreq_safe || empty)
                r_q2_ready <= read_fifo_r;
        end else begin
            if (rdreq_safe || empty)
                r_q2_ready <= 0;
            else
                r_q2_ready <= read_fifo_r;
        end
                    
        read_fifo_r <= read_fifo || read_fifo_r && !(rdreq_safe || empty || !r_q2_ready);
        
        read_fifo <= !next_empty && (
            rdreq_safe && (!empty + r_q2_ready + read_fifo + read_fifo_r < 4) || 
           !rdreq_safe && (!empty + r_q2_ready + read_fifo + read_fifo_r < 3)
        ); 
        
        //usedw <= w_usedw + read_fifo_r + r_q2_ready + wrreq_safe + (!empty & !rdreq_safe);
        {usedw, tmp} <= {w_usedw, !empty & !rdreq_safe} + {
            read_fifo_r & r_q2_ready | read_fifo_r & wrreq_safe | r_q2_ready & wrreq_safe, 
            read_fifo_r ^ r_q2_ready ^ wrreq_safe, 
            !empty & !rdreq_safe};
                
        almost_empty <=
            (usedw < (ALMOST_EMPTY_VALUE-1)) || 
            (usedw == (ALMOST_EMPTY_VALUE-1)) && ((wrreq == 0) || (rdreq_safe == 1)) || 
            (usedw == ALMOST_EMPTY_VALUE) && (rdreq_safe == 1) && (wrreq == 0);
            
        almost_full <= 
            (usedw > ALMOST_FULL_VALUE) ||
            (usedw == ALMOST_FULL_VALUE) && ((rdreq == 0) || (wrreq_safe == 1)) ||
            (usedw == ALMOST_FULL_VALUE - 1) && (rdreq == 0) && (wrreq_safe == 1);    

    end
end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HVwoXV44HvrqLCcyrRLKSPYKBkDWFb/QkVjwDEQ824LbpdY1lpyfSDRh2R2XXI3HT559WzzSGaylMrfix9K0v8D4bP8N/5F2s7q2IVIU3Zbvvtm48IozW/C3YtteWjdzPbWSHrpgM8/tQexSu730vbHbwtI/7bmZ6hVhmDj7iMt/1xxbYHvxq//o4LrluwXjtRNow/nPFObAl3yz5rR4pw9RiExjXrLroBGh1KHp3ENzbxwcVCkblu68gnWRk2bzK7/t4FhO58uGN0oNU1OLYc6HxKNQXdBocE/LcB1kmXXYcCjeOnOsjbazY1exu/Vy76vBStJwnJOymJTX62p49i7CnMrDhxi05NMQVEUTvDqKpFr+MSyeIj8gkQ/8Ci0OxB+LTMO8QSN/yKidEmyiuN/zlXWHWKwbjSPKAYrpovwOLBXoqw06lXjncMhj8IwqR2qGaYI4lg/uI7VypkwEjhqfGurYp+njBdjt1T0dKGClqqQC1YhZu26HJBrFsq+oLy71/+oLccwJv77b0WWg5Z9ss7Z0qayg1T2Z9eGdTZ/yHIkljp835Jc+sAsPVaFCnB0M1yFkHKZ4GZ1Ajr3tRbar9WocXxastb+07DxVADKx/bDPQSSqEuu1tbKiEHx11E7ATuYPR61HNGttvgm1Ra1kRVgViSfy/394V09zzhauOr+3M0iZtuCkfl3xiqss/9c5ftufMEyHwMmTrsATeYdIgFZ8fVhToB+AX07atB3CKlE5ca+/BTwWfBlC5ukbfcxCDKMYOJuet3ZhPOod3fPo4XDuDM1boeKdCH4JNNVYdZmfQnyQ8ASrf4gWqp70UXiwFmMRYwkQ5nHQ0AFM6NrY09378DuHSfIFYXADQYl4249c7Dnd7DUOCEaq1GKfySuE9h6MWLbqsLooUea9nW4mMeo+EYRK0poyAuwy6M85LUOSZD8RwnHTnEFKDfDRm6yZN0awZH1xe+mMING3L+/eXlNpzlo7Z4PV8aJsqApFHX+CCxIt+y1DkXQ3Th1h"
`endif