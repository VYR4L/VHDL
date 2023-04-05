library ieee;
use ieee.std_logic_1164.all;

entity tb is

end entity;

architecture conversao of tb is
    -- Multiplexador 2x6:
    component mux2x6 is 
        port(
            c2_m: in std_logic_vector(5 downto 0);
            ek_m: in std_logic_vector(5 downto 0);
            sel_m: in bit;
            z_m: out std_logic_vector(5 downto 0)
        );
    end component;

    -- Demultiplexador 2x6:
    component demux2x6 is
        port(
            c2_dm : out std_logic_vector(4 downto 0);
            ek_dm : out std_logic_vector(4 downto 0);
            z_dm : in std_logic_vector(5 downto 0);
            sel_dm : in bit;
            erro : out std_logic
            
        );
    end component;

    -- Conversor de Complemento de 2(C2) para Excesso K (EK):
    component conversor is 
        port(
			c : in std_logic_vector (5 downto 0);
            c2_c : out std_logic_vector (5 downto 0);
			ek_c : out std_logic_vector (5 downto 0)
		);
    end component;

    signal sc : std_logic_vector (5 downto 0);
    signal sc2_m   : std_logic_vector (5 downto 0);
    signal sek_m   : std_logic_vector (5 downto 0);
    signal sc2_dm  : std_logic_vector (4 downto 0);
    signal sek_dm  : std_logic_vector (4 downto 0);
    signal smux  : std_logic_vector (5 downto 0);
    signal serro   : std_logic;
    signal ssel    : bit;

begin
    u_conversor : conversor port map(sc, sc2_m, sek_m);
    u_mux2x6 : mux2x6 port map(sc2_m, sek_m, ssel, smux);
    u_demux2x6 : demux2x6 port map(sc2_dm, sek_dm, smux, ssel, serro);
    u_tb : process
    begin
        sc <= "000000";
        ssel <= '0';
        wait for 20 ns;

        sc <= "000000";
        ssel <= '1';
        wait for 20 ns;

        sc <= "000001";
        ssel <= '0';
        wait for 20 ns;

        sc <= "000001";
        ssel <= '1';
        wait for 20 ns;
    
        sc <= "000010";
        ssel <= '0';
        wait for 20 ns;

        sc <= "000010";
        ssel <= '1';
        wait for 20 ns;

        sc <= "000100";
        ssel <= '0';
        wait for 20 ns;

        sc <= "000100";
        ssel <= '1';
        wait for 20 ns;

        sc <= "001000";
        ssel <= '0';
        wait for 20 ns;

        sc <= "001000";
        ssel <= '1';
        wait for 20 ns;

        sc <= "010000";
        ssel <= '0';
        wait for 20 ns;

        sc <= "010000";
        ssel <= '1';
        wait for 20 ns;

        sc <= "011111";
        ssel <= '0';
        wait for 20 ns;

        sc <= "011111";
        ssel <= '1';
        wait for 20 ns;

        sc <= "010001";
        ssel <= '0';
        wait for 20 ns;

        sc <= "010001";
        ssel <= '1';
        wait for 20 ns;

        sc <= "001001";
        ssel <= '0';
        wait for 20 ns;

        sc <= "001001";
        ssel <= '1';
        wait for 20 ns;

        sc <= "000101";
        ssel <= '0';
        wait for 20 ns;

        sc <= "000101";
        ssel <= '1';
        wait for 20 ns;

    wait;
    end process;
    
end architecture;
