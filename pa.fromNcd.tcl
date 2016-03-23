
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name demo_atlys -dir "/home/jeffrey/projects/work/planAhead_run_4" -part xc6slx45csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/jeffrey/projects/work/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/jeffrey/projects/work} {ipcore_dir} {source/TDC/ipcore_dir} }
add_files [list {ipcore_dir/tri_mode_eth_mac_v5_4.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mac_fifo_axi4.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {source/TDC/ipcore_dir/hitFIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {source/TDC/ipcore_dir/hitRam.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "/home/jeffrey/projects/ipbus_2_0_v1/firmware/example_designs/ucf/atlys.ucf" [current_fileset -constrset]
add_files [list {/home/jeffrey/projects/ipbus_2_0_v1/firmware/example_designs/ucf/atlys.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "/home/jeffrey/projects/work/top.ncd"
if {[catch {read_twx -name results_1 -file "/home/jeffrey/projects/work/top.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/jeffrey/projects/work/top.twx\": $eInfo"
}
