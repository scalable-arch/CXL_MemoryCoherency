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






`timescale 1 ns / 1 ns



// altera message_off 16753
module ed_synth_dut_altera_merlin_demultiplexer_1921_ekcygpi
(
    input  [2-1      : 0]   sink_valid,
    input  [124-1    : 0]   sink_data, 
    input  [2-1 : 0]   sink_channel, 
    input                         sink_startofpacket,
    input                         sink_endofpacket,
    output                        sink_ready,

    output reg                      src0_valid,
    output reg [124-1    : 0] src0_data, 
    output reg [2-1 : 0] src0_channel, 
    output reg                      src0_startofpacket,
    output reg                      src0_endofpacket,
    input                           src0_ready,

    output reg                      src1_valid,
    output reg [124-1    : 0] src1_data, 
    output reg [2-1 : 0] src1_channel, 
    output reg                      src1_startofpacket,
    output reg                      src1_endofpacket,
    input                           src1_ready,


    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) 
    input clk,
    (*altera_attribute = "-name MESSAGE_DISABLE 15610" *) 
    input reset

);

    localparam NUM_OUTPUTS = 2;
    wire [NUM_OUTPUTS - 1 : 0] ready_vector;

    always @* begin
        src0_data          = sink_data;
        src0_startofpacket = sink_startofpacket;
        src0_endofpacket   = sink_endofpacket;
        src0_channel       = sink_channel >> NUM_OUTPUTS;

        src0_valid         = sink_channel[0] && sink_valid[0];

        src1_data          = sink_data;
        src1_startofpacket = sink_startofpacket;
        src1_endofpacket   = sink_endofpacket;
        src1_channel       = sink_channel >> NUM_OUTPUTS;

        src1_valid         = sink_channel[1] && sink_valid[1];

    end

    assign ready_vector[0] = src0_ready;
    assign ready_vector[1] = src1_ready;

    assign sink_ready = |(sink_channel & ready_vector);

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZJleD7kVryniLreJjGJHWa1UWc+155CKAf3PNd3J/bFDrKxWcBRdsH8xFyZBJvQtvUye5R3fj7KrlDgUKPGRBqiTuzXoKgsDhCc2/S0Meu8dYrqZzNdMuyPIDDBUQEB0aKKrUzhTR6nPRqxhm/l2uWnPtonSDyuOIkEPgfQ66a7DPD4TNdVlweW6RGPDXSs2/K3tgx1EpWCNeYUxl1zKOHHYJ171EJWPTZjL4WAV0cxGtcV3zTFeG7FN1moMDaLsDSUGvBjM0WQ4ZqXuXETzrI7JUQM64M3JddamXbvF0fLQO7giMkrgR8zkgiXclwsR1aKsVJU4J1Zycy6d/ALT1eafxgxw55weVaCl/E1Q4MD4POacQZvkbc/RmOfB1Txqlk8danqc+Vz7+YKUeyQfloNobRiguSOq7qmdhqt3AePiXjdf+1Mr6Du/XheDnQ6vE5Uy3/ki/eDvFI9xqBlJbeAIaqNsQJVKRrQ3QLl5Nr0aVb3bogxx99Y7gY1UGtxLp75ETC5QQkQ25+9VVBr1vUhBxXu+QWr/bSe6n6AJrxXZob6+ecaKPrL03OrTMWlujyJrPUGJviaEp+cO5rY046OWa8/AjV1LCHuYddxmWG5jmxtqc88o6p7XOZbir+ECjpuh7g/+J1RZzzZPke6yXJS9ZBu0axZu37tcO+9n1Lomgfd9I1DqZt/9N2MlyGbJjIROAIeBsXULoEuxg1yCAdSjP8eAyz5sJvy4dcTZ9rWzK1UBiRSAGX6JKGZg+HOxhOyjxt4z3T0rbEVLL31PS+2"
`endif