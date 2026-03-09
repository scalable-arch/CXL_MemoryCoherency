	component platform_clock_bridge_5 is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component platform_clock_bridge_5;

	u0 : component platform_clock_bridge_5
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

