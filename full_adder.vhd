library ieee;
use ieee.std_logic_1164.all;

ENTITY full_adder IS 
PORT (a ,b, c_in :IN bit;
	s , c_out : out bit);
END ENTITY full_adder;

ARCHITECTURE fa of full_adder IS BEGIN
	pa :PROCESS  (a,b,c_in) is 
	variable input : bit_vector (0 to 2);
	variable output : bit_vector (0 to 1);
	BEGIN
	input := a &b & c_in;
	case input is 
	when "000" =>  output := "00";
	when "001" =>  output := "10";
	when "010" =>  output := "10";
	when "011" =>  output := "01";
	when "100" =>  output := "10";
	when "101" =>  output := "01";
	when "110" =>  output := "00";
	when "111" =>  output := "11";

	end case ;
	s <= output (0);
	c_out <=output(1);

		

END PROCESS pa;
END ARCHITECTURE fa;
