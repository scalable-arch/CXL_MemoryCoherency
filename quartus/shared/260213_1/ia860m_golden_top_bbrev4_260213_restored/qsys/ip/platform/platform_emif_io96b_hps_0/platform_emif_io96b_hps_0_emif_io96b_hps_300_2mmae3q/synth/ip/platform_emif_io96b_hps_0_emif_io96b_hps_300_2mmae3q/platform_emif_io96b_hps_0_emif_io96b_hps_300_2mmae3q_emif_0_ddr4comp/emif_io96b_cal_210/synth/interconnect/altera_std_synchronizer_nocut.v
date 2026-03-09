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





`timescale 1ns / 1ns

module altera_std_synchronizer_nocut (
                                clk, 
                                reset_n, 
                                din, 
                                dout
                                );

   parameter depth = 3; 
   parameter rst_value = 0;

   parameter retiming_reg_en = 0;
     
   input   clk;
   input   reset_n;    
   input   din;
   output  dout;
   

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name SYNCHRONIZER_IDENTIFICATION FORCED; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON  "} *) reg din_s1;

   (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [depth-2:0] dreg;    

   // synthesis translate_off
   `ifndef QUARTUS_CDC
   initial begin
     if (retiming_reg_en == 0 ) begin
       if (depth <2) begin 
         $display("%m: Error: synchronizer length: %0d less than 2.", depth);
       end
      end
     else begin
       if (depth <4) begin 
         $display("%m: Error: synchronizer length: %0d less than 4 with retiming enabled.", depth);
       end
     end
   end
   `endif 

   
`ifdef __ALTERA_STD__METASTABLE_SIM

   reg[31:0]  RANDOM_SEED = 123456;      
   wire  next_din_s1;
   wire  dout;
   reg   din_last;
   reg          random;
   event metastable_event; 

   initial begin
      $display("%m: Info: Metastable event injection simulation mode enabled");
      random = $random;
   end
   
   always @(posedge clk) begin
      if (reset_n == 0)
        random <= $random(RANDOM_SEED);
      else
        random <= $random;
   end

   assign next_din_s1 = (din_last ^ din) ? random : din;   

   always @(posedge clk or negedge reset_n) begin
       if (reset_n == 0) 
         din_last <= (rst_value == 0)? 1'b0 : 1'b1;
       else
         din_last <= din;
   end

   always @(posedge clk or negedge reset_n) begin
       if (reset_n == 0) 
         din_s1 <= (rst_value == 0)? 1'b0 : 1'b1;
       else
         din_s1 <= next_din_s1;
   end
   
`else 

   // synthesis translate_on   
   generate if (rst_value == 0)
       always @(posedge clk or negedge reset_n) begin
           if (reset_n == 0) 
             din_s1 <= 1'b0;
           else
             din_s1 <= din;
       end
   endgenerate
   
   generate if (rst_value == 1)
       always @(posedge clk or negedge reset_n) begin
           if (reset_n == 0) 
             din_s1 <= 1'b1;
           else
             din_s1 <= din;
       end
   endgenerate
   // synthesis translate_off      

`endif

`ifdef __ALTERA_STD__METASTABLE_SIM_VERBOSE
   always @(*) begin
      if (reset_n && (din_last != din) && (random != din)) begin
         $display("%m: Verbose Info: metastable event @ time %t", $time);
         ->metastable_event;
      end
   end      
`endif

   // synthesis translate_on

   generate if (rst_value == 0) begin
      if (retiming_reg_en == 0) begin
         if (depth < 3) begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b0}};            
               else
                 dreg <= din_s1;
            end         
         end else begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b0}};
               else
                 dreg <= {dreg[depth-3:0], din_s1};
            end
         end

         assign dout = dreg[depth-2];
       end

       else begin 
          (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [1:0] dreg1;
          reg [depth-4:0] dreg2;
          wire [depth-2:0] dreg3;

          assign dreg3 = {dreg2,dreg1};

          if (depth <= 3) begin
             always @(posedge clk or negedge reset_n) begin
                if (reset_n == 0)
                  dreg1 <= {depth-1{1'b0}};
                else
                  dreg1 <= din_s1;
               end
           end
           else begin
              always @(posedge clk or negedge reset_n) begin
                if (reset_n == 0)
                  {dreg2,dreg1} <= {depth-1{1'b0}};
                else
                  {dreg2,dreg1} <= {dreg3[depth-3:0], din_s1};
              end
           end
           assign dout = dreg3[depth-2];
       end
    end

   
   else begin
      if (retiming_reg_en == 0) begin
         if (depth < 3) begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b1}};            
               else
                 dreg <= din_s1;
             end         
         end else begin
            always @(posedge clk or negedge reset_n) begin
               if (reset_n == 0) 
                 dreg <= {depth-1{1'b1}};
               else
                 dreg <= {dreg[depth-3:0], din_s1};
            end
         end
       assign dout = dreg[depth-2];
    end

      else begin
         (* altera_attribute = {"-name ADV_NETLIST_OPT_ALLOWED NEVER_ALLOW; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [1:0] dreg1;
         reg [depth-4:0] dreg2;
         wire [depth-2:0] dreg3;

         assign dreg3 = {dreg2,dreg1};

           if (depth <= 3) begin
               always @(posedge clk or negedge reset_n) begin
                  if (reset_n == 0)
                    dreg1 <= {depth-1{1'b1}};
                  else
                    dreg1 <= din_s1;
               end
           end
           else begin
               always @(posedge clk or negedge reset_n) begin
                  if (reset_n == 0)
                    {dreg2,dreg1} <= {depth-1{1'b1}};
                  else
                    {dreg2,dreg1} <= {dreg3[depth-3:0], din_s1};
               end
            end  
          assign dout = dreg3[depth-2];
        end
     end
   endgenerate

endmodule 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "nATEpDWf3CgajPjgH0t9FI3P3v7c7W2p1Bjo8KPiWXptDDKP83tHlZV4/kOjbfP5B3iPKq3r9UGmKAo7uM5E+NrMJJrWKQHFxNhuD9YH7WIm4w92BUZP4bPiPCFjEfA8Gg2F5To+TwSe7HVsQs+/7MZQj0QmDr2hjiVbFLL88xfR21RarRUIjnXzluc0JvTFFI13vcHyvhug/HSbBYjOOLVxyFVn/zaj46Yp0VXaMOw1nlZhJnKcXQsJx0gJoXbJzhqXMAEUYlyGq9c1wdgQSBXE8l1jREheSOvQ0cfeRX88+8g4+XINHMQVcPl0OjfoyRZ3JmyxFBhhTKaBFTuwa9JPGjKsP23EId66pNJyNHw+kx9hfuti4zKPh+4qDKzImqe3EvW9LvOpRFmLrX2Uxvpo1FTEMNxGrXb1ke0Z7vcuC95O72ct3MSS89UfL7tYbP1vXYWRLQ8C82nSl0K+WK6SnZZVbZLDHRpCCYtfelsLw7JJdfz2uhT+702K/cMywBt9oqHNmoTZubqV7787HlJwx1FqO2KI+EJorlVBtLfK7PJ4fOhDL7SQ23Tmb67gx0VsXcDYP/832+fsZsVMzSvS/3CiJjMDZAG0NuCMdvDXLySCkFUgqtHyScmaaundWnVAa+e66Sx7mp7VFD2d91rm0/mT6kUthgdXh1QRF/0/Ip6hP5huj45XBDVGZvX1ZQluQO/BXZXjyiuHXjM+ciVm9ZSPvoSKLFn9QolBYAEnDPQ3meQJpCkgBKNo6sG2vgaH89bYRlanB14+4Oqf7bAr3180nN8Z9LDTJRFfw0lWJ3OGhrRI1NyQ5YEzAsUO+H029+cDiasAmGbTULVUCBCkqyPlboA6mBIxBGWHngeFhEu5HagTbe2Xbew0EmTDW/5vz/BCGK4o27Md24EDRxAKVS/gyU4yVrE2LtGN26kHjxWvloc59PFbZL7EjLB+5tx8lFaZU+DwmAVNAwauX4DQYtDhS9XUFO0Pzj7ryCBHw0ifW2bHRF/R/fHkbo30"
`endif
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "h/iChvxs1BqfjCvpkkJPYvhSyoexz9FnJDZVTIO5lu4JQXqq2zA2zgvU4XUFIeUaspH3pVSXDqAt1zDtj0pnJvSsBYN1vXKXvJgJbipdV2cWNbJwAzoqyz4d52bbneU7dZwyXGLq7j66sBqfbjcD19fcQrHLLZVIFVJ99lJAOuVYNHkW1nicOMqEXTRwhHFvEzNITCKHr6Lm5PjCaA+dAuM3eqAQw7qxLNemioqgtfWAUn4ewyzdOs2mdr9WC02oAlEWWVJu+6rJoO1NPveOp46QNWe/dPWsf80XHEYK/GPgnIVuwar80tbO68WbEE+1882NJlH7FQa6ZhM/lYgOeALOuMrAp6pKVZZS2xHEvL2eGnY5afXzwDWRXinnIsIF34DfnCny7sAoWtmBywZeQs9Lv7hxVC2C7T8/VZM4diy10AYCIMe5wl4t890L+nD9h4OMdei4PIUhdfhiITBVSGclJ1/g7yXq9niLz7p0MfDBdfdHTZn1u2A6lRocsjuJUXgktoGqlI3uhl3NsUdlEZHxI28vTcbOZW0lBpwFo9elHdkxpwYq/dLAfruwy/vOEkaD340AOhyRnJJyKUzJ2X2O0O8dpb8jRQDR4Y2QhamPYNIoVhAttepQleO8ksWzEObqkYj6RQxDeIWy6eq0hmNfx5AiaAJxd2f6dZb/EhvktlpugwTYMpMyDKbq+FqVOpE749P7KPdZ/A8SRMwyVlqGmtTCIrJNtd/ybKE43tPrcTuKSg3AZOvHULLnsPxIXjtWdP833XjMm0qQilke+WQ4dhyZAOZA8qvnKZajVGy9C1/vOWu/tGoEkvsjrqx9pYeKSHTYfBnrpyDKuVJYHpyWwcdfKPl6V7vYR8/iGQnNprjDNcBYwf+m9HU9OfYS3dGBp4VLjX3MpPWq+PuVgXm2lJeRaP/x1JgRQqWXBfBbz/+38+jig12ERP3XG1+h+nPnBc5O7Ub6fki707s7VUNRP46rzmekuM6KMQ9ukx2sK75k83Is755yb60GyxXr"
`endif