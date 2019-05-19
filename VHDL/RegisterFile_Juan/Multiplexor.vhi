
-- VHDL Instantiation Created from source file Multiplexor.vhd -- 15:58:26 11/28/2011
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Multiplexor
	PORT(
		Q0 : IN std_logic_vector(3 downto 0);
		Q1 : IN std_logic_vector(3 downto 0);
		Q2 : IN std_logic_vector(3 downto 0);
		Q3 : IN std_logic_vector(3 downto 0);
		R_Mux : IN std_logic_vector(1 downto 0);          
		Cr : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_Multiplexor: Multiplexor PORT MAP(
		Q0 => ,
		Q1 => ,
		Q2 => ,
		Q3 => ,
		R_Mux => ,
		Cr => 
	);


