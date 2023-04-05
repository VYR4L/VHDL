library ieee;
use ieee.std_logic_1164.all;
entity mux2x12 is
    port(
        C0: in std_logic_vector(11 downto 0 ); 
        C1: in std_logic_vector(11 downto 0 ); 
        Sel: in std_logic;
        Z: out std_logic_vector(11 downto 0)
);
end entity;

architecture comuta of Mux2x12 is
begin
    Z <= C0 when Sel = '0' else 
    C1 when Sel = '1' else "ZZZZZZZZZZZZ" after 3*4 ns;
end architecture;

