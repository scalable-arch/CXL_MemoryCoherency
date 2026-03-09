	component platform_intel_noc_clock_ctrl_1 is
		port (
			refclk     : in  std_logic := 'X'; -- clk
			pll_lock_o : out std_logic         -- pll_lock_o
		);
	end component platform_intel_noc_clock_ctrl_1;

	u0 : component platform_intel_noc_clock_ctrl_1
		port map (
			refclk     => CONNECTED_TO_refclk,     --     refclk.clk
			pll_lock_o => CONNECTED_TO_pll_lock_o  -- pll_lock_o.pll_lock_o
		);

