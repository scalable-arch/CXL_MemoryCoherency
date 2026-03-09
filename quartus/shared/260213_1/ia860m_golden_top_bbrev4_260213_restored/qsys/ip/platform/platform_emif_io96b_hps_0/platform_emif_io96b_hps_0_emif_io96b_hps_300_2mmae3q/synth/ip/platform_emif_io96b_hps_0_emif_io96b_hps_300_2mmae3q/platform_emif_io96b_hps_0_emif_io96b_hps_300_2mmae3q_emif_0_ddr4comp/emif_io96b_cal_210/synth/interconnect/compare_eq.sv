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

module compare_eq #(
    parameter WIDTH=10
) (
    input [WIDTH-1:0]  in_a,
    input [WIDTH-1:0]  in_b,
    output             equal
);

assign equal = (in_a==in_b);

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "3wrV9vxkV6cm3KZuU0YmrpECz0gO85cpwPAwvoDmqQfm97s5UZmfYguhz8/428PUc52yhrNL2DIcflQpOkDgIHixsN/qQIr1Yl8RrFxWUW9+BWG4mgSfzo8rnvUQWJayS2cUu9k11ZYcmdN3LHF6s1KoNJ9JXlORxyEgsglhkdhkf1ALusfEVuG233HcW8M7RNXR6hb8GxDqWtwlLRj1qCOttHqbLRcgsbfjrMDR1FjQL9exbfXYTp137Dtd6Y0g6L4MgYOzwjRQpR0jP8MXyY0JHzOEOLBvGLeAfT0zJFN5eB54bfkyPWJXaUD9Yt++782v+rIWyQg5F3Q+VN5KWZObQSZSJZjskCikMATWs4odQUY2/UcTZ3iS0cyZ1gXZBv5vGyXsGpo3JMt8UqBRfF1GddwcaSNOLRFHi1adCsXu76Z1F1CAuiXCV+d92LcX5yDP9SbxTbuY8uOetEv1wHnVth16O1avdtiqUj8qtb0rrDaBUiskNDQOGgJrkP3YC2PV5p5Ep5C4udKdywI3ziips38Ds90PuJy67yjR8tG/R6zabBtu54dn1e8SLL326vGTA2sisJaEzjaRfIKsLJnA326qDRFJRXuJyNTM7cWuc6AbVd7frqsYkl08yfw34RPfW1+c+YH4f3PlPLrR0O6uYYvNhwJ9mQUj23tFchjYyASeMky7PNT0BIRTQEikjAtaLzBKpg5fs5fbnOqOERLQBFzbBPh4+FDq/9hu4gCx7eTa7MyIsxZKV5gt/lwT2hZcqDd/Z33loBENj5mAY5TuV7o5T6CQNg04nejD9dHDDPGwYJWtrjyx7Cdd/NXGCkPee8GzhdSawScqvEdT4qSIxEZ5C/Yaco4E3KjR+kltA956dS76He9dUzKofYAjSx8SNrd00sOxpHpDnq0yCOcmq6U2usnwNpYR4/6dZvcbsyarjLzWAiNvHJzbqrGMYbPHq2pU03yyDXkLFcSkzzETYMcG+/Jb0ZL6RUUP88PAn1MYWRVdlTzrc4hYcISV"
`endif
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "5qS3R8zxMttf7PJZTLA7cV9GvOjzarX5rX3ZxL1o5zj3QP1K0LmZoKwXVD6b1QvvIJ9fid5j9cKLnFdu0COwdLVaXTY/GdPvplw3j32PW5cnpwwRIzhDy4zVWmqrZgNl1eZUZk5L45DCLouaHzhlqR2LGNMxIFJJsOc+EsoyTkxz/8RlczaMBCu9H9vNWzBfSJPhmfV/caquNxVQRFMgJSsVvMN73gqKC74p2Q2AoZL8qHKEnzV2KNfE3MwL5no7E9l3FLD8jy0YgTZtecZwXCnpEF3qXGu7Fl7h7GpLZgWa5sN6DSQk6GcI2b5t+TGnCKnvBUAtHONrBkthVqWozex5wHJlPOgaPKPBqpjfg2vvQGXbOiqRjApu4Bc4BVacMTZsAB9CWUCaKycj7gOTIS/GQML587d2QszxCBq3F/Mh87wWSMT0z6OLbfl3MrgbuKiwvpx9cq57KQbRL79hXEgp29OMmFE7iD8M++h7SEYvgn1XQit8xjPrTTZmOJQPKHnnIry3Ar73W56Ex+8mnocJgzBn73n4vyyWgpY/4YVRAdsfqAsdGccIMsAg+vfvqpG+uDcjNGInasx2GT0jx987n5tvHhqkn9G9WvgH7cBxFdOz5NSgFged9dt6Mf8TCSmJqLi3K0U7XNIwzsR7ZR9nw4VBRkRfrSqROuJt4Alyjdpb+/9eKv8utgurSc/lfHnfOJryaKjT9nLSm8q6WGpAPDb6NI529kh+jFXKSZzySQTGKFbs2mv9TLEBu+/+6RxMTf1ns7GQ5BNieJVUwdHa6ZazfHAmRifmi/qtxgW999SFifguW7nIjvRp0tKtxXMY2v1sXIaap96V5Fbl/098iAJjZnzg70JZmOyN2ZAdRJEEDer93nHPLunBQTBjYTjhFpJjjqIq7V1dqAk4JF/BI2yhbMn2bpO3vCqoYgsel6Z/SCE4v6Jhixjzk9SrCOjhhAySNm/tTd6MxdS411LtAp7OFNo6SV4R9KHwBFcCBo2/Hpqy8pxK4m3Xdfvc"
`endif