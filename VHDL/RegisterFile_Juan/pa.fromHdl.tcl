
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name RegisterFile -dir "C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile/planAhead_run_5" -part xc5vlx110ff676-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top Registe_File $srcset
set_param project.paUcfFile  "Registe_File.ucf"
set hdlfile [add_files [list {Register.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Multiplexor.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Decodificador.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Registe_File.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
add_files "Registe_File.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc5vlx110ff676-3
