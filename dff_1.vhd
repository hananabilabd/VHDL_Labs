library ieee;
use ieee.std_logic_1164.all;

ENTITY dff_1 IS 
PORT (d ,clk,rst :IN std_logic;
	q: out std_logic);
END ENTITY dff_1;

ARCHITECTURE behav of dff_1 IS 
	signal s_qout : std_logic;
begin
	PROCESS  (clk,rst) is 
	BEGIN
	if rst ='0' then
	s_qout <= '0';
	elsif rising_edge (clk) then
	s_qout <= d;
	end if ;

	
END PROCESS ;
q <= s_qout;
END ARCHITECTURE behav;

