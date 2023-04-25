library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture teste of testbench is
    constant CLK_PERIOD : time := 20 ns;

    component contador is
        port(
            clock_c : in std_logic;
            cl : in std_logic;
            q_c : out std_logic_vector(2 downto 0)
        );
    end component;

    signal s_clock : std_logic := '1';
    signal s_cl : std_logic;
    signal s_q_c : std_logic_vector(2 downto 0);
begin
    u_contador : contador port map(s_clock, s_cl, s_q_c);

    u_teste: process
    begin
        s_cl <= '0';
        wait for CLK_PERIOD;
        s_cl <= '1';
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
    end process;

    u_clock : process
    begin
        s_clock <= not(s_clock);
        wait for CLK_PERIOD/2;
    end process;

end architecture;
