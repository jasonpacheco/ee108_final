
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name final -dir "/afs/ir.stanford.edu/class/ee108/groups/14/final/planAhead_run_2" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/afs/ir.stanford.edu/class/ee108/groups/14/final/final_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/afs/ir.stanford.edu/class/ee108/groups/14/final} }
set_property target_constrs_file "final_top.ucf" [current_fileset -constrset]
add_files [list {final_top.ucf}] -fileset [get_property constrset [current_run]]
link_design
