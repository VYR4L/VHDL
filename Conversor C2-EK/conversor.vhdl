library ieee;
use ieee.std_logic_1164.all;

entity conversor is 
		port(
			c : in std_logic_vector (5 downto 0);
            c2_c : out std_logic_vector (5 downto 0);
			ek_c : out std_logic_vector (5 downto 0)
		);
end entity;

architecture behavior of conversor is

begin
    c2_c(5 downto 0) <= c(5 downto 0);
    ek_c(5) <= (c(4) and not c(3) and not c(2) and not c(1) and not c(0));
	ek_c(4) <= (c(1) and not c(4)) or (c(2) and not c(4)) or (c(0) and not c(4)) or (c(3) and not c(4));
	ek_c(3) <= (not c(2) and not c(3) and not c(0) and not c(1)) or (c(2) and c(3)) or (c(1) and c(3)) or (c(3) and c(0)) or (not c(2));
	ek_c(2) <= (c(0) and c(2)) or (c(1) and c(0)) or (not c(1) and c(3) and not c(0) and not c(2)) or (not c(1) and not c(2) and not c(0));
	ek_c(1) <= (c(1) and c(2)) or (c(2) and c(3) and not c(1)) or (not c(1) and not c(2) and c(0)) or (not c(4) and not c(1) and not c(3) and not c(2));
	ek_c(0) <= (not c(1));
end architecture;
