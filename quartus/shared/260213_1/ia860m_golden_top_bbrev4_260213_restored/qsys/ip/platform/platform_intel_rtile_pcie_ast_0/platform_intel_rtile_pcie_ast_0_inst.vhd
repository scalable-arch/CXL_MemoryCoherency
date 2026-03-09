	component platform_intel_rtile_pcie_ast_0 is
		port (
			p0_reset_status_n            : out std_logic;                                         -- reset_n
			p0_slow_reset_status_n       : out std_logic;                                         -- reset_n
			p0_link_up_o                 : out std_logic;                                         -- link_up
			p0_dl_up_o                   : out std_logic;                                         -- dl_up
			p0_surprise_down_err_o       : out std_logic;                                         -- surprise_down_err
			p0_dl_timer_update_o         : out std_logic;                                         -- dl_timer_update
			p0_ltssm_state_delay_o       : out std_logic_vector(5 downto 0);                      -- ltssm_state_delay
			p0_ltssm_st_hipfifo_ovrflw_o : out std_logic;                                         -- ltssm_st_hipfifo_ovrflw
			p0_app_xfer_pending_i        : in  std_logic                      := 'X';             -- app_xfer_pending
			p0_pld_gp_status_i           : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- status
			p0_pld_gp_ctrl_o             : out std_logic_vector(7 downto 0);                      -- ctrl
			p0_pld_gp_status_ready_o     : out std_logic;                                         -- status_ready
			rx_n_in0                     : in  std_logic                      := 'X';             -- rx_n_in0
			rx_n_in1                     : in  std_logic                      := 'X';             -- rx_n_in1
			rx_n_in2                     : in  std_logic                      := 'X';             -- rx_n_in2
			rx_n_in3                     : in  std_logic                      := 'X';             -- rx_n_in3
			rx_n_in4                     : in  std_logic                      := 'X';             -- rx_n_in4
			rx_n_in5                     : in  std_logic                      := 'X';             -- rx_n_in5
			rx_n_in6                     : in  std_logic                      := 'X';             -- rx_n_in6
			rx_n_in7                     : in  std_logic                      := 'X';             -- rx_n_in7
			rx_n_in8                     : in  std_logic                      := 'X';             -- rx_n_in8
			rx_n_in9                     : in  std_logic                      := 'X';             -- rx_n_in9
			rx_n_in10                    : in  std_logic                      := 'X';             -- rx_n_in10
			rx_n_in11                    : in  std_logic                      := 'X';             -- rx_n_in11
			rx_n_in12                    : in  std_logic                      := 'X';             -- rx_n_in12
			rx_n_in13                    : in  std_logic                      := 'X';             -- rx_n_in13
			rx_n_in14                    : in  std_logic                      := 'X';             -- rx_n_in14
			rx_n_in15                    : in  std_logic                      := 'X';             -- rx_n_in15
			rx_p_in0                     : in  std_logic                      := 'X';             -- rx_p_in0
			rx_p_in1                     : in  std_logic                      := 'X';             -- rx_p_in1
			rx_p_in2                     : in  std_logic                      := 'X';             -- rx_p_in2
			rx_p_in3                     : in  std_logic                      := 'X';             -- rx_p_in3
			rx_p_in4                     : in  std_logic                      := 'X';             -- rx_p_in4
			rx_p_in5                     : in  std_logic                      := 'X';             -- rx_p_in5
			rx_p_in6                     : in  std_logic                      := 'X';             -- rx_p_in6
			rx_p_in7                     : in  std_logic                      := 'X';             -- rx_p_in7
			rx_p_in8                     : in  std_logic                      := 'X';             -- rx_p_in8
			rx_p_in9                     : in  std_logic                      := 'X';             -- rx_p_in9
			rx_p_in10                    : in  std_logic                      := 'X';             -- rx_p_in10
			rx_p_in11                    : in  std_logic                      := 'X';             -- rx_p_in11
			rx_p_in12                    : in  std_logic                      := 'X';             -- rx_p_in12
			rx_p_in13                    : in  std_logic                      := 'X';             -- rx_p_in13
			rx_p_in14                    : in  std_logic                      := 'X';             -- rx_p_in14
			rx_p_in15                    : in  std_logic                      := 'X';             -- rx_p_in15
			tx_n_out0                    : out std_logic;                                         -- tx_n_out0
			tx_n_out1                    : out std_logic;                                         -- tx_n_out1
			tx_n_out2                    : out std_logic;                                         -- tx_n_out2
			tx_n_out3                    : out std_logic;                                         -- tx_n_out3
			tx_n_out4                    : out std_logic;                                         -- tx_n_out4
			tx_n_out5                    : out std_logic;                                         -- tx_n_out5
			tx_n_out6                    : out std_logic;                                         -- tx_n_out6
			tx_n_out7                    : out std_logic;                                         -- tx_n_out7
			tx_n_out8                    : out std_logic;                                         -- tx_n_out8
			tx_n_out9                    : out std_logic;                                         -- tx_n_out9
			tx_n_out10                   : out std_logic;                                         -- tx_n_out10
			tx_n_out11                   : out std_logic;                                         -- tx_n_out11
			tx_n_out12                   : out std_logic;                                         -- tx_n_out12
			tx_n_out13                   : out std_logic;                                         -- tx_n_out13
			tx_n_out14                   : out std_logic;                                         -- tx_n_out14
			tx_n_out15                   : out std_logic;                                         -- tx_n_out15
			tx_p_out0                    : out std_logic;                                         -- tx_p_out0
			tx_p_out1                    : out std_logic;                                         -- tx_p_out1
			tx_p_out2                    : out std_logic;                                         -- tx_p_out2
			tx_p_out3                    : out std_logic;                                         -- tx_p_out3
			tx_p_out4                    : out std_logic;                                         -- tx_p_out4
			tx_p_out5                    : out std_logic;                                         -- tx_p_out5
			tx_p_out6                    : out std_logic;                                         -- tx_p_out6
			tx_p_out7                    : out std_logic;                                         -- tx_p_out7
			tx_p_out8                    : out std_logic;                                         -- tx_p_out8
			tx_p_out9                    : out std_logic;                                         -- tx_p_out9
			tx_p_out10                   : out std_logic;                                         -- tx_p_out10
			tx_p_out11                   : out std_logic;                                         -- tx_p_out11
			tx_p_out12                   : out std_logic;                                         -- tx_p_out12
			tx_p_out13                   : out std_logic;                                         -- tx_p_out13
			tx_p_out14                   : out std_logic;                                         -- tx_p_out14
			tx_p_out15                   : out std_logic;                                         -- tx_p_out15
			refclk0                      : in  std_logic                      := 'X';             -- clk
			refclk1                      : in  std_logic                      := 'X';             -- clk
			coreclkout_hip               : out std_logic;                                         -- clk
			ninit_done                   : in  std_logic                      := 'X';             -- reset
			slow_clk                     : out std_logic;                                         -- clk
			p0_rx_st_ready_i             : in  std_logic                      := 'X';             -- ready
			p0_rx_st0_data_o             : out std_logic_vector(255 downto 0);                    -- data
			p0_rx_st0_sop_o              : out std_logic;                                         -- startofpacket
			p0_rx_st0_eop_o              : out std_logic;                                         -- endofpacket
			p0_rx_st0_dvalid_o           : out std_logic;                                         -- valid
			p0_rx_st0_empty_o            : out std_logic_vector(2 downto 0);                      -- empty
			p0_rx_st0_hdr_o              : out std_logic_vector(127 downto 0);                    -- rx_st0_hdr
			p0_rx_st0_prefix_o           : out std_logic_vector(31 downto 0);                     -- rx_st0_prefix
			p0_rx_st0_hvalid_o           : out std_logic;                                         -- rx_st0_hvalid
			p0_rx_st0_pvalid_o           : out std_logic;                                         -- rx_st0_pvalid
			p0_rx_st0_bar_o              : out std_logic_vector(2 downto 0);                      -- rx_st0_bar
			p0_rx_st0_pt_parity_o        : out std_logic;                                         -- rx_st0_pt_parity
			p0_rx_st1_hdr_o              : out std_logic_vector(127 downto 0);                    -- rx_st1_hdr
			p0_rx_st1_prefix_o           : out std_logic_vector(31 downto 0);                     -- rx_st1_prefix
			p0_rx_st1_hvalid_o           : out std_logic;                                         -- rx_st1_hvalid
			p0_rx_st1_pvalid_o           : out std_logic;                                         -- rx_st1_pvalid
			p0_rx_st1_bar_o              : out std_logic_vector(2 downto 0);                      -- rx_st1_bar
			p0_rx_st1_pt_parity_o        : out std_logic;                                         -- rx_st1_pt_parity
			p0_rx_st2_hdr_o              : out std_logic_vector(127 downto 0);                    -- rx_st2_hdr
			p0_rx_st2_prefix_o           : out std_logic_vector(31 downto 0);                     -- rx_st2_prefix
			p0_rx_st2_hvalid_o           : out std_logic;                                         -- rx_st2_hvalid
			p0_rx_st2_pvalid_o           : out std_logic;                                         -- rx_st2_pvalid
			p0_rx_st2_bar_o              : out std_logic_vector(2 downto 0);                      -- rx_st2_bar
			p0_rx_st2_pt_parity_o        : out std_logic;                                         -- rx_st2_pt_parity
			p0_rx_st3_hdr_o              : out std_logic_vector(127 downto 0);                    -- rx_st3_hdr
			p0_rx_st3_prefix_o           : out std_logic_vector(31 downto 0);                     -- rx_st3_prefix
			p0_rx_st3_hvalid_o           : out std_logic;                                         -- rx_st3_hvalid
			p0_rx_st3_pvalid_o           : out std_logic;                                         -- rx_st3_pvalid
			p0_rx_st3_bar_o              : out std_logic_vector(2 downto 0);                      -- rx_st3_bar
			p0_rx_st3_pt_parity_o        : out std_logic;                                         -- rx_st3_pt_parity
			p0_rx_st_hcrdt_init_i        : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rx_st_Hcrdt_init
			p0_rx_st_hcrdt_update_i      : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rx_st_Hcrdt_update
			p0_rx_st_hcrdt_update_cnt_i  : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- rx_st_Hcrdt_update_cnt
			p0_rx_st_hcrdt_init_ack_o    : out std_logic_vector(2 downto 0);                      -- rx_st_Hcrdt_init_ack
			p0_rx_st_dcrdt_init_i        : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rx_st_Dcrdt_init
			p0_rx_st_dcrdt_update_i      : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- rx_st_Dcrdt_update
			p0_rx_st_dcrdt_update_cnt_i  : in  std_logic_vector(11 downto 0)  := (others => 'X'); -- rx_st_Dcrdt_update_cnt
			p0_rx_st_dcrdt_init_ack_o    : out std_logic_vector(2 downto 0);                      -- rx_st_Dcrdt_init_ack
			p0_rx_st1_data_o             : out std_logic_vector(255 downto 0);                    -- data
			p0_rx_st1_sop_o              : out std_logic;                                         -- startofpacket
			p0_rx_st1_eop_o              : out std_logic;                                         -- endofpacket
			p0_rx_st1_dvalid_o           : out std_logic;                                         -- valid
			p0_rx_st1_empty_o            : out std_logic_vector(2 downto 0);                      -- empty
			p0_rx_st2_data_o             : out std_logic_vector(255 downto 0);                    -- data
			p0_rx_st2_sop_o              : out std_logic;                                         -- startofpacket
			p0_rx_st2_eop_o              : out std_logic;                                         -- endofpacket
			p0_rx_st2_dvalid_o           : out std_logic;                                         -- valid
			p0_rx_st2_empty_o            : out std_logic_vector(2 downto 0);                      -- empty
			p0_rx_st3_data_o             : out std_logic_vector(255 downto 0);                    -- data
			p0_rx_st3_sop_o              : out std_logic;                                         -- startofpacket
			p0_rx_st3_eop_o              : out std_logic;                                         -- endofpacket
			p0_rx_st3_dvalid_o           : out std_logic;                                         -- valid
			p0_rx_st3_empty_o            : out std_logic_vector(2 downto 0);                      -- empty
			p0_tx_st_hcrdt_init_o        : out std_logic_vector(2 downto 0);                      -- tx_st_Hcrdt_init
			p0_tx_st_hcrdt_update_o      : out std_logic_vector(2 downto 0);                      -- tx_st_Hcrdt_update
			p0_tx_st_hcrdt_update_cnt_o  : out std_logic_vector(5 downto 0);                      -- tx_st_Hcrdt_update_cnt
			p0_tx_st_hcrdt_init_ack_i    : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- tx_st_Hcrdtt_init_ack
			p0_tx_st_dcrdt_init_o        : out std_logic_vector(2 downto 0);                      -- tx_st_Dcrdt_init
			p0_tx_st_dcrdt_update_o      : out std_logic_vector(2 downto 0);                      -- tx_st_Dcrdt_update
			p0_tx_st_dcrdt_update_cnt_o  : out std_logic_vector(11 downto 0);                     -- tx_st_Dcrdt_update_cnt
			p0_tx_st_dcrdt_init_ack_i    : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- tx_st_Dcrdt_init_ack
			p0_tx_st0_hdr_i              : in  std_logic_vector(127 downto 0) := (others => 'X'); -- tx_st0_hdr
			p0_tx_st0_prefix_i           : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- tx_st0_prefix
			p0_tx_st0_hvalid_i           : in  std_logic                      := 'X';             -- tx_st0_hvalid
			p0_tx_st0_pvalid_i           : in  std_logic                      := 'X';             -- tx_st0_pvalid
			p0_tx_st1_hdr_i              : in  std_logic_vector(127 downto 0) := (others => 'X'); -- tx_st1_hdr
			p0_tx_st1_prefix_i           : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- tx_st1_prefix
			p0_tx_st1_hvalid_i           : in  std_logic                      := 'X';             -- tx_st1_hvalid
			p0_tx_st1_pvalid_i           : in  std_logic                      := 'X';             -- tx_st1_pvalid
			p0_tx_st2_hdr_i              : in  std_logic_vector(127 downto 0) := (others => 'X'); -- tx_st2_hdr
			p0_tx_st2_prefix_i           : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- tx_st2_prefix
			p0_tx_st2_hvalid_i           : in  std_logic                      := 'X';             -- tx_st2_hvalid
			p0_tx_st2_pvalid_i           : in  std_logic                      := 'X';             -- tx_st2_pvalid
			p0_tx_st3_hdr_i              : in  std_logic_vector(127 downto 0) := (others => 'X'); -- tx_st3_hdr
			p0_tx_st3_prefix_i           : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- tx_st3_prefix
			p0_tx_st3_hvalid_i           : in  std_logic                      := 'X';             -- tx_st3_hvalid
			p0_tx_st3_pvalid_i           : in  std_logic                      := 'X';             -- tx_st3_pvalid
			p0_tx_st_ready_o             : out std_logic;                                         -- ready
			p0_tx_st0_data_i             : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			p0_tx_st0_sop_i              : in  std_logic                      := 'X';             -- startofpacket
			p0_tx_st0_eop_i              : in  std_logic                      := 'X';             -- endofpacket
			p0_tx_st0_dvalid_i           : in  std_logic                      := 'X';             -- valid
			p0_tx_st1_data_i             : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			p0_tx_st1_sop_i              : in  std_logic                      := 'X';             -- startofpacket
			p0_tx_st1_eop_i              : in  std_logic                      := 'X';             -- endofpacket
			p0_tx_st1_dvalid_i           : in  std_logic                      := 'X';             -- valid
			p0_tx_st2_data_i             : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			p0_tx_st2_sop_i              : in  std_logic                      := 'X';             -- startofpacket
			p0_tx_st2_eop_i              : in  std_logic                      := 'X';             -- endofpacket
			p0_tx_st2_dvalid_i           : in  std_logic                      := 'X';             -- valid
			p0_tx_st3_data_i             : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			p0_tx_st3_sop_i              : in  std_logic                      := 'X';             -- startofpacket
			p0_tx_st3_eop_i              : in  std_logic                      := 'X';             -- endofpacket
			p0_tx_st3_dvalid_i           : in  std_logic                      := 'X';             -- valid
			p0_tx_ehp_deallocate_empty_o : out std_logic;                                         -- tx_ehp_deallocate_empty
			pin_perst_n                  : in  std_logic                      := 'X';             -- reset_n
			pin_perst_n_o                : out std_logic                                          -- reset_n
		);
	end component platform_intel_rtile_pcie_ast_0;

	u0 : component platform_intel_rtile_pcie_ast_0
		port map (
			p0_reset_status_n            => CONNECTED_TO_p0_reset_status_n,            --      p0_reset_status_n.reset_n
			p0_slow_reset_status_n       => CONNECTED_TO_p0_slow_reset_status_n,       -- p0_slow_reset_status_n.reset_n
			p0_link_up_o                 => CONNECTED_TO_p0_link_up_o,                 --          p0_hip_status.link_up
			p0_dl_up_o                   => CONNECTED_TO_p0_dl_up_o,                   --                       .dl_up
			p0_surprise_down_err_o       => CONNECTED_TO_p0_surprise_down_err_o,       --                       .surprise_down_err
			p0_dl_timer_update_o         => CONNECTED_TO_p0_dl_timer_update_o,         --                       .dl_timer_update
			p0_ltssm_state_delay_o       => CONNECTED_TO_p0_ltssm_state_delay_o,       --                       .ltssm_state_delay
			p0_ltssm_st_hipfifo_ovrflw_o => CONNECTED_TO_p0_ltssm_st_hipfifo_ovrflw_o, --                       .ltssm_st_hipfifo_ovrflw
			p0_app_xfer_pending_i        => CONNECTED_TO_p0_app_xfer_pending_i,        --          p0_power_mgnt.app_xfer_pending
			p0_pld_gp_status_i           => CONNECTED_TO_p0_pld_gp_status_i,           --              p0_pld_gp.status
			p0_pld_gp_ctrl_o             => CONNECTED_TO_p0_pld_gp_ctrl_o,             --                       .ctrl
			p0_pld_gp_status_ready_o     => CONNECTED_TO_p0_pld_gp_status_ready_o,     --                       .status_ready
			rx_n_in0                     => CONNECTED_TO_rx_n_in0,                     --             hip_serial.rx_n_in0
			rx_n_in1                     => CONNECTED_TO_rx_n_in1,                     --                       .rx_n_in1
			rx_n_in2                     => CONNECTED_TO_rx_n_in2,                     --                       .rx_n_in2
			rx_n_in3                     => CONNECTED_TO_rx_n_in3,                     --                       .rx_n_in3
			rx_n_in4                     => CONNECTED_TO_rx_n_in4,                     --                       .rx_n_in4
			rx_n_in5                     => CONNECTED_TO_rx_n_in5,                     --                       .rx_n_in5
			rx_n_in6                     => CONNECTED_TO_rx_n_in6,                     --                       .rx_n_in6
			rx_n_in7                     => CONNECTED_TO_rx_n_in7,                     --                       .rx_n_in7
			rx_n_in8                     => CONNECTED_TO_rx_n_in8,                     --                       .rx_n_in8
			rx_n_in9                     => CONNECTED_TO_rx_n_in9,                     --                       .rx_n_in9
			rx_n_in10                    => CONNECTED_TO_rx_n_in10,                    --                       .rx_n_in10
			rx_n_in11                    => CONNECTED_TO_rx_n_in11,                    --                       .rx_n_in11
			rx_n_in12                    => CONNECTED_TO_rx_n_in12,                    --                       .rx_n_in12
			rx_n_in13                    => CONNECTED_TO_rx_n_in13,                    --                       .rx_n_in13
			rx_n_in14                    => CONNECTED_TO_rx_n_in14,                    --                       .rx_n_in14
			rx_n_in15                    => CONNECTED_TO_rx_n_in15,                    --                       .rx_n_in15
			rx_p_in0                     => CONNECTED_TO_rx_p_in0,                     --                       .rx_p_in0
			rx_p_in1                     => CONNECTED_TO_rx_p_in1,                     --                       .rx_p_in1
			rx_p_in2                     => CONNECTED_TO_rx_p_in2,                     --                       .rx_p_in2
			rx_p_in3                     => CONNECTED_TO_rx_p_in3,                     --                       .rx_p_in3
			rx_p_in4                     => CONNECTED_TO_rx_p_in4,                     --                       .rx_p_in4
			rx_p_in5                     => CONNECTED_TO_rx_p_in5,                     --                       .rx_p_in5
			rx_p_in6                     => CONNECTED_TO_rx_p_in6,                     --                       .rx_p_in6
			rx_p_in7                     => CONNECTED_TO_rx_p_in7,                     --                       .rx_p_in7
			rx_p_in8                     => CONNECTED_TO_rx_p_in8,                     --                       .rx_p_in8
			rx_p_in9                     => CONNECTED_TO_rx_p_in9,                     --                       .rx_p_in9
			rx_p_in10                    => CONNECTED_TO_rx_p_in10,                    --                       .rx_p_in10
			rx_p_in11                    => CONNECTED_TO_rx_p_in11,                    --                       .rx_p_in11
			rx_p_in12                    => CONNECTED_TO_rx_p_in12,                    --                       .rx_p_in12
			rx_p_in13                    => CONNECTED_TO_rx_p_in13,                    --                       .rx_p_in13
			rx_p_in14                    => CONNECTED_TO_rx_p_in14,                    --                       .rx_p_in14
			rx_p_in15                    => CONNECTED_TO_rx_p_in15,                    --                       .rx_p_in15
			tx_n_out0                    => CONNECTED_TO_tx_n_out0,                    --                       .tx_n_out0
			tx_n_out1                    => CONNECTED_TO_tx_n_out1,                    --                       .tx_n_out1
			tx_n_out2                    => CONNECTED_TO_tx_n_out2,                    --                       .tx_n_out2
			tx_n_out3                    => CONNECTED_TO_tx_n_out3,                    --                       .tx_n_out3
			tx_n_out4                    => CONNECTED_TO_tx_n_out4,                    --                       .tx_n_out4
			tx_n_out5                    => CONNECTED_TO_tx_n_out5,                    --                       .tx_n_out5
			tx_n_out6                    => CONNECTED_TO_tx_n_out6,                    --                       .tx_n_out6
			tx_n_out7                    => CONNECTED_TO_tx_n_out7,                    --                       .tx_n_out7
			tx_n_out8                    => CONNECTED_TO_tx_n_out8,                    --                       .tx_n_out8
			tx_n_out9                    => CONNECTED_TO_tx_n_out9,                    --                       .tx_n_out9
			tx_n_out10                   => CONNECTED_TO_tx_n_out10,                   --                       .tx_n_out10
			tx_n_out11                   => CONNECTED_TO_tx_n_out11,                   --                       .tx_n_out11
			tx_n_out12                   => CONNECTED_TO_tx_n_out12,                   --                       .tx_n_out12
			tx_n_out13                   => CONNECTED_TO_tx_n_out13,                   --                       .tx_n_out13
			tx_n_out14                   => CONNECTED_TO_tx_n_out14,                   --                       .tx_n_out14
			tx_n_out15                   => CONNECTED_TO_tx_n_out15,                   --                       .tx_n_out15
			tx_p_out0                    => CONNECTED_TO_tx_p_out0,                    --                       .tx_p_out0
			tx_p_out1                    => CONNECTED_TO_tx_p_out1,                    --                       .tx_p_out1
			tx_p_out2                    => CONNECTED_TO_tx_p_out2,                    --                       .tx_p_out2
			tx_p_out3                    => CONNECTED_TO_tx_p_out3,                    --                       .tx_p_out3
			tx_p_out4                    => CONNECTED_TO_tx_p_out4,                    --                       .tx_p_out4
			tx_p_out5                    => CONNECTED_TO_tx_p_out5,                    --                       .tx_p_out5
			tx_p_out6                    => CONNECTED_TO_tx_p_out6,                    --                       .tx_p_out6
			tx_p_out7                    => CONNECTED_TO_tx_p_out7,                    --                       .tx_p_out7
			tx_p_out8                    => CONNECTED_TO_tx_p_out8,                    --                       .tx_p_out8
			tx_p_out9                    => CONNECTED_TO_tx_p_out9,                    --                       .tx_p_out9
			tx_p_out10                   => CONNECTED_TO_tx_p_out10,                   --                       .tx_p_out10
			tx_p_out11                   => CONNECTED_TO_tx_p_out11,                   --                       .tx_p_out11
			tx_p_out12                   => CONNECTED_TO_tx_p_out12,                   --                       .tx_p_out12
			tx_p_out13                   => CONNECTED_TO_tx_p_out13,                   --                       .tx_p_out13
			tx_p_out14                   => CONNECTED_TO_tx_p_out14,                   --                       .tx_p_out14
			tx_p_out15                   => CONNECTED_TO_tx_p_out15,                   --                       .tx_p_out15
			refclk0                      => CONNECTED_TO_refclk0,                      --                refclk0.clk
			refclk1                      => CONNECTED_TO_refclk1,                      --                refclk1.clk
			coreclkout_hip               => CONNECTED_TO_coreclkout_hip,               --         coreclkout_hip.clk
			ninit_done                   => CONNECTED_TO_ninit_done,                   --             ninit_done.reset
			slow_clk                     => CONNECTED_TO_slow_clk,                     --               slow_clk.clk
			p0_rx_st_ready_i             => CONNECTED_TO_p0_rx_st_ready_i,             --              p0_rx_st0.ready
			p0_rx_st0_data_o             => CONNECTED_TO_p0_rx_st0_data_o,             --                       .data
			p0_rx_st0_sop_o              => CONNECTED_TO_p0_rx_st0_sop_o,              --                       .startofpacket
			p0_rx_st0_eop_o              => CONNECTED_TO_p0_rx_st0_eop_o,              --                       .endofpacket
			p0_rx_st0_dvalid_o           => CONNECTED_TO_p0_rx_st0_dvalid_o,           --                       .valid
			p0_rx_st0_empty_o            => CONNECTED_TO_p0_rx_st0_empty_o,            --                       .empty
			p0_rx_st0_hdr_o              => CONNECTED_TO_p0_rx_st0_hdr_o,              --          p0_rx_st_misc.rx_st0_hdr
			p0_rx_st0_prefix_o           => CONNECTED_TO_p0_rx_st0_prefix_o,           --                       .rx_st0_prefix
			p0_rx_st0_hvalid_o           => CONNECTED_TO_p0_rx_st0_hvalid_o,           --                       .rx_st0_hvalid
			p0_rx_st0_pvalid_o           => CONNECTED_TO_p0_rx_st0_pvalid_o,           --                       .rx_st0_pvalid
			p0_rx_st0_bar_o              => CONNECTED_TO_p0_rx_st0_bar_o,              --                       .rx_st0_bar
			p0_rx_st0_pt_parity_o        => CONNECTED_TO_p0_rx_st0_pt_parity_o,        --                       .rx_st0_pt_parity
			p0_rx_st1_hdr_o              => CONNECTED_TO_p0_rx_st1_hdr_o,              --                       .rx_st1_hdr
			p0_rx_st1_prefix_o           => CONNECTED_TO_p0_rx_st1_prefix_o,           --                       .rx_st1_prefix
			p0_rx_st1_hvalid_o           => CONNECTED_TO_p0_rx_st1_hvalid_o,           --                       .rx_st1_hvalid
			p0_rx_st1_pvalid_o           => CONNECTED_TO_p0_rx_st1_pvalid_o,           --                       .rx_st1_pvalid
			p0_rx_st1_bar_o              => CONNECTED_TO_p0_rx_st1_bar_o,              --                       .rx_st1_bar
			p0_rx_st1_pt_parity_o        => CONNECTED_TO_p0_rx_st1_pt_parity_o,        --                       .rx_st1_pt_parity
			p0_rx_st2_hdr_o              => CONNECTED_TO_p0_rx_st2_hdr_o,              --                       .rx_st2_hdr
			p0_rx_st2_prefix_o           => CONNECTED_TO_p0_rx_st2_prefix_o,           --                       .rx_st2_prefix
			p0_rx_st2_hvalid_o           => CONNECTED_TO_p0_rx_st2_hvalid_o,           --                       .rx_st2_hvalid
			p0_rx_st2_pvalid_o           => CONNECTED_TO_p0_rx_st2_pvalid_o,           --                       .rx_st2_pvalid
			p0_rx_st2_bar_o              => CONNECTED_TO_p0_rx_st2_bar_o,              --                       .rx_st2_bar
			p0_rx_st2_pt_parity_o        => CONNECTED_TO_p0_rx_st2_pt_parity_o,        --                       .rx_st2_pt_parity
			p0_rx_st3_hdr_o              => CONNECTED_TO_p0_rx_st3_hdr_o,              --                       .rx_st3_hdr
			p0_rx_st3_prefix_o           => CONNECTED_TO_p0_rx_st3_prefix_o,           --                       .rx_st3_prefix
			p0_rx_st3_hvalid_o           => CONNECTED_TO_p0_rx_st3_hvalid_o,           --                       .rx_st3_hvalid
			p0_rx_st3_pvalid_o           => CONNECTED_TO_p0_rx_st3_pvalid_o,           --                       .rx_st3_pvalid
			p0_rx_st3_bar_o              => CONNECTED_TO_p0_rx_st3_bar_o,              --                       .rx_st3_bar
			p0_rx_st3_pt_parity_o        => CONNECTED_TO_p0_rx_st3_pt_parity_o,        --                       .rx_st3_pt_parity
			p0_rx_st_hcrdt_init_i        => CONNECTED_TO_p0_rx_st_hcrdt_init_i,        --                       .rx_st_Hcrdt_init
			p0_rx_st_hcrdt_update_i      => CONNECTED_TO_p0_rx_st_hcrdt_update_i,      --                       .rx_st_Hcrdt_update
			p0_rx_st_hcrdt_update_cnt_i  => CONNECTED_TO_p0_rx_st_hcrdt_update_cnt_i,  --                       .rx_st_Hcrdt_update_cnt
			p0_rx_st_hcrdt_init_ack_o    => CONNECTED_TO_p0_rx_st_hcrdt_init_ack_o,    --                       .rx_st_Hcrdt_init_ack
			p0_rx_st_dcrdt_init_i        => CONNECTED_TO_p0_rx_st_dcrdt_init_i,        --                       .rx_st_Dcrdt_init
			p0_rx_st_dcrdt_update_i      => CONNECTED_TO_p0_rx_st_dcrdt_update_i,      --                       .rx_st_Dcrdt_update
			p0_rx_st_dcrdt_update_cnt_i  => CONNECTED_TO_p0_rx_st_dcrdt_update_cnt_i,  --                       .rx_st_Dcrdt_update_cnt
			p0_rx_st_dcrdt_init_ack_o    => CONNECTED_TO_p0_rx_st_dcrdt_init_ack_o,    --                       .rx_st_Dcrdt_init_ack
			p0_rx_st1_data_o             => CONNECTED_TO_p0_rx_st1_data_o,             --              p0_rx_st1.data
			p0_rx_st1_sop_o              => CONNECTED_TO_p0_rx_st1_sop_o,              --                       .startofpacket
			p0_rx_st1_eop_o              => CONNECTED_TO_p0_rx_st1_eop_o,              --                       .endofpacket
			p0_rx_st1_dvalid_o           => CONNECTED_TO_p0_rx_st1_dvalid_o,           --                       .valid
			p0_rx_st1_empty_o            => CONNECTED_TO_p0_rx_st1_empty_o,            --                       .empty
			p0_rx_st2_data_o             => CONNECTED_TO_p0_rx_st2_data_o,             --              p0_rx_st2.data
			p0_rx_st2_sop_o              => CONNECTED_TO_p0_rx_st2_sop_o,              --                       .startofpacket
			p0_rx_st2_eop_o              => CONNECTED_TO_p0_rx_st2_eop_o,              --                       .endofpacket
			p0_rx_st2_dvalid_o           => CONNECTED_TO_p0_rx_st2_dvalid_o,           --                       .valid
			p0_rx_st2_empty_o            => CONNECTED_TO_p0_rx_st2_empty_o,            --                       .empty
			p0_rx_st3_data_o             => CONNECTED_TO_p0_rx_st3_data_o,             --              p0_rx_st3.data
			p0_rx_st3_sop_o              => CONNECTED_TO_p0_rx_st3_sop_o,              --                       .startofpacket
			p0_rx_st3_eop_o              => CONNECTED_TO_p0_rx_st3_eop_o,              --                       .endofpacket
			p0_rx_st3_dvalid_o           => CONNECTED_TO_p0_rx_st3_dvalid_o,           --                       .valid
			p0_rx_st3_empty_o            => CONNECTED_TO_p0_rx_st3_empty_o,            --                       .empty
			p0_tx_st_hcrdt_init_o        => CONNECTED_TO_p0_tx_st_hcrdt_init_o,        --          p0_tx_st_misc.tx_st_Hcrdt_init
			p0_tx_st_hcrdt_update_o      => CONNECTED_TO_p0_tx_st_hcrdt_update_o,      --                       .tx_st_Hcrdt_update
			p0_tx_st_hcrdt_update_cnt_o  => CONNECTED_TO_p0_tx_st_hcrdt_update_cnt_o,  --                       .tx_st_Hcrdt_update_cnt
			p0_tx_st_hcrdt_init_ack_i    => CONNECTED_TO_p0_tx_st_hcrdt_init_ack_i,    --                       .tx_st_Hcrdtt_init_ack
			p0_tx_st_dcrdt_init_o        => CONNECTED_TO_p0_tx_st_dcrdt_init_o,        --                       .tx_st_Dcrdt_init
			p0_tx_st_dcrdt_update_o      => CONNECTED_TO_p0_tx_st_dcrdt_update_o,      --                       .tx_st_Dcrdt_update
			p0_tx_st_dcrdt_update_cnt_o  => CONNECTED_TO_p0_tx_st_dcrdt_update_cnt_o,  --                       .tx_st_Dcrdt_update_cnt
			p0_tx_st_dcrdt_init_ack_i    => CONNECTED_TO_p0_tx_st_dcrdt_init_ack_i,    --                       .tx_st_Dcrdt_init_ack
			p0_tx_st0_hdr_i              => CONNECTED_TO_p0_tx_st0_hdr_i,              --                       .tx_st0_hdr
			p0_tx_st0_prefix_i           => CONNECTED_TO_p0_tx_st0_prefix_i,           --                       .tx_st0_prefix
			p0_tx_st0_hvalid_i           => CONNECTED_TO_p0_tx_st0_hvalid_i,           --                       .tx_st0_hvalid
			p0_tx_st0_pvalid_i           => CONNECTED_TO_p0_tx_st0_pvalid_i,           --                       .tx_st0_pvalid
			p0_tx_st1_hdr_i              => CONNECTED_TO_p0_tx_st1_hdr_i,              --                       .tx_st1_hdr
			p0_tx_st1_prefix_i           => CONNECTED_TO_p0_tx_st1_prefix_i,           --                       .tx_st1_prefix
			p0_tx_st1_hvalid_i           => CONNECTED_TO_p0_tx_st1_hvalid_i,           --                       .tx_st1_hvalid
			p0_tx_st1_pvalid_i           => CONNECTED_TO_p0_tx_st1_pvalid_i,           --                       .tx_st1_pvalid
			p0_tx_st2_hdr_i              => CONNECTED_TO_p0_tx_st2_hdr_i,              --                       .tx_st2_hdr
			p0_tx_st2_prefix_i           => CONNECTED_TO_p0_tx_st2_prefix_i,           --                       .tx_st2_prefix
			p0_tx_st2_hvalid_i           => CONNECTED_TO_p0_tx_st2_hvalid_i,           --                       .tx_st2_hvalid
			p0_tx_st2_pvalid_i           => CONNECTED_TO_p0_tx_st2_pvalid_i,           --                       .tx_st2_pvalid
			p0_tx_st3_hdr_i              => CONNECTED_TO_p0_tx_st3_hdr_i,              --                       .tx_st3_hdr
			p0_tx_st3_prefix_i           => CONNECTED_TO_p0_tx_st3_prefix_i,           --                       .tx_st3_prefix
			p0_tx_st3_hvalid_i           => CONNECTED_TO_p0_tx_st3_hvalid_i,           --                       .tx_st3_hvalid
			p0_tx_st3_pvalid_i           => CONNECTED_TO_p0_tx_st3_pvalid_i,           --                       .tx_st3_pvalid
			p0_tx_st_ready_o             => CONNECTED_TO_p0_tx_st_ready_o,             --              p0_tx_st0.ready
			p0_tx_st0_data_i             => CONNECTED_TO_p0_tx_st0_data_i,             --                       .data
			p0_tx_st0_sop_i              => CONNECTED_TO_p0_tx_st0_sop_i,              --                       .startofpacket
			p0_tx_st0_eop_i              => CONNECTED_TO_p0_tx_st0_eop_i,              --                       .endofpacket
			p0_tx_st0_dvalid_i           => CONNECTED_TO_p0_tx_st0_dvalid_i,           --                       .valid
			p0_tx_st1_data_i             => CONNECTED_TO_p0_tx_st1_data_i,             --              p0_tx_st1.data
			p0_tx_st1_sop_i              => CONNECTED_TO_p0_tx_st1_sop_i,              --                       .startofpacket
			p0_tx_st1_eop_i              => CONNECTED_TO_p0_tx_st1_eop_i,              --                       .endofpacket
			p0_tx_st1_dvalid_i           => CONNECTED_TO_p0_tx_st1_dvalid_i,           --                       .valid
			p0_tx_st2_data_i             => CONNECTED_TO_p0_tx_st2_data_i,             --              p0_tx_st2.data
			p0_tx_st2_sop_i              => CONNECTED_TO_p0_tx_st2_sop_i,              --                       .startofpacket
			p0_tx_st2_eop_i              => CONNECTED_TO_p0_tx_st2_eop_i,              --                       .endofpacket
			p0_tx_st2_dvalid_i           => CONNECTED_TO_p0_tx_st2_dvalid_i,           --                       .valid
			p0_tx_st3_data_i             => CONNECTED_TO_p0_tx_st3_data_i,             --              p0_tx_st3.data
			p0_tx_st3_sop_i              => CONNECTED_TO_p0_tx_st3_sop_i,              --                       .startofpacket
			p0_tx_st3_eop_i              => CONNECTED_TO_p0_tx_st3_eop_i,              --                       .endofpacket
			p0_tx_st3_dvalid_i           => CONNECTED_TO_p0_tx_st3_dvalid_i,           --                       .valid
			p0_tx_ehp_deallocate_empty_o => CONNECTED_TO_p0_tx_ehp_deallocate_empty_o, --              p0_tx_ehp.tx_ehp_deallocate_empty
			pin_perst_n                  => CONNECTED_TO_pin_perst_n,                  --              pin_perst.reset_n
			pin_perst_n_o                => CONNECTED_TO_pin_perst_n_o                 --          pin_perst_n_o.reset_n
		);

