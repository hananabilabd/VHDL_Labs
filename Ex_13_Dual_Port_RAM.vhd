LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY dual_port_ram IS
	GENERIC( n: positive := 4;
		     m: positive := 4);
	PORT (r, w: IN bit;
		  address_in: IN std_logic_vector (n-1 DOWNTO 0);
		  address_out: IN std_logic_vector (n-1 DOWNTO 0);    --OUT or IN ?????
		  d_in: IN std_logic_vector (m-1 DOWNTO 0); 
		  d_out: OUT std_logic_vector (m-1 DOWNTO 0));
END ENTITY dual_port_ram;

ARCHITECTURE behav OF dual_port_ram IS
BEGIN
	rm: PROCESS (r, w, address_in, address_out, d_in) IS
		TYPE rm IS ARRAY (0 TO 2**n-1) OF std_logic_vector (m-1 DOWNTO 0);
		VARIABLE word: rm;
	BEGIN
		IF w = '1' THEN
			word(conv_integer(address_in)) := d_in;
		END IF;
		IF r = '1' THEN
			d_out <= word(conv_integer(address_out));
		END IF;
	END PROCESS rm;
END ARCHITECTURE behav;