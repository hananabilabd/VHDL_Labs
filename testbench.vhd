library ieee;
use ieee.std_logic_1164.all;

ENTITY testbench IS 
END ENTITY testbench;



ARCHITECTURE test_dff of testbench IS 
	component dff 
	PORT (d ,clk : IN bit;
		q: out bit);
	END component dff;
	for dut : dff USE entity WORK.dff (behav);
	SIGNAL d_in ,d_out :bit;
	SIGNAL clock :bit;
	
	BEGIN
	dut : dff PORT MAP (d_in ,clock ,d_out);
	pd : process is BEGIN
	d_in <='1';
	clock <= '0';
	clock<='1';
	assert d_out = '1'
	REPORT "problem with capturing a 1 on rising edge"
	severity error;
	
	d_in <= '0';
	assert d_out = '1'
	REPORT "problem with No change"
	severity error;

	clock<='0';
	assert d_out = '1'
	REPORT "problem with No change"
	severity error;

	clock<='1';
	assert d_out = '0'
	REPORT "problem with capturing a 0 on rising edge"
	severity error;
	
	WAIT;


	
END PROCESS pd;
END ARCHITECTURE test_dff;

