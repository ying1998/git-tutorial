LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity defenjishu1103 is
     port(jg_catch :in std_logic;  -- out_point;
          p_state:in std_logic_vector(1 downto 0);
          point_out:out integer range 0 to 19;
          color_flag : buffer std_logic_vector(1 downto 0);  -- hen guan jian ooooo
          gameover:out std_logic);
end defenjishu1103;

architecture behavior of defenjishu1103 is
     signal point:integer range 0 to 19;
   begin
            process(jg_catch)
            begin
                   if(p_state="00") then point<=0;gameover<='0';
                   elsif(p_state="01") then
                         if(point=19) then gameover<='1';
                         elsif(jg_catch'event and jg_catch='1') then 
                         case color_flag is
							when "00" => point<= point + 2;  --red
							when "01" => point<= point + 1;  --green
							when "11" => point<= point + 3;  --yellow
							when others => point<= point + 3; --yellow
						end case;
							point<=point+1;
                         end if;
                   elsif(p_state="10") then gameover <= '1';
                   else gameover<='0';
                   end if;
            end process;
            process(jg_catch)
            begin
				case color_flag is
					when "00" => color_flag<="01";
					when "01" => color_flag<="11";
					when "11" => color_flag<="10";
					when "10" => color_flag<="00";
					when others => color_flag <= "00";
					end case;
			end process;
            point_out<=point;
end behavior;