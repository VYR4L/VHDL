--modulo de negação para subtração
library ieee;
use ieee.std_logic_1164.all;
entity negacao is
    port(
        entrada: in std_logic_vector(11 downto 0 );
        nega: out std_logic_vector(11 downto 0)
    );
end entity;

architecture comuta of negacao is

begin
    nega(0) <= not(entrada(0)) after  4 ns;
    nega(1) <= not(entrada(1)) after  4 ns;
    nega(2) <= not(entrada(2)) after  4 ns;
    nega(3) <= not(entrada(3)) after  4 ns;
    nega(4) <= not(entrada(4)) after  4 ns;
    nega(5) <= not(entrada(5)) after  4 ns;
    nega(6) <= not(entrada(6)) after  4 ns;
    nega(7) <= not(entrada(7)) after  4 ns;
    nega(8) <= not(entrada(8)) after  4 ns;
    nega(9) <= not(entrada(9)) after  4 ns;
    nega(10) <= not(entrada(10)) after  4 ns;
    nega(11) <= not(entrada(11)) after  4 ns;
end architecture;
 
