package counterpackage is
component counter

port ( clk: in bit;
       q : out integer);
end component counter;
end package counterpackage;

use WORK.counterpackage.All;

entity counter_test is
end entity counter_test;

architecture testbench of counter_test is
for c: counter use entity work.counter(a);
signal clock : bit;
signal count_value :integer;
begin
c:counter port map(clk=> clock, q => count_value);
clk_gen : process is begin

wait for 5 ns;
if clock ='0' then
clock<='1';
else
clock <='0';
end if;
end process clk_gen;
end architecture testbench;
