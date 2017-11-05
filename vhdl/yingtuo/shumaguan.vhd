LIBRARY IEEE;
use ieee.std_logic_1164.all;
          
entity shumaguan is
	port(
	
	link_out_scan_nixie : out std_logic_vector(7 downto 0);
	link_clk_1kh :in std_logic;
	color_exchange : in std_logic_vector(2 downto 0);  --  wei shi xian 0.5 s 
	nixie_1 :in std_logic_vector(7 downto 0);
	nixie_2: in std_logic_vector(7 downto 0);
	p_nixie_1 :in std_logic_vector(7 downto 0);
	p_nixie_2 :in std_logic_vector(7 downto 0);
	out_nixie : out std_logic_vector(7 downto 0);
	state:in std_logic_vector(1 downto 0));
end shumaguan;
          
architecture behavior of shumaguan is
signal link_out_scan  :std_logic_vector(7 downto 0):="01111111";

begin
     nixie_scan:process(link_clk_1kh)
     begin
     if(link_clk_1kh'event and link_clk_1kh='1')then
     case state is
     when "00"=>
					 case color_exchange is
			 when "000" => 
				case link_out_scan is 
				 when"01111111"=>link_out_scan<="10111111"; out_nixie <= "01111111";
				 when"10111111"=>link_out_scan<="11011111";out_nixie <= "01111111";
				 when"11011111"=>link_out_scan<="11101111";out_nixie <= "01111111";
				 when"11101111"=>link_out_scan<="11110111";out_nixie <= "01111111";
				 when"11110111"=>link_out_scan<="11111011";out_nixie <= "01111111";
				 when"11111011"=>link_out_scan<="11111101";out_nixie <= "01111111";
				 when"11111101"=>link_out_scan<="11111110";out_nixie <= "01111111";
				 when others => link_out_scan<= "01111111";out_nixie <= "01111111";
				 end case;
				 
			 when "001" =>
				link_out_scan <= "11111111";			
			 when "010" =>
				case link_out_scan is 
				 when"01111111"=>link_out_scan<="10111111"; out_nixie <= "01111111";
				 when"10111111"=>link_out_scan<="11011111";out_nixie <= "01111111";
				 when"11011111"=>link_out_scan<="11101111";out_nixie <= "01111111";
				 when"11101111"=>link_out_scan<="11110111";out_nixie <= "01111111";
				 when"11110111"=>link_out_scan<="11111011";out_nixie <= "01111111";
				 when"11111011"=>link_out_scan<="11111101";out_nixie <= "01111111";
				 when"11111101"=>link_out_scan<="11111110";out_nixie <= "01111111";
				 when others => link_out_scan<= "01111111";out_nixie <= "01111111";
				 end case;
			 when "011" =>
				link_out_scan <= "11111111";	
			 when "100" =>
				case link_out_scan is 
				 when"01111111"=>link_out_scan<="10111111"; out_nixie <= "01111111";
				 when"10111111"=>link_out_scan<="11011111";out_nixie <= "01111111";
				 when"11011111"=>link_out_scan<="11101111";out_nixie <= "01111111";
				 when"11101111"=>link_out_scan<="11110111";out_nixie <= "01111111";
				 when"11110111"=>link_out_scan<="11111011";out_nixie <= "01111111";
				 when"11111011"=>link_out_scan<="11111101";out_nixie <= "01111111";
				 when"11111101"=>link_out_scan<="11111110";out_nixie <= "01111111";
				 when others => link_out_scan<= "01111111";out_nixie <= "01111111";
				 end case;
			 when "111" =>
					link_out_scan <= "11111111";	
			 when others => 
					link_out_scan <= "11111111";	
			 end case;
     when "01"=>
				case link_out_scan is 
				 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
				 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
				 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
				 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
				 end case;
     when "10"=>
					case color_exchange is
					when "000" =>  -- y
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "001" =>  --n
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= "00000000"; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= "00000000";  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "010" => --y
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "011" => --n
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= "00000000"; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= "00000000";  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "100" => --y 
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "101" => --n
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= "00000000"; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= "00000000";  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "110" => --y
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when others=> --n
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= "00000000"; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= "00000000";  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					end case;
					
     when "11"=>
				case color_exchange is
					when "000" =>  -- y
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "001" =>  --n
						case link_out_scan is 
						when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= "00000000";   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= "00000000";   -- dao ji shi ge wei 
						 end case;
					when "010" => --y
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "011" => --n
						case link_out_scan is 
						when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= "00000000";   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= "00000000";   -- dao ji shi ge wei 
						 end case;
					when "100" => --y 
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when "101" => --n
						case link_out_scan is 
						when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= "00000000";   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= "00000000";   -- dao ji shi ge wei 
						 end case;
					when "110" => --y
						case link_out_scan is 
						 when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						 when"11111101"=>link_out_scan<="11111110";out_nixie <= nixie_1;   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= nixie_2;   -- dao ji shi ge wei 
						 end case;
					when others=> --n
						case link_out_scan is 
						when"01111111"=>link_out_scan<="10111111"; out_nixie <= p_nixie_1; --  ji fen shiwei
						 when"10111111"=>link_out_scan<="11111101";out_nixie <= p_nixie_2;  -- ji fen gewei
						  when"11111101"=>link_out_scan<="11111110";out_nixie <= "00000000";   -- dao ji shi shiwei
						 when others => link_out_scan<= "01111111";out_nixie <= "00000000";   -- dao ji shi ge wei 
						 end case;
					end case;
     end case;
     -------------------------------------------------
	end if;
     end process;
         link_out_scan_nixie  <=link_out_scan;
end behavior;