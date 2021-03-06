
library ieee;
use ieee.std_logic_1164.all;

entity latch8 is
PORT(d: in bit_vector (7 downto 0);
     en,clk :in bit;
     q:out bit_vector (7 downto 0));
end entity latch8;

architecture struct of latch8 is
component latch4

  port (d: in bit_vector (3 downto 0);
         en,clk: in bit;
        q: out bit_vector (3 downto 0));
end component latch4;

for msb: latch4
 use entity work.latch4 (struct);
for lsb :latch4
use entity work.latch4 (struct);
begin
msb: latch4 port map (d(7 downto 4), en, clk,q(7 downto 4));
lsb: latch4 port map (d(3 downto 0), en, clk,q(3 downto 0));
end architecture struct;

library ieee;
use ieee.std_logic_1164.all;

entity latch8 is
PORT(d: in bit_vector (7 downto 0);
     en,clk :in bit;
     q:out bit_vector (7 downto 0));
end entity latch8;

architecture struct of latch8 is
component latch4

  port (d: in bit_vector (3 downto 0);
         en,clk: in bit;
        q: out bit_vector (3 downto 0));
end component latch4;

for msb: latch4
 use entity work.latch4 (struct);
for lsb :latch4
use entity work.latch4 (struct);
begin
msb: latch4 port map (d(7 downto 4), en, clk,q(7 downto 4));
lsb: latch4 port map (d(3 downto 0), en, clk,q(3 downto 0));
end architecture struct;

