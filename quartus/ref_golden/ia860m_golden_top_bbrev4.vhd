--------------------------------------------------------------------------------
--
--      This source code is provided to you (the Licensee) under license
--      by BittWare, a Molex Company. To view or use this source code,
--      the Licensee must accept a Software License Agreement (viewable
--      at developer.bittware.com), which is commonly provided as a click-
--      through license agreement. The terms of the Software License
--      Agreement govern all use and distribution of this file unless an
--      alternative superseding license has been executed with BittWare.
--      This source code and its derivatives may not be distributed to
--      third parties in source code form. Software including or derived
--      from this source code, including derivative works thereof created
--      by Licensee, may be distributed to third parties with BittWare
--      hardware only and in executable form only.
--
--      The click-through license is available here:
--        https://developer.bittware.com/software_license.txt
--
--------------------------------------------------------------------------------
--      UNCLASSIFIED//FOR OFFICIAL USE ONLY
--------------------------------------------------------------------------------
-- Title       : IA-860m (top level)
-- Project     : IA-860m
--------------------------------------------------------------------------------
-- Description:
--   This is the top level of the IA-860m.
--   It contains no architecture therefore will error if a full compilation is
--   attempted.
--   Example uses for the golden top include as a reference project that
--   contains the FPGA pins, associated I/O constraints and required Quartus
--   settings, as an empty project starting point or for configuring IP from
--   Intels IP Catalog with the correct device.
--
-- Main interfaces / groupings:
--   PCIe Gen5x16 (R-tile)
--   General Clocks
--   F-Tile Clocking, used for the QSFP-DDs, MCIO and M.2 SSD
--   HBM2e & NoC Clocking
--   Board Management Controller (BMC) Interface
--   LEDs, GPIO, Other
--   QSFP-DDs (F-tile)
--   MCIO (F-Tile)
--   M.2 SSD (F-Tile)
--   1 x 4GB component DDR4 bank (for HPS)
--   HPS
--------------------------------------------------------------------------------
-- Known Issues and Omissions:
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ia860m_golden_top is
port (
  -----------------------------------------------------------------------------
  -- PCIe Gen5 x16
  -----------------------------------------------------------------------------
  PERST_L            : in     std_logic;
  PCIE_REFCLK0       : in     std_logic;
  PCIE_REFCLK1       : in     std_logic;
  PCIE_RX_P          : in     std_logic_vector(15 downto 0);
  PCIE_RX_N          : in     std_logic_vector(15 downto 0);
  PCIE_TX_P          : out    std_logic_vector(15 downto 0);
  PCIE_TX_N          : out    std_logic_vector(15 downto 0);
  -----------------------------------------------------------------------------
  -- General Clocks
  -----------------------------------------------------------------------------
  USER_CLK0          : in     std_logic;
  USER_CLK1          : in     std_logic;  -- Second 100MHz User Clock - BBRev1 and above
  CLKA               : in     std_logic;
  U1PPS              : in     std_logic;
  -----------------------------------------------------------------------------
  -- F-Tile Clocking, used for the QSFP-DDs, MCIO and M.2 SSD
  -----------------------------------------------------------------------------
  QSFP0_REFCLK       : in     std_logic;  -- F-Tile 12A, Refclk #5
  QSFP1_REFCLK       : in     std_logic;  -- F-Tile 13A, Refclk #5
  QSFP2_REFCLK       : in     std_logic;  -- F-Tile 13C, Refclk #5
  MCIO_REFCLK        : in     std_logic;  -- F-Tile 13A, Refclk #2
  M2_REFCLK          : in     std_logic;  -- F-Tile 13C, Refclk #2
  -- Recovered Clocks (output from F-Tile)
  RECV0_CLK          : out    std_logic;  -- F-Tile 12A, Refclk #9
  RECV1_CLK          : out    std_logic;  -- F-Tile 13A, Refclk #9
  RECV2_CLK          : out    std_logic;  -- F-Tile 13C, Refclk #9
  -----------------------------------------------------------------------------
  -- HBM2e & NoC Clocking
  -----------------------------------------------------------------------------
  HBM_REFCLK0        : in     std_logic;  -- Lower HBM2e Reference Clock
  HBM_FBR_REFCLK0    : in     std_logic;  -- Lower HBM2e Fabric Clock.  Must be connected to IOPLL to use.
  HBM_CATTRIP0       : in     std_logic;  -- When using HBM2e, Cattrip and Temp inputs must be connected to top level.  No associated pins.
  HBM_TEMP0          : in     std_logic_vector(2 downto 0);
  NOC_CLK0           : in     std_logic;  -- Lower Network-on-Chip (NoC) Reference Clock
  HBM_REFCLK1        : in     std_logic;  -- Upper HBM2e Reference Clock
  HBM_FBR_REFCLK1    : in     std_logic;  -- Upper HBM2e Fabric Clock.  Must be connected to IOPLL to use.
  HBM_CATTRIP1       : in     std_logic;  -- When using HBM2e, Cattrip and Temp inputs must be connected to top level.  No associated pins.
  HBM_TEMP1          : in     std_logic_vector(2 downto 0);
  NOC_CLK1           : in     std_logic;  -- Upper Network-on-Chip (NoC) Reference Clock
  -----------------------------------------------------------------------------
  -- Board Management Controller (BMC) Interface
  -----------------------------------------------------------------------------
  -- BMC interface present in FPGA design
  BMC_IF_PRESENT_L   : out    std_logic;
  -- BMC interface FPGA Ingress SPI and IRQ
  FPGA_IG_SPI_SCK    : in     std_logic;
  FPGA_IG_SPI_PCS0   : in     std_logic;
  FPGA_IG_SPI_MOSI   : in     std_logic;
  FPGA_IG_SPI_MISO   : out    std_logic;
  FPGA_TO_BMC_IRQ    : out    std_logic;
  -- BMC interface FPGA Egress SPI and IRQ
  FPGA_EG_SPI_SCK    : out    std_logic;
  FPGA_EG_SPI_PCS0   : out    std_logic;
  FPGA_EG_SPI_MOSI   : out    std_logic;
  FPGA_EG_SPI_MISO   : in     std_logic;
  BMC_TO_FPGA_IRQ    : in     std_logic;
  -----------------------------------------------------------------------------
  -- Board Management Controller (BMC) reset
  -----------------------------------------------------------------------------
  BMC_FPGA_RST_L     : in     std_logic;
  -----------------------------------------------------------------------------
  -- LEDs, GPIO, Other
  -----------------------------------------------------------------------------
  -- LEDs
  FPGA_LED_G_L       : out    std_logic;
  FPGA_LED_R_L       : out    std_logic;
  -- External GPIO
  EXT_SE_CLK         : in     std_logic; -- LVDS Clock (LVDS at connector, single-ended at FPGA)
  EXT_GPIO_IN        : in     std_logic_vector(1 downto 0); -- LVDS Inputs (LVDS at connector, single-ended at FPGA)
  EXT_GPIO_OUT       : out    std_logic; -- LVDS Output (LVDS at connector, single-ended at FPGA)
  -- Buffer Enables (both should be driven LOW)
  MCIO_GPIO_EN_L     : out    std_logic;
  MCIO_I2C_EN        : out    std_logic; -- BBRev1 and above
  EXT_GPIO_EN_L      : out    std_logic;
  -----------------------------------------------------------------------------
  -- QSFPDD0
  -----------------------------------------------------------------------------
  QSFP0_TX_P         : out    std_logic_vector(7 downto 0);
  QSFP0_TX_N         : out    std_logic_vector(7 downto 0);
  QSFP0_RX_P         : in     std_logic_vector(7 downto 0);
  QSFP0_RX_N         : in     std_logic_vector(7 downto 0);
  -----------------------------------------------------------------------------
  -- QSFPDD1
  -----------------------------------------------------------------------------
  QSFP1_TX_P         : out    std_logic_vector(7 downto 0);
  QSFP1_TX_N         : out    std_logic_vector(7 downto 0);
  QSFP1_RX_P         : in     std_logic_vector(7 downto 0);
  QSFP1_RX_N         : in     std_logic_vector(7 downto 0);
  -----------------------------------------------------------------------------
  -- QSFPDD2
  -----------------------------------------------------------------------------
  QSFP2_TX_P         : out    std_logic_vector(7 downto 0);
  QSFP2_TX_N         : out    std_logic_vector(7 downto 0);
  QSFP2_RX_P         : in     std_logic_vector(7 downto 0);
  QSFP2_RX_N         : in     std_logic_vector(7 downto 0);
  -----------------------------------------------------------------------------
  -- MCIO
  -----------------------------------------------------------------------------
  -- PCIe Reset
  MCIO_PERST_N       : in     std_logic;
  -- Transceivers
  MCIO_TX_P          : out    std_logic_vector(7 downto 0);
  MCIO_TX_N          : out    std_logic_vector(7 downto 0);
  MCIO_RX_P          : in     std_logic_vector(7 downto 0);
  MCIO_RX_N          : in     std_logic_vector(7 downto 0);
  -- Sideband Signals
  MCIO_CWAKEA        : in     std_logic;
  MCIO_BP_TYPEA      : out    std_logic;
  MCIO_CPRSNTA       : in     std_logic;
  MCIO_I2C0_SCL      : inout  std_logic;
  MCIO_I2C0_SDA      : inout  std_logic;
  MCIO_CWAKEB        : in     std_logic;
  MCIO_BP_TYPEB      : out    std_logic;
  MCIO_CPRSNTB       : in     std_logic;
  MCIO_I2C1_SCL      : inout  std_logic;
  MCIO_I2C1_SDA      : inout  std_logic;
  -----------------------------------------------------------------------------
  -- M.2 SSD
  -----------------------------------------------------------------------------
  -- PCIe Reset
  M2_PERST_N         : in     std_logic;
  -- Transceivers
  M2SSD_TX_P         : out    std_logic_vector(3 downto 0);
  M2SSD_TX_N         : out    std_logic_vector(3 downto 0);
  M2SSD_RX_P         : in     std_logic_vector(3 downto 0);
  M2SSD_RX_N         : in     std_logic_vector(3 downto 0);
  -----------------------------------------------------------------------------
  -- HPS DDR4 SDRAM
  -----------------------------------------------------------------------------
  HPS_DDR4_REFCLK    : in    std_logic;
  HPS_DDR4_CLK_P     : out   std_logic_vector;
  HPS_DDR4_CLK_N     : out   std_logic_vector;
  HPS_DDR4_A         : out   std_logic_vector(16 downto 0);
  HPS_DDR4_ACT_L     : out   std_logic;
  HPS_DDR4_BA        : out   std_logic_vector(1 downto 0);
  HPS_DDR4_BG        : out   std_logic;
  HPS_DDR4_CKE       : out   std_logic_vector;
  HPS_DDR4_CS_L      : out   std_logic_vector;
  HPS_DDR4_ODT       : out   std_logic_vector;
  HPS_DDR4_RESET_L   : out   std_logic_vector;
  HPS_DDR4_PARITY    : out   std_logic_vector;
  HPS_DDR4_ALERT_L   : in    std_logic_vector;
  HPS_DDR4_DM        : inout std_logic_vector(4 downto 0);
  HPS_DDR4_DQS_P     : inout std_logic_vector(4 downto 0);
  HPS_DDR4_DQS_N     : inout std_logic_vector(4 downto 0);
  HPS_DDR4_DQ        : inout std_logic_vector(39 downto 0);
  HPS_RZQ            : in    std_logic;
  -----------------------------------------------------------------------------
  -- HPS
  -----------------------------------------------------------------------------
  HPS_CLK            : in    std_logic;
  HPS_UART_TXD       : out   std_logic;
  HPS_UART_RXD       : in    std_logic;
  HPS_NAND_D         : inout std_logic_vector(7 downto 0);
  HPS_NAND_CE_L      : out   std_logic;
  HPS_NAND_CLE       : out   std_logic;
  HPS_NAND_ALE       : out   std_logic;
  HPS_NAND_WE_L      : out   std_logic;
  HPS_NAND_RE_L      : out   std_logic;
  HPS_NAND_WP_L      : out   std_logic;
  HPS_NAND_RB_L      : in    std_logic;
  -- External connections to J13 for Ethernet PHY
  ETH_PHY_RESET_L    : out   std_logic;
  EMAC_MDIO          : inout std_logic;
  EMAC_MDC           : in    std_logic;
  EMAC_TX_CLK        : out   std_logic;
  EMAC_TX_CTL        : out   std_logic;
  EMAC_TXD           : out   std_logic_vector(3 downto 0);
  EMAC_RX_CLK        : in    std_logic;
  EMAC_RX_CTL        : in    std_logic;
  EMAC_RXD           : in    std_logic_vector(3 downto 0);
  -- MCIO/M.2 SSD Sideband Signals
  EXT_M2_GPIO_EN_L   : out   std_logic;
  EXT_MCIO_GPIO_EN_L : out   std_logic;
  M2_SMB_CLK         : inout std_logic;
  M2_SMB_DAT         : inout std_logic;
  M2_PEWAKE_L        : out   std_logic;
  M2_CLKREQ_L        : in    std_logic;
  M2_PERST_OUT_L     : out   std_logic;
  MCIO_PERST_OUT_L   : out   std_logic
  );
end entity ia860m_golden_top;

architecture rtl of ia860m_golden_top is

begin

-- MCIO_GPIO_EN_L must be driven LOW and MCIO_I2C_EN must be driven HIGH when MCIO is in design.
-- EXT_GPIO_EN_L must be driven LOW when the GPIO is in design.
-- Otherwise can be removed/ignored.
MCIO_GPIO_EN_L <= '0';
MCIO_I2C_EN    <= '1';
EXT_GPIO_EN_L  <= '0';

-- The BMC_IF_PRESENT_L must be driven to ensure proper BMC operation.
-- When the Bittware BMC FPGA IP is integrated into the design, comment out the statement below (and connect BMC_IF_PRESENT_L to the IP).
BMC_IF_PRESENT_L <= '1';

end rtl;

