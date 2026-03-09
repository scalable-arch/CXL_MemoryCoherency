	component platform_intel_noc_initiator_0 is
		port (
			s0_axi4_arid    : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- arid
			s0_axi4_araddr  : in  std_logic_vector(43 downto 0)  := (others => 'X'); -- araddr
			s0_axi4_arlen   : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- arlen
			s0_axi4_arsize  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arsize
			s0_axi4_arburst : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- arburst
			s0_axi4_arlock  : in  std_logic                      := 'X';             -- arlock
			s0_axi4_arprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			s0_axi4_arqos   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arqos
			s0_axi4_aruser  : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- aruser
			s0_axi4_arvalid : in  std_logic                      := 'X';             -- arvalid
			s0_axi4_arready : out std_logic;                                         -- arready
			s0_axi4_rid     : out std_logic_vector(6 downto 0);                      -- rid
			s0_axi4_rdata   : out std_logic_vector(255 downto 0);                    -- rdata
			s0_axi4_rresp   : out std_logic_vector(1 downto 0);                      -- rresp
			s0_axi4_rlast   : out std_logic;                                         -- rlast
			s0_axi4_ruser   : out std_logic_vector(31 downto 0);                     -- ruser
			s0_axi4_rvalid  : out std_logic;                                         -- rvalid
			s0_axi4_rready  : in  std_logic                      := 'X';             -- rready
			s0_axi4_awid    : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- awid
			s0_axi4_awaddr  : in  std_logic_vector(43 downto 0)  := (others => 'X'); -- awaddr
			s0_axi4_awlen   : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- awlen
			s0_axi4_awsize  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awsize
			s0_axi4_awburst : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- awburst
			s0_axi4_awlock  : in  std_logic                      := 'X';             -- awlock
			s0_axi4_awprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			s0_axi4_awqos   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awqos
			s0_axi4_awuser  : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- awuser
			s0_axi4_awvalid : in  std_logic                      := 'X';             -- awvalid
			s0_axi4_awready : out std_logic;                                         -- awready
			s0_axi4_wdata   : in  std_logic_vector(255 downto 0) := (others => 'X'); -- wdata
			s0_axi4_wstrb   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wstrb
			s0_axi4_wlast   : in  std_logic                      := 'X';             -- wlast
			s0_axi4_wuser   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wuser
			s0_axi4_wvalid  : in  std_logic                      := 'X';             -- wvalid
			s0_axi4_wready  : out std_logic;                                         -- wready
			s0_axi4_bid     : out std_logic_vector(6 downto 0);                      -- bid
			s0_axi4_bresp   : out std_logic_vector(1 downto 0);                      -- bresp
			s0_axi4_bvalid  : out std_logic;                                         -- bvalid
			s0_axi4_bready  : in  std_logic                      := 'X';             -- bready
			s1_axi4_arid    : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- arid
			s1_axi4_araddr  : in  std_logic_vector(43 downto 0)  := (others => 'X'); -- araddr
			s1_axi4_arlen   : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- arlen
			s1_axi4_arsize  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arsize
			s1_axi4_arburst : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- arburst
			s1_axi4_arlock  : in  std_logic                      := 'X';             -- arlock
			s1_axi4_arprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			s1_axi4_arqos   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arqos
			s1_axi4_aruser  : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- aruser
			s1_axi4_arvalid : in  std_logic                      := 'X';             -- arvalid
			s1_axi4_arready : out std_logic;                                         -- arready
			s1_axi4_rid     : out std_logic_vector(6 downto 0);                      -- rid
			s1_axi4_rdata   : out std_logic_vector(255 downto 0);                    -- rdata
			s1_axi4_rresp   : out std_logic_vector(1 downto 0);                      -- rresp
			s1_axi4_rlast   : out std_logic;                                         -- rlast
			s1_axi4_ruser   : out std_logic_vector(31 downto 0);                     -- ruser
			s1_axi4_rvalid  : out std_logic;                                         -- rvalid
			s1_axi4_rready  : in  std_logic                      := 'X';             -- rready
			s1_axi4_awid    : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- awid
			s1_axi4_awaddr  : in  std_logic_vector(43 downto 0)  := (others => 'X'); -- awaddr
			s1_axi4_awlen   : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- awlen
			s1_axi4_awsize  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awsize
			s1_axi4_awburst : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- awburst
			s1_axi4_awlock  : in  std_logic                      := 'X';             -- awlock
			s1_axi4_awprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			s1_axi4_awqos   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awqos
			s1_axi4_awuser  : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- awuser
			s1_axi4_awvalid : in  std_logic                      := 'X';             -- awvalid
			s1_axi4_awready : out std_logic;                                         -- awready
			s1_axi4_wdata   : in  std_logic_vector(255 downto 0) := (others => 'X'); -- wdata
			s1_axi4_wstrb   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wstrb
			s1_axi4_wlast   : in  std_logic                      := 'X';             -- wlast
			s1_axi4_wuser   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wuser
			s1_axi4_wvalid  : in  std_logic                      := 'X';             -- wvalid
			s1_axi4_wready  : out std_logic;                                         -- wready
			s1_axi4_bid     : out std_logic_vector(6 downto 0);                      -- bid
			s1_axi4_bresp   : out std_logic_vector(1 downto 0);                      -- bresp
			s1_axi4_bvalid  : out std_logic;                                         -- bvalid
			s1_axi4_bready  : in  std_logic                      := 'X';             -- bready
			s2_axi4_arid    : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- arid
			s2_axi4_araddr  : in  std_logic_vector(43 downto 0)  := (others => 'X'); -- araddr
			s2_axi4_arlen   : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- arlen
			s2_axi4_arsize  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arsize
			s2_axi4_arburst : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- arburst
			s2_axi4_arlock  : in  std_logic                      := 'X';             -- arlock
			s2_axi4_arprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			s2_axi4_arqos   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- arqos
			s2_axi4_aruser  : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- aruser
			s2_axi4_arvalid : in  std_logic                      := 'X';             -- arvalid
			s2_axi4_arready : out std_logic;                                         -- arready
			s2_axi4_rid     : out std_logic_vector(6 downto 0);                      -- rid
			s2_axi4_rdata   : out std_logic_vector(255 downto 0);                    -- rdata
			s2_axi4_rresp   : out std_logic_vector(1 downto 0);                      -- rresp
			s2_axi4_rlast   : out std_logic;                                         -- rlast
			s2_axi4_ruser   : out std_logic_vector(31 downto 0);                     -- ruser
			s2_axi4_rvalid  : out std_logic;                                         -- rvalid
			s2_axi4_rready  : in  std_logic                      := 'X';             -- rready
			s2_axi4_awid    : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- awid
			s2_axi4_awaddr  : in  std_logic_vector(43 downto 0)  := (others => 'X'); -- awaddr
			s2_axi4_awlen   : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- awlen
			s2_axi4_awsize  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awsize
			s2_axi4_awburst : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- awburst
			s2_axi4_awlock  : in  std_logic                      := 'X';             -- awlock
			s2_axi4_awprot  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			s2_axi4_awqos   : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- awqos
			s2_axi4_awuser  : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- awuser
			s2_axi4_awvalid : in  std_logic                      := 'X';             -- awvalid
			s2_axi4_awready : out std_logic;                                         -- awready
			s2_axi4_wdata   : in  std_logic_vector(255 downto 0) := (others => 'X'); -- wdata
			s2_axi4_wstrb   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wstrb
			s2_axi4_wlast   : in  std_logic                      := 'X';             -- wlast
			s2_axi4_wuser   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- wuser
			s2_axi4_wvalid  : in  std_logic                      := 'X';             -- wvalid
			s2_axi4_wready  : out std_logic;                                         -- wready
			s2_axi4_bid     : out std_logic_vector(6 downto 0);                      -- bid
			s2_axi4_bresp   : out std_logic_vector(1 downto 0);                      -- bresp
			s2_axi4_bvalid  : out std_logic;                                         -- bvalid
			s2_axi4_bready  : in  std_logic                      := 'X';             -- bready
			s_axi4_aclk     : in  std_logic                      := 'X';             -- clk
			s_axi4_aresetn  : in  std_logic                      := 'X'              -- reset_n
		);
	end component platform_intel_noc_initiator_0;

	u0 : component platform_intel_noc_initiator_0
		port map (
			s0_axi4_arid    => CONNECTED_TO_s0_axi4_arid,    --        s0_axi4.arid
			s0_axi4_araddr  => CONNECTED_TO_s0_axi4_araddr,  --               .araddr
			s0_axi4_arlen   => CONNECTED_TO_s0_axi4_arlen,   --               .arlen
			s0_axi4_arsize  => CONNECTED_TO_s0_axi4_arsize,  --               .arsize
			s0_axi4_arburst => CONNECTED_TO_s0_axi4_arburst, --               .arburst
			s0_axi4_arlock  => CONNECTED_TO_s0_axi4_arlock,  --               .arlock
			s0_axi4_arprot  => CONNECTED_TO_s0_axi4_arprot,  --               .arprot
			s0_axi4_arqos   => CONNECTED_TO_s0_axi4_arqos,   --               .arqos
			s0_axi4_aruser  => CONNECTED_TO_s0_axi4_aruser,  --               .aruser
			s0_axi4_arvalid => CONNECTED_TO_s0_axi4_arvalid, --               .arvalid
			s0_axi4_arready => CONNECTED_TO_s0_axi4_arready, --               .arready
			s0_axi4_rid     => CONNECTED_TO_s0_axi4_rid,     --               .rid
			s0_axi4_rdata   => CONNECTED_TO_s0_axi4_rdata,   --               .rdata
			s0_axi4_rresp   => CONNECTED_TO_s0_axi4_rresp,   --               .rresp
			s0_axi4_rlast   => CONNECTED_TO_s0_axi4_rlast,   --               .rlast
			s0_axi4_ruser   => CONNECTED_TO_s0_axi4_ruser,   --               .ruser
			s0_axi4_rvalid  => CONNECTED_TO_s0_axi4_rvalid,  --               .rvalid
			s0_axi4_rready  => CONNECTED_TO_s0_axi4_rready,  --               .rready
			s0_axi4_awid    => CONNECTED_TO_s0_axi4_awid,    --               .awid
			s0_axi4_awaddr  => CONNECTED_TO_s0_axi4_awaddr,  --               .awaddr
			s0_axi4_awlen   => CONNECTED_TO_s0_axi4_awlen,   --               .awlen
			s0_axi4_awsize  => CONNECTED_TO_s0_axi4_awsize,  --               .awsize
			s0_axi4_awburst => CONNECTED_TO_s0_axi4_awburst, --               .awburst
			s0_axi4_awlock  => CONNECTED_TO_s0_axi4_awlock,  --               .awlock
			s0_axi4_awprot  => CONNECTED_TO_s0_axi4_awprot,  --               .awprot
			s0_axi4_awqos   => CONNECTED_TO_s0_axi4_awqos,   --               .awqos
			s0_axi4_awuser  => CONNECTED_TO_s0_axi4_awuser,  --               .awuser
			s0_axi4_awvalid => CONNECTED_TO_s0_axi4_awvalid, --               .awvalid
			s0_axi4_awready => CONNECTED_TO_s0_axi4_awready, --               .awready
			s0_axi4_wdata   => CONNECTED_TO_s0_axi4_wdata,   --               .wdata
			s0_axi4_wstrb   => CONNECTED_TO_s0_axi4_wstrb,   --               .wstrb
			s0_axi4_wlast   => CONNECTED_TO_s0_axi4_wlast,   --               .wlast
			s0_axi4_wuser   => CONNECTED_TO_s0_axi4_wuser,   --               .wuser
			s0_axi4_wvalid  => CONNECTED_TO_s0_axi4_wvalid,  --               .wvalid
			s0_axi4_wready  => CONNECTED_TO_s0_axi4_wready,  --               .wready
			s0_axi4_bid     => CONNECTED_TO_s0_axi4_bid,     --               .bid
			s0_axi4_bresp   => CONNECTED_TO_s0_axi4_bresp,   --               .bresp
			s0_axi4_bvalid  => CONNECTED_TO_s0_axi4_bvalid,  --               .bvalid
			s0_axi4_bready  => CONNECTED_TO_s0_axi4_bready,  --               .bready
			s1_axi4_arid    => CONNECTED_TO_s1_axi4_arid,    --        s1_axi4.arid
			s1_axi4_araddr  => CONNECTED_TO_s1_axi4_araddr,  --               .araddr
			s1_axi4_arlen   => CONNECTED_TO_s1_axi4_arlen,   --               .arlen
			s1_axi4_arsize  => CONNECTED_TO_s1_axi4_arsize,  --               .arsize
			s1_axi4_arburst => CONNECTED_TO_s1_axi4_arburst, --               .arburst
			s1_axi4_arlock  => CONNECTED_TO_s1_axi4_arlock,  --               .arlock
			s1_axi4_arprot  => CONNECTED_TO_s1_axi4_arprot,  --               .arprot
			s1_axi4_arqos   => CONNECTED_TO_s1_axi4_arqos,   --               .arqos
			s1_axi4_aruser  => CONNECTED_TO_s1_axi4_aruser,  --               .aruser
			s1_axi4_arvalid => CONNECTED_TO_s1_axi4_arvalid, --               .arvalid
			s1_axi4_arready => CONNECTED_TO_s1_axi4_arready, --               .arready
			s1_axi4_rid     => CONNECTED_TO_s1_axi4_rid,     --               .rid
			s1_axi4_rdata   => CONNECTED_TO_s1_axi4_rdata,   --               .rdata
			s1_axi4_rresp   => CONNECTED_TO_s1_axi4_rresp,   --               .rresp
			s1_axi4_rlast   => CONNECTED_TO_s1_axi4_rlast,   --               .rlast
			s1_axi4_ruser   => CONNECTED_TO_s1_axi4_ruser,   --               .ruser
			s1_axi4_rvalid  => CONNECTED_TO_s1_axi4_rvalid,  --               .rvalid
			s1_axi4_rready  => CONNECTED_TO_s1_axi4_rready,  --               .rready
			s1_axi4_awid    => CONNECTED_TO_s1_axi4_awid,    --               .awid
			s1_axi4_awaddr  => CONNECTED_TO_s1_axi4_awaddr,  --               .awaddr
			s1_axi4_awlen   => CONNECTED_TO_s1_axi4_awlen,   --               .awlen
			s1_axi4_awsize  => CONNECTED_TO_s1_axi4_awsize,  --               .awsize
			s1_axi4_awburst => CONNECTED_TO_s1_axi4_awburst, --               .awburst
			s1_axi4_awlock  => CONNECTED_TO_s1_axi4_awlock,  --               .awlock
			s1_axi4_awprot  => CONNECTED_TO_s1_axi4_awprot,  --               .awprot
			s1_axi4_awqos   => CONNECTED_TO_s1_axi4_awqos,   --               .awqos
			s1_axi4_awuser  => CONNECTED_TO_s1_axi4_awuser,  --               .awuser
			s1_axi4_awvalid => CONNECTED_TO_s1_axi4_awvalid, --               .awvalid
			s1_axi4_awready => CONNECTED_TO_s1_axi4_awready, --               .awready
			s1_axi4_wdata   => CONNECTED_TO_s1_axi4_wdata,   --               .wdata
			s1_axi4_wstrb   => CONNECTED_TO_s1_axi4_wstrb,   --               .wstrb
			s1_axi4_wlast   => CONNECTED_TO_s1_axi4_wlast,   --               .wlast
			s1_axi4_wuser   => CONNECTED_TO_s1_axi4_wuser,   --               .wuser
			s1_axi4_wvalid  => CONNECTED_TO_s1_axi4_wvalid,  --               .wvalid
			s1_axi4_wready  => CONNECTED_TO_s1_axi4_wready,  --               .wready
			s1_axi4_bid     => CONNECTED_TO_s1_axi4_bid,     --               .bid
			s1_axi4_bresp   => CONNECTED_TO_s1_axi4_bresp,   --               .bresp
			s1_axi4_bvalid  => CONNECTED_TO_s1_axi4_bvalid,  --               .bvalid
			s1_axi4_bready  => CONNECTED_TO_s1_axi4_bready,  --               .bready
			s2_axi4_arid    => CONNECTED_TO_s2_axi4_arid,    --        s2_axi4.arid
			s2_axi4_araddr  => CONNECTED_TO_s2_axi4_araddr,  --               .araddr
			s2_axi4_arlen   => CONNECTED_TO_s2_axi4_arlen,   --               .arlen
			s2_axi4_arsize  => CONNECTED_TO_s2_axi4_arsize,  --               .arsize
			s2_axi4_arburst => CONNECTED_TO_s2_axi4_arburst, --               .arburst
			s2_axi4_arlock  => CONNECTED_TO_s2_axi4_arlock,  --               .arlock
			s2_axi4_arprot  => CONNECTED_TO_s2_axi4_arprot,  --               .arprot
			s2_axi4_arqos   => CONNECTED_TO_s2_axi4_arqos,   --               .arqos
			s2_axi4_aruser  => CONNECTED_TO_s2_axi4_aruser,  --               .aruser
			s2_axi4_arvalid => CONNECTED_TO_s2_axi4_arvalid, --               .arvalid
			s2_axi4_arready => CONNECTED_TO_s2_axi4_arready, --               .arready
			s2_axi4_rid     => CONNECTED_TO_s2_axi4_rid,     --               .rid
			s2_axi4_rdata   => CONNECTED_TO_s2_axi4_rdata,   --               .rdata
			s2_axi4_rresp   => CONNECTED_TO_s2_axi4_rresp,   --               .rresp
			s2_axi4_rlast   => CONNECTED_TO_s2_axi4_rlast,   --               .rlast
			s2_axi4_ruser   => CONNECTED_TO_s2_axi4_ruser,   --               .ruser
			s2_axi4_rvalid  => CONNECTED_TO_s2_axi4_rvalid,  --               .rvalid
			s2_axi4_rready  => CONNECTED_TO_s2_axi4_rready,  --               .rready
			s2_axi4_awid    => CONNECTED_TO_s2_axi4_awid,    --               .awid
			s2_axi4_awaddr  => CONNECTED_TO_s2_axi4_awaddr,  --               .awaddr
			s2_axi4_awlen   => CONNECTED_TO_s2_axi4_awlen,   --               .awlen
			s2_axi4_awsize  => CONNECTED_TO_s2_axi4_awsize,  --               .awsize
			s2_axi4_awburst => CONNECTED_TO_s2_axi4_awburst, --               .awburst
			s2_axi4_awlock  => CONNECTED_TO_s2_axi4_awlock,  --               .awlock
			s2_axi4_awprot  => CONNECTED_TO_s2_axi4_awprot,  --               .awprot
			s2_axi4_awqos   => CONNECTED_TO_s2_axi4_awqos,   --               .awqos
			s2_axi4_awuser  => CONNECTED_TO_s2_axi4_awuser,  --               .awuser
			s2_axi4_awvalid => CONNECTED_TO_s2_axi4_awvalid, --               .awvalid
			s2_axi4_awready => CONNECTED_TO_s2_axi4_awready, --               .awready
			s2_axi4_wdata   => CONNECTED_TO_s2_axi4_wdata,   --               .wdata
			s2_axi4_wstrb   => CONNECTED_TO_s2_axi4_wstrb,   --               .wstrb
			s2_axi4_wlast   => CONNECTED_TO_s2_axi4_wlast,   --               .wlast
			s2_axi4_wuser   => CONNECTED_TO_s2_axi4_wuser,   --               .wuser
			s2_axi4_wvalid  => CONNECTED_TO_s2_axi4_wvalid,  --               .wvalid
			s2_axi4_wready  => CONNECTED_TO_s2_axi4_wready,  --               .wready
			s2_axi4_bid     => CONNECTED_TO_s2_axi4_bid,     --               .bid
			s2_axi4_bresp   => CONNECTED_TO_s2_axi4_bresp,   --               .bresp
			s2_axi4_bvalid  => CONNECTED_TO_s2_axi4_bvalid,  --               .bvalid
			s2_axi4_bready  => CONNECTED_TO_s2_axi4_bready,  --               .bready
			s_axi4_aclk     => CONNECTED_TO_s_axi4_aclk,     --    s_axi4_aclk.clk
			s_axi4_aresetn  => CONNECTED_TO_s_axi4_aresetn   -- s_axi4_aresetn.reset_n
		);

