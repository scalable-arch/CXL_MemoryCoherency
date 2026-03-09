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


module top_ready_latency_adp # (

parameter LOG_DEPTH =3 ,
parameter CONNECT_WUSER = 0, // wuser and wstra are mutually exclusive on the VIO interface 
parameter NUM_PIPELINES =2,
parameter ID_WIDTH = 9,
parameter ADDR_WIDTH =44,
parameter DATA_WIDTH = 256,
parameter STRB_WIDTH = 32,
parameter AUSER_WIDTH = 8

 ) (

input logic clk,
input logic reset,
output logic reset_r,

// aw channel

 input  logic awready,
 output logic awvalid_r,
 output logic [ID_WIDTH-1:0] awid_r,
 output logic [ADDR_WIDTH-1:0] awaddr_r,
 output logic [7:0] awlen_r,
 output logic [2:0] awsize_r,
 output logic [1:0] awburst_r,
 output logic awlock_r,
 output logic [AUSER_WIDTH-1:0] awuser_r,
 output logic [1:0] awqos_r,



 output logic  awready_r,
 input logic awvalid,
 input logic [ID_WIDTH-1:0] awid,
 input logic [ADDR_WIDTH-1:0] awaddr,
 input logic [7:0] awlen,
 input logic [2:0] awsize,
 input logic [1:0] awburst,
 input logic awlock,
 input logic [AUSER_WIDTH-1:0] awuser,
 input logic [1:0] awqos,


 // ar channel

 input  logic arready,
 output logic arvalid_r,
 output logic [ID_WIDTH-1:0] arid_r,
 output logic [ADDR_WIDTH-1:0] araddr_r,
 output logic [7:0] arlen_r,
 output logic [2:0] arsize_r,
 output logic [1:0] arburst_r,
 output logic arlock_r,
 output logic [AUSER_WIDTH-1:0] aruser_r,
 output logic [1:0] arqos_r,



 output logic arready_r,
 input logic arvalid,
 input logic [ID_WIDTH-1:0] arid,
 input logic [ADDR_WIDTH-1:0] araddr,
 input logic [7:0] arlen,
 input logic [2:0] arsize,
 input logic [1:0] arburst,
 input logic arlock,
 input logic [AUSER_WIDTH-1:0] aruser,
 input logic [1:0] arqos,


 //w channel

 input logic wready,
 
 output logic wvalid_r,
 output logic [DATA_WIDTH-1:0] wdata_r,
 output logic wlast_r,
 output logic [STRB_WIDTH-1:0] wstrb_r,
 output logic [31:0] wuser_r,


 output logic wready_r,
 
 input logic wvalid,
 input logic [DATA_WIDTH-1:0] wdata,
 input logic wlast,
 input logic [STRB_WIDTH-1:0] wstrb,
 input logic [31:0] wuser,




 // response channel

  input logic bvalid ,
  input logic [ID_WIDTH-1:0] bid,
  input logic [1:0] bresp,

  output logic  bready_r,

  output logic  bvalid_r ,
  output logic  [ID_WIDTH-1:0] bid_r,
  output logic  [1:0] bresp_r,

  input logic bready ,


  input logic rvalid,
  input logic [ID_WIDTH-1:0] rid,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [1:0] rresp,
  input logic [31:0] ruser,
  input logic rlast,

  output logic rready_r,


  output logic rvalid_r,
  output logic [ID_WIDTH-1:0] rid_r,
  output logic [DATA_WIDTH-1:0] rdata_r,
  output logic [1:0] rresp_r,
  output logic [31:0] ruser_r,
  output logic rlast_r,

  input logic rready





 );

 localparam FIXED_WIDTH_AW =17;
 localparam DATA_WIDTH_AW = ID_WIDTH + ADDR_WIDTH +AUSER_WIDTH + FIXED_WIDTH_AW; 
 localparam DATA_WIDTH_B = ID_WIDTH + 2;
 // 33: 32 user or wstrb + last,valid
 localparam DATA_WIDTH_W = DATA_WIDTH + (CONNECT_WUSER ? 32 : STRB_WIDTH) + 2;
 // 35: 32 user signals + last,resp(2)
 localparam DATA_WIDTH_R = DATA_WIDTH + ID_WIDTH + 35;

 localparam FLOP_DEPTH = NUM_PIPELINES/2; // half flops on cmd, rest on rsp path

  logic bvalid_b, rvalid_b;
  logic [DATA_WIDTH_AW-1:0] input_to_atom_aw, input_to_atom_aw_r, input_to_atom_ar, input_to_atom_ar_r;
  logic output_from_atom_aw, output_from_atom_aw_r, output_from_atom_ar, output_from_atom_ar_r;
  logic [DATA_WIDTH_B -1 :0] indata_b,tempdata_b, bdata_f;

  logic [DATA_WIDTH_R -1 :0] indata_r,tempdata_r, rdata_f;


  logic [DATA_WIDTH_W -1 :0] input_to_atom_w, input_to_atom_w_r, outdata_w;
  logic output_from_atom_w, output_from_atom_w_r;

  generate if ( NUM_PIPELINES == 0 ) begin : no_pipeline

    assign reset_r = reset;

    assign {awready_r,awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r} ={awready,awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos}; 

    assign {arready_r,arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r} ={arready,arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos};

    assign {wready_r,wvalid_r,wdata_r,wstrb_r,wuser_r,wlast_r} = {wready,wvalid,wdata,wstrb,wuser,wlast};

    assign {bready_r,bvalid_r,bid_r,bresp_r} = {bready,bvalid,bid,bresp};
    
    assign {rready_r,rvalid_r,rid_r,rresp_r,rdata_r,ruser_r,rlast_r} = {rready,rvalid,rid,rresp,rdata,ruser,rlast}; 

  end
  else begin

 // reset via a C2P hipi register that can be connected to initiator atom

  ff_macro_init # (
  .NUM_FLOPS (1),
  .DIRECTION ("INPUT"),
  .DATA_WIDTH (1)

  ) reset_inst (

  .clk (clk),
  .in_data (reset),
  .out_data (reset_r)

  );

 // aw channel 

  assign input_to_atom_aw = {awvalid,awid,awaddr,awlen,awsize,awburst,awlock,awuser,awqos};
  assign output_from_atom_aw = awready;
 

  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("INPUT"),
  .DATA_WIDTH (DATA_WIDTH_AW)

  ) aw_inst (

  .clk (clk),
  .in_data (input_to_atom_aw),
  .out_data ( input_to_atom_aw_r)

  );

  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("OUTPUT"),
  .DATA_WIDTH (1)

  ) aw_ready_inst (

  .clk (clk),
  .in_data (output_from_atom_aw),
  .out_data (output_from_atom_aw_r)

  );

  assign {awvalid_r,awid_r,awaddr_r,awlen_r,awsize_r,awburst_r,awlock_r,awuser_r,awqos_r} = input_to_atom_aw_r;
  assign awready_r = output_from_atom_aw_r;


 // ar channel 

 assign input_to_atom_ar = {arvalid,arid,araddr,arlen,arsize,arburst,arlock,aruser,arqos};
 assign output_from_atom_ar = arready;

  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("INPUT"),
  .DATA_WIDTH (DATA_WIDTH_AW)

  ) ar_inst (

  .clk (clk),
  .in_data (input_to_atom_ar),
  .out_data ( input_to_atom_ar_r)

  );

  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("OUTPUT"),
  .DATA_WIDTH (1)

  ) arready_inst (

  .clk (clk),
  .in_data (output_from_atom_ar),
  .out_data ( output_from_atom_ar_r)

  );

  assign {arvalid_r,arid_r,araddr_r,arlen_r,arsize_r,arburst_r,arlock_r,aruser_r,arqos_r} = input_to_atom_ar_r;
  assign arready_r = output_from_atom_ar_r;

 // w channel 

  if (CONNECT_WUSER) begin : gen_connect_wuser_to_w_inst
    assign input_to_atom_w = {wvalid,wdata,wlast,wuser};
  end else begin : gen_connect_wstrb_to_w_inst
    assign input_to_atom_w = {wvalid,wdata,wlast,wstrb};
  end

  assign output_from_atom_w = wready;

  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("INPUT"),
  .DATA_WIDTH (DATA_WIDTH_W)

  ) w_inst (

  .clk (clk),
  .in_data (input_to_atom_w),
  .out_data ( input_to_atom_w_r)

  );

    ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("OUTPUT"),
  .DATA_WIDTH (1)

  ) wready_inst (

  .clk (clk),
  .in_data (output_from_atom_w),
  .out_data ( output_from_atom_w_r)

  );

  if (CONNECT_WUSER) begin : gen_connect_wuser_r_from_w_inst
    assign {wvalid_r,wdata_r,wlast_r,wuser_r} = input_to_atom_w_r;
  end else begin : gen_connect_wstrb_r_from_w_inst
    assign {wvalid_r,wdata_r,wlast_r,wstrb_r} = input_to_atom_w_r;
  end
  
  assign wready_r = output_from_atom_w_r;

  // write response channel

  assign indata_b = {bid,bresp};

  // data 
  
  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("OUTPUT"),
  .DATA_WIDTH (DATA_WIDTH_B)

  ) b_inst_data (

  .clk (clk),
  .in_data (indata_b),
  .out_data (tempdata_b)

  );

   
  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("INPUT"),
  .DATA_WIDTH (1)

  ) b_inst_ctl_ready (

  .clk (clk),
  .in_data (bready_f),
  .out_data (bready_r)

  );

    ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("OUTPUT"),
  .DATA_WIDTH (1)

  ) b_inst_ctl_valid (

  .clk (clk),
  .in_data (bvalid),
  .out_data (bvalid_b)

  );


  ready_latency_adapter # (
     .READY_LATENCY_OUT (NUM_PIPELINES),
     .PAYLOAD_WIDTH (DATA_WIDTH_B),
     .LOG_DEPTH (LOG_DEPTH) 
    ) bresp_inst (
     .clk (clk),
     .reset (reset),
     .in_ready (bready_f), // noc ready output 
     .in_valid (bvalid_b),
     .in_data (tempdata_b),

     .out_ready (bready), // axi ready 0 latency
     .out_valid (bvalid_f),
     .out_data (bdata_f)
 
    );


 assign bvalid_r = bvalid_f;
 assign {bid_r,bresp_r} = bdata_f;



 // read response channel

  assign indata_r = {rid,rresp,ruser,rdata,rlast};

  // data 
  
  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("OUTPUT"),
  .DATA_WIDTH (DATA_WIDTH_R)

  ) r_inst_data (

  .clk (clk),
  .in_data (indata_r),
  .out_data (tempdata_r)

  );

   
  ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("INPUT"),
  .DATA_WIDTH (1)

  ) r_inst_ctl_ready (

  .clk (clk),
  .in_data (rready_f),
  .out_data (rready_r)

  );

    ff_macro_init # (
  .NUM_FLOPS (FLOP_DEPTH),
  .DIRECTION ("OUTPUT"),
  .DATA_WIDTH (1)

  ) r_inst_ctl_valid (

  .clk (clk),
  .in_data (rvalid),
  .out_data (rvalid_b)

  );


  ready_latency_adapter # (
     .READY_LATENCY_OUT (NUM_PIPELINES),
     .PAYLOAD_WIDTH (DATA_WIDTH_R),
     .LOG_DEPTH (LOG_DEPTH) 
    ) rresp_inst (
     .clk (clk),
     .reset (reset),
     .in_ready (rready_f), // noc ready output 
     .in_valid (rvalid_b),
     .in_data (tempdata_r),

     .out_ready (rready), // axi ready 0 latency
     .out_valid (rvalid_f),
     .out_data (rdata_f)
 
    );


 assign rvalid_r = rvalid_f;
 assign {rid_r,rresp_r,ruser_r,rdata_r,rlast_r} = rdata_f;

 end
 endgenerate



  



endmodule 

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "HVwoXV44HvrqLCcyrRLKSPYKBkDWFb/QkVjwDEQ824LbpdY1lpyfSDRh2R2XXI3HT559WzzSGaylMrfix9K0v8D4bP8N/5F2s7q2IVIU3Zbvvtm48IozW/C3YtteWjdzPbWSHrpgM8/tQexSu730vbHbwtI/7bmZ6hVhmDj7iMt/1xxbYHvxq//o4LrluwXjtRNow/nPFObAl3yz5rR4pw9RiExjXrLroBGh1KHp3EPctPnU7kWsAOc9ipByYqhfyh3XdSOaJuxBcAKbXi/VRKe/4LjLQGLgNG3NREy7YT/8sDe9lZjLD4r2Gac2ln1G9rNA/uiCg37HG1UQL+4FripoZkVgwrwf2a6j1xizrQAwnCBtVtJPWKIzZuF3o4ajTKHaPl+v/t2t18PDnZx8K+rM4wzBl71O0/32CvJbL4UmK8o1Bov1RS8fqZVqFQLOa3HtIwPXaA1Bw+VlSpq6MNzVfbzaLcXsiY1J1TXB+YTs4uytxPf9oXyvRgnkImqrly4gv0LujUT2n6I4oUgvnrVcD682BAhbQCZTjApt9WegQiaVVygvziiCviLHX1zCOEaj78r9Uhk4W2KoNTQ0Zc7mRXy4jdTfJpolOMfawb0+LRjZCBsWVwNsorVjLih8trn/VaAejrq6YlZDeilVuWg6hzLmlIU4uI+hXXUz98E9bWUiGNltlZwIDMp7JDiaipayU3QEodIPwWbhiEM8kV+rCUX/MPnEjii+6LFFUqCLazDVnu4DPZKNSLlgCVEd8094yvJGyqfR0aTSOwhLWzNYa6HDwXZYKLEKt53ad9N1X+gxCPaDGy3l7ZKn83Kr3mzfUcPJbz6YyKnIIarJQ8+MtdrWwpaXmFRHPKS4eDph23nbSChkPK4mLxsImikUde+L/Yo1z6vukHUYnX73juwb4ojSNn6zNoMsEQEvpqjSMxPKBpJsjSLCJXs7eydCePmxBAG8d0N2COmBOzH1TpQjoXdrvj2AT8BLGJjDg+QszWwNV7Lw0NRga8+L4Uk/"
`endif