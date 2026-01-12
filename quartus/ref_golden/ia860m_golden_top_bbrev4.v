//------------------------------------------------------------------------------
//
//      This source code is provided to you (the Licensee) under license
//      by BittWare, a Molex Company. To view or use this source code,
//      the Licensee must accept a Software License Agreement (viewable
//      at developer.bittware.com), which is commonly provided as a click-
//      through license agreement. The terms of the Software License
//      Agreement govern all use and distribution of this file unless an
//      alternative superseding license has been executed with BittWare.
//      This source code and its derivatives may not be distributed to
//      third parties in source code form. Software including or derived
//      from this source code, including derivative works thereof created
//      by Licensee, may be distributed to third parties with BittWare
//      hardware only and in executable form only.
//
//      The click-through license is available here:
//        https://developer.bittware.com/software_license.txt
//
//------------------------------------------------------------------------------
//      UNCLASSIFIED//FOR OFFICIAL USE ONLY
//------------------------------------------------------------------------------
// Title       : IA-860m (top level)
// Project     : IA-860m
//------------------------------------------------------------------------------
// Description:
//   This is the top level of the IA-860m.
//   It contains no architecture therefore will error if a full compilation is
//   attempted.
//   Example uses for the golden top include as a reference project that
//   contains the FPGA pins, associated I/O constraints and required Quartus
//   settings, as an empty project starting point or for configuring IP from
//   Intels IP Catalog with the correct device.
//
// Main interfaces / groupings:
//   PCIe Gen5x16 (R-tile)
//   General Clocks
//   F-Tile Clocking, used for the QSFP-DDs, MCIO and M.2 SSD
//   HBM2e & NoC Clocking
//   Board Management Controller (BMC) Interface
//   LEDs, GPIO, Other
//   QSFP-DDs (F-tile)
//   MCIO (F-Tile)
//   M.2 SSD (F-Tile)
//   1 x 4GB component DDR4 bank (for HPS)
//   HPS
//------------------------------------------------------------------------------
// Known Issues and Omissions:
//
//------------------------------------------------------------------------------

module ia860m_golden_top
  (
  //---------------------------------------------------------------------------
  // PCIe Gen5 x16
  //---------------------------------------------------------------------------
  input          PERST_L,
  input          PCIE_REFCLK0,
  input          PCIE_REFCLK1,
  input   [15:0] PCIE_RX_P,
  input   [15:0] PCIE_RX_N,
  output  [15:0] PCIE_TX_P,
  output  [15:0] PCIE_TX_N,
  //---------------------------------------------------------------------------
  // General Clocks
  //---------------------------------------------------------------------------
  input          USER_CLK0,
  input          USER_CLK1,           // Second 100MHz User Clock.  BBRev1 and above
  input          CLKA,
  input          U1PPS,
  //---------------------------------------------------------------------------
  // F-Tile Clocking, used for the QSFP-DDs, MCIO and M.2 SSD
  //---------------------------------------------------------------------------
  input          QSFP0_REFCLK,        // F-Tile 12A, Refclk #5
  input          QSFP1_REFCLK,        // F-Tile 13A, Refclk #5
  input          QSFP2_REFCLK,        // F-Tile 13C, Refclk #5
  input          MCIO_REFCLK,         // F-Tile 13A, Refclk #2
  input          M2_REFCLK,           // F-Tile 13C, Refclk #2
  // Recovered Clocks (output from F-Tile)
  output         RECV0_CLK,           // F-Tile 12A, Refclk #9
  output         RECV1_CLK,           // F-Tile 13A, Refclk #9
  output         RECV2_CLK,           // F-Tile 13C, Refclk #9
  //---------------------------------------------------------------------------
  // HBM2e & NoC Clocking
  //---------------------------------------------------------------------------
  input          HBM_REFCLK0,         // Lower HBM2e Reference Clock
  input          HBM_FBR_REFCLK0,     // Lower HBM2e Fabric Clock.  Must be connected to IOPLL to use.
  input          HBM_CATTRIP0,        // When using HBM2e, Cattrip and Temp inputs must be connected to top level.  No associated pins.
  input    [2:0] HBM_TEMP0,
  input          NOC_CLK0,            // Lower Network-on-Chip (NoC) Reference Clock
  input          HBM_REFCLK1,         // Upper HBM2e Reference Clock
  input          HBM_FBR_REFCLK1,     // Upper HBM2e Fabric Clock.  Must be connected to IOPLL to use.
  input          HBM_CATTRIP1,        // When using HBM2e, Cattrip and Temp inputs must be connected to top level.  No associated pins.
  input    [2:0] HBM_TEMP1,
  input          NOC_CLK1,            // Upper Network-on-Chip (NoC) Reference Clock
  //---------------------------------------------------------------------------
  // Board Management Controller (BMC) Interface
  //---------------------------------------------------------------------------
  // BMC interface present in FPGA design
  output         BMC_IF_PRESENT_L,
  // BMC interface FPGA Ingress SPI and IRQ
  input          FPGA_IG_SPI_SCK,
  input          FPGA_IG_SPI_PCS0,
  input          FPGA_IG_SPI_MOSI,
  output         FPGA_IG_SPI_MISO,
  output         FPGA_TO_BMC_IRQ,
  // BMC interface FPGA Egress SPI and IRQ
  output         FPGA_EG_SPI_SCK,
  output         FPGA_EG_SPI_PCS0,
  output         FPGA_EG_SPI_MOSI,
  input          FPGA_EG_SPI_MISO,
  input          BMC_TO_FPGA_IRQ,
  //---------------------------------------------------------------------------
  // Board Management Controller (BMC) reset
  //---------------------------------------------------------------------------
  input          BMC_FPGA_RST_L,
  //---------------------------------------------------------------------------
  // LEDs, GPIO, Other
  //---------------------------------------------------------------------------
  // LEDs
  output         FPGA_LED_G_L,
  output         FPGA_LED_R_L,
  // External GPIO
  input          EXT_SE_CLK,          // LVDS Clock (LVDS at connector, single-ended at FPGA)
  input    [1:0] EXT_GPIO_IN,         // LVDS Inputs (LVDS at connector, single-ended at FPGA)
  output         EXT_GPIO_OUT,        // LVDS Output (LVDS at connector, single-ended at FPGA)
  // Buffer Enables (both should be driven LOW)
  output         MCIO_GPIO_EN_L,
  output         MCIO_I2C_EN,         // BBRev1 and above
  output         EXT_GPIO_EN_L,
  //---------------------------------------------------------------------------
  // QSFPDD0
  //---------------------------------------------------------------------------
  output   [7:0] QSFP0_TX_P,
  output   [7:0] QSFP0_TX_N,
  input    [7:0] QSFP0_RX_P,
  input    [7:0] QSFP0_RX_N,
  //---------------------------------------------------------------------------
  // QSFPDD1
  //---------------------------------------------------------------------------
  output   [7:0] QSFP1_TX_P,
  output   [7:0] QSFP1_TX_N,
  input    [7:0] QSFP1_RX_P,
  input    [7:0] QSFP1_RX_N,
  //---------------------------------------------------------------------------
  // QSFPDD2
  //---------------------------------------------------------------------------
  output   [7:0] QSFP2_TX_P,
  output   [7:0] QSFP2_TX_N,
  input    [7:0] QSFP2_RX_P,
  input    [7:0] QSFP2_RX_N,
  //---------------------------------------------------------------------------
  // MCIO
  //---------------------------------------------------------------------------
  // PCIe Reset
  input          MCIO_PERST_N,
  // Transceivers
  output   [7:0] MCIO_TX_P,
  output   [7:0] MCIO_TX_N,
  input    [7:0] MCIO_RX_P,
  input    [7:0] MCIO_RX_N,
  // Sideband Signals
  input          MCIO_CWAKEA,
  output         MCIO_BP_TYPEA,
  input          MCIO_CPRSNTA,
  inout          MCIO_I2C0_SCL,
  inout          MCIO_I2C0_SDA,
  input          MCIO_CWAKEB,
  output         MCIO_BP_TYPEB,
  input          MCIO_CPRSNTB,
  inout          MCIO_I2C1_SCL,
  inout          MCIO_I2C1_SDA,
  //---------------------------------------------------------------------------
  // M.2 SSD
  //---------------------------------------------------------------------------
  // PCIe Reset
  input          M2_PERST_N,
  // Transceivers
  output   [3:0] M2SSD_TX_P,
  output   [3:0] M2SSD_TX_N,
  input    [3:0] M2SSD_RX_P,
  input    [3:0] M2SSD_RX_N,
  //---------------------------------------------------------------------------
  // HPS DDR4 SDRAM
  //---------------------------------------------------------------------------
  input          HPS_DDR4_REFCLK,
  output         HPS_DDR4_CLK_P,
  output         HPS_DDR4_CLK_N,
  output  [16:0] HPS_DDR4_A,
  output         HPS_DDR4_ACT_L,
  output   [1:0] HPS_DDR4_BA,
  output         HPS_DDR4_BG,
  output         HPS_DDR4_CKE,
  output         HPS_DDR4_CS_L,
  output         HPS_DDR4_ODT,
  output         HPS_DDR4_RESET_L,
  output         HPS_DDR4_PARITY,
  input          HPS_DDR4_ALERT_L,
  inout    [4:0] HPS_DDR4_DM,
  inout    [4:0] HPS_DDR4_DQS_P,
  inout    [4:0] HPS_DDR4_DQS_N,
  inout   [39:0] HPS_DDR4_DQ,
  input          HPS_RZQ,
  //---------------------------------------------------------------------------
  // HPS
  //---------------------------------------------------------------------------
  input          HPS_CLK,
  output         HPS_UART_TXD,
  input          HPS_UART_RXD,
  inout    [7:0] HPS_NAND_D,
  output         HPS_NAND_CE_L,
  output         HPS_NAND_CLE,
  output         HPS_NAND_ALE,
  output         HPS_NAND_WE_L,
  output         HPS_NAND_RE_L,
  output         HPS_NAND_WP_L,
  input          HPS_NAND_RB_L,
  // External connections to J13 for Ethernet PHY
  output         ETH_PHY_RESET_L,
  inout          EMAC_MDIO,
  input          EMAC_MDC,
  output         EMAC_TX_CLK,
  output         EMAC_TX_CTL,
  output   [3:0] EMAC_TXD,
  input          EMAC_RX_CLK,
  input          EMAC_RX_CTL,
  input    [3:0] EMAC_RXD,
  // MCIO/M.2 SSD Sideband Signals
  output         EXT_M2_GPIO_EN_L,
  output         EXT_MCIO_GPIO_EN_L,
  inout          M2_SMB_CLK,
  inout          M2_SMB_DAT,
  output         M2_PEWAKE_L,
  input          M2_CLKREQ_L,
  output         M2_PERST_OUT_L,
  output         MCIO_PERST_OUT_L
  );

// MCIO_GPIO_EN_L must be driven LOW and MCIO_I2C_EN must be driven HIGH when MCIO is in design.
// EXT_GPIO_EN_L must be driven LOW when the GPIO is in design.
// Otherwise can be removed/ignored.
assign MCIO_GPIO_EN_L = 1'b0;
assign MCIO_I2C_EN    = 1'b1;
assign EXT_GPIO_EN_L  = 1'b0;

// The BMC_IF_PRESENT_L must be driven to ensure proper BMC operation.
// When the Bittware BMC FPGA IP is integrated into the design, comment out the statement below (and connect BMC_IF_PRESENT_L to the IP).
assign BMC_IF_PRESENT_L = 1'b1;

endmodule // ia860m_golden_top

