package pack_a is 
type op_type is (add , sub , mul ,div);
end package pack_a;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.pack_a.ALL;
use ieee.numeric_std.all;

ENTITY alu IS 
PORT (a,b : in std_logic_vector (7 downto 0);
	op :IN op_type;
	c : out std_logic_vector (7 downto 0));
END ENTITY alu;

ARCHITECTURE alu of alu IS BEGIN
	palu :PROCESS  (a ,b,op)
	variable temp : std_logic_vector (15 downto 0) := x"0000";
	
	BEGIN
	case op is 
	when add => c <= a+b;
	when sub => c <= a-b;
	when mul => temp := a*b; c<= temp (7 downto 0);
	when div => c <= std_logic_vector ( to_signed (to_integer (signed (a)/ signed (b)),8 ) );
	end case ;

END PROCESS palu;
END ARCHITECTURE alu;

