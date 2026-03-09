	component platform_intel_pcie_ss_axi_0 is
		port (
			pin_perst_n                        : in  std_logic                       := 'X';             -- reset_n
			coreclkout_hip_toapp               : out std_logic;                                          -- clk
			p0_pin_perst_n                     : out std_logic;                                          -- reset_n
			ninit_done                         : in  std_logic                       := 'X';             -- reset
			p0_reset_status_n                  : out std_logic;                                          -- reset_n
			dummy_user_avmm_rst                : in  std_logic                       := 'X';             -- reset
			p0_axi_st_clk                      : in  std_logic                       := 'X';             -- clk
			p0_axi_lite_clk                    : in  std_logic                       := 'X';             -- clk
			p0_axi_st_areset_n                 : in  std_logic                       := 'X';             -- reset_n
			p0_axi_lite_areset_n               : in  std_logic                       := 'X';             -- reset_n
			p0_subsystem_cold_rst_n            : in  std_logic                       := 'X';             -- reset_n
			p0_subsystem_warm_rst_n            : in  std_logic                       := 'X';             -- reset_n
			p0_subsystem_cold_rst_ack_n        : out std_logic;                                          -- subsystem_cold_rst_ack_n
			p0_subsystem_warm_rst_ack_n        : out std_logic;                                          -- subsystem_warm_rst_ack_n
			p0_subsystem_rst_req               : in  std_logic                       := 'X';             -- subsystem_rst_req
			p0_subsystem_rst_rdy               : out std_logic;                                          -- subsystem_rst_rdy
			p0_initiate_warmrst_req            : out std_logic;                                          -- initiate_warmrst_req
			p0_initiate_rst_req_rdy            : in  std_logic                       := 'X';             -- initiate_rst_req_rdy
			p0_ss_app_st_rx_tvalid             : out std_logic;                                          -- tvalid
			p0_ss_app_st_rx_tdata              : out std_logic_vector(1023 downto 0);                    -- tdata
			p0_ss_app_st_rx_tkeep              : out std_logic_vector(127 downto 0);                     -- tkeep
			p0_ss_app_st_rx_tlast              : out std_logic;                                          -- tlast
			p0_ss_app_st_rx_tuser_vendor       : out std_logic_vector(3 downto 0);                       -- ss_app_st_rx_tuser_vendor
			p0_ss_app_st_rx_tuser_last_segment : out std_logic_vector(3 downto 0);                       -- ss_app_st_rx_tuser_last_segment
			p0_ss_app_st_rx_tuser_hvalid       : out std_logic_vector(3 downto 0);                       -- ss_app_st_rx_tuser_hvalid
			p0_ss_app_st_rx_tuser_hdr          : out std_logic_vector(1023 downto 0);                    -- ss_app_st_rx_tuser_hdr
			p0_app_ss_st_tx_tvalid             : in  std_logic                       := 'X';             -- tvalid
			p0_ss_app_st_tx_tready             : out std_logic;                                          -- tready
			p0_app_ss_st_tx_tdata              : in  std_logic_vector(1023 downto 0) := (others => 'X'); -- tdata
			p0_app_ss_st_tx_tkeep              : in  std_logic_vector(127 downto 0)  := (others => 'X'); -- tkeep
			p0_app_ss_st_tx_tlast              : in  std_logic                       := 'X';             -- tlast
			p0_app_ss_st_tx_tuser_last_segment : in  std_logic_vector(3 downto 0)    := (others => 'X'); -- app_ss_st_tx_tuser_last_segment
			p0_app_ss_st_tx_tuser_hvalid       : in  std_logic_vector(3 downto 0)    := (others => 'X'); -- app_ss_st_tx_tuser_hvalid
			p0_app_ss_st_tx_tuser_hdr          : in  std_logic_vector(1023 downto 0) := (others => 'X'); -- app_ss_st_tx_tuser_hdr
			p0_ss_app_st_flrrcvd_tvalid        : out std_logic;                                          -- tvalid
			p0_ss_app_st_flrrcvd_tdata         : out std_logic_vector(19 downto 0);                      -- tdata
			p0_app_ss_st_flrcmpl_tvalid        : in  std_logic                       := 'X';             -- tvalid
			p0_app_ss_st_flrcmpl_tdata         : in  std_logic_vector(19 downto 0)   := (others => 'X'); -- tdata
			p0_ss_app_st_flrcmpl_tready        : out std_logic;                                          -- tready
			p0_ss_app_st_txcrdt_tvalid         : out std_logic;                                          -- tvalid
			p0_ss_app_st_txcrdt_tdata          : out std_logic_vector(18 downto 0);                      -- tdata
			p0_ss_app_st_rxcrdt_tvalid         : in  std_logic                       := 'X';             -- tvalid
			p0_ss_app_st_rxcrdt_tdata          : in  std_logic_vector(18 downto 0)   := (others => 'X'); -- tdata
			p0_app_ss_lite_csr_awvalid         : in  std_logic                       := 'X';             -- awvalid
			p0_ss_app_lite_csr_awready         : out std_logic;                                          -- awready
			p0_app_ss_lite_csr_awaddr          : in  std_logic_vector(19 downto 0)   := (others => 'X'); -- awaddr
			p0_app_ss_lite_csr_awprot          : in  std_logic_vector(2 downto 0)    := (others => 'X'); -- awprot
			p0_app_ss_lite_csr_wvalid          : in  std_logic                       := 'X';             -- wvalid
			p0_ss_app_lite_csr_wready          : out std_logic;                                          -- wready
			p0_app_ss_lite_csr_wdata           : in  std_logic_vector(31 downto 0)   := (others => 'X'); -- wdata
			p0_app_ss_lite_csr_wstrb           : in  std_logic_vector(3 downto 0)    := (others => 'X'); -- wstrb
			p0_ss_app_lite_csr_bvalid          : out std_logic;                                          -- bvalid
			p0_app_ss_lite_csr_bready          : in  std_logic                       := 'X';             -- bready
			p0_ss_app_lite_csr_bresp           : out std_logic_vector(1 downto 0);                       -- bresp
			p0_app_ss_lite_csr_arvalid         : in  std_logic                       := 'X';             -- arvalid
			p0_ss_app_lite_csr_arready         : out std_logic;                                          -- arready
			p0_app_ss_lite_csr_araddr          : in  std_logic_vector(19 downto 0)   := (others => 'X'); -- araddr
			p0_app_ss_lite_csr_arprot          : in  std_logic_vector(2 downto 0)    := (others => 'X'); -- arprot
			p0_ss_app_lite_csr_rvalid          : out std_logic;                                          -- rvalid
			p0_app_ss_lite_csr_rready          : in  std_logic                       := 'X';             -- rready
			p0_ss_app_lite_csr_rdata           : out std_logic_vector(31 downto 0);                      -- rdata
			p0_ss_app_lite_csr_rresp           : out std_logic_vector(1 downto 0);                       -- rresp
			p0_app_ss_st_err_tvalid            : in  std_logic                       := 'X';             -- tvalid
			p0_app_ss_st_err_tdata             : in  std_logic_vector(31 downto 0)   := (others => 'X'); -- tdata
			p0_app_ss_st_err_tlast             : in  std_logic                       := 'X';             -- tlast
			p0_ss_app_st_err_tready            : out std_logic;                                          -- tready
			p0_app_ss_st_err_tuser_error_type  : in  std_logic_vector(13 downto 0)   := (others => 'X'); -- app_ss_st_err_tuser_error_type
			p0_ss_app_serr                     : out std_logic;                                          -- ss_app_serr
			p0_ss_app_dlup                     : out std_logic;                                          -- ss_app_dlup
			p0_ss_app_surprise_down_err        : out std_logic;                                          -- ss_app_surprise_down_err
			p0_ss_app_rx_par_err               : out std_logic;                                          -- ss_app_rx_par_err
			p0_ss_app_tx_par_err               : out std_logic;                                          -- ss_app_tx_par_err
			tx_n_out0                          : out std_logic;                                          -- tx_n_out0
			tx_n_out1                          : out std_logic;                                          -- tx_n_out1
			tx_n_out2                          : out std_logic;                                          -- tx_n_out2
			tx_n_out3                          : out std_logic;                                          -- tx_n_out3
			tx_n_out4                          : out std_logic;                                          -- tx_n_out4
			tx_n_out5                          : out std_logic;                                          -- tx_n_out5
			tx_n_out6                          : out std_logic;                                          -- tx_n_out6
			tx_n_out7                          : out std_logic;                                          -- tx_n_out7
			tx_n_out8                          : out std_logic;                                          -- tx_n_out8
			tx_n_out9                          : out std_logic;                                          -- tx_n_out9
			tx_n_out10                         : out std_logic;                                          -- tx_n_out10
			tx_n_out11                         : out std_logic;                                          -- tx_n_out11
			tx_n_out12                         : out std_logic;                                          -- tx_n_out12
			tx_n_out13                         : out std_logic;                                          -- tx_n_out13
			tx_n_out14                         : out std_logic;                                          -- tx_n_out14
			tx_n_out15                         : out std_logic;                                          -- tx_n_out15
			tx_p_out0                          : out std_logic;                                          -- tx_p_out0
			tx_p_out1                          : out std_logic;                                          -- tx_p_out1
			tx_p_out2                          : out std_logic;                                          -- tx_p_out2
			tx_p_out3                          : out std_logic;                                          -- tx_p_out3
			tx_p_out4                          : out std_logic;                                          -- tx_p_out4
			tx_p_out5                          : out std_logic;                                          -- tx_p_out5
			tx_p_out6                          : out std_logic;                                          -- tx_p_out6
			tx_p_out7                          : out std_logic;                                          -- tx_p_out7
			tx_p_out8                          : out std_logic;                                          -- tx_p_out8
			tx_p_out9                          : out std_logic;                                          -- tx_p_out9
			tx_p_out10                         : out std_logic;                                          -- tx_p_out10
			tx_p_out11                         : out std_logic;                                          -- tx_p_out11
			tx_p_out12                         : out std_logic;                                          -- tx_p_out12
			tx_p_out13                         : out std_logic;                                          -- tx_p_out13
			tx_p_out14                         : out std_logic;                                          -- tx_p_out14
			tx_p_out15                         : out std_logic;                                          -- tx_p_out15
			rx_n_in0                           : in  std_logic                       := 'X';             -- rx_n_in0
			rx_n_in1                           : in  std_logic                       := 'X';             -- rx_n_in1
			rx_n_in2                           : in  std_logic                       := 'X';             -- rx_n_in2
			rx_n_in3                           : in  std_logic                       := 'X';             -- rx_n_in3
			rx_n_in4                           : in  std_logic                       := 'X';             -- rx_n_in4
			rx_n_in5                           : in  std_logic                       := 'X';             -- rx_n_in5
			rx_n_in6                           : in  std_logic                       := 'X';             -- rx_n_in6
			rx_n_in7                           : in  std_logic                       := 'X';             -- rx_n_in7
			rx_n_in8                           : in  std_logic                       := 'X';             -- rx_n_in8
			rx_n_in9                           : in  std_logic                       := 'X';             -- rx_n_in9
			rx_n_in10                          : in  std_logic                       := 'X';             -- rx_n_in10
			rx_n_in11                          : in  std_logic                       := 'X';             -- rx_n_in11
			rx_n_in12                          : in  std_logic                       := 'X';             -- rx_n_in12
			rx_n_in13                          : in  std_logic                       := 'X';             -- rx_n_in13
			rx_n_in14                          : in  std_logic                       := 'X';             -- rx_n_in14
			rx_n_in15                          : in  std_logic                       := 'X';             -- rx_n_in15
			rx_p_in0                           : in  std_logic                       := 'X';             -- rx_p_in0
			rx_p_in1                           : in  std_logic                       := 'X';             -- rx_p_in1
			rx_p_in2                           : in  std_logic                       := 'X';             -- rx_p_in2
			rx_p_in3                           : in  std_logic                       := 'X';             -- rx_p_in3
			rx_p_in4                           : in  std_logic                       := 'X';             -- rx_p_in4
			rx_p_in5                           : in  std_logic                       := 'X';             -- rx_p_in5
			rx_p_in6                           : in  std_logic                       := 'X';             -- rx_p_in6
			rx_p_in7                           : in  std_logic                       := 'X';             -- rx_p_in7
			rx_p_in8                           : in  std_logic                       := 'X';             -- rx_p_in8
			rx_p_in9                           : in  std_logic                       := 'X';             -- rx_p_in9
			rx_p_in10                          : in  std_logic                       := 'X';             -- rx_p_in10
			rx_p_in11                          : in  std_logic                       := 'X';             -- rx_p_in11
			rx_p_in12                          : in  std_logic                       := 'X';             -- rx_p_in12
			rx_p_in13                          : in  std_logic                       := 'X';             -- rx_p_in13
			rx_p_in14                          : in  std_logic                       := 'X';             -- rx_p_in14
			rx_p_in15                          : in  std_logic                       := 'X';             -- rx_p_in15
			refclk0                            : in  std_logic                       := 'X';             -- clk
			refclk1                            : in  std_logic                       := 'X'              -- clk
		);
	end component platform_intel_pcie_ss_axi_0;

	u0 : component platform_intel_pcie_ss_axi_0
		port map (
			pin_perst_n                        => CONNECTED_TO_pin_perst_n,                        --                        pin_perst_n.reset_n
			coreclkout_hip_toapp               => CONNECTED_TO_coreclkout_hip_toapp,               --               coreclkout_hip_toapp.clk
			p0_pin_perst_n                     => CONNECTED_TO_p0_pin_perst_n,                     --                     p0_pin_perst_n.reset_n
			ninit_done                         => CONNECTED_TO_ninit_done,                         --                         ninit_done.reset
			p0_reset_status_n                  => CONNECTED_TO_p0_reset_status_n,                  --                  p0_reset_status_n.reset_n
			dummy_user_avmm_rst                => CONNECTED_TO_dummy_user_avmm_rst,                --                dummy_user_avmm_rst.reset
			p0_axi_st_clk                      => CONNECTED_TO_p0_axi_st_clk,                      --                      p0_axi_st_clk.clk
			p0_axi_lite_clk                    => CONNECTED_TO_p0_axi_lite_clk,                    --                    p0_axi_lite_clk.clk
			p0_axi_st_areset_n                 => CONNECTED_TO_p0_axi_st_areset_n,                 --                 p0_axi_st_areset_n.reset_n
			p0_axi_lite_areset_n               => CONNECTED_TO_p0_axi_lite_areset_n,               --               p0_axi_lite_areset_n.reset_n
			p0_subsystem_cold_rst_n            => CONNECTED_TO_p0_subsystem_cold_rst_n,            --            p0_subsystem_cold_rst_n.reset_n
			p0_subsystem_warm_rst_n            => CONNECTED_TO_p0_subsystem_warm_rst_n,            --            p0_subsystem_warm_rst_n.reset_n
			p0_subsystem_cold_rst_ack_n        => CONNECTED_TO_p0_subsystem_cold_rst_ack_n,        --        p0_subsystem_cold_rst_ack_n.subsystem_cold_rst_ack_n
			p0_subsystem_warm_rst_ack_n        => CONNECTED_TO_p0_subsystem_warm_rst_ack_n,        --        p0_subsystem_warm_rst_ack_n.subsystem_warm_rst_ack_n
			p0_subsystem_rst_req               => CONNECTED_TO_p0_subsystem_rst_req,               --               p0_subsystem_rst_req.subsystem_rst_req
			p0_subsystem_rst_rdy               => CONNECTED_TO_p0_subsystem_rst_rdy,               --               p0_subsystem_rst_rdy.subsystem_rst_rdy
			p0_initiate_warmrst_req            => CONNECTED_TO_p0_initiate_warmrst_req,            --            p0_initiate_warmrst_req.initiate_warmrst_req
			p0_initiate_rst_req_rdy            => CONNECTED_TO_p0_initiate_rst_req_rdy,            --            p0_initiate_rst_req_rdy.initiate_rst_req_rdy
			p0_ss_app_st_rx_tvalid             => CONNECTED_TO_p0_ss_app_st_rx_tvalid,             --                           p0_st_rx.tvalid
			p0_ss_app_st_rx_tdata              => CONNECTED_TO_p0_ss_app_st_rx_tdata,              --                                   .tdata
			p0_ss_app_st_rx_tkeep              => CONNECTED_TO_p0_ss_app_st_rx_tkeep,              --                                   .tkeep
			p0_ss_app_st_rx_tlast              => CONNECTED_TO_p0_ss_app_st_rx_tlast,              --                                   .tlast
			p0_ss_app_st_rx_tuser_vendor       => CONNECTED_TO_p0_ss_app_st_rx_tuser_vendor,       --       p0_ss_app_st_rx_tuser_vendor.ss_app_st_rx_tuser_vendor
			p0_ss_app_st_rx_tuser_last_segment => CONNECTED_TO_p0_ss_app_st_rx_tuser_last_segment, -- p0_ss_app_st_rx_tuser_last_segment.ss_app_st_rx_tuser_last_segment
			p0_ss_app_st_rx_tuser_hvalid       => CONNECTED_TO_p0_ss_app_st_rx_tuser_hvalid,       --       p0_ss_app_st_rx_tuser_hvalid.ss_app_st_rx_tuser_hvalid
			p0_ss_app_st_rx_tuser_hdr          => CONNECTED_TO_p0_ss_app_st_rx_tuser_hdr,          --          p0_ss_app_st_rx_tuser_hdr.ss_app_st_rx_tuser_hdr
			p0_app_ss_st_tx_tvalid             => CONNECTED_TO_p0_app_ss_st_tx_tvalid,             --                           p0_st_tx.tvalid
			p0_ss_app_st_tx_tready             => CONNECTED_TO_p0_ss_app_st_tx_tready,             --                                   .tready
			p0_app_ss_st_tx_tdata              => CONNECTED_TO_p0_app_ss_st_tx_tdata,              --                                   .tdata
			p0_app_ss_st_tx_tkeep              => CONNECTED_TO_p0_app_ss_st_tx_tkeep,              --                                   .tkeep
			p0_app_ss_st_tx_tlast              => CONNECTED_TO_p0_app_ss_st_tx_tlast,              --                                   .tlast
			p0_app_ss_st_tx_tuser_last_segment => CONNECTED_TO_p0_app_ss_st_tx_tuser_last_segment, -- p0_app_ss_st_tx_tuser_last_segment.app_ss_st_tx_tuser_last_segment
			p0_app_ss_st_tx_tuser_hvalid       => CONNECTED_TO_p0_app_ss_st_tx_tuser_hvalid,       --       p0_app_ss_st_tx_tuser_hvalid.app_ss_st_tx_tuser_hvalid
			p0_app_ss_st_tx_tuser_hdr          => CONNECTED_TO_p0_app_ss_st_tx_tuser_hdr,          --          p0_app_ss_st_tx_tuser_hdr.app_ss_st_tx_tuser_hdr
			p0_ss_app_st_flrrcvd_tvalid        => CONNECTED_TO_p0_ss_app_st_flrrcvd_tvalid,        --                      p0_st_flrrcvd.tvalid
			p0_ss_app_st_flrrcvd_tdata         => CONNECTED_TO_p0_ss_app_st_flrrcvd_tdata,         --                                   .tdata
			p0_app_ss_st_flrcmpl_tvalid        => CONNECTED_TO_p0_app_ss_st_flrcmpl_tvalid,        --                      p0_st_flrcmpl.tvalid
			p0_app_ss_st_flrcmpl_tdata         => CONNECTED_TO_p0_app_ss_st_flrcmpl_tdata,         --                                   .tdata
			p0_ss_app_st_flrcmpl_tready        => CONNECTED_TO_p0_ss_app_st_flrcmpl_tready,        --                                   .tready
			p0_ss_app_st_txcrdt_tvalid         => CONNECTED_TO_p0_ss_app_st_txcrdt_tvalid,         --                       p0_st_txcrdt.tvalid
			p0_ss_app_st_txcrdt_tdata          => CONNECTED_TO_p0_ss_app_st_txcrdt_tdata,          --                                   .tdata
			p0_ss_app_st_rxcrdt_tvalid         => CONNECTED_TO_p0_ss_app_st_rxcrdt_tvalid,         --                       p0_st_rxcrdt.tvalid
			p0_ss_app_st_rxcrdt_tdata          => CONNECTED_TO_p0_ss_app_st_rxcrdt_tdata,          --                                   .tdata
			p0_app_ss_lite_csr_awvalid         => CONNECTED_TO_p0_app_ss_lite_csr_awvalid,         --                        p0_lite_csr.awvalid
			p0_ss_app_lite_csr_awready         => CONNECTED_TO_p0_ss_app_lite_csr_awready,         --                                   .awready
			p0_app_ss_lite_csr_awaddr          => CONNECTED_TO_p0_app_ss_lite_csr_awaddr,          --                                   .awaddr
			p0_app_ss_lite_csr_awprot          => CONNECTED_TO_p0_app_ss_lite_csr_awprot,          --                                   .awprot
			p0_app_ss_lite_csr_wvalid          => CONNECTED_TO_p0_app_ss_lite_csr_wvalid,          --                                   .wvalid
			p0_ss_app_lite_csr_wready          => CONNECTED_TO_p0_ss_app_lite_csr_wready,          --                                   .wready
			p0_app_ss_lite_csr_wdata           => CONNECTED_TO_p0_app_ss_lite_csr_wdata,           --                                   .wdata
			p0_app_ss_lite_csr_wstrb           => CONNECTED_TO_p0_app_ss_lite_csr_wstrb,           --                                   .wstrb
			p0_ss_app_lite_csr_bvalid          => CONNECTED_TO_p0_ss_app_lite_csr_bvalid,          --                                   .bvalid
			p0_app_ss_lite_csr_bready          => CONNECTED_TO_p0_app_ss_lite_csr_bready,          --                                   .bready
			p0_ss_app_lite_csr_bresp           => CONNECTED_TO_p0_ss_app_lite_csr_bresp,           --                                   .bresp
			p0_app_ss_lite_csr_arvalid         => CONNECTED_TO_p0_app_ss_lite_csr_arvalid,         --                                   .arvalid
			p0_ss_app_lite_csr_arready         => CONNECTED_TO_p0_ss_app_lite_csr_arready,         --                                   .arready
			p0_app_ss_lite_csr_araddr          => CONNECTED_TO_p0_app_ss_lite_csr_araddr,          --                                   .araddr
			p0_app_ss_lite_csr_arprot          => CONNECTED_TO_p0_app_ss_lite_csr_arprot,          --                                   .arprot
			p0_ss_app_lite_csr_rvalid          => CONNECTED_TO_p0_ss_app_lite_csr_rvalid,          --                                   .rvalid
			p0_app_ss_lite_csr_rready          => CONNECTED_TO_p0_app_ss_lite_csr_rready,          --                                   .rready
			p0_ss_app_lite_csr_rdata           => CONNECTED_TO_p0_ss_app_lite_csr_rdata,           --                                   .rdata
			p0_ss_app_lite_csr_rresp           => CONNECTED_TO_p0_ss_app_lite_csr_rresp,           --                                   .rresp
			p0_app_ss_st_err_tvalid            => CONNECTED_TO_p0_app_ss_st_err_tvalid,            --                          p0_st_err.tvalid
			p0_app_ss_st_err_tdata             => CONNECTED_TO_p0_app_ss_st_err_tdata,             --                                   .tdata
			p0_app_ss_st_err_tlast             => CONNECTED_TO_p0_app_ss_st_err_tlast,             --                                   .tlast
			p0_ss_app_st_err_tready            => CONNECTED_TO_p0_ss_app_st_err_tready,            --                                   .tready
			p0_app_ss_st_err_tuser_error_type  => CONNECTED_TO_p0_app_ss_st_err_tuser_error_type,  --  p0_app_ss_st_err_tuser_error_type.app_ss_st_err_tuser_error_type
			p0_ss_app_serr                     => CONNECTED_TO_p0_ss_app_serr,                     --                     p0_ss_app_serr.ss_app_serr
			p0_ss_app_dlup                     => CONNECTED_TO_p0_ss_app_dlup,                     --                     p0_ss_app_dlup.ss_app_dlup
			p0_ss_app_surprise_down_err        => CONNECTED_TO_p0_ss_app_surprise_down_err,        --        p0_ss_app_surprise_down_err.ss_app_surprise_down_err
			p0_ss_app_rx_par_err               => CONNECTED_TO_p0_ss_app_rx_par_err,               --               p0_ss_app_rx_par_err.ss_app_rx_par_err
			p0_ss_app_tx_par_err               => CONNECTED_TO_p0_ss_app_tx_par_err,               --               p0_ss_app_tx_par_err.ss_app_tx_par_err
			tx_n_out0                          => CONNECTED_TO_tx_n_out0,                          --                         hip_serial.tx_n_out0
			tx_n_out1                          => CONNECTED_TO_tx_n_out1,                          --                                   .tx_n_out1
			tx_n_out2                          => CONNECTED_TO_tx_n_out2,                          --                                   .tx_n_out2
			tx_n_out3                          => CONNECTED_TO_tx_n_out3,                          --                                   .tx_n_out3
			tx_n_out4                          => CONNECTED_TO_tx_n_out4,                          --                                   .tx_n_out4
			tx_n_out5                          => CONNECTED_TO_tx_n_out5,                          --                                   .tx_n_out5
			tx_n_out6                          => CONNECTED_TO_tx_n_out6,                          --                                   .tx_n_out6
			tx_n_out7                          => CONNECTED_TO_tx_n_out7,                          --                                   .tx_n_out7
			tx_n_out8                          => CONNECTED_TO_tx_n_out8,                          --                                   .tx_n_out8
			tx_n_out9                          => CONNECTED_TO_tx_n_out9,                          --                                   .tx_n_out9
			tx_n_out10                         => CONNECTED_TO_tx_n_out10,                         --                                   .tx_n_out10
			tx_n_out11                         => CONNECTED_TO_tx_n_out11,                         --                                   .tx_n_out11
			tx_n_out12                         => CONNECTED_TO_tx_n_out12,                         --                                   .tx_n_out12
			tx_n_out13                         => CONNECTED_TO_tx_n_out13,                         --                                   .tx_n_out13
			tx_n_out14                         => CONNECTED_TO_tx_n_out14,                         --                                   .tx_n_out14
			tx_n_out15                         => CONNECTED_TO_tx_n_out15,                         --                                   .tx_n_out15
			tx_p_out0                          => CONNECTED_TO_tx_p_out0,                          --                                   .tx_p_out0
			tx_p_out1                          => CONNECTED_TO_tx_p_out1,                          --                                   .tx_p_out1
			tx_p_out2                          => CONNECTED_TO_tx_p_out2,                          --                                   .tx_p_out2
			tx_p_out3                          => CONNECTED_TO_tx_p_out3,                          --                                   .tx_p_out3
			tx_p_out4                          => CONNECTED_TO_tx_p_out4,                          --                                   .tx_p_out4
			tx_p_out5                          => CONNECTED_TO_tx_p_out5,                          --                                   .tx_p_out5
			tx_p_out6                          => CONNECTED_TO_tx_p_out6,                          --                                   .tx_p_out6
			tx_p_out7                          => CONNECTED_TO_tx_p_out7,                          --                                   .tx_p_out7
			tx_p_out8                          => CONNECTED_TO_tx_p_out8,                          --                                   .tx_p_out8
			tx_p_out9                          => CONNECTED_TO_tx_p_out9,                          --                                   .tx_p_out9
			tx_p_out10                         => CONNECTED_TO_tx_p_out10,                         --                                   .tx_p_out10
			tx_p_out11                         => CONNECTED_TO_tx_p_out11,                         --                                   .tx_p_out11
			tx_p_out12                         => CONNECTED_TO_tx_p_out12,                         --                                   .tx_p_out12
			tx_p_out13                         => CONNECTED_TO_tx_p_out13,                         --                                   .tx_p_out13
			tx_p_out14                         => CONNECTED_TO_tx_p_out14,                         --                                   .tx_p_out14
			tx_p_out15                         => CONNECTED_TO_tx_p_out15,                         --                                   .tx_p_out15
			rx_n_in0                           => CONNECTED_TO_rx_n_in0,                           --                                   .rx_n_in0
			rx_n_in1                           => CONNECTED_TO_rx_n_in1,                           --                                   .rx_n_in1
			rx_n_in2                           => CONNECTED_TO_rx_n_in2,                           --                                   .rx_n_in2
			rx_n_in3                           => CONNECTED_TO_rx_n_in3,                           --                                   .rx_n_in3
			rx_n_in4                           => CONNECTED_TO_rx_n_in4,                           --                                   .rx_n_in4
			rx_n_in5                           => CONNECTED_TO_rx_n_in5,                           --                                   .rx_n_in5
			rx_n_in6                           => CONNECTED_TO_rx_n_in6,                           --                                   .rx_n_in6
			rx_n_in7                           => CONNECTED_TO_rx_n_in7,                           --                                   .rx_n_in7
			rx_n_in8                           => CONNECTED_TO_rx_n_in8,                           --                                   .rx_n_in8
			rx_n_in9                           => CONNECTED_TO_rx_n_in9,                           --                                   .rx_n_in9
			rx_n_in10                          => CONNECTED_TO_rx_n_in10,                          --                                   .rx_n_in10
			rx_n_in11                          => CONNECTED_TO_rx_n_in11,                          --                                   .rx_n_in11
			rx_n_in12                          => CONNECTED_TO_rx_n_in12,                          --                                   .rx_n_in12
			rx_n_in13                          => CONNECTED_TO_rx_n_in13,                          --                                   .rx_n_in13
			rx_n_in14                          => CONNECTED_TO_rx_n_in14,                          --                                   .rx_n_in14
			rx_n_in15                          => CONNECTED_TO_rx_n_in15,                          --                                   .rx_n_in15
			rx_p_in0                           => CONNECTED_TO_rx_p_in0,                           --                                   .rx_p_in0
			rx_p_in1                           => CONNECTED_TO_rx_p_in1,                           --                                   .rx_p_in1
			rx_p_in2                           => CONNECTED_TO_rx_p_in2,                           --                                   .rx_p_in2
			rx_p_in3                           => CONNECTED_TO_rx_p_in3,                           --                                   .rx_p_in3
			rx_p_in4                           => CONNECTED_TO_rx_p_in4,                           --                                   .rx_p_in4
			rx_p_in5                           => CONNECTED_TO_rx_p_in5,                           --                                   .rx_p_in5
			rx_p_in6                           => CONNECTED_TO_rx_p_in6,                           --                                   .rx_p_in6
			rx_p_in7                           => CONNECTED_TO_rx_p_in7,                           --                                   .rx_p_in7
			rx_p_in8                           => CONNECTED_TO_rx_p_in8,                           --                                   .rx_p_in8
			rx_p_in9                           => CONNECTED_TO_rx_p_in9,                           --                                   .rx_p_in9
			rx_p_in10                          => CONNECTED_TO_rx_p_in10,                          --                                   .rx_p_in10
			rx_p_in11                          => CONNECTED_TO_rx_p_in11,                          --                                   .rx_p_in11
			rx_p_in12                          => CONNECTED_TO_rx_p_in12,                          --                                   .rx_p_in12
			rx_p_in13                          => CONNECTED_TO_rx_p_in13,                          --                                   .rx_p_in13
			rx_p_in14                          => CONNECTED_TO_rx_p_in14,                          --                                   .rx_p_in14
			rx_p_in15                          => CONNECTED_TO_rx_p_in15,                          --                                   .rx_p_in15
			refclk0                            => CONNECTED_TO_refclk0,                            --                            refclk0.clk
			refclk1                            => CONNECTED_TO_refclk1                             --                            refclk1.clk
		);

