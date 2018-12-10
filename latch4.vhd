library ieee;
use ieee.std_logic_1164.all;

ENTITY latch4 IS 
PORT (d :IN bit_vector(3 DOWNTO 0);
	en ,clk :IN bit;
	q  : OUT bit_vector (3 DOWNTO 0));
END ENTITY latch4;

ARCHITECTURE behav of latch4 IS BEGIN
	p2 :PROCESS  is 
	VARIABLE x : bit_vector( 3 DOWNTO 0);
	BEGIN
	IF en ='1' AND clk ='1' THEN 
	x :=d;
	END IF;
	q <=x;
WAIT ON d , en ,clk;
END PROCESS p2;
END ARCHITECTURE behav;

