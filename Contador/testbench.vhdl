library ieee;
use ieee.std_logic_1164.all;

entity tb is
end entity;

architecture teste of testbench is
    constant CLK_PERIOD : time := 20 ns;

    component ffjk is
        port(        
            j, k   : in  std_logic;        
            clock  : in  std_logic;        
            pr, cl : in  std_logic;        
            q, nq  : out std_logic    
        );    
    end component;

    component ctrl is
        port(
            q : in std_logic_vector(2 downto 0);
            j, k : out std_logic_vector(2 downto 0)
        );
    end component;

    component contador is
        port(
            clock : in std_logic;
            cl : in std_logic;
            q : out std_logic_vector(2 downto 0)
        );
    end component;

end entity;
