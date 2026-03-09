
namespace eval platform_intel_pcie_axi_mcdma_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries intel_pcie_axi_mcdma_300        1
    dict set libraries platform_intel_pcie_axi_mcdma_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR QUARTUS_INSTALL_DIR} {
    set memory_files [list]
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/pf2int_funct.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/pf2int_funct.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/pf2int_funct.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/pf2int_funct.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/int_funct2dma_chan_pf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/int_funct2dma_chan_pf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/int_funct2dma_chan_pf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/int_funct2dma_chan_pf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/int_funct2dma_chan_vf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/int_funct2dma_chan_vf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/int_funct2dma_chan_vf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/int_funct2dma_chan_vf.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/dma_chan2funct.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/dma_chan2funct.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/dma_chan2funct.mif"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/dma_chan2funct.mif"]"
    return $memory_files
  }
  
  proc get_common_design_files {QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {QSYS_SIMDIR QUARTUS_INSTALL_DIR} {
    set design_files [list]
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/platform_intel_pcie_axi_mcdma_0_intel_pcie_axi_mcdma_300_xnmrdqa.sv"]\"   -end"         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_top.sv"]\"   -end"                                                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/altera_std_synchronizer_nocut.sv"]\"   -end"                               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_pkg.sv"]\"   -end"                                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axilite_arbiter.sv"]\"   -end"                        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axilite_rr_scheduler.sv"]\"   -end"                   
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axis_register_pipeline.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axist_rr_scheduler.sv"]\"   -end"                     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axist_rr_scheduler_packet.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_axist_rr_scheduler_simple.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_binary_counter.sv"]\"   -end"                         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_coherent_read_ram.sv"]\"   -end"                      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_credit_handler.sv"]\"   -end"                         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_extractor_hip_reconfig.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_extractor_hip_reconfig_func.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_funct2qid_map.sv"]\"   -end"                          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_int_funct2dma_chan_pf_table.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_int_funct2dma_chan_vf_table.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_pf2int_funct_table.sv"]\"   -end"                     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_qid2funct_map.sv"]\"   -end"                          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_quad_port_ram.sv"]\"   -end"                          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_ram.sv"]\"   -end"                                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_ram_2wr_1rd.sv"]\"   -end"                            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_reset_sync.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_rx_demux.sv"]\"   -end"                               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_sdp_ram.sv"]\"   -end"                                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_sdp_ram_fw.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_set_clr_rd.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_tdp_ram.sv"]\"   -end"                                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_tdp_ram_fw.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_tx_arbiter.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_txcpl_arbiter.sv"]\"   -end"                          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/common_files/intel_pcie_axi_mcdma_txreq_arbiter.sv"]\"   -end"                          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_pkg.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam.sv"]\"   -end"                                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_avmm_intf.sv"]\"   -end"                       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite.sv"]\"   -end"                         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite_cpl.sv"]\"   -end"                     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite_intf.sv"]\"   -end"                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_axilite_rw.sv"]\"   -end"                      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm.sv"]\"   -end"                           
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm_cpl.sv"]\"   -end"                       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm_intf.sv"]\"   -end"                      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_aximm_rw.sv"]\"   -end"                        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_cmd_prepoc.sv"]\"   -end"                      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_cpl.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_rw.sv"]\"   -end"                              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_sch_intf.sv"]\"   -end"                        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bam_files/intel_pcie_axi_mcdma_bam_wrapper.sv"]\"   -end"                         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_pkg.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas.sv"]\"   -end"                                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_axis_cpl_parser.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_axis_memrd_gen.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_axis_memwr_gen.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_data_buffer.sv"]\"   -end"                     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_read.sv"]\"   -end"                            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_bas_write.sv"]\"   -end"                           
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_pkg.sv"]\"   -end"                              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs.sv"]\"   -end"                                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_att_buffer.sv"]\"   -end"                       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_cpl_parser.sv"]\"   -end"                       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_cs_regfile.sv"]\"   -end"                          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_msi_cfg_extractor.sv"]\"   -end"                   
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_msi_ctrl.sv"]\"   -end"                            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_bas_files/intel_pcie_axi_mcdma_msi_pba_buffer.sv"]\"   -end"                      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_cplto_files/intel_pcie_axi_mcdma_app_error_intf.sv"]\"   -end"                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_cplto_files/intel_pcie_axi_mcdma_cplto_intf.sv"]\"   -end"                        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_cplto_files/intel_pcie_axi_mcdma_error_intf.sv"]\"   -end"                        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_gcsr_pkg.sv"]\"   -end"                        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_qcsr_pkg.sv"]\"   -end"                        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr.sv"]\"   -end"                                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_decode.sv"]\"   -end"                          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_gcsr.sv"]\"   -end"                            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_csr_files/intel_pcie_axi_mcdma_csr_qcsr.sv"]\"   -end"                            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_data_buffer.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_desc_preproc.sv"]\"   -end"                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_desc_preproc.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_data_mover.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_header_gen.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mm_read_master.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_mwr_header_split.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_st_data_buffer.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_st_data_mover.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_d2hdm_files/intel_pcie_axi_mcdma_d2hdm_st_header_gen.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_dca_files/intel_pcie_axi_mcdma_dca_mapping_table.sv"]\"   -end"                   
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_dca_files/intel_pcie_axi_mcdma_dca_mapping_table_c2f_buffer.sv"]\"   -end"        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_dca_files/intel_pcie_axi_mcdma_dca_mapping_table_f2c_buffer.sv"]\"   -end"        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/cache/intel_pcie_axi_mcdma_desc_cache.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/cache/intel_pcie_axi_mcdma_desc_cache_ram.sv"]\"   -end"         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/cache/intel_pcie_axi_mcdma_desc_prefetchcache.sv"]\"   -end"     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_completion.sv"]\"   -end"    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_qreset.sv"]\"   -end"        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_request.sv"]\"   -end"       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_d2h_desc_fetch_response.sv"]\"   -end"      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_desc_fetch_avmm_arbiter.sv"]\"   -end"      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_desc_fetch_avmm_rr_scheduler.sv"]\"   -end" 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_priority_queue.sv"]\"   -end"
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_qreset.sv"]\"   -end"        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_request.sv"]\"   -end"       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_desc_fetch_files/intel_pcie_axi_mcdma_h2d_desc_fetch_response.sv"]\"   -end"      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_ctrl.sv"]\"   -end"                       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_dch_mapper.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_intf.sv"]\"   -end"                       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_pf_arbiter.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_pfvf_arbiter.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_rr_scheduler.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_flr_ctrl_files/intel_pcie_axi_mcdma_flr_sch_mapper.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm.sv"]\"   -end"                             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_cpl_data.sv"]\"   -end"                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_data_buffer.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_data_mover.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_desc_fetch.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_desc_fetch_cpl.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_desc_preproc.sv"]\"   -end"                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_header_gen.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_mm_data_mover.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_mm_write_master.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_framer.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_mover.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_mover_cpl_align.sv"]\"   -end"     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_mover_cpl_unalign.sv"]\"   -end"   
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/intel_pcie_axi_mcdma_h2ddm_st_data_packer.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/rddm/intel_pcie_axi_mcdma_rddm_pkg.sv"]\"   -end"                     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_h2ddm_files/rddm/intel_pcie_axi_mcdma_rddm_data_aligner.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_pkg.sv"]\"   -end"                     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox.sv"]\"   -end"                         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_arbiter.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr.sv"]\"   -end"                     
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_inbox.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_outbox.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_pf_ram.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_pf_tdp_ram.sv"]\"   -end"          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_regfile.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_regfile_pf.sv"]\"   -end"          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_regfile_vf.sv"]\"   -end"          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_vf_sdp_ram.sv"]\"   -end"          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_csr_vf_tdp_ram.sv"]\"   -end"          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_ctrl.sv"]\"   -end"                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_pf_arbiter.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_pfvf_arbiter.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_mailbox_files/intel_pcie_axi_mcdma_mailbox_rr_scheduler.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob.sv"]\"   -end"                      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_buffer.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_header.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_read.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_rifo.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_reordering_files/intel_pcie_axi_mcdma_cpl_rob_write.sv"]\"   -end"                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_files/intel_pcie_axi_mcdma_schd.sv"]\"   -end"                               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_order.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_piped_empty_calc.sv"]\"   -end"       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_ram.sv"]\"   -end"                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_common_files/intel_pcie_axi_mcdma_schd_scfifo.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_bam_cdt_checker.sv"]\"   -end"         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_cdt_handler.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_delay.sv"]\"   -end"                   
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_ibuf.sv"]\"   -end"                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_ibuf_order_mngr.sv"]\"   -end"         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_ibuf_rd_dns.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_obuf.sv"]\"   -end"                    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_obuf_order_mngr.sv"]\"   -end"         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_p_np_arb.sv"]\"   -end"                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_parser.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_stream.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_tlp_decoder.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_rx_files/intel_pcie_axi_mcdma_schd_rx_valid_gen.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx.sv"]\"   -end"                         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_cdt_checker.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_invalidator.sv"]\"   -end"             
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_np_obuf.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_np_order_mngr.sv"]\"   -end"           
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_np_packer.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_ibuf.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_np_arb.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_obuf.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_order_mngr.sv"]\"   -end"           
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_order_mngr_rd.sv"]\"   -end"        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_order_mngr_wr.sv"]\"   -end"        
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_pc_packer.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_schd_tx_files/intel_pcie_axi_mcdma_schd_tx_seg_packer_4_to_2.sv"]\"   -end"       
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_package.sv"]\"   -end"                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_imm_memwr_arbiter.sv"]\"   -end"           
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_imm_memwr_gen.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_flush_arbiter.sv"]\"   -end"          
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_irq_arbiter.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_irq_ctrl.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_pba_ram.sv"]\"   -end"                
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_msix_table_ram.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_arbiter.sv"]\"   -end"              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_avmm_arbiter.sv"]\"   -end"         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_avmm_rr_scheduler.sv"]\"   -end"    
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_ctrl.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_pba.sv"]\"   -end"                  
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_proc.sv"]\"   -end"                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_processor.sv"]\"   -end"            
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/mcdma_status_ctrl_files/intel_pcie_axi_mcdma_status_qreset.sv"]\"   -end"               
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_bridge.sv"]\"   -end"                                              
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_dma.sv"]\"   -end"                                                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_qreset_arbiter.sv"]\"   -end"                                      
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_qreset_ctrl.sv"]\"   -end"                                         
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_qreset_rr_scheduler.sv"]\"   -end"                                 
    lappend design_files "-makelib intel_pcie_axi_mcdma_300 \"[normalize_path "$QSYS_SIMDIR/../intel_pcie_axi_mcdma_300/sim/intel_pcie_axi_mcdma_wrapper.sv"]\"   -end"                                             
    lappend design_files "-makelib platform_intel_pcie_axi_mcdma_0 \"[normalize_path "$QSYS_SIMDIR/platform_intel_pcie_axi_mcdma_0.v"]\"   -end"                                                                    
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
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}
