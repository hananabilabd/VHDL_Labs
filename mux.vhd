library ieee;
use ieee.std_logic_1164.all;

ENTITY mux IS 
PORT (a ,b,c,d :IN std_logic;
	s  : in std_logic_vector (1 downto 0);
	z : out std_logic);
END ENTITY mux;

ARCHITECTURE mux of mux IS BEGIN
	pmux :PROCESS  (a,b,c,d,s) is 
	
	BEGIN
	if s = "00" then z <= a;
	elsif s = "01" then z <= b;
	elsif s = "10" then z <= c;
	elsif s = "11" then z <= d;	
	Else z <=a;
	End IF ;
		

END PROCESS pmux;
END ARCHITECTURE mux;
