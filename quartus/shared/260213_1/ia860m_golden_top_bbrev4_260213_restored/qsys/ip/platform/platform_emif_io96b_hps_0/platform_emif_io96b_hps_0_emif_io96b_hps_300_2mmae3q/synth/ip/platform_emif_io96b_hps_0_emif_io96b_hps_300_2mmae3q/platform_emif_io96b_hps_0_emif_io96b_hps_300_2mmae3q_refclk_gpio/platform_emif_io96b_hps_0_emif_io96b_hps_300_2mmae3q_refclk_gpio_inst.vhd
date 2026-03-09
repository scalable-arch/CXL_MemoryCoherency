	component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_refclk_gpio is
		port (
			dout   : out std_logic_vector(0 downto 0);                    -- export
			pad_in : in  std_logic_vector(0 downto 0) := (others => 'X')  -- export
		);
	end component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_refclk_gpio;

	u0 : component platform_emif_io96b_hps_0_emif_io96b_hps_300_2mmae3q_refclk_gpio
		port map (
			dout   => CONNECTED_TO_dout,   --   dout.export
			pad_in => CONNECTED_TO_pad_in  -- pad_in.export
		);

