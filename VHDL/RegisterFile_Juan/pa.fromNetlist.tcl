
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name RegisterFile -dir "C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile/planAhead_run_2" -part xc6slx100fgg484-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile/Registe_File.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "Registe_File.ucf"
add_files "Registe_File.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
