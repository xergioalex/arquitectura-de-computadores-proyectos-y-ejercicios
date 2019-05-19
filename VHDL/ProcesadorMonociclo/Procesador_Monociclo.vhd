library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador_Monociclo is
end Procesador_Monociclo;

architecture Behavioral of Procesador_Monociclo is	
	signal rs : STD_LOGIC_VECTOR (1 downto 0);
	signal dw : STD_LOGIC_VECTOR (3 downto 0);
	signal rw : STD_LOGIC_VECTOR (1 downto 0);
	signal rwe :  STD_LOGIC;
	signal clk :   STD_LOGIC;
	signal rt :  STD_LOGIC_VECTOR (1 downto 0);
	signal crs :  STD_LOGIC_VECTOR (3 downto 0);
	signal crt :  STD_LOGIC_VECTOR (3 downto 0);

	component Register_File is
		port( rs : in  STD_LOGIC_VECTOR (1 downto 0);
            dw : in  STD_LOGIC_VECTOR (3 downto 0);
            rw : in  STD_LOGIC_VECTOR (1 downto 0);
            rwe : in  STD_LOGIC;
            clk : in  STD_LOGIC;
            rt : in  STD_LOGIC_VECTOR (1 downto 0);
            crs : out  STD_LOGIC_VECTOR (3 downto 0);
            crt : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
	end component;
begin
	 --reg_file: Register_File port map(rs,dw,rw,rwe,clk,rt,crs,crt);

end Behavioral;

