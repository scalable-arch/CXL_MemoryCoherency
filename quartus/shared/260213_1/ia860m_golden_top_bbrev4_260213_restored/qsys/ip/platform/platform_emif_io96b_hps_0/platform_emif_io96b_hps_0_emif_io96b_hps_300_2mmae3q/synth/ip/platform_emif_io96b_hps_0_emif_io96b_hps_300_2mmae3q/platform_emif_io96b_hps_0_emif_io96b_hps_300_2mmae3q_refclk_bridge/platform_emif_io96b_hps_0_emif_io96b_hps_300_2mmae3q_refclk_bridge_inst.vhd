	component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_refclk_bridge is
		port (
			refclk_in       : in  std_logic := 'X'; -- clk
			refclk_out      : out std_logic;        -- clk
			refclk_in_gpio  : out std_logic;        -- export
			refclk_out_gpio : in  std_logic := 'X'  -- export
		);
	end component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_refclk_bridge;

	u0 : component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_refclk_bridge
		port map (
			refclk_in       => CONNECTED_TO_refclk_in,       --       refclk_in.clk
			refclk_out      => CONNECTED_TO_refclk_out,      --      refclk_out.clk
			refclk_in_gpio  => CONNECTED_TO_refclk_in_gpio,  --  refclk_in_gpio.export
			refclk_out_gpio => CONNECTED_TO_refclk_out_gpio  -- refclk_out_gpio.export
		);

