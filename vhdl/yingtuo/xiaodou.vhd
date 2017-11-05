LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity xiaodou is
	port(clk_1hh :in std_logic; --100hz 
		idata_row:in std_logic_vector(3 downto 0);
		idata_column:in std_logic_vector(3 downto 0);
		odata_row:out std_logic_vector(3 downto 0);
		
		odata_column:out std_logic_vector(3 downto 0));
end xiaodou;

architecture behavior of xiaodou is
	type cache is array(2 downto 0) of std_logic_vector(3 downto 0);
	signal cache_row:cache;
	signal cache_column:cache;
begin
	process(clk_1hh)
	begin
		if(rising_edge(clk_1hh))then
			cache_row<=cache_row(1 downto 0)&idata_row;
			cache_column<=cache_column(1 downto 0)&idata_column;
		end if;
	end process;
	odata_row<=cache_row(0) and cache_row(1) and cache_row(2);
	odata_column<=cache_column(0) and cache_column(1) and cache_column(2);
end behavior;


