library ieee;
use ieee.std_logic_1164.all;
entity overflow is
    port(
        Amsb  : in std_logic; 
        Bmsb  : in std_logic;
        Rmsb  : in std_logic;
        ovf : out std_logic
    );
end entity;

architecture transborda of overflow is

begin
    ovf <=  (not(Amsb) and not(Bmsb) and Rmsb) or (Amsb and Bmsb and not(Rmsb)) after  3*4 ns;
end architecture;

