package pack_a is
type op_type is (add, sub,mul,div);
end package pack_a;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use work.pack_a.all;
--------------------------------------------------------------------
ENTITY wide_alu IS 
PORT (x,y :in std_logic_vector (23 downto 0);
	sel : in op_type;
	z :out std_logic_vector (23 downto 0));
END ENTITY wide_alu;

ARCHITECTURE wide_1 of wide_alu IS 
	component alu
	port (a,b : in std_logic_vector (7 downto 0);
	op : in op_type;--control : in std_logic_vector (2 downto 0);
	c : out  std_logic_vector (7 downto 0));
end component alu;
--for slice gen: alu_34 use entity work.alu_34
	
	BEGIN
	gen_slice: for n in 0 to 2 generate
	--begin
	slice_gen : alu port map (x(7+n*8 downto n*8),
	y(7+n*8 downto n*8),
	sel,
	z(7+n*8 downto n*8));
end generate gen_slice;
END ARCHITECTURE wide_1;
