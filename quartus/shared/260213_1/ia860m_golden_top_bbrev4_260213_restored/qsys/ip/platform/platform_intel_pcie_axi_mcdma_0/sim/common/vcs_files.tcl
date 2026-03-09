
namespace eval platform_intel_pcie_axi_mcdma_0 {
  proc get_memory_files {QSYS_SIMDIR QUARTUS_INSTALL_DIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/pf2int_funct.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/pf2int_funct.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/pf2int_funct.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/pf2int_funct.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/int_funct2dma_chan_pf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/int_funct2dma_chan_pf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/int_funct2dma_chan_pf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/int_funct2dma_chan_pf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/int_funct2dma_chan_vf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/int_funct2dma_chan_vf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/int_funct2dma_chan_vf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/int_funct2dma_chan_vf.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/dma_chan2funct.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/dma_chan2funct.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/dma_chan2funct.mif"
    lappend memory_files "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/dma_chan2funct.mif"
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR QUARTUS_INSTALL_DIR} {
    set design_files [dict create]
    dict set design_files "platform_intel_pcie_axi_mcdma_0_intel_pcie_axi_mcdma_300_xnmrdqa.sv" "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/platform_intel_pcie_axi_mcdma_0_intel_pcie_axi_mcdma_300_xnmrdqa.sv"         
    dict set design_files "intel_pcie_axi_mcdma_top.sv"                                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_top.sv"                                                 
    dict set design_files "altera_std_synchronizer_nocut.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/altera_std_synchronizer_nocut.sv"                               
    dict set design_files "intel_pcie_axi_mcdma_pkg.sv"                                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_pkg.sv"                                    
    dict set design_files "intel_pcie_axi_mcdma_axilite_arbiter.sv"                             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axilite_arbiter.sv"                        
    dict set design_files "intel_pcie_axi_mcdma_axilite_rr_scheduler.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axilite_rr_scheduler.sv"                   
    dict set design_files "intel_pcie_axi_mcdma_axis_register_pipeline.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axis_register_pipeline.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_axist_rr_scheduler.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axist_rr_scheduler.sv"                     
    dict set design_files "intel_pcie_axi_mcdma_axist_rr_scheduler_packet.sv"                   "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axist_rr_scheduler_packet.sv"              
    dict set design_files "intel_pcie_axi_mcdma_axist_rr_scheduler_simple.sv"                   "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axist_rr_scheduler_simple.sv"              
    dict set design_files "intel_pcie_axi_mcdma_binary_counter.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_binary_counter.sv"                         
    dict set design_files "intel_pcie_axi_mcdma_coherent_read_ram.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_coherent_read_ram.sv"                      
    dict set design_files "intel_pcie_axi_mcdma_credit_handler.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_credit_handler.sv"                         
    dict set design_files "intel_pcie_axi_mcdma_extractor_hip_reconfig.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_extractor_hip_reconfig.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_extractor_hip_reconfig_func.sv"                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_extractor_hip_reconfig_func.sv"            
    dict set design_files "intel_pcie_axi_mcdma_funct2qid_map.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_funct2qid_map.sv"                          
    dict set design_files "intel_pcie_axi_mcdma_int_funct2dma_chan_pf_table.sv"                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_int_funct2dma_chan_pf_table.sv"            
    dict set design_files "intel_pcie_axi_mcdma_int_funct2dma_chan_vf_table.sv"                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_int_funct2dma_chan_vf_table.sv"            
    dict set design_files "intel_pcie_axi_mcdma_pf2int_funct_table.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_pf2int_funct_table.sv"                     
    dict set design_files "intel_pcie_axi_mcdma_qid2funct_map.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_qid2funct_map.sv"                          
    dict set design_files "intel_pcie_axi_mcdma_quad_port_ram.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_quad_port_ram.sv"                          
    dict set design_files "intel_pcie_axi_mcdma_ram.sv"                                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_ram.sv"                                    
    dict set design_files "intel_pcie_axi_mcdma_ram_2wr_1rd.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_ram_2wr_1rd.sv"                            
    dict set design_files "intel_pcie_axi_mcdma_reset_sync.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_reset_sync.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_rx_demux.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_rx_demux.sv"                               
    dict set design_files "intel_pcie_axi_mcdma_sdp_ram.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_sdp_ram.sv"                                
    dict set design_files "intel_pcie_axi_mcdma_sdp_ram_fw.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_sdp_ram_fw.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_set_clr_rd.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_set_clr_rd.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_tdp_ram.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_tdp_ram.sv"                                
    dict set design_files "intel_pcie_axi_mcdma_tdp_ram_fw.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_tdp_ram_fw.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_tx_arbiter.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_tx_arbiter.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_txcpl_arbiter.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_txcpl_arbiter.sv"                          
    dict set design_files "intel_pcie_axi_mcdma_txreq_arbiter.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_txreq_arbiter.sv"                          
    dict set design_files "intel_pcie_axi_mcdma_bam_pkg.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_pkg.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_bam.sv"                                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam.sv"                                 
    dict set design_files "intel_pcie_axi_mcdma_bam_avmm_intf.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_avmm_intf.sv"                       
    dict set design_files "intel_pcie_axi_mcdma_bam_axilite.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite.sv"                         
    dict set design_files "intel_pcie_axi_mcdma_bam_axilite_cpl.sv"                             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite_cpl.sv"                     
    dict set design_files "intel_pcie_axi_mcdma_bam_axilite_intf.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite_intf.sv"                    
    dict set design_files "intel_pcie_axi_mcdma_bam_axilite_rw.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite_rw.sv"                      
    dict set design_files "intel_pcie_axi_mcdma_bam_aximm.sv"                                   "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm.sv"                           
    dict set design_files "intel_pcie_axi_mcdma_bam_aximm_cpl.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm_cpl.sv"                       
    dict set design_files "intel_pcie_axi_mcdma_bam_aximm_intf.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm_intf.sv"                      
    dict set design_files "intel_pcie_axi_mcdma_bam_aximm_rw.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm_rw.sv"                        
    dict set design_files "intel_pcie_axi_mcdma_bam_cmd_prepoc.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_cmd_prepoc.sv"                      
    dict set design_files "intel_pcie_axi_mcdma_bam_cpl.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_cpl.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_bam_rw.sv"                                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_rw.sv"                              
    dict set design_files "intel_pcie_axi_mcdma_bam_sch_intf.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_sch_intf.sv"                        
    dict set design_files "intel_pcie_axi_mcdma_bam_wrapper.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_wrapper.sv"                         
    dict set design_files "intel_pcie_axi_mcdma_bas_pkg.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_pkg.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_bas.sv"                                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas.sv"                                 
    dict set design_files "intel_pcie_axi_mcdma_bas_axis_cpl_parser.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_axis_cpl_parser.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_bas_axis_memrd_gen.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_axis_memrd_gen.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_bas_axis_memwr_gen.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_axis_memwr_gen.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_bas_data_buffer.sv"                             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_data_buffer.sv"                     
    dict set design_files "intel_pcie_axi_mcdma_bas_read.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_read.sv"                            
    dict set design_files "intel_pcie_axi_mcdma_bas_write.sv"                                   "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_write.sv"                           
    dict set design_files "intel_pcie_axi_mcdma_cs_pkg.sv"                                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_pkg.sv"                              
    dict set design_files "intel_pcie_axi_mcdma_cs.sv"                                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs.sv"                                  
    dict set design_files "intel_pcie_axi_mcdma_cs_att_buffer.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_att_buffer.sv"                       
    dict set design_files "intel_pcie_axi_mcdma_cs_cpl_parser.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_cpl_parser.sv"                       
    dict set design_files "intel_pcie_axi_mcdma_cs_regfile.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_regfile.sv"                          
    dict set design_files "intel_pcie_axi_mcdma_msi_cfg_extractor.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_msi_cfg_extractor.sv"                   
    dict set design_files "intel_pcie_axi_mcdma_msi_ctrl.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_msi_ctrl.sv"                            
    dict set design_files "intel_pcie_axi_mcdma_msi_pba_buffer.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_msi_pba_buffer.sv"                      
    dict set design_files "intel_pcie_axi_mcdma_app_error_intf.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_cplto_files/intel_pcie_axi_mcdma_app_error_intf.sv"                    
    dict set design_files "intel_pcie_axi_mcdma_cplto_intf.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_cplto_files/intel_pcie_axi_mcdma_cplto_intf.sv"                        
    dict set design_files "intel_pcie_axi_mcdma_error_intf.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_cplto_files/intel_pcie_axi_mcdma_error_intf.sv"                        
    dict set design_files "intel_pcie_axi_mcdma_csr_gcsr_pkg.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_gcsr_pkg.sv"                        
    dict set design_files "intel_pcie_axi_mcdma_csr_qcsr_pkg.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_qcsr_pkg.sv"                        
    dict set design_files "intel_pcie_axi_mcdma_csr.sv"                                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr.sv"                                 
    dict set design_files "intel_pcie_axi_mcdma_csr_decode.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_decode.sv"                          
    dict set design_files "intel_pcie_axi_mcdma_csr_gcsr.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_gcsr.sv"                            
    dict set design_files "intel_pcie_axi_mcdma_csr_qcsr.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_qcsr.sv"                            
    dict set design_files "intel_pcie_axi_mcdma_d2hdm.sv"                                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_data_buffer.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_data_buffer.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_desc_preproc.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_desc_preproc.sv"                
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_mm_desc_preproc.sv"                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_desc_preproc.sv"             
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_mm_data_mover.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_data_mover.sv"               
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_mm_header_gen.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_header_gen.sv"               
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_mm_read_master.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_read_master.sv"              
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_mwr_header_split.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mwr_header_split.sv"            
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_st_data_buffer.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_st_data_buffer.sv"              
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_st_data_mover.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_st_data_mover.sv"               
    dict set design_files "intel_pcie_axi_mcdma_d2hdm_st_header_gen.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_st_header_gen.sv"               
    dict set design_files "intel_pcie_axi_mcdma_dca_mapping_table.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_dca_files/intel_pcie_axi_mcdma_dca_mapping_table.sv"                   
    dict set design_files "intel_pcie_axi_mcdma_dca_mapping_table_c2f_buffer.sv"                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_dca_files/intel_pcie_axi_mcdma_dca_mapping_table_c2f_buffer.sv"        
    dict set design_files "intel_pcie_axi_mcdma_dca_mapping_table_f2c_buffer.sv"                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_dca_files/intel_pcie_axi_mcdma_dca_mapping_table_f2c_buffer.sv"        
    dict set design_files "intel_pcie_axi_mcdma_desc_cache.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/cache/intel_pcie_axi_mcdma_desc_cache.sv"             
    dict set design_files "intel_pcie_axi_mcdma_desc_cache_ram.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/cache/intel_pcie_axi_mcdma_desc_cache_ram.sv"         
    dict set design_files "intel_pcie_axi_mcdma_desc_prefetchcache.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/cache/intel_pcie_axi_mcdma_desc_prefetchcache.sv"     
    dict set design_files "intel_pcie_axi_mcdma_d2h_desc_fetch.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch.sv"               
    dict set design_files "intel_pcie_axi_mcdma_d2h_desc_fetch_completion.sv"                   "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_completion.sv"    
    dict set design_files "intel_pcie_axi_mcdma_d2h_desc_fetch_qreset.sv"                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_qreset.sv"        
    dict set design_files "intel_pcie_axi_mcdma_d2h_desc_fetch_request.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_request.sv"       
    dict set design_files "intel_pcie_axi_mcdma_d2h_desc_fetch_response.sv"                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_response.sv"      
    dict set design_files "intel_pcie_axi_mcdma_desc_fetch_avmm_arbiter.sv"                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_desc_fetch_avmm_arbiter.sv"      
    dict set design_files "intel_pcie_axi_mcdma_desc_fetch_avmm_rr_scheduler.sv"                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_desc_fetch_avmm_rr_scheduler.sv" 
    dict set design_files "intel_pcie_axi_mcdma_h2d_desc_fetch.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch.sv"               
    dict set design_files "intel_pcie_axi_mcdma_h2d_desc_fetch_priority_queue.sv"               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_priority_queue.sv"
    dict set design_files "intel_pcie_axi_mcdma_h2d_desc_fetch_qreset.sv"                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_qreset.sv"        
    dict set design_files "intel_pcie_axi_mcdma_h2d_desc_fetch_request.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_request.sv"       
    dict set design_files "intel_pcie_axi_mcdma_h2d_desc_fetch_response.sv"                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_response.sv"      
    dict set design_files "intel_pcie_axi_mcdma_flr_ctrl.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_ctrl.sv"                       
    dict set design_files "intel_pcie_axi_mcdma_flr_dch_mapper.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_dch_mapper.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_flr_intf.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_intf.sv"                       
    dict set design_files "intel_pcie_axi_mcdma_flr_pf_arbiter.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_pf_arbiter.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_flr_pfvf_arbiter.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_pfvf_arbiter.sv"               
    dict set design_files "intel_pcie_axi_mcdma_flr_rr_scheduler.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_rr_scheduler.sv"               
    dict set design_files "intel_pcie_axi_mcdma_flr_sch_mapper.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_sch_mapper.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_h2ddm.sv"                                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm.sv"                             
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_cpl_data.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_cpl_data.sv"                    
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_data_buffer.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_data_buffer.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_data_mover.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_data_mover.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_desc_fetch.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_desc_fetch.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_desc_fetch_cpl.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_desc_fetch_cpl.sv"              
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_desc_preproc.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_desc_preproc.sv"                
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_header_gen.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_header_gen.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_mm_data_mover.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_mm_data_mover.sv"               
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_mm_write_master.sv"                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_mm_write_master.sv"             
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_st_data_framer.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_framer.sv"              
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_st_data_mover.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_mover.sv"               
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_st_data_mover_cpl_align.sv"               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_mover_cpl_align.sv"     
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_st_data_mover_cpl_unalign.sv"             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_mover_cpl_unalign.sv"   
    dict set design_files "intel_pcie_axi_mcdma_h2ddm_st_data_packer.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_packer.sv"              
    dict set design_files "intel_pcie_axi_mcdma_rddm_pkg.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/rddm/intel_pcie_axi_mcdma_rddm_pkg.sv"                     
    dict set design_files "intel_pcie_axi_mcdma_rddm_data_aligner.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/rddm/intel_pcie_axi_mcdma_rddm_data_aligner.sv"            
    dict set design_files "intel_pcie_axi_mcdma_mailbox_pkg.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_pkg.sv"                     
    dict set design_files "intel_pcie_axi_mcdma_mailbox.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox.sv"                         
    dict set design_files "intel_pcie_axi_mcdma_mailbox_arbiter.sv"                             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_arbiter.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr.sv"                     
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_inbox.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_inbox.sv"               
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_outbox.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_outbox.sv"              
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_pf_ram.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_pf_ram.sv"              
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_pf_tdp_ram.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_pf_tdp_ram.sv"          
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_regfile.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_regfile.sv"             
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_regfile_pf.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_regfile_pf.sv"          
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_regfile_vf.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_regfile_vf.sv"          
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_vf_sdp_ram.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_vf_sdp_ram.sv"          
    dict set design_files "intel_pcie_axi_mcdma_mailbox_csr_vf_tdp_ram.sv"                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_vf_tdp_ram.sv"          
    dict set design_files "intel_pcie_axi_mcdma_mailbox_ctrl.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_ctrl.sv"                    
    dict set design_files "intel_pcie_axi_mcdma_mailbox_pf_arbiter.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_pf_arbiter.sv"              
    dict set design_files "intel_pcie_axi_mcdma_mailbox_pfvf_arbiter.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_pfvf_arbiter.sv"            
    dict set design_files "intel_pcie_axi_mcdma_mailbox_rr_scheduler.sv"                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_rr_scheduler.sv"            
    dict set design_files "intel_pcie_axi_mcdma_cpl_rob.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob.sv"                      
    dict set design_files "intel_pcie_axi_mcdma_cpl_rob_buffer.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_buffer.sv"               
    dict set design_files "intel_pcie_axi_mcdma_cpl_rob_header.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_header.sv"               
    dict set design_files "intel_pcie_axi_mcdma_cpl_rob_read.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_read.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_cpl_rob_rifo.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_rifo.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_cpl_rob_write.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_write.sv"                
    dict set design_files "intel_pcie_axi_mcdma_schd.sv"                                        "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_files/intel_pcie_axi_mcdma_schd.sv"                               
    dict set design_files "intel_pcie_axi_mcdma_schd_order.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_order.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_schd_piped_empty_calc.sv"                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_piped_empty_calc.sv"       
    dict set design_files "intel_pcie_axi_mcdma_schd_ram.sv"                                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_ram.sv"                    
    dict set design_files "intel_pcie_axi_mcdma_schd_scfifo.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_scfifo.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_bam_cdt_checker.sv"                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_bam_cdt_checker.sv"         
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_cdt_handler.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_cdt_handler.sv"             
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_delay.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_delay.sv"                   
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_ibuf.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_ibuf.sv"                    
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_ibuf_order_mngr.sv"                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_ibuf_order_mngr.sv"         
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_ibuf_rd_dns.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_ibuf_rd_dns.sv"             
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_obuf.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_obuf.sv"                    
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_obuf_order_mngr.sv"                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_obuf_order_mngr.sv"         
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_p_np_arb.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_p_np_arb.sv"                
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_parser.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_parser.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_stream.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_stream.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_tlp_decoder.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_tlp_decoder.sv"             
    dict set design_files "intel_pcie_axi_mcdma_schd_rx_valid_gen.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_valid_gen.sv"               
    dict set design_files "intel_pcie_axi_mcdma_schd_tx.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx.sv"                         
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_cdt_checker.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_cdt_checker.sv"             
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_invalidator.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_invalidator.sv"             
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_np_obuf.sv"                             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_np_obuf.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_np_order_mngr.sv"                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_np_order_mngr.sv"           
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_np_packer.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_np_packer.sv"               
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_pc_ibuf.sv"                             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_ibuf.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_pc_np_arb.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_np_arb.sv"               
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_pc_obuf.sv"                             "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_obuf.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_pc_order_mngr.sv"                       "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_order_mngr.sv"           
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_pc_order_mngr_rd.sv"                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_order_mngr_rd.sv"        
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_pc_order_mngr_wr.sv"                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_order_mngr_wr.sv"        
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_pc_packer.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_packer.sv"               
    dict set design_files "intel_pcie_axi_mcdma_schd_tx_seg_packer_4_to_2.sv"                   "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_seg_packer_4_to_2.sv"       
    dict set design_files "intel_pcie_axi_mcdma_msix_package.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_package.sv"                
    dict set design_files "intel_pcie_axi_mcdma_imm_memwr_arbiter.sv"                           "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_imm_memwr_arbiter.sv"           
    dict set design_files "intel_pcie_axi_mcdma_imm_memwr_gen.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_imm_memwr_gen.sv"               
    dict set design_files "intel_pcie_axi_mcdma_msix_flush_arbiter.sv"                          "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_flush_arbiter.sv"          
    dict set design_files "intel_pcie_axi_mcdma_msix_irq_arbiter.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_irq_arbiter.sv"            
    dict set design_files "intel_pcie_axi_mcdma_msix_irq_ctrl.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_irq_ctrl.sv"               
    dict set design_files "intel_pcie_axi_mcdma_msix_pba_ram.sv"                                "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_pba_ram.sv"                
    dict set design_files "intel_pcie_axi_mcdma_msix_table_ram.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_table_ram.sv"              
    dict set design_files "intel_pcie_axi_mcdma_status_arbiter.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_arbiter.sv"              
    dict set design_files "intel_pcie_axi_mcdma_status_avmm_arbiter.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_avmm_arbiter.sv"         
    dict set design_files "intel_pcie_axi_mcdma_status_avmm_rr_scheduler.sv"                    "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_avmm_rr_scheduler.sv"    
    dict set design_files "intel_pcie_axi_mcdma_status_ctrl.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_ctrl.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_status_pba.sv"                                  "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_pba.sv"                  
    dict set design_files "intel_pcie_axi_mcdma_status_proc.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_proc.sv"                 
    dict set design_files "intel_pcie_axi_mcdma_status_processor.sv"                            "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_processor.sv"            
    dict set design_files "intel_pcie_axi_mcdma_status_qreset.sv"                               "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_qreset.sv"               
    dict set design_files "intel_pcie_axi_mcdma_bridge.sv"                                      "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_bridge.sv"                                              
    dict set design_files "intel_pcie_axi_mcdma_dma.sv"                                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_dma.sv"                                                 
    dict set design_files "intel_pcie_axi_mcdma_qreset_arbiter.sv"                              "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_qreset_arbiter.sv"                                      
    dict set design_files "intel_pcie_axi_mcdma_qreset_ctrl.sv"                                 "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_qreset_ctrl.sv"                                         
    dict set design_files "intel_pcie_axi_mcdma_qreset_rr_scheduler.sv"                         "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_qreset_rr_scheduler.sv"                                 
    dict set design_files "intel_pcie_axi_mcdma_wrapper.sv"                                     "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_wrapper.sv"                                             
    dict set design_files "platform_intel_pcie_axi_mcdma_0.v"                                   "$QSYS_SIMDIR/platform_intel_pcie_axi_mcdma_0.v"                                                                           
    return $design_files
  }
  
  proc get_non_duplicate_elab_option {ELAB_OPTIONS NEW_ELAB_OPTION} {
    set IS_DUPLICATE [string first $NEW_ELAB_OPTION $ELAB_OPTIONS]
    if {$IS_DUPLICATE == -1} {
      return $NEW_ELAB_OPTION
    } else {
      return ""
    }
  }
  
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}
