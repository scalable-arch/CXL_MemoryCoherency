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


`ifndef CAL_ARCH_FP_INTERFACE

`define CAL_ARCH_FP_INTERFACE 1

// altera message_off 18455
interface AXILITE_BUS #(
  parameter int signed PORT_AXI_AXADDR_WIDTH  = 0,
  parameter int signed PORT_AXI_AXID_WIDTH    = 0,
  parameter int signed PORT_AXI_AXBURST_WIDTH = 0,
  parameter int signed PORT_AXI_AXLEN_WIDTH   = 0,
  parameter int signed PORT_AXI_AXSIZE_WIDTH  = 0,
  parameter int signed PORT_AXI_AXUSER_WIDTH  = 0,
  parameter int signed PORT_AXI_DATA_WIDTH    = 0,
  parameter int signed PORT_AXI_STRB_WIDTH    = 0,
  parameter int signed PORT_AXI_RESP_WIDTH    = 0,
  parameter int signed PORT_AXI_ID_WIDTH      = 0,
  parameter int signed PORT_AXI_USER_WIDTH    = 0,
  parameter int signed PORT_AXI_AXQOS_WIDTH   = 0,
  parameter int signed PORT_AXI_AXCACHE_WIDTH = 0,
  parameter int signed PORT_AXI_AXPROT_WIDTH  = 0
);

typedef logic                              clk_t;
typedef logic                              rst_n_t;
typedef logic [PORT_AXI_AXADDR_WIDTH-1:0]  addr_t;
typedef logic [PORT_AXI_AXID_WIDTH-1:0]    id_t;
typedef logic [PORT_AXI_AXBURST_WIDTH-1:0] burst_t;
typedef logic [PORT_AXI_AXLEN_WIDTH-1:0]   len_t;
typedef logic [PORT_AXI_AXSIZE_WIDTH-1:0]  size_t;
typedef logic [PORT_AXI_AXUSER_WIDTH-1:0]  user_t;
typedef logic [PORT_AXI_DATA_WIDTH-1:0]    data_t;
typedef logic [PORT_AXI_STRB_WIDTH-1:0]    strb_t;
typedef logic [PORT_AXI_RESP_WIDTH-1:0]    resp_t;
typedef logic [PORT_AXI_ID_WIDTH-1:0]      respid_t;
typedef logic [PORT_AXI_USER_WIDTH-1:0]    respuser_t;
typedef logic [PORT_AXI_AXQOS_WIDTH-1:0]   qos_t;
typedef logic [PORT_AXI_AXCACHE_WIDTH-1:0] cache_t;
typedef logic [PORT_AXI_AXPROT_WIDTH-1:0]  prot_t;

clk_t             clk;
rst_n_t           rst_n;

id_t              awid;
addr_t            awaddr;
len_t             awlen;
size_t            awsize;
burst_t           awburst;
logic             awlock;
cache_t           awcache;
prot_t            awprot;
qos_t             awqos;
user_t            awuser;
logic             awvalid;
logic             awready;

data_t            wdata;
strb_t            wstrb;
logic             wlast;
respuser_t        wuser;
logic             wvalid;
logic             wready;

respid_t          bid;
resp_t            bresp;
respuser_t        buser;
logic             bvalid;
logic             bready;

id_t              arid;
addr_t            araddr;
len_t             arlen;
size_t            arsize;
burst_t           arburst;
logic             arlock;
cache_t           arcache;
prot_t            arprot;
qos_t             arqos;
user_t            aruser;
logic             arvalid;
logic             arready;

respid_t          rid;
data_t            rdata;
resp_t            rresp;
logic             rlast;
respuser_t        ruser;
logic             rvalid;
logic             rready;

modport Manager (
   input clk, rst_n,
   output awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awqos, awuser, awvalid, input awready,
   output wdata, wstrb, wlast, wuser, wvalid, input wready,
   input bid, bresp, buser, bvalid, output bready,
   output arid, araddr, arlen, arsize, arburst, arlock, arcache, arprot, arqos, aruser, arvalid, input arready,
   input rid, rdata, rresp, rlast, ruser, rvalid, output rready
);

modport Subordinate (
   output clk, rst_n,
   input awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awqos, awuser, awvalid, output awready,
   input wdata, wstrb, wlast, wuser, wvalid, output wready,
   output bid, bresp, buser, bvalid, input bready,
   input arid, araddr, arlen, arsize, arburst, arlock, arcache, arprot, arqos, aruser, arvalid, output arready,
   output rid, rdata, rresp, rlast, ruser, rvalid, input rready
);

endinterface

`endif 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "h/iChvxs1BqfjCvpkkJPYvhSyoexz9FnJDZVTIO5lu4JQXqq2zA2zgvU4XUFIeUaspH3pVSXDqAt1zDtj0pnJvSsBYN1vXKXvJgJbipdV2cWNbJwAzoqyz4d52bbneU7dZwyXGLq7j66sBqfbjcD19fcQrHLLZVIFVJ99lJAOuVYNHkW1nicOMqEXTRwhHFvEzNITCKHr6Lm5PjCaA+dAuM3eqAQw7qxLNemioqgtfVvYNN5TmS4JHeHhtKw33+oekBKV8HH+3c/Yfdz/ZYN+Y5X0OoAgcUUCyr/QT68C5JVaErkTIGyMPH3YeiAKttbElUrUUMccdMHIR4292aGRuD9JChSFsPM6rMnp5HVwmqd5vo3He4nDQEhlBXcE5uSkrQRUPaAT7iODkvZFLk/WCju57FQtRRyq4HapCEEGfKVtw1PLCz7rsKqxDS6TFdA4d43eJ8DsAZFw+Auo0tZ8lo1ctPQXoC76zIwXPfwcRB1NpVpsTJktDQr7p3vD6+uHLr6cffFZ/2WvIhTVCJ2Jw9b5JVcA2UlUh0476KWlDWmbineOC89Ezq457RkJK89mc0f7Vmr+A02/hxbg6GEugidDeETD67ivMmm+eaUu5CMESZSelBwzE71zpQlEHgmYY4BCm+Yv5it8UjZCRbSHuaW7krqgz800RkSNI8NtkcEsIA89vE5srjVPPuddeq9E6CfPfiF5bsZChuycZRIS29l/6pS5vigZQJ0RqQ9RblqGkgteuC+YvqBnOSpeBXUuI/qw3EVGHbTJFcjaB3rmgqxr7cJQW4lKtQqdrX5Fj/3evSIVp3/xJPrpz0IpsfYGBNaLBBTK3S9CHa2+AfR9BnsOA01QV5W5WQt1l7JkYAqqK43pKU+n5GfZabNPJ/InzIs4/xp3OEXogaVYbn/a/WROI/c+LKJ3KDfxvgpApGXlyLj99CL/hd+M0Hc3C7NqSZVRvFRl4MZWZsr5h6VI5um2JZ3YpQjCWxLgA79Os3K46HpGuXaAGdL1l+Rjaiu"
`endif