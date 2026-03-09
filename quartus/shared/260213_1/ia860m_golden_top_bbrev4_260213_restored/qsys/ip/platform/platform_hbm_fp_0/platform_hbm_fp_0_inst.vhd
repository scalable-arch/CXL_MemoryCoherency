	component platform_hbm_fp_0 is
		port (
			ch0_u0_wmc_intr   : out std_logic;                                       -- conduit
			ch0_u1_wmc_intr   : out std_logic;                                       -- conduit
			fabric_clk        : in  std_logic                    := 'X';             -- clk
			hbm_reset_n       : in  std_logic                    := 'X';             -- reset_n
			hbm_reset_in_prog : out std_logic;                                       -- hbm_reset_in_prog
			hbm_cattrip       : out std_logic;                                       -- hbm_cattrip
			hbm_cattrip_i     : in  std_logic                    := 'X';             -- conduit
			hbm_temp          : out std_logic_vector(2 downto 0);                    -- hbm_temp
			hbm_temp_i        : in  std_logic_vector(2 downto 0) := (others => 'X'); -- conduit
			local_cal_success : out std_logic;                                       -- local_cal_success
			local_cal_fail    : out std_logic;                                       -- local_cal_fail
			uibpll_refclk     : in  std_logic                    := 'X'              -- clk
		);
	end component platform_hbm_fp_0;

	u0 : component platform_hbm_fp_0
		port map (
			ch0_u0_wmc_intr   => CONNECTED_TO_ch0_u0_wmc_intr,   --   ch0_u0_wmc_intr.conduit
			ch0_u1_wmc_intr   => CONNECTED_TO_ch0_u1_wmc_intr,   --   ch0_u1_wmc_intr.conduit
			fabric_clk        => CONNECTED_TO_fabric_clk,        --        fabric_clk.clk
			hbm_reset_n       => CONNECTED_TO_hbm_reset_n,       --       hbm_reset_n.reset_n
			hbm_reset_in_prog => CONNECTED_TO_hbm_reset_in_prog, -- hbm_reset_in_prog.hbm_reset_in_prog
			hbm_cattrip       => CONNECTED_TO_hbm_cattrip,       --           cattrip.hbm_cattrip
			hbm_cattrip_i     => CONNECTED_TO_hbm_cattrip_i,     --         cattrip_i.conduit
			hbm_temp          => CONNECTED_TO_hbm_temp,          --              temp.hbm_temp
			hbm_temp_i        => CONNECTED_TO_hbm_temp_i,        --            temp_i.conduit
			local_cal_success => CONNECTED_TO_local_cal_success, -- local_cal_success.local_cal_success
			local_cal_fail    => CONNECTED_TO_local_cal_fail,    --    local_cal_fail.local_cal_fail
			uibpll_refclk     => CONNECTED_TO_uibpll_refclk      --     uibpll_refclk.clk
		);

