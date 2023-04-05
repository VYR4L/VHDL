library ieee;
use ieee.std_logic_1164.all;

entity mux2x6 is
    port(
        c2_m: in std_logic_vector(5 downto 0);
        ek_m: in std_logic_vector(5 downto 0);
        sel_m: in bit;
        z_m: out std_logic_vector(5 downto 0)
        );
end entity;

architecture comuta of mux2x6 is

begin

    z_m <= c2_m when sel_m = '0' else ek_m;
end architecture;

