library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjk is
end tb_ffjk;

architecture test of tb_ffjk is
    constant CLK_PERIOD : time := 20 ns;    

    component ffjk is
        port(        
            j, k   : in  std_logic;        
            clock  : in  std_logic;        
            pr, cl : in  std_logic;        
            q, nq  : out std_logic    
        );    
    end component;

    signal sj, sk, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

    begin 
        u_flipflop : ffjk port map(sj, sk, sclk, spr, scl, sq, snq);  
        tbp : process
    begin        
        spr <= '1';        
        scl <= '0';        
        sj  <= '0';        
        sk  <= '0';        
        wait for CLK_PERIOD;

        spr <= '1';        
        scl <= '1';        
        sj  <= '0';        
        sk  <= '0';        
        wait for CLK_PERIOD;  

        spr <= '1';        
        scl <= '1';        
        sj  <= '1';        
        sk  <= '0';        
        wait for CLK_PERIOD;  

        spr <= '1';        
        scl <= '1';        
        sj  <= '1';        
        sk  <= '1';        
        wait for CLK_PERIOD;  

        spr <= '1';        
        scl <= '1';        
        sj  <= '1';        
        sk  <= '1';        
        wait for CLK_PERIOD; 

        spr <= '1';        
        scl <= '1';        
        sj  <= '0';        
        sk  <= '1';        
        wait for CLK_PERIOD; 

        spr <= '1';        
        scl <= '1';        
        sj  <= '0';        
        sk  <= '0';        
        wait for CLK_PERIOD; 

        end process;    
    p_clock : process 
    begin        
        sclk <= not(sclk);
        wait for CLK_PERIOD/2; 
    end process;

end architecture test;
