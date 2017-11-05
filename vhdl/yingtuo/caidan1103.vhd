LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


entity caidan1103 is
	port(
	r_state:in std_logic_vector(1 downto 0);
	clk_1h: in std_logic;
	catch:in std_logic;
	row_out:buffer std_logic_vector(7 downto 0);  -- 2017/10/25  turn 3 to 7 ;  yingtuo
	column_out:buffer std_logic_vector(7 downto 0));  -- same above
end caidan1103;    -- 2017/10/25  xiu gai le wen jian ming
         
architecture behavioral of  caidan1103 is
	signal r_series:std_logic_vector(7 downto 0);
	begin
		process(catch,clk_1h) 
			begin 
			
			if (catch = '1') then  -- de fen
					case row_out is                            -- ban dao dian zhen mo kuai ba
						when"00000011"=>row_out<="11111011";
						when"00001100"=>row_out<="11101101";
						when"00110000"=>row_out<="10110111";
						when"11000000"=>row_out<="11011111";
						when    others=>row_out<="00000000";
						end case;
					case column_out is
						when"00000011"=>column_out<="00000100";
						when"00001100"=>column_out<="00010010";
						when"00110000"=>column_out<="01001000";
						when"11000000"=>column_out<="00100000";
						when    others=>column_out<="00000000";
						end case;
			elsif(clk_1h'event and clk_1h = '1') then   --  
					if(r_state="00")then
						r_series <= "10011010";
						row_out<= "00000000";   --  zi jian quan liang 
						column_out <= "11111111";
					elsif(r_state="01") then
						r_series <= r_series(6 downto 0)&(r_series(0)xor r_series(7));
							case r_series(1 downto 0)is
							when   "00"=>row_out<="11111100";
							when   "01"=>row_out<="11110011";
							when   "10"=>row_out<="11001111";
							when   "11"=>row_out<="00111111";
							when others=>row_out<="00000000";
						end case;
						case r_series(3 downto 2)is
							when  "00" =>column_out<="00000011";   -- as column_red/column_green
							when  "01" =>column_out<="00001100";
							when  "10" =>column_out<="00110000";
							when  "11" =>column_out<="11000000";
							when others=>column_out<="00000000";
						end case ;
			end if;		
			end if;
			end process; -- 2017/10/25 add "end process ;"  - yingtuo 
			
end behavioral;
		