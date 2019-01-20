library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL; -- for the conv_integer function
use ieee.std_logic_textio.ALL;
USE std.textio.ALL;

entity rom is
GENERIC ( n : integer := 3;
	m: integer := 6);
	port (addr : IN std_logic_vector (n-1 DOWNTO 0);
	enable : IN bit;
	data : out std_logic_vector ( m-1 DOWNTO 0));
	END ENTITY rom;

architecture function_arch of rom is 
type rm is array ( 0 to 2**n-1) of std_logic_vector ( m-1 DOWNTO 0);

FUNCTION rom_fill RETURN rm IS
	VARIABLE memory: rm;
	FILE f: text OPEN READ_MODE IS "rom.txt";
	VARIABLE l: line;
BEGIN
	FOR index IN memory'range LOOP
		readline(f, l);
		read(l, memory(index));
	END LOOP;
	RETURN memory;
END FUNCTION rom_fill;
constant word : rm := rom_fill;
begin
memory : process (enable ,addr) is begin
if enable = '1' then
data <= word (conv_integer(addr));
else
data <= (others => 'Z');
end if ;
end process memory;
end architecture function_arch;