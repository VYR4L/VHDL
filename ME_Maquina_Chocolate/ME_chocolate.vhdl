library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ME_chocolate is
end entity;

architecture ME_choc of ME_chocolate is
    constant CLK_PERIOD : time := 20 ns;
    component fEA is
        port(
            m25 : in std_logic;
            m50 : in std_logic;
            ea  : in std_logic_vector(2 downto 0);
            pe  : out std_logic_vector(2 downto 0)
        );
    end component;
    
    component regis is
        port(
            din     : in std_logic_vector(2 downto 0);
            cl, clk : in std_logic;
            dout    : out std_logic_vector(2 downto 0)
        );
    end component;
    
    component sEA is
        port(
            pe     : in std_logic_vector(2 downto 0);
            m_dev  : out std_logic;
            m_cof  : out std_logic;
            d_disp : out std_logic
        );
    end component;

    signal spe_reg, sea_reg  : std_logic_vector(2 downto 0);
    signal sm25, sm50        : std_logic;
    signal sdev, scof, sdisp : std_logic;
    signal s_reset : std_logic;
    signal sclk : std_logic := '1';

    begin
    u_fcea : fEA port map (sm25, sm50, sea_reg, spe_reg);
    u_reg  : regis port map(spe_reg, s_reset, sclk, sea_reg);
    u_fsea : sEA port map(spe_reg, sdev, scof, sdisp);
    
    u_teste : process
    begin
        s_reset <= '0';
        sm25 <= '0';
        sm50 <= '0';
        wait for 4*CLK_PERIOD;

        s_reset <= '1';
        sM50   <= '1';
        sM25    <= '1';
        wait for CLK_PERIOD;

        sM50 <= '0';
        sM25 <= '0';
        wait for 4*CLK_PERIOD;
        sM25 <= '1';
        wait for CLK_PERIOD;
        sM25 <= '0';
        wait for CLK_PERIOD;
        sM50 <= '1';
        wait for CLK_PERIOD;
        sM50 <= '0';
        wait for CLK_PERIOD;
        sM25 <= '1';
        wait for CLK_PERIOD;
        sM25 <= '0';
        wait for CLK_PERIOD;
        sM25 <= '1';
        wait for CLK_PERIOD;
        sM25 <= '0';
        wait for CLK_PERIOD;
        sM50 <= '1';
        wait for CLK_PERIOD;
        sM50 <= '0';
        wait for CLK_PERIOD;
        sM50 <= '1';
        wait for CLK_PERIOD;
        sM50 <= '0';
        wait for CLK_PERIOD;
        sM50 <= '1';
        wait for 5*CLK_PERIOD;
        sM25 <= '1';
        wait for 2*CLK_PERIOD;
        sM25 <= '0'; 
        wait for CLK_PERIOD;
        sM25 <= '1';
        wait for CLK_PERIOD;
        sM50 <= '0';
        sM25 <= '0'; 
        wait for CLK_PERIOD;
        sM25 <= '1';
        wait for 8*CLK_PERIOD;
        sM25 <= '0';
        sM50 <= '1'; 
        wait for 6*CLK_PERIOD;
        sM50 <= '0';
        sM25 <= '1';
        wait for 100*CLK_PERIOD;
 
        wait;
    end process;
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;
end architecture;
