library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all; 

entity Register_File is
    Port ( rs : in  STD_LOGIC_VECTOR (1 downto 0);
           dw : in  STD_LOGIC_VECTOR (3 downto 0);
           rw : in  STD_LOGIC_VECTOR (1 downto 0);
           rwe : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rt : in  STD_LOGIC_VECTOR (1 downto 0);
           crs : out  STD_LOGIC_VECTOR (3 downto 0);
           crt : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
end Register_File;

architecture Behavioral of Register_File is
	--Registros
	signal r0: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal r1: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal r2: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal r3: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');	
	
	--Multiplexor de 4 con registros de 4 bits
	component Multiplexor_2 is
		port( r0: in STD_LOGIC_VECTOR(3 downto 0);
				r1: in STD_LOGIC_VECTOR(3 downto 0);
				r2: in STD_LOGIC_VECTOR(3 downto 0);
				r3: in STD_LOGIC_VECTOR(3 downto 0);
				control: in STD_LOGIC_VECTOR(1 downto 0);
				salida: out STD_LOGIC_VECTOR(3 downto 0)
			  );	
	end component;
	
	--Decodificador de 4 registros
	component Decodificador is
		port( rw: in STD_LOGIC_VECTOR(1 downto 0);
				rwe: in STD_LOGIC;
				er0: out STD_LOGIC;
				er1: out STD_LOGIC;
				er2: out STD_LOGIC;
				er3: out STD_LOGIC				
			  );	
	end component;
	
	--Enable de los Registros
	signal er0: STD_LOGIC := '0';
	signal er1: STD_LOGIC := '0';
	signal er2: STD_LOGIC := '0';
	signal er3: STD_LOGIC := '0';
	
begin
	dec : Decodificador port map (rw,rwe,er0,er1,er2,er3);
	muxrs: Multiplexor_2 port map (r0,r1,r2,r3,rs,crs);
	muxrt: Multiplexor_2 port map (r0,r1,r2,r3,rt,crt);
	process(rs,dw,rw,rwe,clk,rt)		
	begin	
		
		if rising_edge(clk) then
			if er0='1' then r0 <= dw; end if;
			if er1='1' then r1 <= dw; end if;
			if er2='1' then r2 <= dw; end if;
			if er3='1' then r3 <= dw; end if;
		end if;			
		
	end process;
	
end Behavioral;

