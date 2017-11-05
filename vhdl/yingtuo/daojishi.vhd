LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity daojishi is
	port(clk_1h:in std_logic; --1s
		
		c_state:in std_logic_vector(1 downto 0);
		nixie_1:out std_logic_vector(7 downto 0);
		nixie_2:out std_logic_vector(7 downto 0);
		gameover:out std_logic
		);
end daojishi;

architecture counter_1 of daojishi is
signal count_d:integer range 0 to 6;
signal count_o:integer range 0 to 9;
begin
	counting:
	process(clk_1h)
	begin
	if(c_state="00")then
		count_d<=6;
		count_o<=0;
		gameover <= '0';
	elsif(c_state="01")then
		if(clk_1h'event and clk_1h='1')then
			if(count_d=0 and count_o=0)then
			gameover<='1';
			elsif(count_o=0)then
			count_d<=count_d-1;
			count_o<=9;
			else
			count_o<=count_o-1;
			end if;
		end if;
	end if;
	end process;
	nixie_present:
	process(count_d,count_o)
	begin
	if(c_state="00")then
		nixie_1<="01101101";
		nixie_2<="01101111";
	elsif(c_state="10" or c_state="11")then
		
		case count_d is
			when 5=>nixie_1<="01101101";
			when 4=>nixie_1<="01100110";
			when 3=>nixie_1<="01001111";
			when 2=>nixie_1<="01011011";
			when 1=>nixie_1<="00000110";
			when 0=>nixie_1<="00111111";
			when others=>nixie_1<="00000000";
		end case;
		case count_o is
			when 9=>nixie_2<="01101111";
			when 8=>nixie_2<="01111111";
			when 7=>nixie_2<="00000111";
			when 6=>nixie_2<="01111101";
			when 5=>nixie_2<="01101101";
			when 4=>nixie_2<="01100110";
			when 3=>nixie_2<="01001111";
			when 2=>nixie_2<="01011011";
			when 1=>nixie_2<="00000110";
			when 0=>nixie_2<="00111111";
			when others=>nixie_2<="00000000";
		end case;
		
	elsif(c_state="01")then
		case count_d is
			when 5=>nixie_1<="01101101";
			when 4=>nixie_1<="01100110";
			when 3=>nixie_1<="01001111";
			when 2=>nixie_1<="01011011";
			when 1=>nixie_1<="00000110";
			when 0=>nixie_1<="00111111";
			when others=>nixie_1<="00000000";
		end case;
		case count_o is
			when 9=>nixie_2<="01101111";
			when 8=>nixie_2<="01111111";
			when 7=>nixie_2<="00000111";
			when 6=>nixie_2<="01111101";
			when 5=>nixie_2<="01101101";
			when 4=>nixie_2<="01100110";
			when 3=>nixie_2<="01001111";
			when 2=>nixie_2<="01011011";
			when 1=>nixie_2<="00000110";
			when 0=>nixie_2<="00111111";
			when others=>nixie_2<="00000000";
		end case;
		else null;
	end if;
	end process;
end counter_1;

