#*******************************************************************************
#
#      This source code is provided to you (the Licensee) under license
#      by BittWare, a Molex Company.  To view or use this source code,
#      the Licensee must accept a Software License Agreement (viewable
#      at developer.bittware.com), which is commonly provided as a click-
#      through license agreement.  The terms of the Software License
#      Agreement govern all use and distribution of this file unless an
#      alternative superseding license has been executed with BittWare.
#      This source code and its derivatives may not be distributed to
#      third parties in source code form. Software including or derived
#      from this source code, including derivative works thereof created
#      by Licensee, may be distributed to third parties with BittWare
#      hardware only and in executable form only.
#
#      The click-through license is available here:
#        https://developer.bittware.com/software_license.txt
#
#*******************************************************************************
#      UNCLASSIFIED//FOR OFFICIAL USE ONLY
#*******************************************************************************
# Title       : IA-860m Pre Synthesis Timing Constraints
# Project     : IA-860m
#*******************************************************************************
# Description : Timing constraints - clock declarations
#*******************************************************************************
# Known Issues and Omissions:
#
#*******************************************************************************

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3


#**************************************************************
# Create Clock
#**************************************************************

# Prime User Clock 100MHz
create_clock -name {USER_CLK0}            -period  10.000 [get_ports USER_CLK0]
# Secondary User Clock 100MHz (BBRev1 and above)
create_clock -name {USER_CLK1}            -period  10.000 [get_ports USER_CLK1] 
# 1PPS (pulse per second). Tested with a 10MHz external source
create_clock -name {U1PPS}                -period 100.000 [get_ports U1PPS]
# ClkA/External Clock. Tested with a 10MHz external source
create_clock -name {CLKA}                 -period 100.000 [get_ports CLKA]
# R-Tile PCIe Ref Clocks 100MHz
create_clock -name {PCIE_REFCLK0}         -period  10.000 [get_ports PCIE_REFCLK0]
create_clock -name {PCIE_REFCLK1}         -period  10.000 [get_ports PCIE_REFCLK1]
# F-Tile Ref Clock Channel 5 156.25MHz - Refclk #5
create_clock -name {QSFP0_REFCLK}         -period   6.400 [get_ports QSFP0_REFCLK]
# F-Tile Ref Clock Channel 2 100MHz - Refclk #2
create_clock -name {MCIO_REFCLK}          -period  10.000 [get_ports MCIO_REFCLK]
# F-Tile Ref Clock Channel 5 156.25MHz - Refclk #5
create_clock -name {QSFP1_REFCLK}         -period   6.400 [get_ports QSFP1_REFCLK]
# F-Tile Ref Clock Channel 2 100MHz - Refclk #2
create_clock -name {M2_REFCLK}            -period  10.000 [get_ports M2_REFCLK]
# F-Tile Ref Clock Channel 5 156.25MHz - Refclk #5
create_clock -name {QSFP2_REFCLK}         -period   6.400 [get_ports QSFP2_REFCLK]
# LVDS Clock (Single-Ended at FPGA).  Tested with a 125MHz external source
create_clock -name {EXT_SE_CLK}           -period   8.000 [get_ports EXT_SE_CLK]
# HBM2e (Lower) Reference Clock 100MHz
create_clock -name {HBM_REFCLK0}          -period  10.000 [get_ports HBM_REFCLK0]
# NoC Clock (Lower) 100MHz
create_clock -name {NOC_CLK0}             -period  10.000 [get_ports NOC_CLK0]
HBM2e (Lower) Fabric Clock 100MHz.  Must be connected to IOPLL to use.
create_clock -name {HBM_FBR_REFCLK0}      -period  10.000 [get_ports HBM_FBR_REFCLK0]
# HBM2e (Upper) Reference Clock 100MHz
create_clock -name {HBM_REFCLK1}          -period  10.000 [get_ports HBM_REFCLK1]
# NoC Clock (Upper) 100MHz
create_clock -name {NOC_CLK1}             -period  10.000 [get_ports NOC_CLK1]
HBM2e (Upper) Fabric Clock 100MHz.  Must be connected to IOPLL to use.
create_clock -name {HBM_FBR_REFCLK1}      -period  10.000 [get_ports HBM_FBR_REFCLK1]
# HPS DDR4 SDRAM Reference Clock 133.33MHz
create_clock -name {HPS_DDR4_REFCLK}      -period   7.500 [get_ports HPS_DDR4_REFCLK]
# HPS Reference Clock 25MHz
create_clock -name {HPS_CLK}              -period  40.000 [get_ports HPS_CLK]
# BMC Ingress SPI Clock 25MHz
create_clock -name {FPGA_IG_SPI_SCK}      -period  40.000 [get_ports FPGA_IG_SPI_SCK]

# 24MHz
create_clock -name {altera_reserved_tck} -period 24MHz {altera_reserved_tck}

#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty
set_clock_uncertainty -rise_from [get_clocks {USER_CLK0}] -rise_to [get_clocks {USER_CLK0}]  0.200
set_clock_uncertainty -rise_from [get_clocks {USER_CLK0}] -fall_to [get_clocks {USER_CLK0}]  0.100
set_clock_uncertainty -fall_from [get_clocks {USER_CLK0}] -rise_to [get_clocks {USER_CLK0}]  0.100
set_clock_uncertainty -fall_from [get_clocks {USER_CLK0}] -fall_to [get_clocks {USER_CLK0}]  0.200

set_clock_uncertainty -rise_from [get_clocks {USER_CLK1}] -rise_to [get_clocks {USER_CLK1}]  0.200
set_clock_uncertainty -rise_from [get_clocks {USER_CLK1}] -fall_to [get_clocks {USER_CLK1}]  0.100
set_clock_uncertainty -fall_from [get_clocks {USER_CLK1}] -rise_to [get_clocks {USER_CLK1}]  0.100
set_clock_uncertainty -fall_from [get_clocks {USER_CLK1}] -fall_to [get_clocks {USER_CLK1}]  0.200

set_clock_uncertainty -rise_from [get_clocks {HPS_DDR4_REFCLK}] -rise_to [get_clocks {HPS_DDR4_REFCLK}]  0.200
set_clock_uncertainty -rise_from [get_clocks {HPS_DDR4_REFCLK}] -fall_to [get_clocks {HPS_DDR4_REFCLK}]  0.100
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR4_REFCLK}] -rise_to [get_clocks {HPS_DDR4_REFCLK}]  0.100
set_clock_uncertainty -fall_from [get_clocks {HPS_DDR4_REFCLK}] -fall_to [get_clocks {HPS_DDR4_REFCLK}]  0.200

