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

module altera_reset_synchronizer
#(
    parameter ASYNC_RESET = 1,
    parameter DEPTH       = 2
)
(
    input   reset_in /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101" */,

    input   clk,
    output  reset_out
);

    (*preserve*) reg [DEPTH-1:0] altera_reset_synchronizer_int_chain;
    reg altera_reset_synchronizer_int_chain_out;

    generate if (ASYNC_RESET) begin

        always @(posedge clk or posedge reset_in) begin
            if (reset_in) begin
                altera_reset_synchronizer_int_chain <= {DEPTH{1'b1}};
                altera_reset_synchronizer_int_chain_out <= 1'b1;
            end
            else begin
                altera_reset_synchronizer_int_chain[DEPTH-2:0] <= altera_reset_synchronizer_int_chain[DEPTH-1:1];
                altera_reset_synchronizer_int_chain[DEPTH-1] <= 0;
                altera_reset_synchronizer_int_chain_out <= altera_reset_synchronizer_int_chain[0];
            end
        end

        assign reset_out = altera_reset_synchronizer_int_chain_out;
     
    end else begin

        always @(posedge clk) begin
            altera_reset_synchronizer_int_chain[DEPTH-2:0] <= altera_reset_synchronizer_int_chain[DEPTH-1:1];
            altera_reset_synchronizer_int_chain[DEPTH-1] <= reset_in;
            altera_reset_synchronizer_int_chain_out <= altera_reset_synchronizer_int_chain[0];
        end

        assign reset_out = altera_reset_synchronizer_int_chain_out;
 
    end
    endgenerate

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3wrV9vxkV6cm3KZuU0YmrpECz0gO85cpwPAwvoDmqQfm97s5UZmfYguhz8/428PUc52yhrNL2DIcflQpOkDgIHixsN/qQIr1Yl8RrFxWUW9+BWG4mgSfzo8rnvUQWJayS2cUu9k11ZYcmdN3LHF6s1KoNJ9JXlORxyEgsglhkdhkf1ALusfEVuG233HcW8M7RNXR6hb8GxDqWtwlLRj1qCOttHqbLRcgsbfjrMDR1Fht4277Y+91VJnUrh/5hrFqOADwKRqiLsdt/cqGLEzhQQcrWmg51Yy5mXnSiw6FfImIkgD8Ck/ZT4cliEkfBJ8MvlFHiucF4gjdNZhvvfZU3j81OpYa3tPH5H2W4J0+SkdP2DPeAapjXi9YkQVQjsI0v4dbWpeIG8fZzNZQb9r7IdLCqtnNFCmiFw1vqqzdGnE27id82+iufRydCYAVk76+AWQbaZyosgkUXLqY4VRCSoh4OJxErbAAjmhklcR3qbZtNBCdqCF9bqryWupZkMpklXsfe5G7KRiw8bMAjFvuAkGQdFiOzIojPkWtODBv1c3i4gjsuZE3PgHhRr39wn7obP7Zbf3zLQj/+o5QqVZOBuvsEIcRop+a6TucmMyF05/Unhp5C8/X3pneoq2+xZlVNyoTAWvXxsJsJerJ6mVoXwgs0Z3s450Mwxyi5f58hSPcUlD0U5YH1oljVxcbGyTA/kGzhItzAQlqjUK8Y6PiM7sgNM8c2LCi+syVlvevi00Di4+5Yflxzgid71tikJyvSLR2JIWvDyEwfW1F979kr7GG6qPKwZe6wFqkahaYAqD1kRkCW5dk+TcXzoc1iadVqlx0CgQIAleg7RoO0x/ejjgjSGMJ+kMMBQjDfpp8ulvK+sQlLhAx4dAtyXhMd1yE2XZo2y0Cet2gTSahyRCLfrD8ATSo+QfCgxeAyrOgC1PLuBivxvInziHwS9gnXV4igXcvshPg1Ix27cLQaYhmSMa44reiY9GfUxWuPfMvegh30ope1L7aenwCK7bSPmwX"
`endif
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "h/iChvxs1BqfjCvpkkJPYvhSyoexz9FnJDZVTIO5lu4JQXqq2zA2zgvU4XUFIeUaspH3pVSXDqAt1zDtj0pnJvSsBYN1vXKXvJgJbipdV2cWNbJwAzoqyz4d52bbneU7dZwyXGLq7j66sBqfbjcD19fcQrHLLZVIFVJ99lJAOuVYNHkW1nicOMqEXTRwhHFvEzNITCKHr6Lm5PjCaA+dAuM3eqAQw7qxLNemioqgtfVjHPBsTw/JckVund0JZONJSFYtXfifDjC1DJcSuKOShta+fAPbtEbxPI7Jmmod4A9rU9ip7ua52vo576qJhA3OONZVfPvKBPIaqvVXBehpmkNuXFn1gFNcAx9sGN2sd4o3Jyhyf7XMd+RprE1JvBaik7r+A2lmoPKzCx4l81K4ToASGgvzCXWcn9+BOUR7kRDHQYHh3Jfii6g3MJmxBQef0Fz14ECrrBo3DseVNAuS/+9+T41ieoLMhCZTtRFYCfXqDiCWNS48PpQ+cLvzhvmwok6bPWNpI/qE0Eu7Is1o9ZmYNc/g5KwApaRZRqAVnh1BYIQS4g4FOsP82qjwfriUzDYDj0w2zAmKt3M6czY8oJg1CneTIino3VquLKtdGnUDwGGWZbWpS4D8rUyIhUpAWCd8kPOLkSfSDYaXphpdaa9o2Ffj/QtJ6OTeKBGXeT/Gm8BiXz1ICecBwOdQuzXndZA4SoMRQVXH0BRzauKw/vuH+dAGa1c5w2/UVMxp0tfokyQOT7KqQlG9ZxtvbxwK3lvpuVMLcqx/OJ6uiGDCwTCB6ZdGTxrbxDcrU3fUMT29f4Uj2/TLfbDbxHQPSBnEWLKs+EeE+1TVGFIu3kV9lBS7LlvQ6MV9cZlwoOIn6aj+hJ+1Bwg7su9aWnYTFORBm3EGtiMst8nmzInxdxEsvVuMhi2RiV9S5IVxLYa49TUJvs2t/yOGQTaUSM0xn5g6ZUPdiGkyzvEJrxY6w2wkwi8aqCuZKjPxzEh6MKIUNgrvx5gzWOlJKGH659msYS7/"
`endif