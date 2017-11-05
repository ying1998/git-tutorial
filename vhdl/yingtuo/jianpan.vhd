LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


entity jianpan is
	port(clk_1kh :in std_logic; -- zan shi  wei 1000 hz  
		scan_column:out std_logic_vector(3 downto 0);
		row_input:in std_logic_vector(3 downto 0);  -- hang an jian shu ru
		row_output:out std_logic_vector(3 downto 0);
		column_output:out std_logic_vector(3 downto 0));	
end jianpan;
architecture behavior of jianpan is
	signal scan:std_logic_vector(3 downto 0);
	signal counter:integer range 0 to 4;
	signal i_clk:std_logic;
	begin
		counter_down:
		process(clk_1kh)
		begin
		if(clk_1kh'event and clk_1kh='1')then
			if(counter=4)then counter<=0;i_clk<=not i_clk;
			else counter<=counter+1;
			end if;
		end if;
		end process;
	scanning:
		process(i_clk)
		begin
			if(i_clk'event and i_clk='1')then
				case scan is
					when"0111"=>scan<="1011";
					when"1011"=>scan<="1101";
					when"1101"=>scan<="1110";
					when others=>scan<="0111";
				end case;
			end if;
		end process;
	scan_column<=scan;
	input:
		process(scan)
		begin
			if(row_input(3)='0')then row_output<="1000";column_output<=not scan;
			elsif(row_input(2)='0')then row_output<="0100";column_output<=not scan;
			elsif(row_input(1)='0')then row_output<="0010";column_output<=not scan;
			elsif(row_input(0)='0')then row_output<="0001";column_output<=not scan;
			end if;
		end process;
end behavior;

