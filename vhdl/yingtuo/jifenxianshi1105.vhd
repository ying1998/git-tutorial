LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;




entity jifenxianshi1105 is
       port(points:in integer range 0 to 19;
               p_nixie_1:out std_logic_vector(7 downto 0);
               p_nixie_2:out std_logic_vector(7 downto 0));
end jifenxianshi1105;

architecture behavior of jifenxianshi1105 is
        begin
        process(points)
        begin
              case points is
        when 0=> p_nixie_1<="00111111";p_nixie_2<="00111111";
        when 1=> p_nixie_1<="00111111";p_nixie_2<="00000110";
        when 2=> p_nixie_1<="00111111";p_nixie_2<="01011011";
        when 3=> p_nixie_1<="00111111";p_nixie_2<="01001111";
        when 4=> p_nixie_1<="00111111";p_nixie_2<="01100110";
        when 5=> p_nixie_1<="00111111";p_nixie_2<="01101101";
        when 6=> p_nixie_1<="00111111";p_nixie_2<="01111101";
        when 7=> p_nixie_1<="00111111";p_nixie_2<="00000111";
        when 8=> p_nixie_1<="00111111";p_nixie_2<="01111111";
        when 9=> p_nixie_1<="00111111";p_nixie_2<="01101111";
        when 10=> p_nixie_1<="00000110";p_nixie_2<="00111111";
		when 11=> p_nixie_1<="00000110";p_nixie_2<="00000110";
		when 12=> p_nixie_1<="00000110";p_nixie_2<="01011011";
		when 13=> p_nixie_1<="00000110";p_nixie_2<="01001111";
		when 14=> p_nixie_1<="00000110";p_nixie_2<="01100110";
		when 15=> p_nixie_1<="00000110";p_nixie_2<="01101101";
		when 16=> p_nixie_1<="00000110";p_nixie_2<="01111101";
		when 17=> p_nixie_1<="00000110";p_nixie_2<="00000111";
		when 18=> p_nixie_1<="00000110";p_nixie_2<="01111111";
		when 19 => p_nixie_1<="00000110";p_nixie_2<="01101111";
        when others=> p_nixie_1<="00000000";p_nixie_2<="00000000";
        end case;
      end process;
end behavior;

