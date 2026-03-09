	component platform_intel_agilex_hps_1 is
		port (
			NAND_ALE      : out   std_logic;                                         -- NAND_ALE
			NAND_CE_N     : out   std_logic;                                         -- NAND_CE_N
			NAND_CLE      : out   std_logic;                                         -- NAND_CLE
			NAND_RE_N     : out   std_logic;                                         -- NAND_RE_N
			NAND_RB       : in    std_logic                      := 'X';             -- NAND_RB
			NAND_ADQ0     : inout std_logic                      := 'X';             -- NAND_ADQ0
			NAND_ADQ1     : inout std_logic                      := 'X';             -- NAND_ADQ1
			NAND_ADQ2     : inout std_logic                      := 'X';             -- NAND_ADQ2
			NAND_ADQ3     : inout std_logic                      := 'X';             -- NAND_ADQ3
			NAND_ADQ4     : inout std_logic                      := 'X';             -- NAND_ADQ4
			NAND_ADQ5     : inout std_logic                      := 'X';             -- NAND_ADQ5
			NAND_ADQ6     : inout std_logic                      := 'X';             -- NAND_ADQ6
			NAND_ADQ7     : inout std_logic                      := 'X';             -- NAND_ADQ7
			NAND_WP_N     : out   std_logic;                                         -- NAND_WP_N
			NAND_WE_N     : out   std_logic;                                         -- NAND_WE_N
			UART0_RX      : in    std_logic                      := 'X';             -- UART0_RX
			UART0_TX      : out   std_logic;                                         -- UART0_TX
			hps_osc_clk   : in    std_logic                      := 'X';             -- hps_osc_clk
			h2f_rst       : out   std_logic;                                         -- reset
			h2f_axi_clk   : in    std_logic                      := 'X';             -- clk
			h2f_axi_rst_n : in    std_logic                      := 'X';             -- reset_n
			h2f_AWID      : out   std_logic_vector(3 downto 0);                      -- awid
			h2f_AWADDR    : out   std_logic_vector(31 downto 0);                     -- awaddr
			h2f_AWLEN     : out   std_logic_vector(7 downto 0);                      -- awlen
			h2f_AWSIZE    : out   std_logic_vector(2 downto 0);                      -- awsize
			h2f_AWBURST   : out   std_logic_vector(1 downto 0);                      -- awburst
			h2f_AWLOCK    : out   std_logic;                                         -- awlock
			h2f_AWCACHE   : out   std_logic_vector(3 downto 0);                      -- awcache
			h2f_AWPROT    : out   std_logic_vector(2 downto 0);                      -- awprot
			h2f_AWVALID   : out   std_logic;                                         -- awvalid
			h2f_AWREADY   : in    std_logic                      := 'X';             -- awready
			h2f_WDATA     : out   std_logic_vector(127 downto 0);                    -- wdata
			h2f_WSTRB     : out   std_logic_vector(15 downto 0);                     -- wstrb
			h2f_WLAST     : out   std_logic;                                         -- wlast
			h2f_WVALID    : out   std_logic;                                         -- wvalid
			h2f_WREADY    : in    std_logic                      := 'X';             -- wready
			h2f_BID       : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			h2f_BRESP     : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			h2f_BVALID    : in    std_logic                      := 'X';             -- bvalid
			h2f_BREADY    : out   std_logic;                                         -- bready
			h2f_ARID      : out   std_logic_vector(3 downto 0);                      -- arid
			h2f_ARADDR    : out   std_logic_vector(31 downto 0);                     -- araddr
			h2f_ARLEN     : out   std_logic_vector(7 downto 0);                      -- arlen
			h2f_ARSIZE    : out   std_logic_vector(2 downto 0);                      -- arsize
			h2f_ARBURST   : out   std_logic_vector(1 downto 0);                      -- arburst
			h2f_ARLOCK    : out   std_logic;                                         -- arlock
			h2f_ARCACHE   : out   std_logic_vector(3 downto 0);                      -- arcache
			h2f_ARPROT    : out   std_logic_vector(2 downto 0);                      -- arprot
			h2f_ARVALID   : out   std_logic;                                         -- arvalid
			h2f_ARREADY   : in    std_logic                      := 'X';             -- arready
			h2f_RID       : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			h2f_RDATA     : in    std_logic_vector(127 downto 0) := (others => 'X'); -- rdata
			h2f_RRESP     : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			h2f_RLAST     : in    std_logic                      := 'X';             -- rlast
			h2f_RVALID    : in    std_logic                      := 'X';             -- rvalid
			h2f_RREADY    : out   std_logic                                          -- rready
		);
	end component platform_intel_agilex_hps_1;

	u0 : component platform_intel_agilex_hps_1
		port map (
			NAND_ALE      => CONNECTED_TO_NAND_ALE,      --         hps_io.NAND_ALE
			NAND_CE_N     => CONNECTED_TO_NAND_CE_N,     --               .NAND_CE_N
			NAND_CLE      => CONNECTED_TO_NAND_CLE,      --               .NAND_CLE
			NAND_RE_N     => CONNECTED_TO_NAND_RE_N,     --               .NAND_RE_N
			NAND_RB       => CONNECTED_TO_NAND_RB,       --               .NAND_RB
			NAND_ADQ0     => CONNECTED_TO_NAND_ADQ0,     --               .NAND_ADQ0
			NAND_ADQ1     => CONNECTED_TO_NAND_ADQ1,     --               .NAND_ADQ1
			NAND_ADQ2     => CONNECTED_TO_NAND_ADQ2,     --               .NAND_ADQ2
			NAND_ADQ3     => CONNECTED_TO_NAND_ADQ3,     --               .NAND_ADQ3
			NAND_ADQ4     => CONNECTED_TO_NAND_ADQ4,     --               .NAND_ADQ4
			NAND_ADQ5     => CONNECTED_TO_NAND_ADQ5,     --               .NAND_ADQ5
			NAND_ADQ6     => CONNECTED_TO_NAND_ADQ6,     --               .NAND_ADQ6
			NAND_ADQ7     => CONNECTED_TO_NAND_ADQ7,     --               .NAND_ADQ7
			NAND_WP_N     => CONNECTED_TO_NAND_WP_N,     --               .NAND_WP_N
			NAND_WE_N     => CONNECTED_TO_NAND_WE_N,     --               .NAND_WE_N
			UART0_RX      => CONNECTED_TO_UART0_RX,      --               .UART0_RX
			UART0_TX      => CONNECTED_TO_UART0_TX,      --               .UART0_TX
			hps_osc_clk   => CONNECTED_TO_hps_osc_clk,   --               .hps_osc_clk
			h2f_rst       => CONNECTED_TO_h2f_rst,       --      h2f_reset.reset
			h2f_axi_clk   => CONNECTED_TO_h2f_axi_clk,   --  h2f_axi_clock.clk
			h2f_axi_rst_n => CONNECTED_TO_h2f_axi_rst_n, --  h2f_axi_reset.reset_n
			h2f_AWID      => CONNECTED_TO_h2f_AWID,      -- h2f_axi_master.awid
			h2f_AWADDR    => CONNECTED_TO_h2f_AWADDR,    --               .awaddr
			h2f_AWLEN     => CONNECTED_TO_h2f_AWLEN,     --               .awlen
			h2f_AWSIZE    => CONNECTED_TO_h2f_AWSIZE,    --               .awsize
			h2f_AWBURST   => CONNECTED_TO_h2f_AWBURST,   --               .awburst
			h2f_AWLOCK    => CONNECTED_TO_h2f_AWLOCK,    --               .awlock
			h2f_AWCACHE   => CONNECTED_TO_h2f_AWCACHE,   --               .awcache
			h2f_AWPROT    => CONNECTED_TO_h2f_AWPROT,    --               .awprot
			h2f_AWVALID   => CONNECTED_TO_h2f_AWVALID,   --               .awvalid
			h2f_AWREADY   => CONNECTED_TO_h2f_AWREADY,   --               .awready
			h2f_WDATA     => CONNECTED_TO_h2f_WDATA,     --               .wdata
			h2f_WSTRB     => CONNECTED_TO_h2f_WSTRB,     --               .wstrb
			h2f_WLAST     => CONNECTED_TO_h2f_WLAST,     --               .wlast
			h2f_WVALID    => CONNECTED_TO_h2f_WVALID,    --               .wvalid
			h2f_WREADY    => CONNECTED_TO_h2f_WREADY,    --               .wready
			h2f_BID       => CONNECTED_TO_h2f_BID,       --               .bid
			h2f_BRESP     => CONNECTED_TO_h2f_BRESP,     --               .bresp
			h2f_BVALID    => CONNECTED_TO_h2f_BVALID,    --               .bvalid
			h2f_BREADY    => CONNECTED_TO_h2f_BREADY,    --               .bready
			h2f_ARID      => CONNECTED_TO_h2f_ARID,      --               .arid
			h2f_ARADDR    => CONNECTED_TO_h2f_ARADDR,    --               .araddr
			h2f_ARLEN     => CONNECTED_TO_h2f_ARLEN,     --               .arlen
			h2f_ARSIZE    => CONNECTED_TO_h2f_ARSIZE,    --               .arsize
			h2f_ARBURST   => CONNECTED_TO_h2f_ARBURST,   --               .arburst
			h2f_ARLOCK    => CONNECTED_TO_h2f_ARLOCK,    --               .arlock
			h2f_ARCACHE   => CONNECTED_TO_h2f_ARCACHE,   --               .arcache
			h2f_ARPROT    => CONNECTED_TO_h2f_ARPROT,    --               .arprot
			h2f_ARVALID   => CONNECTED_TO_h2f_ARVALID,   --               .arvalid
			h2f_ARREADY   => CONNECTED_TO_h2f_ARREADY,   --               .arready
			h2f_RID       => CONNECTED_TO_h2f_RID,       --               .rid
			h2f_RDATA     => CONNECTED_TO_h2f_RDATA,     --               .rdata
			h2f_RRESP     => CONNECTED_TO_h2f_RRESP,     --               .rresp
			h2f_RLAST     => CONNECTED_TO_h2f_RLAST,     --               .rlast
			h2f_RVALID    => CONNECTED_TO_h2f_RVALID,    --               .rvalid
			h2f_RREADY    => CONNECTED_TO_h2f_RREADY     --               .rready
		);

