
library ieee;
use ieee.std_logic_1164.all;

ENTITY latch4 IS 
PORT (d :IN bit_vector(3 DOWNTO 0);
	en ,clk :IN bit;
	q  : OUT bit_vector (3 DOWNTO 0));
END ENTITY latch4;

ARCHITECTURE struct of latch4 IS 
	component latch
	PORT(d , clk :IN bit;q ,nq : OUT bit);
	END component latch;
	for ALL : latch USE ENTITY WORK.latch (behav);

	component and2
	PORT(a,b:IN bit; c : OUT bit);
	END component and2;
	for gate : and2 USE ENTITY WORK.and2 (and2);
	SIGNAL int_clk :bit;
BEGIN
bit3 :latch
PORT MAP (d(3), int_clk,q(3));
bit2 :latch
PORT MAP (d(2), int_clk,q(2));
bit1 :latch
PORT MAP (d(1), int_clk,q(1));
bit0 :latch
PORT MAP (d(0), int_clk,q(0));
gate: and2
PORT MAP (en, clk,int_clk);
	

END ARCHITECTURE struct;
