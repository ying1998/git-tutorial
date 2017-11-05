LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


entity jifenqi1103 is
          port(r_row:in std_logic_vector(7 downto 0);   -- coloreggs 
               r_column:in std_logic_vector(7 downto 0); -- coloreggs
               in_row:in std_logic_vector(3 downto 0);  -- jianpan
               in_column:in std_logic_vector(3 downto 0); --jianpan
               catch:out std_logic);
end jifenqi1103;

architecture behavior of jifenqi1103 is
 signal  comin_row :std_logic_vector(7 downto 0);
 signal  comin_column  :std_logic_vector(7 downto 0);
 signal one_point :std_logic;
   begin
            process(r_row,r_column,in_row,in_column)       
               begin
               case in_row is
					when "0001"=>comin_row<="11111100";
					when "0010"=>comin_row<="11110011";
					when "0100"=>comin_row<="11001111";
					when "1000"=>comin_row<="00111111";
					when others =>comin_row<="00000000";
					end case;
				case in_column is 
					when "0001" => comin_column <="00000011";
					when "0010" => comin_column <="00001100";
					when "0100" => comin_column <="00110000";
					when "1000" => comin_column <="11000000";
					when others =>comin_column<="00000000";
				end case;
               if(r_row="00000000" or r_column="00000000" or comin_row="00000000" or comin_column="00000000") then
						one_point<='0';
                 elsif(r_row=comin_row and r_column= comin_column) then 
						one_point<='1';
                 else one_point<='0';
                 end if;
            end process;
            catch <= one_point;
end behavior;


