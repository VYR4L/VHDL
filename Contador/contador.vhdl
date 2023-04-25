library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port(
        clock_c : in std_logic;
        cl : in std_logic;
        q_c : out std_logic_vector(2 downto 0)
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

    signal s_j, s_k, s_q, s_nq   : std_logic_vector(2 downto 0);
    signal vcc : std_logic := '1';

    begin
        u_ctrl  : ctrl port map(s_q, s_j, s_k);
        
        u_ffjk2 : ffjk port map(s_j(2), s_k(2),clock_c, vcc, cl,  s_q(2), s_nq(2));
        u_ffjk1 : ffjk port map(s_j(1), s_k(1),clock_c, vcc, cl,  s_q(1), s_nq(1));
        u_ffjk0 : ffjk port map(s_j(0), s_k(0),clock_c, cl, vcc,  s_q(0), s_nq(0));

       

        q_c <= s_q;
end architecture;
