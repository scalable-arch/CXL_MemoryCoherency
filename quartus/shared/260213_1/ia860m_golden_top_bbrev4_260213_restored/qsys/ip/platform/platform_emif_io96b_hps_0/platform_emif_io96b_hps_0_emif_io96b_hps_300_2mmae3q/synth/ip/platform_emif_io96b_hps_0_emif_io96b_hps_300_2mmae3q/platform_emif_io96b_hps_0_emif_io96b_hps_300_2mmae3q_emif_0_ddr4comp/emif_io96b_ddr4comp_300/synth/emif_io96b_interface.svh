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


`ifndef PHY_ARCH_FP_INTERFACE

`define PHY_ARCH_FP_INTERFACE 1

// altera message_off 18455
interface AXI_BUS #(
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
   output awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awqos, awuser, awvalid, input awready,
   output wdata, wstrb, wlast, wuser, wvalid, input wready,
   input bid, bresp, buser, bvalid, output bready,
   output arid, araddr, arlen, arsize, arburst, arlock, arcache, arprot, arqos, aruser, arvalid, input arready,
   input rid, rdata, rresp, rlast, ruser, rvalid, output rready
);

modport Subordinate (
   input awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awqos, awuser, awvalid, output awready,
   input wdata, wstrb, wlast, wuser, wvalid, output wready,
   output bid, bresp, buser, bvalid, input bready,
   input arid, araddr, arlen, arsize, arburst, arlock, arcache, arprot, arqos, aruser, arvalid, output arready,
   output rid, rdata, rresp, rlast, ruser, rvalid, input rready
);

endinterface

// altera message_off 18455
interface AXILITE_INTF #(
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
`pragma questa_oem_00 "rnrbDlZf5g51SydUlUGTvdKtE6ZgklarsG32iw4zsuqWdcBm8lug3owSBXfzqWcWfrQyT8DByE2tJRw9lFzzZRZAwarPRpcZUTBIlqKLRY64oYzi6t2HPr8mGEbYMURwULAYLTrU+4srdlWj7dczYJWMvLa1/WWc5SOmkyUT/5kLvvdsVrDTpnZYgacVGqGNTJFlKIltv03rzS1PeMROei6IPHgTdXDB3dGFsvMTwxx7+ef4ae5X3ovMDYCKwe3nESo9/E/WR30X4WBN5nX1oy4d1KBdmWEjIr6/IK7ztpZ6LDYSiJamcIZXKSEi49wfH1nX+bBjxLXuxgzi/C9ibMQPnXdr2oiocQ8aD7lR2vHXqJnCIMEZy5hyh/sA/UnKmAmrk1BsprhW/1LJoUyf9M89CD2r7rQOpGk3tESSkDwwDqlAPSYL1Tnh0KMVVxkcaXEahhEljYoxJ8DF18HKl/4uNUjTSIgy7tMfZwAp3OidULY1VhRgIDUEK+8uyEx/+10/3T77mmIMAgfwzs6FxweqalQ9aFdVIDcRCgrJU7MHcF7/21ENhW2TinZrZ6QxP+ir894xBi4jT3MBhvrIUqTzFAZRsSPewsqF4P7Jk1zrz1NbBLIywJpa4Mkn4P9PPsthtQq3B1/JNQc7bK/Y9FQPjLZwXf3jrHkrkB6xDDY0CHfZCfXexgwjtVokcMXhjTOICNok070xx5+E6dVVEkRze4EHt8NeNHg9EgyRbTT8GQxJT4btixXClrzR8as8iubRqgr1iZE0QWgnPh6ZrXGfXTw0TQHqzdmKQPkyQkzM4JJSJtE1paK4ydQR9dVELbmrsCcXLgdBNhpJTGMyzOXUpkMHmHROLj++Lvnai3ypH0ZSXRcErBKj7SwFZ3he2N06enlnSjWKbxIXnI3SgAWfacAb8Cc/sihE+9kD6hvLztKj7FEqOS4KBz5Bu3QgDXIsA225xnj1h/W48lbaQHQRKKv1DCFZVg9x4cle4BG0VCn2WWhHQcFMK5BNj2sQ"
`endif