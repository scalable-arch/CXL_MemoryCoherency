	component platform_intel_pcie_axi_mcdma_0 is
		port (
			axi_st_clk                      : in  std_logic                       := 'X';             -- clk
			axi_mm_clk                      : in  std_logic                       := 'X';             -- clk
			axi_lite_clk                    : in  std_logic                       := 'X';             -- clk
			axi_st_areset_n                 : in  std_logic                       := 'X';             -- reset_n
			axi_mm_areset_n                 : in  std_logic                       := 'X';             -- reset_n
			axi_lite_areset_n               : in  std_logic                       := 'X';             -- reset_n
			ss_app_st_rx_tvalid             : in  std_logic                       := 'X';             -- tvalid
			ss_app_st_rx_tdata              : in  std_logic_vector(1023 downto 0) := (others => 'X'); -- tdata
			ss_app_st_rx_tkeep              : in  std_logic_vector(127 downto 0)  := (others => 'X'); -- tkeep
			ss_app_st_rx_tlast              : in  std_logic                       := 'X';             -- tlast
			ss_app_st_rx_tuser_vendor       : in  std_logic_vector(3 downto 0)    := (others => 'X'); -- ss_app_st_rx_tuser_vendor
			ss_app_st_rx_tuser_last_segment : in  std_logic_vector(3 downto 0)    := (others => 'X'); -- ss_app_st_rx_tuser_last_segment
			ss_app_st_rx_tuser_hvalid       : in  std_logic_vector(3 downto 0)    := (others => 'X'); -- ss_app_st_rx_tuser_hvalid
			ss_app_st_rx_tuser_hdr          : in  std_logic_vector(1023 downto 0) := (others => 'X'); -- ss_app_st_rx_tuser_hdr
			app_ss_st_tx_tvalid             : out std_logic;                                          -- tvalid
			ss_app_st_tx_tready             : in  std_logic                       := 'X';             -- tready
			app_ss_st_tx_tdata              : out std_logic_vector(1023 downto 0);                    -- tdata
			app_ss_st_tx_tkeep              : out std_logic_vector(127 downto 0);                     -- tkeep
			app_ss_st_tx_tlast              : out std_logic;                                          -- tlast
			app_ss_st_tx_tuser_last_segment : out std_logic_vector(3 downto 0);                       -- app_ss_st_tx_tuser_last_segment
			app_ss_st_tx_tuser_hvalid       : out std_logic_vector(3 downto 0);                       -- app_ss_st_tx_tuser_hvalid
			app_ss_st_tx_tuser_hdr          : out std_logic_vector(1023 downto 0);                    -- app_ss_st_tx_tuser_hdr
			app_ss_lite_csr_awvalid         : out std_logic;                                          -- awvalid
			ss_app_lite_csr_awready         : in  std_logic                       := 'X';             -- awready
			app_ss_lite_csr_awaddr          : out std_logic_vector(19 downto 0);                      -- awaddr
			app_ss_lite_csr_wvalid          : out std_logic;                                          -- wvalid
			ss_app_lite_csr_wready          : in  std_logic                       := 'X';             -- wready
			app_ss_lite_csr_wdata           : out std_logic_vector(31 downto 0);                      -- wdata
			app_ss_lite_csr_wstrb           : out std_logic_vector(3 downto 0);                       -- wstrb
			ss_app_lite_csr_bvalid          : in  std_logic                       := 'X';             -- bvalid
			app_ss_lite_csr_bready          : out std_logic;                                          -- bready
			ss_app_lite_csr_bresp           : in  std_logic_vector(1 downto 0)    := (others => 'X'); -- bresp
			app_ss_lite_csr_arvalid         : out std_logic;                                          -- arvalid
			ss_app_lite_csr_arready         : in  std_logic                       := 'X';             -- arready
			app_ss_lite_csr_araddr          : out std_logic_vector(19 downto 0);                      -- araddr
			ss_app_lite_csr_rvalid          : in  std_logic                       := 'X';             -- rvalid
			app_ss_lite_csr_rready          : out std_logic;                                          -- rready
			ss_app_lite_csr_rdata           : in  std_logic_vector(31 downto 0)   := (others => 'X'); -- rdata
			ss_app_lite_csr_rresp           : in  std_logic_vector(1 downto 0)    := (others => 'X'); -- rresp
			ss_app_lite_csr_awprot          : out std_logic_vector(2 downto 0);                       -- awprot
			ss_app_lite_csr_arprot          : out std_logic_vector(2 downto 0);                       -- arprot
			h2d_axi_st_tvalid               : out std_logic;                                          -- tvalid
			h2d_axi_st_tready               : in  std_logic                       := 'X';             -- tready
			h2d_axi_st_tdata                : out std_logic_vector(1023 downto 0);                    -- tdata
			h2d_axi_st_tkeep                : out std_logic_vector(127 downto 0);                     -- tkeep
			h2d_axi_st_tlast                : out std_logic;                                          -- tlast
			h2d_axi_st_tuser_metadata       : out std_logic_vector(63 downto 0);                      -- tuser
			h2d_axi_st_tid                  : out std_logic_vector(11 downto 0);                      -- tid
			h2d_axi_st_tuser_error          : out std_logic;                                          -- tuser_error
			d2h_axi_st_tvalid               : in  std_logic                       := 'X';             -- tvalid
			d2h_axi_st_tready               : out std_logic;                                          -- tready
			d2h_axi_st_tdata                : in  std_logic_vector(1023 downto 0) := (others => 'X'); -- tdata
			d2h_axi_st_tkeep                : in  std_logic_vector(127 downto 0)  := (others => 'X'); -- tkeep
			d2h_axi_st_tlast                : in  std_logic                       := 'X';             -- tlast
			d2h_axi_st_tuser_metadata       : in  std_logic_vector(63 downto 0)   := (others => 'X'); -- tuser
			d2h_axi_st_tid                  : in  std_logic_vector(11 downto 0)   := (others => 'X'); -- tid
			d2h_axi_st_tuser_error          : in  std_logic                       := 'X';             -- tuser_error
			rx_pio_axi_lite_awvalid         : out std_logic;                                          -- awvalid
			rx_pio_axi_lite_awready         : in  std_logic                       := 'X';             -- awready
			rx_pio_axi_lite_awaddr          : out std_logic_vector(24 downto 0);                      -- awaddr
			rx_pio_axi_lite_wvalid          : out std_logic;                                          -- wvalid
			rx_pio_axi_lite_wready          : in  std_logic                       := 'X';             -- wready
			rx_pio_axi_lite_wdata           : out std_logic_vector(63 downto 0);                      -- wdata
			rx_pio_axi_lite_wstrb           : out std_logic_vector(7 downto 0);                       -- wstrb
			rx_pio_axi_lite_bvalid          : in  std_logic                       := 'X';             -- bvalid
			rx_pio_axi_lite_bready          : out std_logic;                                          -- bready
			rx_pio_axi_lite_bresp           : in  std_logic_vector(1 downto 0)    := (others => 'X'); -- bresp
			rx_pio_axi_lite_arvalid         : out std_logic;                                          -- arvalid
			rx_pio_axi_lite_arready         : in  std_logic                       := 'X';             -- arready
			rx_pio_axi_lite_araddr          : out std_logic_vector(24 downto 0);                      -- araddr
			rx_pio_axi_lite_rvalid          : in  std_logic                       := 'X';             -- rvalid
			rx_pio_axi_lite_rready          : out std_logic;                                          -- rready
			rx_pio_axi_lite_rdata           : in  std_logic_vector(63 downto 0)   := (others => 'X'); -- rdata
			rx_pio_axi_lite_rresp           : in  std_logic_vector(1 downto 0)    := (others => 'X'); -- rresp
			rx_pio_axi_lite_awprot          : out std_logic_vector(2 downto 0);                       -- awprot
			rx_pio_axi_lite_arprot          : out std_logic_vector(2 downto 0);                       -- arprot
			ss_app_st_ciireq_tvalid         : in  std_logic                       := 'X';             -- tvalid
			app_ss_st_ciireq_tready         : out std_logic;                                          -- tready
			ss_app_st_ciireq_tdata          : in  std_logic_vector(71 downto 0)   := (others => 'X'); -- tdata
			app_ss_st_ciiresp_tvalid        : out std_logic;                                          -- tvalid
			app_ss_st_ciiresp_tdata         : out std_logic_vector(32 downto 0);                      -- tdata
			ss_app_st_txcrdt_tvalid         : in  std_logic                       := 'X';             -- tvalid
			ss_app_st_txcrdt_tdata          : in  std_logic_vector(18 downto 0)   := (others => 'X'); -- tdata
			app_ss_st_rxcrdt_tvalid         : out std_logic;                                          -- tvalid
			app_ss_st_rxcrdt_tdata          : out std_logic_vector(18 downto 0);                      -- tdata
			ss_app_st_ctrlshadow_tvalid     : in  std_logic                       := 'X';             -- tvalid
			ss_app_st_ctrlshadow_tdata      : in  std_logic_vector(39 downto 0)   := (others => 'X'); -- tdata
			ss_app_st_flrrcvd_tvalid        : in  std_logic                       := 'X';             -- tvalid
			ss_app_st_flrrcvd_tdata         : in  std_logic_vector(19 downto 0)   := (others => 'X'); -- tdata
			app_ss_st_flrcmpl_tvalid        : out std_logic;                                          -- tvalid
			app_ss_st_flrcmpl_tdata         : out std_logic_vector(19 downto 0);                      -- tdata
			ss_app_st_flrcmpl_tready        : in  std_logic                       := 'X';             -- tready
			ss_app_st_cplto_tvalid          : in  std_logic                       := 'X';             -- tvalid
			ss_app_st_cplto_tdata           : in  std_logic_vector(29 downto 0)   := (others => 'X'); -- tdata
			app_ss_st_err_tvalid            : out std_logic;                                          -- tvalid
			app_ss_st_err_tdata             : out std_logic_vector(31 downto 0);                      -- tdata
			app_ss_st_err_tlast             : out std_logic;                                          -- tlast
			ss_app_st_err_tready            : in  std_logic                       := 'X';             -- tready
			app_ss_st_err_tuser_error_type  : out std_logic_vector(13 downto 0)                       -- app_ss_st_err_tuser_error_type
		);
	end component platform_intel_pcie_axi_mcdma_0;

	u0 : component platform_intel_pcie_axi_mcdma_0
		port map (
			axi_st_clk                      => CONNECTED_TO_axi_st_clk,                      --                     axi_st_clk.clk
			axi_mm_clk                      => CONNECTED_TO_axi_mm_clk,                      --                     axi_mm_clk.clk
			axi_lite_clk                    => CONNECTED_TO_axi_lite_clk,                    --                   axi_lite_clk.clk
			axi_st_areset_n                 => CONNECTED_TO_axi_st_areset_n,                 --                axi_st_areset_n.reset_n
			axi_mm_areset_n                 => CONNECTED_TO_axi_mm_areset_n,                 --                axi_mm_areset_n.reset_n
			axi_lite_areset_n               => CONNECTED_TO_axi_lite_areset_n,               --              axi_lite_areset_n.reset_n
			ss_app_st_rx_tvalid             => CONNECTED_TO_ss_app_st_rx_tvalid,             --                       ss_rx_st.tvalid
			ss_app_st_rx_tdata              => CONNECTED_TO_ss_app_st_rx_tdata,              --                               .tdata
			ss_app_st_rx_tkeep              => CONNECTED_TO_ss_app_st_rx_tkeep,              --                               .tkeep
			ss_app_st_rx_tlast              => CONNECTED_TO_ss_app_st_rx_tlast,              --                               .tlast
			ss_app_st_rx_tuser_vendor       => CONNECTED_TO_ss_app_st_rx_tuser_vendor,       --          ss_rx_st_tuser_vendor.ss_app_st_rx_tuser_vendor
			ss_app_st_rx_tuser_last_segment => CONNECTED_TO_ss_app_st_rx_tuser_last_segment, --    ss_rx_st_tuser_last_segment.ss_app_st_rx_tuser_last_segment
			ss_app_st_rx_tuser_hvalid       => CONNECTED_TO_ss_app_st_rx_tuser_hvalid,       --          ss_rx_st_tuser_hvalid.ss_app_st_rx_tuser_hvalid
			ss_app_st_rx_tuser_hdr          => CONNECTED_TO_ss_app_st_rx_tuser_hdr,          --             ss_rx_st_tuser_hdr.ss_app_st_rx_tuser_hdr
			app_ss_st_tx_tvalid             => CONNECTED_TO_app_ss_st_tx_tvalid,             --                       ss_tx_st.tvalid
			ss_app_st_tx_tready             => CONNECTED_TO_ss_app_st_tx_tready,             --                               .tready
			app_ss_st_tx_tdata              => CONNECTED_TO_app_ss_st_tx_tdata,              --                               .tdata
			app_ss_st_tx_tkeep              => CONNECTED_TO_app_ss_st_tx_tkeep,              --                               .tkeep
			app_ss_st_tx_tlast              => CONNECTED_TO_app_ss_st_tx_tlast,              --                               .tlast
			app_ss_st_tx_tuser_last_segment => CONNECTED_TO_app_ss_st_tx_tuser_last_segment, --    ss_tx_st_tuser_last_segment.app_ss_st_tx_tuser_last_segment
			app_ss_st_tx_tuser_hvalid       => CONNECTED_TO_app_ss_st_tx_tuser_hvalid,       --          ss_tx_st_tuser_hvalid.app_ss_st_tx_tuser_hvalid
			app_ss_st_tx_tuser_hdr          => CONNECTED_TO_app_ss_st_tx_tuser_hdr,          --             ss_tx_st_tuser_hdr.app_ss_st_tx_tuser_hdr
			app_ss_lite_csr_awvalid         => CONNECTED_TO_app_ss_lite_csr_awvalid,         --                    ss_csr_lite.awvalid
			ss_app_lite_csr_awready         => CONNECTED_TO_ss_app_lite_csr_awready,         --                               .awready
			app_ss_lite_csr_awaddr          => CONNECTED_TO_app_ss_lite_csr_awaddr,          --                               .awaddr
			app_ss_lite_csr_wvalid          => CONNECTED_TO_app_ss_lite_csr_wvalid,          --                               .wvalid
			ss_app_lite_csr_wready          => CONNECTED_TO_ss_app_lite_csr_wready,          --                               .wready
			app_ss_lite_csr_wdata           => CONNECTED_TO_app_ss_lite_csr_wdata,           --                               .wdata
			app_ss_lite_csr_wstrb           => CONNECTED_TO_app_ss_lite_csr_wstrb,           --                               .wstrb
			ss_app_lite_csr_bvalid          => CONNECTED_TO_ss_app_lite_csr_bvalid,          --                               .bvalid
			app_ss_lite_csr_bready          => CONNECTED_TO_app_ss_lite_csr_bready,          --                               .bready
			ss_app_lite_csr_bresp           => CONNECTED_TO_ss_app_lite_csr_bresp,           --                               .bresp
			app_ss_lite_csr_arvalid         => CONNECTED_TO_app_ss_lite_csr_arvalid,         --                               .arvalid
			ss_app_lite_csr_arready         => CONNECTED_TO_ss_app_lite_csr_arready,         --                               .arready
			app_ss_lite_csr_araddr          => CONNECTED_TO_app_ss_lite_csr_araddr,          --                               .araddr
			ss_app_lite_csr_rvalid          => CONNECTED_TO_ss_app_lite_csr_rvalid,          --                               .rvalid
			app_ss_lite_csr_rready          => CONNECTED_TO_app_ss_lite_csr_rready,          --                               .rready
			ss_app_lite_csr_rdata           => CONNECTED_TO_ss_app_lite_csr_rdata,           --                               .rdata
			ss_app_lite_csr_rresp           => CONNECTED_TO_ss_app_lite_csr_rresp,           --                               .rresp
			ss_app_lite_csr_awprot          => CONNECTED_TO_ss_app_lite_csr_awprot,          --                               .awprot
			ss_app_lite_csr_arprot          => CONNECTED_TO_ss_app_lite_csr_arprot,          --                               .arprot
			h2d_axi_st_tvalid               => CONNECTED_TO_h2d_axi_st_tvalid,               --                 h2d_st_initatr.tvalid
			h2d_axi_st_tready               => CONNECTED_TO_h2d_axi_st_tready,               --                               .tready
			h2d_axi_st_tdata                => CONNECTED_TO_h2d_axi_st_tdata,                --                               .tdata
			h2d_axi_st_tkeep                => CONNECTED_TO_h2d_axi_st_tkeep,                --                               .tkeep
			h2d_axi_st_tlast                => CONNECTED_TO_h2d_axi_st_tlast,                --                               .tlast
			h2d_axi_st_tuser_metadata       => CONNECTED_TO_h2d_axi_st_tuser_metadata,       --                               .tuser
			h2d_axi_st_tid                  => CONNECTED_TO_h2d_axi_st_tid,                  --                               .tid
			h2d_axi_st_tuser_error          => CONNECTED_TO_h2d_axi_st_tuser_error,          --     h2d_st_initatr_tuser_error.tuser_error
			d2h_axi_st_tvalid               => CONNECTED_TO_d2h_axi_st_tvalid,               --                 d2h_st_respndr.tvalid
			d2h_axi_st_tready               => CONNECTED_TO_d2h_axi_st_tready,               --                               .tready
			d2h_axi_st_tdata                => CONNECTED_TO_d2h_axi_st_tdata,                --                               .tdata
			d2h_axi_st_tkeep                => CONNECTED_TO_d2h_axi_st_tkeep,                --                               .tkeep
			d2h_axi_st_tlast                => CONNECTED_TO_d2h_axi_st_tlast,                --                               .tlast
			d2h_axi_st_tuser_metadata       => CONNECTED_TO_d2h_axi_st_tuser_metadata,       --                               .tuser
			d2h_axi_st_tid                  => CONNECTED_TO_d2h_axi_st_tid,                  --                               .tid
			d2h_axi_st_tuser_error          => CONNECTED_TO_d2h_axi_st_tuser_error,          --     d2h_st_respndr_tuser_error.tuser_error
			rx_pio_axi_lite_awvalid         => CONNECTED_TO_rx_pio_axi_lite_awvalid,         --               pio_lite_initatr.awvalid
			rx_pio_axi_lite_awready         => CONNECTED_TO_rx_pio_axi_lite_awready,         --                               .awready
			rx_pio_axi_lite_awaddr          => CONNECTED_TO_rx_pio_axi_lite_awaddr,          --                               .awaddr
			rx_pio_axi_lite_wvalid          => CONNECTED_TO_rx_pio_axi_lite_wvalid,          --                               .wvalid
			rx_pio_axi_lite_wready          => CONNECTED_TO_rx_pio_axi_lite_wready,          --                               .wready
			rx_pio_axi_lite_wdata           => CONNECTED_TO_rx_pio_axi_lite_wdata,           --                               .wdata
			rx_pio_axi_lite_wstrb           => CONNECTED_TO_rx_pio_axi_lite_wstrb,           --                               .wstrb
			rx_pio_axi_lite_bvalid          => CONNECTED_TO_rx_pio_axi_lite_bvalid,          --                               .bvalid
			rx_pio_axi_lite_bready          => CONNECTED_TO_rx_pio_axi_lite_bready,          --                               .bready
			rx_pio_axi_lite_bresp           => CONNECTED_TO_rx_pio_axi_lite_bresp,           --                               .bresp
			rx_pio_axi_lite_arvalid         => CONNECTED_TO_rx_pio_axi_lite_arvalid,         --                               .arvalid
			rx_pio_axi_lite_arready         => CONNECTED_TO_rx_pio_axi_lite_arready,         --                               .arready
			rx_pio_axi_lite_araddr          => CONNECTED_TO_rx_pio_axi_lite_araddr,          --                               .araddr
			rx_pio_axi_lite_rvalid          => CONNECTED_TO_rx_pio_axi_lite_rvalid,          --                               .rvalid
			rx_pio_axi_lite_rready          => CONNECTED_TO_rx_pio_axi_lite_rready,          --                               .rready
			rx_pio_axi_lite_rdata           => CONNECTED_TO_rx_pio_axi_lite_rdata,           --                               .rdata
			rx_pio_axi_lite_rresp           => CONNECTED_TO_rx_pio_axi_lite_rresp,           --                               .rresp
			rx_pio_axi_lite_awprot          => CONNECTED_TO_rx_pio_axi_lite_awprot,          --                               .awprot
			rx_pio_axi_lite_arprot          => CONNECTED_TO_rx_pio_axi_lite_arprot,          --                               .arprot
			ss_app_st_ciireq_tvalid         => CONNECTED_TO_ss_app_st_ciireq_tvalid,         --                     ss_cii_req.tvalid
			app_ss_st_ciireq_tready         => CONNECTED_TO_app_ss_st_ciireq_tready,         --                               .tready
			ss_app_st_ciireq_tdata          => CONNECTED_TO_ss_app_st_ciireq_tdata,          --                               .tdata
			app_ss_st_ciiresp_tvalid        => CONNECTED_TO_app_ss_st_ciiresp_tvalid,        --                    ss_cii_resp.tvalid
			app_ss_st_ciiresp_tdata         => CONNECTED_TO_app_ss_st_ciiresp_tdata,         --                               .tdata
			ss_app_st_txcrdt_tvalid         => CONNECTED_TO_ss_app_st_txcrdt_tvalid,         --                      ss_txcrdt.tvalid
			ss_app_st_txcrdt_tdata          => CONNECTED_TO_ss_app_st_txcrdt_tdata,          --                               .tdata
			app_ss_st_rxcrdt_tvalid         => CONNECTED_TO_app_ss_st_rxcrdt_tvalid,         --                      ss_rxcrdt.tvalid
			app_ss_st_rxcrdt_tdata          => CONNECTED_TO_app_ss_st_rxcrdt_tdata,          --                               .tdata
			ss_app_st_ctrlshadow_tvalid     => CONNECTED_TO_ss_app_st_ctrlshadow_tvalid,     --                  ss_ctrlshadow.tvalid
			ss_app_st_ctrlshadow_tdata      => CONNECTED_TO_ss_app_st_ctrlshadow_tdata,      --                               .tdata
			ss_app_st_flrrcvd_tvalid        => CONNECTED_TO_ss_app_st_flrrcvd_tvalid,        --                     ss_flrrcvd.tvalid
			ss_app_st_flrrcvd_tdata         => CONNECTED_TO_ss_app_st_flrrcvd_tdata,         --                               .tdata
			app_ss_st_flrcmpl_tvalid        => CONNECTED_TO_app_ss_st_flrcmpl_tvalid,        --                     ss_flrcmpl.tvalid
			app_ss_st_flrcmpl_tdata         => CONNECTED_TO_app_ss_st_flrcmpl_tdata,         --                               .tdata
			ss_app_st_flrcmpl_tready        => CONNECTED_TO_ss_app_st_flrcmpl_tready,        --                               .tready
			ss_app_st_cplto_tvalid          => CONNECTED_TO_ss_app_st_cplto_tvalid,          --                       ss_cplto.tvalid
			ss_app_st_cplto_tdata           => CONNECTED_TO_ss_app_st_cplto_tdata,           --                               .tdata
			app_ss_st_err_tvalid            => CONNECTED_TO_app_ss_st_err_tvalid,            --                     ss_app_err.tvalid
			app_ss_st_err_tdata             => CONNECTED_TO_app_ss_st_err_tdata,             --                               .tdata
			app_ss_st_err_tlast             => CONNECTED_TO_app_ss_st_err_tlast,             --                               .tlast
			ss_app_st_err_tready            => CONNECTED_TO_ss_app_st_err_tready,            --                               .tready
			app_ss_st_err_tuser_error_type  => CONNECTED_TO_app_ss_st_err_tuser_error_type   -- app_ss_st_err_tuser_error_type.app_ss_st_err_tuser_error_type
		);

