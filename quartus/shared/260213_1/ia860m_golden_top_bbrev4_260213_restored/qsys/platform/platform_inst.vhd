	component platform is
		port (
			ddr4_mem_0_mem_cke                             : out   std_logic_vector(0 downto 0);                     -- mem_cke
			ddr4_mem_0_mem_odt                             : out   std_logic_vector(0 downto 0);                     -- mem_odt
			ddr4_mem_0_mem_cs_n                            : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			ddr4_mem_0_mem_a                               : out   std_logic_vector(16 downto 0);                    -- mem_a
			ddr4_mem_0_mem_ba                              : out   std_logic_vector(1 downto 0);                     -- mem_ba
			ddr4_mem_0_mem_bg                              : out   std_logic_vector(0 downto 0);                     -- mem_bg
			ddr4_mem_0_mem_act_n                           : out   std_logic;                                        -- mem_act_n
			ddr4_mem_0_mem_par                             : out   std_logic;                                        -- mem_par
			ddr4_mem_0_mem_dq                              : inout std_logic_vector(39 downto 0) := (others => 'X'); -- mem_dq
			ddr4_mem_0_mem_dqs_t                           : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_t
			ddr4_mem_0_mem_dqs_c                           : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_c
			ddr4_mem_0_mem_alert_n                         : in    std_logic                     := 'X';             -- mem_alert_n
			ddr4_mem_0_mem_dbi_n                           : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dbi_n
			ddr4_mem_ck_0_mem_ck_t                         : out   std_logic_vector(0 downto 0);                     -- mem_ck_t
			ddr4_mem_ck_0_mem_ck_c                         : out   std_logic_vector(0 downto 0);                     -- mem_ck_c
			ddr4_mem_reset_n_mem_reset_n                   : out   std_logic;                                        -- mem_reset_n
			ddr4_oct_0_oct_rzqin                           : in    std_logic                     := 'X';             -- oct_rzqin
			ddr4_ref_clk_clk                               : in    std_logic                     := 'X';             -- clk
			hbm_hbm_reset_n_reset_n                        : in    std_logic                     := 'X';             -- reset_n
			hbm_cattrip_i_conduit                          : in    std_logic                     := 'X';             -- conduit
			hbm_temp_i_conduit                             : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- conduit
			hbm_uibpll_refclk_clk                          : in    std_logic                     := 'X';             -- clk
			intel_agilex_hps_0_hps_io_NAND_ALE             : out   std_logic;                                        -- NAND_ALE
			intel_agilex_hps_0_hps_io_NAND_CE_N            : out   std_logic;                                        -- NAND_CE_N
			intel_agilex_hps_0_hps_io_NAND_CLE             : out   std_logic;                                        -- NAND_CLE
			intel_agilex_hps_0_hps_io_NAND_RE_N            : out   std_logic;                                        -- NAND_RE_N
			intel_agilex_hps_0_hps_io_NAND_RB              : in    std_logic                     := 'X';             -- NAND_RB
			intel_agilex_hps_0_hps_io_NAND_ADQ0            : inout std_logic                     := 'X';             -- NAND_ADQ0
			intel_agilex_hps_0_hps_io_NAND_ADQ1            : inout std_logic                     := 'X';             -- NAND_ADQ1
			intel_agilex_hps_0_hps_io_NAND_ADQ2            : inout std_logic                     := 'X';             -- NAND_ADQ2
			intel_agilex_hps_0_hps_io_NAND_ADQ3            : inout std_logic                     := 'X';             -- NAND_ADQ3
			intel_agilex_hps_0_hps_io_NAND_ADQ4            : inout std_logic                     := 'X';             -- NAND_ADQ4
			intel_agilex_hps_0_hps_io_NAND_ADQ5            : inout std_logic                     := 'X';             -- NAND_ADQ5
			intel_agilex_hps_0_hps_io_NAND_ADQ6            : inout std_logic                     := 'X';             -- NAND_ADQ6
			intel_agilex_hps_0_hps_io_NAND_ADQ7            : inout std_logic                     := 'X';             -- NAND_ADQ7
			intel_agilex_hps_0_hps_io_NAND_WP_N            : out   std_logic;                                        -- NAND_WP_N
			intel_agilex_hps_0_hps_io_NAND_WE_N            : out   std_logic;                                        -- NAND_WE_N
			intel_agilex_hps_0_hps_io_UART0_RX             : in    std_logic                     := 'X';             -- UART0_RX
			intel_agilex_hps_0_hps_io_UART0_TX             : out   std_logic;                                        -- UART0_TX
			intel_agilex_hps_0_hps_io_hps_osc_clk          : in    std_logic                     := 'X';             -- hps_osc_clk
			intel_noc_clock_ctrl_0_refclk_clk              : in    std_logic                     := 'X';             -- clk
			intel_noc_clock_ctrl_1_refclk_clk              : in    std_logic                     := 'X';             -- clk
			ninit_done_out_1_reset                         : in    std_logic                     := 'X';             -- reset
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in0   : in    std_logic                     := 'X';             -- rx_n_in0
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in1   : in    std_logic                     := 'X';             -- rx_n_in1
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in2   : in    std_logic                     := 'X';             -- rx_n_in2
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in3   : in    std_logic                     := 'X';             -- rx_n_in3
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in4   : in    std_logic                     := 'X';             -- rx_n_in4
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in5   : in    std_logic                     := 'X';             -- rx_n_in5
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in6   : in    std_logic                     := 'X';             -- rx_n_in6
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in7   : in    std_logic                     := 'X';             -- rx_n_in7
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in8   : in    std_logic                     := 'X';             -- rx_n_in8
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in9   : in    std_logic                     := 'X';             -- rx_n_in9
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in10  : in    std_logic                     := 'X';             -- rx_n_in10
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in11  : in    std_logic                     := 'X';             -- rx_n_in11
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in12  : in    std_logic                     := 'X';             -- rx_n_in12
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in13  : in    std_logic                     := 'X';             -- rx_n_in13
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in14  : in    std_logic                     := 'X';             -- rx_n_in14
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in15  : in    std_logic                     := 'X';             -- rx_n_in15
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in0   : in    std_logic                     := 'X';             -- rx_p_in0
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in1   : in    std_logic                     := 'X';             -- rx_p_in1
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in2   : in    std_logic                     := 'X';             -- rx_p_in2
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in3   : in    std_logic                     := 'X';             -- rx_p_in3
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in4   : in    std_logic                     := 'X';             -- rx_p_in4
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in5   : in    std_logic                     := 'X';             -- rx_p_in5
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in6   : in    std_logic                     := 'X';             -- rx_p_in6
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in7   : in    std_logic                     := 'X';             -- rx_p_in7
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in8   : in    std_logic                     := 'X';             -- rx_p_in8
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in9   : in    std_logic                     := 'X';             -- rx_p_in9
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in10  : in    std_logic                     := 'X';             -- rx_p_in10
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in11  : in    std_logic                     := 'X';             -- rx_p_in11
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in12  : in    std_logic                     := 'X';             -- rx_p_in12
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in13  : in    std_logic                     := 'X';             -- rx_p_in13
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in14  : in    std_logic                     := 'X';             -- rx_p_in14
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in15  : in    std_logic                     := 'X';             -- rx_p_in15
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out0  : out   std_logic;                                        -- tx_n_out0
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out1  : out   std_logic;                                        -- tx_n_out1
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out2  : out   std_logic;                                        -- tx_n_out2
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out3  : out   std_logic;                                        -- tx_n_out3
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out4  : out   std_logic;                                        -- tx_n_out4
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out5  : out   std_logic;                                        -- tx_n_out5
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out6  : out   std_logic;                                        -- tx_n_out6
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out7  : out   std_logic;                                        -- tx_n_out7
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out8  : out   std_logic;                                        -- tx_n_out8
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out9  : out   std_logic;                                        -- tx_n_out9
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out10 : out   std_logic;                                        -- tx_n_out10
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out11 : out   std_logic;                                        -- tx_n_out11
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out12 : out   std_logic;                                        -- tx_n_out12
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out13 : out   std_logic;                                        -- tx_n_out13
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out14 : out   std_logic;                                        -- tx_n_out14
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out15 : out   std_logic;                                        -- tx_n_out15
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out0  : out   std_logic;                                        -- tx_p_out0
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out1  : out   std_logic;                                        -- tx_p_out1
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out2  : out   std_logic;                                        -- tx_p_out2
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out3  : out   std_logic;                                        -- tx_p_out3
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out4  : out   std_logic;                                        -- tx_p_out4
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out5  : out   std_logic;                                        -- tx_p_out5
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out6  : out   std_logic;                                        -- tx_p_out6
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out7  : out   std_logic;                                        -- tx_p_out7
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out8  : out   std_logic;                                        -- tx_p_out8
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out9  : out   std_logic;                                        -- tx_p_out9
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out10 : out   std_logic;                                        -- tx_p_out10
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out11 : out   std_logic;                                        -- tx_p_out11
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out12 : out   std_logic;                                        -- tx_p_out12
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out13 : out   std_logic;                                        -- tx_p_out13
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out14 : out   std_logic;                                        -- tx_p_out14
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out15 : out   std_logic;                                        -- tx_p_out15
			intel_pcie_rtile_mcdma_0_pin_perst_reset_n     : in    std_logic                     := 'X';             -- reset_n
			noc_ref_clock_in_in_clk_clk                    : in    std_logic                     := 'X';             -- clk
			pcie_ref0_clock_in_in_clk_clk                  : in    std_logic                     := 'X';             -- clk
			pcie_ref1_clock_in_in_clk_clk                  : in    std_logic                     := 'X';             -- clk
			reset_bridge_0_out_reset_reset_n               : out   std_logic;                                        -- reset_n
			sys_reset_h_in_reset                           : in    std_logic                     := 'X';             -- reset
			sys_reset_n_in_reset_n                         : in    std_logic                     := 'X';             -- reset_n
			sysclk_in_clk                                  : in    std_logic                     := 'X'              -- clk
		);
	end component platform;

	u0 : component platform
		port map (
			ddr4_mem_0_mem_cke                             => CONNECTED_TO_ddr4_mem_0_mem_cke,                             --                          ddr4_mem_0.mem_cke
			ddr4_mem_0_mem_odt                             => CONNECTED_TO_ddr4_mem_0_mem_odt,                             --                                    .mem_odt
			ddr4_mem_0_mem_cs_n                            => CONNECTED_TO_ddr4_mem_0_mem_cs_n,                            --                                    .mem_cs_n
			ddr4_mem_0_mem_a                               => CONNECTED_TO_ddr4_mem_0_mem_a,                               --                                    .mem_a
			ddr4_mem_0_mem_ba                              => CONNECTED_TO_ddr4_mem_0_mem_ba,                              --                                    .mem_ba
			ddr4_mem_0_mem_bg                              => CONNECTED_TO_ddr4_mem_0_mem_bg,                              --                                    .mem_bg
			ddr4_mem_0_mem_act_n                           => CONNECTED_TO_ddr4_mem_0_mem_act_n,                           --                                    .mem_act_n
			ddr4_mem_0_mem_par                             => CONNECTED_TO_ddr4_mem_0_mem_par,                             --                                    .mem_par
			ddr4_mem_0_mem_dq                              => CONNECTED_TO_ddr4_mem_0_mem_dq,                              --                                    .mem_dq
			ddr4_mem_0_mem_dqs_t                           => CONNECTED_TO_ddr4_mem_0_mem_dqs_t,                           --                                    .mem_dqs_t
			ddr4_mem_0_mem_dqs_c                           => CONNECTED_TO_ddr4_mem_0_mem_dqs_c,                           --                                    .mem_dqs_c
			ddr4_mem_0_mem_alert_n                         => CONNECTED_TO_ddr4_mem_0_mem_alert_n,                         --                                    .mem_alert_n
			ddr4_mem_0_mem_dbi_n                           => CONNECTED_TO_ddr4_mem_0_mem_dbi_n,                           --                                    .mem_dbi_n
			ddr4_mem_ck_0_mem_ck_t                         => CONNECTED_TO_ddr4_mem_ck_0_mem_ck_t,                         --                       ddr4_mem_ck_0.mem_ck_t
			ddr4_mem_ck_0_mem_ck_c                         => CONNECTED_TO_ddr4_mem_ck_0_mem_ck_c,                         --                                    .mem_ck_c
			ddr4_mem_reset_n_mem_reset_n                   => CONNECTED_TO_ddr4_mem_reset_n_mem_reset_n,                   --                    ddr4_mem_reset_n.mem_reset_n
			ddr4_oct_0_oct_rzqin                           => CONNECTED_TO_ddr4_oct_0_oct_rzqin,                           --                          ddr4_oct_0.oct_rzqin
			ddr4_ref_clk_clk                               => CONNECTED_TO_ddr4_ref_clk_clk,                               --                        ddr4_ref_clk.clk
			hbm_hbm_reset_n_reset_n                        => CONNECTED_TO_hbm_hbm_reset_n_reset_n,                        --                     hbm_hbm_reset_n.reset_n
			hbm_cattrip_i_conduit                          => CONNECTED_TO_hbm_cattrip_i_conduit,                          --                       hbm_cattrip_i.conduit
			hbm_temp_i_conduit                             => CONNECTED_TO_hbm_temp_i_conduit,                             --                          hbm_temp_i.conduit
			hbm_uibpll_refclk_clk                          => CONNECTED_TO_hbm_uibpll_refclk_clk,                          --                   hbm_uibpll_refclk.clk
			intel_agilex_hps_0_hps_io_NAND_ALE             => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ALE,             --           intel_agilex_hps_0_hps_io.NAND_ALE
			intel_agilex_hps_0_hps_io_NAND_CE_N            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_CE_N,            --                                    .NAND_CE_N
			intel_agilex_hps_0_hps_io_NAND_CLE             => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_CLE,             --                                    .NAND_CLE
			intel_agilex_hps_0_hps_io_NAND_RE_N            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_RE_N,            --                                    .NAND_RE_N
			intel_agilex_hps_0_hps_io_NAND_RB              => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_RB,              --                                    .NAND_RB
			intel_agilex_hps_0_hps_io_NAND_ADQ0            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ0,            --                                    .NAND_ADQ0
			intel_agilex_hps_0_hps_io_NAND_ADQ1            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ1,            --                                    .NAND_ADQ1
			intel_agilex_hps_0_hps_io_NAND_ADQ2            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ2,            --                                    .NAND_ADQ2
			intel_agilex_hps_0_hps_io_NAND_ADQ3            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ3,            --                                    .NAND_ADQ3
			intel_agilex_hps_0_hps_io_NAND_ADQ4            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ4,            --                                    .NAND_ADQ4
			intel_agilex_hps_0_hps_io_NAND_ADQ5            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ5,            --                                    .NAND_ADQ5
			intel_agilex_hps_0_hps_io_NAND_ADQ6            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ6,            --                                    .NAND_ADQ6
			intel_agilex_hps_0_hps_io_NAND_ADQ7            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_ADQ7,            --                                    .NAND_ADQ7
			intel_agilex_hps_0_hps_io_NAND_WP_N            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_WP_N,            --                                    .NAND_WP_N
			intel_agilex_hps_0_hps_io_NAND_WE_N            => CONNECTED_TO_intel_agilex_hps_0_hps_io_NAND_WE_N,            --                                    .NAND_WE_N
			intel_agilex_hps_0_hps_io_UART0_RX             => CONNECTED_TO_intel_agilex_hps_0_hps_io_UART0_RX,             --                                    .UART0_RX
			intel_agilex_hps_0_hps_io_UART0_TX             => CONNECTED_TO_intel_agilex_hps_0_hps_io_UART0_TX,             --                                    .UART0_TX
			intel_agilex_hps_0_hps_io_hps_osc_clk          => CONNECTED_TO_intel_agilex_hps_0_hps_io_hps_osc_clk,          --                                    .hps_osc_clk
			intel_noc_clock_ctrl_0_refclk_clk              => CONNECTED_TO_intel_noc_clock_ctrl_0_refclk_clk,              --       intel_noc_clock_ctrl_0_refclk.clk
			intel_noc_clock_ctrl_1_refclk_clk              => CONNECTED_TO_intel_noc_clock_ctrl_1_refclk_clk,              --       intel_noc_clock_ctrl_1_refclk.clk
			ninit_done_out_1_reset                         => CONNECTED_TO_ninit_done_out_1_reset,                         --                    ninit_done_out_1.reset
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in0   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in0,   -- intel_pcie_rtile_mcdma_0_hip_serial.rx_n_in0
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in1   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in1,   --                                    .rx_n_in1
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in2   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in2,   --                                    .rx_n_in2
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in3   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in3,   --                                    .rx_n_in3
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in4   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in4,   --                                    .rx_n_in4
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in5   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in5,   --                                    .rx_n_in5
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in6   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in6,   --                                    .rx_n_in6
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in7   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in7,   --                                    .rx_n_in7
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in8   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in8,   --                                    .rx_n_in8
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in9   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in9,   --                                    .rx_n_in9
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in10  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in10,  --                                    .rx_n_in10
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in11  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in11,  --                                    .rx_n_in11
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in12  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in12,  --                                    .rx_n_in12
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in13  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in13,  --                                    .rx_n_in13
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in14  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in14,  --                                    .rx_n_in14
			intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in15  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_n_in15,  --                                    .rx_n_in15
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in0   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in0,   --                                    .rx_p_in0
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in1   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in1,   --                                    .rx_p_in1
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in2   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in2,   --                                    .rx_p_in2
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in3   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in3,   --                                    .rx_p_in3
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in4   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in4,   --                                    .rx_p_in4
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in5   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in5,   --                                    .rx_p_in5
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in6   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in6,   --                                    .rx_p_in6
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in7   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in7,   --                                    .rx_p_in7
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in8   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in8,   --                                    .rx_p_in8
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in9   => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in9,   --                                    .rx_p_in9
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in10  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in10,  --                                    .rx_p_in10
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in11  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in11,  --                                    .rx_p_in11
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in12  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in12,  --                                    .rx_p_in12
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in13  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in13,  --                                    .rx_p_in13
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in14  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in14,  --                                    .rx_p_in14
			intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in15  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_rx_p_in15,  --                                    .rx_p_in15
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out0  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out0,  --                                    .tx_n_out0
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out1  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out1,  --                                    .tx_n_out1
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out2  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out2,  --                                    .tx_n_out2
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out3  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out3,  --                                    .tx_n_out3
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out4  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out4,  --                                    .tx_n_out4
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out5  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out5,  --                                    .tx_n_out5
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out6  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out6,  --                                    .tx_n_out6
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out7  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out7,  --                                    .tx_n_out7
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out8  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out8,  --                                    .tx_n_out8
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out9  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out9,  --                                    .tx_n_out9
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out10 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out10, --                                    .tx_n_out10
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out11 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out11, --                                    .tx_n_out11
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out12 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out12, --                                    .tx_n_out12
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out13 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out13, --                                    .tx_n_out13
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out14 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out14, --                                    .tx_n_out14
			intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out15 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_n_out15, --                                    .tx_n_out15
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out0  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out0,  --                                    .tx_p_out0
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out1  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out1,  --                                    .tx_p_out1
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out2  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out2,  --                                    .tx_p_out2
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out3  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out3,  --                                    .tx_p_out3
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out4  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out4,  --                                    .tx_p_out4
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out5  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out5,  --                                    .tx_p_out5
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out6  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out6,  --                                    .tx_p_out6
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out7  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out7,  --                                    .tx_p_out7
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out8  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out8,  --                                    .tx_p_out8
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out9  => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out9,  --                                    .tx_p_out9
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out10 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out10, --                                    .tx_p_out10
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out11 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out11, --                                    .tx_p_out11
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out12 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out12, --                                    .tx_p_out12
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out13 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out13, --                                    .tx_p_out13
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out14 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out14, --                                    .tx_p_out14
			intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out15 => CONNECTED_TO_intel_pcie_rtile_mcdma_0_hip_serial_tx_p_out15, --                                    .tx_p_out15
			intel_pcie_rtile_mcdma_0_pin_perst_reset_n     => CONNECTED_TO_intel_pcie_rtile_mcdma_0_pin_perst_reset_n,     --  intel_pcie_rtile_mcdma_0_pin_perst.reset_n
			noc_ref_clock_in_in_clk_clk                    => CONNECTED_TO_noc_ref_clock_in_in_clk_clk,                    --             noc_ref_clock_in_in_clk.clk
			pcie_ref0_clock_in_in_clk_clk                  => CONNECTED_TO_pcie_ref0_clock_in_in_clk_clk,                  --           pcie_ref0_clock_in_in_clk.clk
			pcie_ref1_clock_in_in_clk_clk                  => CONNECTED_TO_pcie_ref1_clock_in_in_clk_clk,                  --           pcie_ref1_clock_in_in_clk.clk
			reset_bridge_0_out_reset_reset_n               => CONNECTED_TO_reset_bridge_0_out_reset_reset_n,               --            reset_bridge_0_out_reset.reset_n
			sys_reset_h_in_reset                           => CONNECTED_TO_sys_reset_h_in_reset,                           --                      sys_reset_h_in.reset
			sys_reset_n_in_reset_n                         => CONNECTED_TO_sys_reset_n_in_reset_n,                         --                      sys_reset_n_in.reset_n
			sysclk_in_clk                                  => CONNECTED_TO_sysclk_in_clk                                   --                           sysclk_in.clk
		);

