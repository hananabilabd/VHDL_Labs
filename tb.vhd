------------------IEEE Libraries-----------
library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;
---------------TB Entity---------------------
ENTITY tb_comb_42 IS 
end entity tb_comb_42;
-----------------------Tb Architecture -----------------------
architecture test_dff of tb_comb_42 is 
----------------DFF Instance (DUT)-------------------------
component dff_1
 PORT (d ,clk ,rst  :IN std_logic ; q:out std_logic);
end component dff_1;
for dut: dff_1 use entity work.dff_1 (behav);

---------Declaring Signals ---------------------
signal d_in ,rst,q_out : std_logic;
signal clock : std_logic;
begin
--------------------port Mapping---------------------
dut : dff_1 port map (d_in, clock ,rst ,q_out);
process is 
----------------File Open-----------------
file file_test : text open read_mode is "test_vectors_dff.txt";
file file_output : text open write_mode is "output_dff.txt";
------------------Declaring Variables -------------------
variable l: line;
variable ol: line;
variable clock_in_file,rst_in_file: std_logic;
variable d_in_file,q_out_file: std_logic;
variable pause: time;
variable message: string(1 to 5);
variable o_message: string(1 to 7) := "qout = ";
variable o_q_out : std_logic;

begin
-------------------Initializing Inputs----------------
d_in <= '1';clock <= '0' ; rst <= '1'; --wait for 15 ns
----------------------- Loop to read from file ------------------
while not endfile (file_test) loop
	readline (file_test,l);
	read (l , d_in_file);
	read (l , clock_in_file);
	read (l , rst_in_file);
	read (l , pause);
	read (l , q_out_file);
	read (l , message);
---------------------Assigning imported values to DUT signals--------
d_in <= d_in_file ; clock <= clock_in_file; rst <= rst_in_file;

-------------------------Writing output to file --------------
	write (ol,o_message);
	write (ol ,q_out);
	writeline (file_output ,ol);
-----------------Wait and assert statement for debugging ------
	wait for pause ;
	assert q_out = q_out_file;
	report message
	severity error ;
	end loop ;
----------------- Closing Files ----------------
	file_close (file_test);	
	file_close (file_output);
	wait ;
	end process ;
	end architecture test_dff;


