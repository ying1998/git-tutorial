LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;



entity testdianzhen is
     port(s_state:in std_logic_vector(1 downto 0);
        r_row:in std_logic_vector(7 downto 0); --  randomborn in 
        r_column:in std_logic_vector(7 downto 0); -- randomborn in 
         -- 1s / 2s signal
		clk_1kh: in std_logic; -- scan signal
		color_exchange : in std_logic_vector (2 downto 0);
		color_flag :in std_logic_vector(1 downto 0);
        column_red:out std_logic_vector(7 downto 0);
        column_green:out std_logic_vector(7 downto 0);
		row_scanning:out std_logic_vector(7 downto 0));
		
end testdianzhen;
  
architecture behavior of testdianzhen is
    signal temp_row_scanning:std_logic_vector(7 downto 0);
    -- signal color_exchange :std_logic_vector (2 downto 0):="000";  fang zai kong zhi mo kuai ba 
       begin
       process(clk_1kh)
   begin
if(clk_1kh'event and clk_1kh='1')then  
        
	-- 开机动画显示（要改）
	case  s_state  is
	when "00" =>
		 case color_exchange is
				when "000" =>-- red
					case temp_row_scanning is 
						when"11111111"=>temp_row_scanning<="01111111";column_green<="00000000";column_red<="11111111";
						when"01111111"=>temp_row_scanning<="10111111";column_green<="00000000";column_red<="11111111";
						when"10111111"=>temp_row_scanning<="11011111";column_green<="00000000";column_red<="11111111";
						when"11011111"=>temp_row_scanning<="11101111";column_green<="00000000";column_red<="11111111";
						when"11101111"=>temp_row_scanning<="11110111";column_green<="00000000";column_red<="11111111";
						when"11110111"=>temp_row_scanning<="11111011";column_green<="00000000";column_red<="11111111";
						when"11111011"=>temp_row_scanning<="11111101";column_green<="00000000";column_red<="11111111";
						when"11111101"=>temp_row_scanning<="11111110";column_green<="00000000";column_red<="11111111";
						when others=>temp_row_scanning<="11111111";column_green<="00000000";column_red<="00000000";
						end case;
				when "001" =>-- ximie
					case temp_row_scanning is
						when"11111111"=>temp_row_scanning<="01111111";column_green<="00000000";column_red<="00000000";
						when"01111111"=>temp_row_scanning<="10111111";column_green<="00000000";column_red<="00000000";
						when"10111111"=>temp_row_scanning<="11011111";column_green<="00000000";column_red<="00000000";
						when"11011111"=>temp_row_scanning<="11101111";column_green<="00000000";column_red<="00000000";
						when"11101111"=>temp_row_scanning<="11110111";column_green<="00000000";column_red<="00000000";
						when"11110111"=>temp_row_scanning<="11111011";column_green<="00000000";column_red<="00000000";
						when"11111011"=>temp_row_scanning<="11111101";column_green<="00000000";column_red<="00000000";
						when"11111101"=>temp_row_scanning<="11111110";column_green<="00000000";column_red<="00000000";
						when others=>temp_row_scanning<="11111111";column_green<="00000000";column_red<="00000000";
						end case;
				when "010" => --green
						case temp_row_scanning is
						when"11111111"=>temp_row_scanning<="01111111";column_green<="11111111";column_red<="00000000";
						when"01111111"=>temp_row_scanning<="10111111";column_green<="11111111";column_red<="00000000";
						when"10111111"=>temp_row_scanning<="11011111";column_green<="11111111";column_red<="00000000";
						when"11011111"=>temp_row_scanning<="11101111";column_green<="11111111";column_red<="00000000";
						when"11101111"=>temp_row_scanning<="11110111";column_green<="11111111";column_red<="00000000";
						when"11110111"=>temp_row_scanning<="11111011";column_green<="11111111";column_red<="00000000";
						when"11111011"=>temp_row_scanning<="11111101";column_green<="11111111";column_red<="00000000";
						when"11111101"=>temp_row_scanning<="11111110";column_green<="11111111";column_red<="00000000";
						when others=>temp_row_scanning<="11111111";column_green<="00000000";column_red<="00000000";
					  end case;
				when "011" => -- ximie
						case temp_row_scanning is
						when"11111111"=>temp_row_scanning<="01111111";column_green<="00000000";column_red<="00000000";
						when"01111111"=>temp_row_scanning<="10111111";column_green<="00000000";column_red<="00000000";
						when"10111111"=>temp_row_scanning<="11011111";column_green<="00000000";column_red<="00000000";
						when"11011111"=>temp_row_scanning<="11101111";column_green<="00000000";column_red<="00000000";
						when"11101111"=>temp_row_scanning<="11110111";column_green<="00000000";column_red<="00000000";
						when"11110111"=>temp_row_scanning<="11111011";column_green<="00000000";column_red<="00000000";
						when"11111011"=>temp_row_scanning<="11111101";column_green<="00000000";column_red<="00000000";
						when"11111101"=>temp_row_scanning<="11111110";column_green<="00000000";column_red<="00000000";
						when others=>temp_row_scanning<="11111111";column_green<="00000000";column_red<="00000000";
						end case;
				when "100" => -- yellow
					  case temp_row_scanning is
						when"11111111"=>temp_row_scanning<="01111111";column_green<="11111111";column_red<="11111111";
						when"01111111"=>temp_row_scanning<="10111111";column_green<="11111111";column_red<="11111111";
						when"10111111"=>temp_row_scanning<="11011111";column_green<="11111111";column_red<="11111111";
						when"11011111"=>temp_row_scanning<="11101111";column_green<="11111111";column_red<="11111111";
						when"11101111"=>temp_row_scanning<="11110111";column_green<="11111111";column_red<="11111111";
						when"11110111"=>temp_row_scanning<="11111011";column_green<="11111111";column_red<="11111111";
						when"11111011"=>temp_row_scanning<="11111101";column_green<="11111111";column_red<="11111111";
						when"11111101"=>temp_row_scanning<="11111110";column_green<="11111111";column_red<="11111111";
						when others=>temp_row_scanning<="11111111";column_green<="00000000";column_red<="00000000";
					  end case;
				when "111" => --daiji
						case temp_row_scanning is
						when"11111111"=>temp_row_scanning<="01111111";column_green<="00000000";column_red<="00000000";
						when"01111111"=>temp_row_scanning<="10111111";column_green<="00000000";column_red<="00000000";
						when"10111111"=>temp_row_scanning<="11011111";column_green<="00000000";column_red<="00000000";
						when"11011111"=>temp_row_scanning<="11101111";column_green<="00000000";column_red<="00000000";
						when"11101111"=>temp_row_scanning<="11110111";column_green<="00000000";column_red<="00000000";
						when"11110111"=>temp_row_scanning<="11111011";column_green<="00000000";column_red<="00000000";
						when"11111011"=>temp_row_scanning<="11111101";column_green<="00000000";column_red<="00000000";
						when"11111101"=>temp_row_scanning<="11111110";column_green<="00000000";column_red<="00000000";
						when others=>temp_row_scanning<="11111111";column_green<="00000000";column_red<="00000000";
						end case;
				when others => column_green<="00000000";column_red<="00000000"; --daiji
		end case;
	when "01" =>   -- game begin
				case temp_row_scanning is
						when"11111111"=>temp_row_scanning<="00111111";
						when"00111111"=>temp_row_scanning<="11001111";
						when"11001111"=>temp_row_scanning<="11110011";
						when"11110011"=>temp_row_scanning<="11111100";
						when"11111100"=>temp_row_scanning<="11111011";
						-- above is for color eggs 
						when"11111011"=>temp_row_scanning<="11101101";
						when"11101101"=>temp_row_scanning<="10110111";
						when"10110111"=>temp_row_scanning<="11011111";
						when"11011111"=>temp_row_scanning<="11111111";
						-- above is for spark station
						when others=>temp_row_scanning<="11111111";column_green<="00000000";column_red<="00000000";
						end case;
					if(temp_row_scanning = r_row )then 
						if (color_flag ="00") then  --  00 :red 
							column_red <= r_column; 
							column_green <= "00000000";
						elsif (color_flag = "01")then -- 01 :green
							column_green <= r_column;
							 column_red <="00000000";
						else
							column_red <= r_column;   -- 11/10 :yellow
							column_green <= r_column;
						end if;
					else 
						column_red <="00000000";
						column_green <= "00000000";
					end if;
		---------------------------------------------------
		
	when "10" =>   -- success
			case temp_row_scanning is
			when"11111111"=>temp_row_scanning<="01111111";column_green<="10000001";column_red<="00000000";
			when"01111111"=>temp_row_scanning<="10111111";column_green<="10000001";column_red<="01100110";
			when"10111111"=>temp_row_scanning<="11011111";column_green<="10000001";column_red<="01100110";
			when"11011111"=>temp_row_scanning<="11101111";column_green<="10000001";column_red<="00100100";
			when"11101111"=>temp_row_scanning<="11110111";column_green<="10000001";column_red<="00100100";
			when"11110111"=>temp_row_scanning<="11111011";column_green<="10000001";column_red<="00100100";
			when"11111011"=>temp_row_scanning<="11111101";column_green<="10000001";column_red<="00111100";
			when others=>temp_row_scanning<="11111111";column_green<="00000000";
			end case;
	when "11" =>   -- fall
		case temp_row_scanning is
		when"11111111"=>temp_row_scanning<="01111111";column_green<="00000000";column_red<="00000000";
		when"01111111"=>temp_row_scanning<="10111111";column_green<="00000000";column_red<="01000100";
		when"10111111"=>temp_row_scanning<="11011111";column_green<="00000000";column_red<="00101000";
		when"11011111"=>temp_row_scanning<="11101111";column_green<="00000000";column_red<="00010000";
		when"11101111"=>temp_row_scanning<="11110111";column_green<="00000000";column_red<="00101000";
		when"11110111"=>temp_row_scanning<="11111011";column_green<="00000000";column_red<="01000100";
		when"11111011"=>temp_row_scanning<="11111101";column_green<="00000000";column_red<="00000000";
		when others=>temp_row_scanning<="11111111";column_green<="00000000";
		end case;
	end case;
 --- ---- -- -- --- -- - - - 
   
 end if;
end process;
row_scanning <= temp_row_scanning;
end behavior;