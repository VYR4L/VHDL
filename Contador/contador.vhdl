library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port(
        clock : in std_logic;
        cl : in std_logic;
        q : out std_logic_vector(2 downto 0)
);
end entity;

architecture contar of contador is
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

    signal s_j, s_k, s_q     : std_logic_vector(2 downto 0);
    signal s_clock, s_pr, s_cl   : std_logic;

    begin
        
        
        u_ffjk2 : ffjk port map(s_j(2), s_k(2),s_clock, s_pr, s_cl,  s_q(2));
        u_ffjk1 : ffjk port map(s_j(1), s_k(1),s_clock, s_pr, s_cl,  s_q(1));
        u_ffjk0 : ffjk port map(s_j(0), s_k(0),s_clock, s_pr, s_cl,  s_q(0));

        u_ctrl  : ctrl port map(s_j(2 downto 0), s_k(2 downto 0), s_q(2 downto 0));

end architecture;
