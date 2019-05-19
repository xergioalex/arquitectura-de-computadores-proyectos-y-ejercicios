
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name RegisterFile -dir "C:/Users/Andres/Desktop/Entrega Arquitectura/RegisterFile/planAhead_run_1" -part xc5vlx110tff1136-1
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top RegisterFile $srcset
set_param project.paUcfFile  "C:/Users/Andres/Desktop/Entrega Arquitectura/RegisterFile/RegisterFile.ucf"
set hdlfile [add_files [list {RegisterFile.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "RegisterFile.ucf" -fileset [get_property constrset [current_run]]
add_files "XUPV5.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc5vlx110tff1136-1
