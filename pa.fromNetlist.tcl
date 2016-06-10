
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name demo_atlys -dir "/home/Administrators/jeffrey/xilinx/work/planAhead_run_5" -part xc6slx45csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/Administrators/jeffrey/xilinx/work/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/Administrators/jeffrey/xilinx/work} {ipcore_dir} {source/TDC/ipcore_dir} }
add_files [list {ipcore_dir/tri_mode_eth_mac_v5_4.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mac_fifo_axi4.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {source/TDC/ipcore_dir/hitFIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {source/TDC/ipcore_dir/hitRam.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "atlys.ucf" [current_fileset -constrset]
add_files [list {atlys.ucf}] -fileset [get_property constrset [current_run]]
link_design
