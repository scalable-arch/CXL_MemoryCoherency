	component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_emif_0_ddr4comp is
		port (
			mem_0_cke     : out   std_logic_vector(0 downto 0);                     -- mem_cke
			mem_0_odt     : out   std_logic_vector(0 downto 0);                     -- mem_odt
			mem_0_cs_n    : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			mem_0_a       : out   std_logic_vector(16 downto 0);                    -- mem_a
			mem_0_ba      : out   std_logic_vector(1 downto 0);                     -- mem_ba
			mem_0_bg      : out   std_logic_vector(0 downto 0);                     -- mem_bg
			mem_0_act_n   : out   std_logic;                                        -- mem_act_n
			mem_0_par     : out   std_logic;                                        -- mem_par
			mem_0_dq      : inout std_logic_vector(39 downto 0) := (others => 'X'); -- mem_dq
			mem_0_dqs_t   : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_t
			mem_0_dqs_c   : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_c
			mem_0_alert_n : in    std_logic                     := 'X';             -- mem_alert_n
			mem_0_dbi_n   : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dbi_n
			mem_0_ck_t    : out   std_logic_vector(0 downto 0);                     -- mem_ck_t
			mem_0_ck_c    : out   std_logic_vector(0 downto 0);                     -- mem_ck_c
			mem_0_reset_n : out   std_logic;                                        -- mem_reset_n
			oct_rzqin_0   : in    std_logic                     := 'X';             -- oct_rzqin
			ref_clk       : in    std_logic                     := 'X'              -- clk
		);
	end component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_emif_0_ddr4comp;

	u0 : component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_emif_0_ddr4comp
		port map (
			mem_0_cke     => CONNECTED_TO_mem_0_cke,     --       mem_0.mem_cke
			mem_0_odt     => CONNECTED_TO_mem_0_odt,     --            .mem_odt
			mem_0_cs_n    => CONNECTED_TO_mem_0_cs_n,    --            .mem_cs_n
			mem_0_a       => CONNECTED_TO_mem_0_a,       --            .mem_a
			mem_0_ba      => CONNECTED_TO_mem_0_ba,      --            .mem_ba
			mem_0_bg      => CONNECTED_TO_mem_0_bg,      --            .mem_bg
			mem_0_act_n   => CONNECTED_TO_mem_0_act_n,   --            .mem_act_n
			mem_0_par     => CONNECTED_TO_mem_0_par,     --            .mem_par
			mem_0_dq      => CONNECTED_TO_mem_0_dq,      --            .mem_dq
			mem_0_dqs_t   => CONNECTED_TO_mem_0_dqs_t,   --            .mem_dqs_t
			mem_0_dqs_c   => CONNECTED_TO_mem_0_dqs_c,   --            .mem_dqs_c
			mem_0_alert_n => CONNECTED_TO_mem_0_alert_n, --            .mem_alert_n
			mem_0_dbi_n   => CONNECTED_TO_mem_0_dbi_n,   --            .mem_dbi_n
			mem_0_ck_t    => CONNECTED_TO_mem_0_ck_t,    --    mem_ck_0.mem_ck_t
			mem_0_ck_c    => CONNECTED_TO_mem_0_ck_c,    --            .mem_ck_c
			mem_0_reset_n => CONNECTED_TO_mem_0_reset_n, -- mem_reset_n.mem_reset_n
			oct_rzqin_0   => CONNECTED_TO_oct_rzqin_0,   --       oct_0.oct_rzqin
			ref_clk       => CONNECTED_TO_ref_clk        --     ref_clk.clk
		);

