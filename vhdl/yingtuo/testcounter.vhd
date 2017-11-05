LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY testcounter is
	port (clk: in std_logic ;
		  clk_1kh:buffer std_logic;   -- sao miao 
		  clk_1hh:buffer std_logic;   -- xiaodou!!
		  clk_1h :buffer std_logic;   -- 1s 
		  clk_2hz :buffer std_logic);  --  0.5 s
end testcounter;

architecture counter_1 of testcounter is 
	signal counter_1kh:integer range 0 to 49999; -- divide into 1000Hz  
	signal counter_1hh:integer range 0 to 9;     -- divide into 100Hz
	signal counter_2hz:integer range 0 to 49 ; -- divide into 2 Hz
	signal counter_1h:integer range 0 to 1;	 -- divide into 1Hz
begin
	process(clk)
	begin
	if(rising_edge(clk)) then
		if(counter_1kh = 49999) then
			counter_1kh <= 0;
			clk_1kh<=not clk_1kh;
			if(counter_1hh = 9) then 
				counter_1hh <= 0;
				clk_1hh <= not clk_1hh;
				if(counter_2hz <= 49) then 
					counter_2hz <= 0;
					clk_2hz <= not clk_2hz;
						if (counter_1h <= 1)then 
							counter_1h <=0;
							clk_1h <= not clk_1h;
							else counter_1h <= counter_1h + 1;
							end if;
				else counter_2hz <= counter_2hz + 1;
				end if ;
			else counter_1hh <= counter_1hh + 1;
			end if ;
		else  counter_1kh <= counter_1kh + 1;
		end if ;
	end if;	
	end process;
end counter_1;
