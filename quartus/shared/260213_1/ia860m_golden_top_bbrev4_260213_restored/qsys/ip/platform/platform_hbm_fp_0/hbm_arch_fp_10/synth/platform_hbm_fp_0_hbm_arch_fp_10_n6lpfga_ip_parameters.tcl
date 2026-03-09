# (C) 2001-2025 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files from any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera IP License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


#####################################################################
#
# THIS IS AN AUTO-GENERATED FILE!
# -------------------------------
# If you modify this files, all your changes will be lost if you
# regenerate the core!
#
# FILE DESCRIPTION
# ----------------
# This file specifies the timing properties of the memory device and
# of the memory interface

package require ::quartus::clock_uncertainty


set ::GLOBAL_platform_hbm_fp_0_hbm_arch_fp_10_n6lpfga_corename platform_hbm_fp_0_hbm_arch_fp_10_n6lpfga


set var(PHY_DEVICE_SPEEDGRADE)                                   "2 - change device under 'System'->'System Settings'"
set var(PHY_HBM_DEVICE_TYPE)                                     HBM_DEVICE_16GB_8HI
set var(PHY_MEMCLK_FREQ_MHZ)                                     1400
set var(PHY_REFCLK_FREQ_MHZ)                                     100

set var(C2P_SETUP_OC_NS)                                         0.000
set var(C2P_HOLD_OC_NS)                                          0.000
set var(P2C_SETUP_OC_NS)                                         0.000
set var(P2C_HOLD_OC_NS)                                          0.000
set var(C2C_SAME_CLK_SETUP_OC_NS)                                0.000
set var(C2C_SAME_CLK_HOLD_OC_NS)                                 0.000
set var(C2C_DIFF_CLK_SETUP_OC_NS)                                0.000
set var(C2C_DIFF_CLK_HOLD_OC_NS)                                 0.000
set var(C2C_TG_FALSE_PATH)                                       false
set var(C2P_P2C_PR)                                              false

initialize_clock_uncertainty_data
