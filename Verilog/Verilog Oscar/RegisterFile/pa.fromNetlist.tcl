
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name RegisterFile -dir "C:/Users/Andres/Desktop/Entrega Arquitectura/RegisterFile/planAhead_run_1" -part xc5vlx110tff1136-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Andres/Desktop/Entrega Arquitectura/RegisterFile/RegisterFile.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Andres/Desktop/Entrega Arquitectura/RegisterFile} }
set_param project.paUcfFile  "RegisterFile.ucf"
add_files "RegisterFile.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
