--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 12.4
--  \   \         Application : sch2hdl
--  /   /         Filename : Sumador_Cuatro_bits.vhf
-- /___/   /\     Timestamp : 11/27/2011 21:27:34
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\12.4\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family virtex5 -flat -suppress -vhdl Sumador_Cuatro_bits.vhf -w "C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile/Sumador_Cuatro_bits.sch"
--Design Name: Sumador_Cuatro_bits
--Device: virtex5
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Sumador_Cuatro_bits is
   port ( );
end Sumador_Cuatro_bits;

architecture BEHAVIORAL of Sumador_Cuatro_bits is
   signal XLXN_1              : std_logic;
   signal XLXN_2              : std_logic;
   signal XLXN_3              : std_logic;
   signal XLXN_4              : std_logic;
   signal XLXN_5              : std_logic;
   signal XLXN_6              : std_logic;
   signal XLXI_2_A_openSignal : std_logic;
   signal XLXI_2_B_openSignal : std_logic;
   signal XLXI_3_A_openSignal : std_logic;
   signal XLXI_3_B_openSignal : std_logic;
   signal XLXI_4_A_openSignal : std_logic;
   signal XLXI_4_B_openSignal : std_logic;
   component Sumador_Medio
      port ( Cin  : in    std_logic; 
             A    : in    std_logic; 
             B    : in    std_logic; 
             Cout : out   std_logic; 
             S    : out   std_logic);
   end component;
   
begin
   XLXI_1 : Sumador_Medio
      port map (A=>XLXN_5,
                B=>XLXN_6,
                Cin=>XLXN_4,
                Cout=>XLXN_1,
                S=>open);
   
   XLXI_2 : Sumador_Medio
      port map (A=>XLXI_2_A_openSignal,
                B=>XLXI_2_B_openSignal,
                Cin=>XLXN_1,
                Cout=>XLXN_2,
                S=>open);
   
   XLXI_3 : Sumador_Medio
      port map (A=>XLXI_3_A_openSignal,
                B=>XLXI_3_B_openSignal,
                Cin=>XLXN_2,
                Cout=>XLXN_3,
                S=>open);
   
   XLXI_4 : Sumador_Medio
      port map (A=>XLXI_4_A_openSignal,
                B=>XLXI_4_B_openSignal,
                Cin=>XLXN_3,
                Cout=>open,
                S=>open);
   
end BEHAVIORAL;


