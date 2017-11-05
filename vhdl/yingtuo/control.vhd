LIBRARY IEEE;
use ieee.std_logic_1164.all;
entity control is
	port(ctr_time_counter:in std_logic;  --time flag
	ctr_point_counter:in std_logic;       -- point flag
	reset:in std_logic;
	BTN7 :in std_logic;
	clk_2h :in std_logic;
	color_exchange : out std_logic_vector(2 downto 0);
	state:buffer std_logic_vector(1 downto 0));
end control;

architecture behavior of control is
signal c_exchange : std_logic_vector(2 downto 0):="000";
	begin
		process(reset,BTN7,ctr_time_counter,ctr_point_counter)
		begin
		if(reset='1')then 
		state<="00";
			--daiji
		elsif(ctr_point_counter='1'AND ctr_point_counter='0') then
		state<="10"; --success
		elsif(ctr_time_counter='1' AND ctr_point_counter='0') then
		state<="11"; --fall
		elsif ( BTN7= '1') then
		state<="01"; --begin
		else 
		state <= "01";
		end if;
		end process;
		
		---
		process (clk_2h)
			begin
			if(clk_2h'event and clk_2h = '1' )then  -- 0.5 s 
				if(state = "00" )then 
					case c_exchange is
						when "000" =>c_exchange<= "001";
						when "001" =>c_exchange<= "010";
						when "010" =>c_exchange<= "011";
						when "011" =>c_exchange<= "100";
						when "100" =>c_exchange<= "111";
						when others =>c_exchange<= "111";
					end case;
				elsif (state = "10" or state = "11")then
						case c_exchange is
						when "000" =>c_exchange<= "001";
						when "001" =>c_exchange<= "010";
						when "010" =>c_exchange<= "011";
						when "011" =>c_exchange<= "100";
						when "100" =>c_exchange<= "101";
						when "101" =>c_exchange<= "110";
						when "110" =>c_exchange<= "111";
						when others=>c_exchange<= "000";
						end case;
				end if;
				end if;
			end process;
		color_exchange <=  c_exchange;
		
end behavior;
