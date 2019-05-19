
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name algoc -dir "C:/Users/XergioAleX/Documents/Xilinx Projects/algoc/planAhead_run_2" -part xc5vlx30ff324-1
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top algoc $srcset
set_param project.paUcfFile  "algoc.ucf"
set hdlfile [add_files [list {algoc.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "algoc.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc5vlx30ff324-1
