library ieee;
use ieee.std_logic_1164.all;

entity demux2x6 is
    port(
        c2_dm : out std_logic_vector(4 downto 0);
        ek_dm : out std_logic_vector(4 downto 0);
        z_dm : in std_logic_vector(5 downto 0);
        sel_dm : in bit;
        erro : out std_logic
        
    );
end entity;

architecture demux of demux2x6 is
begin
    c2_dm <= z_dm(4 downto 0) when sel_dm = '0' else "00000";
    ek_dm <= z_dm(4 downto 0) when sel_dm = '1' else "00000";
    erro  <= '1' when z_dm(5) = '1' else '0';
end architecture;
