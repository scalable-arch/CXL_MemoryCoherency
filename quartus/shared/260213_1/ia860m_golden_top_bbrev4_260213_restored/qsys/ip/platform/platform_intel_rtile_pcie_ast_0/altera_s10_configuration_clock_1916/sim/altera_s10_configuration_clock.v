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


// $Id: //acds/main/ip/pgm/altera_nd_mailbox_avst_adap/altera_nd_mailbox_avst_adap.sv#2 $
// $Revision: #2 $
// $Date: 2015/10/19 $
// $Author: tgngo $


`timescale 1ns / 1ns

module  altera_s10_configuration_clock
    ( 
    clkout
    );

    parameter DEVICE_FAMILY   = " Stratix 10";
    
    output   clkout;
    
    localparam CLOCK_PERIOD = 4;
    localparam HALF_CLOCK_PERIOD = CLOCK_PERIOD/2;

    reg  wire_clkout;
    
    assign clkout = wire_clkout;
    
    initial begin
        wire_clkout <= 1'b1;
        forever #HALF_CLOCK_PERIOD wire_clkout <= ~wire_clkout; // most efficient method for sim speed      
    end
    
endmodule //altera_int_osc
//VALID FILE
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "xSvs1hurHuCzoptkBuKl8Eg91An0kmwAWuXnG7CXkJHtFCSWhhMUzNF6ROiyJrH5/GqMiyyJsBJdsO8Uo3SNWvN64TFW3PHbl+mXxCU+WS3GKnRxHplsxH6C6awdJrFZmpKVBft1DqdJaUWMSZq4s0y90YbG8pnp1qnwRKN7dh3kf8/S8dkygjua23pvDRHlcgZwDTaDtjvub+M4LGEEtTdQqTYgFvlJ574wUVnFC3NKJMVPvWJHSBGNHzlEsx0nIgXp0hAWLLCWB+D+Mc4aO7y3eHloP36y6rp/LwF+qSDeRapNRJRG6XI9A0/LmF/1ICs4+fI9LsCbIFQcWuTq+2sRQ6/Ro4YftxlaJW4p66z6Nf8dOCKs8jPn+jonaVHLudfVpdzP7t3k9TMsZkhg032wKe3ADSIC24E2U2oMMQJGeoOw+bZWJqEf2mPgs2Jy5Bz47upMHsx1wMS8Cf66DesqKtuypNIB7Tzr21es0tID6a7sCmhe0dpOSqx66ndB9khDG0ge1NB6rAI3LzNZq0e3mkdZduHbqWc5QBa9+/JHZVJovUPH/5xOajIHA32uC7tGAzXycsixXHkS2Ja6lf6npwRYfJhYeLzL+9BcAdAHLOay8WvCeXsjxwYnYZiHGaoJsfyrJSG3oKIqsUgJVZLU0jiQ4lTAhKc9kztvEszOM4eR0DrY7dz8FUkh034YOIj9xmV2Qttf4wc+Aar17d4JZJ/M0TJmrZE71dkS7v8wG3Zwj4hm/VlOjSlgGxOGI8D2Td+V+7OtYtqiGaOeU7Lj3nnPO6yLfzmkqDJQfjyNcdxu0IgXDsft5Oj6qoOVKRmUrKhvGsxtnBKyI73M+z984TU4VdHr8FIFyC+KHgUHZ8t/uBMysiSdze5hOcQOj0+H5AOAFq268cqCclgttQ4AhQtsQhBDxtpKjzzwPzcwrbLEQtMdmRA3ozpOMav8pw0Y69PsbR+45G/gym4Eem8+L1yJAWv++yCSMlA1OTW0k/vXKxIGRATMogm/Yij5"
`endif