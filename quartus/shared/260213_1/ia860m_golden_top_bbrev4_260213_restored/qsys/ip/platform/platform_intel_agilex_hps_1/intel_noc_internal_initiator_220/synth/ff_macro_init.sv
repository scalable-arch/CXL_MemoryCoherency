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


module ff_macro_init # (
 parameter DATA_WIDTH = 256,
 parameter DIRECTION = "INPUT",
 parameter NUM_FLOPS = 1 // based on number of flops you need in 1 dir 
 ) (
 input logic clk,

 input [DATA_WIDTH -1:0] in_data ,

 output [DATA_WIDTH -1:0] out_data

);

    genvar i;

    generate
        if ((DIRECTION == "INPUT") && (NUM_FLOPS == 0)) begin : CORE_TO_PERIPHERY_DIRECT
            assign out_data = in_data;
        end

        else if (DIRECTION == "INPUT") begin : CORE_TO_PERIPHERY_REG
            (* altera_attribute = {"-name PRESERVE_REGISTER ON; -name FORCE_HYPER_REGISTER_FOR_CORE_PERIPHERY_TRANSFER ON; -name HYPER_REGISTER_DELAY_CHAIN 225"} *)
            reg [DATA_WIDTH-1:0] out_data_reg;
            reg [DATA_WIDTH-1:0] in_data_reg [NUM_FLOPS-1:0]; 
        
            assign in_data_reg[0] = in_data;

            for (i=0 ; i<NUM_FLOPS-1 ; i=i+1 ) begin : PIPELINE_REG
                always @(posedge clk) begin
                    in_data_reg[i+1] <= in_data_reg[i];
                end
            end

            always @(posedge clk) begin
                out_data_reg <= in_data_reg[NUM_FLOPS-1];
            end

            assign out_data = out_data_reg;
        
        end

        else begin : PERIPHERY_TO_CORE_REG
            (* altera_attribute = {"-name PRESERVE_REGISTER ON; -name PRESERVE_FANOUT_FREE_NODE ON; -name FORCE_HYPER_REGISTER_FOR_PERIPHERY_CORE_TRANSFER ON"} *)
            reg [DATA_WIDTH-1:0] in_data_reg [NUM_FLOPS:0];
        
            assign in_data_reg[0] = in_data;

            for (i=0 ; i<NUM_FLOPS ; i=i+1 ) begin : PIPELINE_REG
                always @(posedge clk) begin
                in_data_reg[i+1] <= in_data_reg[i];
                end
            end

            assign out_data = in_data_reg[NUM_FLOPS];
        end
    endgenerate 
    
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HVwoXV44HvrqLCcyrRLKSPYKBkDWFb/QkVjwDEQ824LbpdY1lpyfSDRh2R2XXI3HT559WzzSGaylMrfix9K0v8D4bP8N/5F2s7q2IVIU3Zbvvtm48IozW/C3YtteWjdzPbWSHrpgM8/tQexSu730vbHbwtI/7bmZ6hVhmDj7iMt/1xxbYHvxq//o4LrluwXjtRNow/nPFObAl3yz5rR4pw9RiExjXrLroBGh1KHp3EMiF85KzZkdWNU04dv9yUUi8LpLVv+KEu6S1WJ8gc+ek1crJYirGM98qFzl7HFyhp3CpG12fapw7q1qoQF/aB3NjuqkGphsYJ2cKJFZqhhKYYnw8LXjcCpvS6emG1obDKTutpremQ0ZL/ivlHBCyR1baLy07Glsxh4h9efpBRmpX4SjV6Vh08MvoeGcDUxG5KkOIXBvI8OocpDwTIIJ8KuUSOTVKvFJnms7JXQ/jWNGfxxW/Dur/Q5C4EHbWiCuYv9w5SU/5gAFIW4doou8SgxC4RBRC+C0ShJGTBC3OuKS2gSKGJENyTEa92UVJSDJs5/ybAfEhsq5gjqprYeuuKAeEBUV8J/9IcwUEtKcgJNuVFF68vH05r0gW3OdUsWJjjVKognoy3+t3XKTTGFMvXzvdxR8jTQsNJi0ka7P6ur70v+UNdBc5B3Vt7+dUBIR3D55pjMTC3WF2w7mLqn/w8eP+VoJ+MV+BtfYhHgZUDA801t5JdV30sLwj9bu9Tr6vu6zomXHt3cQrU2vp9zj8b2v0EPbiA7y+iEkq7KpZXkNeLddPT4RypCSrWZxhGoxYQ5N7Go0VGjlsb/7ZMAGap030ojbUIXKRa2ax+83d+qStO6TRCyWnqTkjne0Cz8y+hAtE87mtyKGnYk8qO6s4IXHU7rWX30EfPA9NPEk+qYhzibyC+7MHI6FtnNt8cgCjtU/gfqiTSzDpjp0DGtJzOoiNJIH1ioR7I89RdZ11hbM2DK6qm8mKfTvljmkRFmgv4dbO9t2iYoDK0kvqpR9e2zQ"
`endif