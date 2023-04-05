library ieee;
use ieee.std_logic_1164.all;

entity tb_add_sub is
end entity;

architecture teste of tb_add_sub is 
    component papai is
        port(
	        A: in std_logic_vector(11 downto 0); 
	        B: in std_logic_vector(11 downto 0);
	        cin : in std_logic;
	        cout: out std_logic;
	        S: out std_logic_vector(11 downto 0);
            Binicial : in std_logic_vector(11 downto 0)
        );
    end component;

    component negacao is
        port(
            entrada: in std_logic_vector(11 downto 0 );
            nega: out std_logic_vector(11 downto 0)
        );
    end component;

    component cigarro is
        port(
	        A_c: in std_logic_vector(11 downto 0); 
	        B_c: in std_logic_vector(11 downto 0);
	        cin_c : in std_logic;
	        cout_c: out std_logic;
	        S_c: out std_logic_vector(11 downto 0)
        );
    end component;

    component mux2x12 is
        port(
            C0: in std_logic_vector(11 downto 0 ); 
            C1: in std_logic_vector(11 downto 0 ); 
            Sel: in std_logic;
            Z: out std_logic_vector(11 downto 0)
    );
    end component;

    component overflow is
        port(
            Amsb  : in std_logic; 
            Bmsb  : in std_logic;
            Rmsb  : in std_logic;
            ovf : out std_logic
        );
    end component;

    signal sA, sB, sBinicial, sS : std_logic_vector(11 downto 0);
    signal scin, scout : std_logic;

    signal sentrada, snega : std_logic_vector(11 downto 0);

    signal sA_c, sB_c, sS_c : std_logic_vector(11 downto 0);
    signal scin_c, scout_c : std_logic;

    signal sC0, sC1, sZ : std_logic_vector(11 downto 0);
    signal sSel : std_logic;

    signal sAmsb, sBmsb, sRmsb, sovf : std_logic;

    begin
        u_papai : papai port map(sA, sB, scin, scout, sS, sBinicial);
        u_negacao : negacao port map(sentrada, snega);
        u_cigarro : cigarro port map(sA_c, sB_c, scin_c, scout_c, sS_c);
        u_mux2x12 : mux2x12 port map(sC0, sC1, sSel, sZ);
        u_overflow : overflow port map(sAmsb, sBmsb, sRmsb, sovf);

        sentrada <= sBinicial;
        sA_c <= snega;
        sB_c <= "000000000001";
        sC0 <= sBinicial;
        sC1 <= sS_c;
        sAmsb <= sA(11);
        sBmsb <= sZ(11);
        sRmsb <= sS(11);
        scin <= '0';
        scin_c <= '0';
        sB <= sZ;

    u_tb : process
    begin
    	sSel <= '0' ;
	    sA <= x"000";   
	    sBinicial <= x"FFF";       
        wait for 588 ns;

    	sSel <= '1' ;
	    sA <= x"000";   
	    sBinicial <= x"FFF";       
        wait for 588 ns;

        sSel <= '0' ;
	    sA <= x"FFF";   
	    sBinicial <= x"001";       
        wait for 588 ns;
 
        sSel <= '1' ;
	    sA <= x"FFF";   
	    sBinicial <= x"001";       
        wait for 588 ns;

        sSel <= '0' ;
	    sA <= x"FFE";   
	    sBinicial <= x"FFE";       
        wait for 588 ns;

        sSel <= '0' ;
	    sA <= x"0FF";   
	    sBinicial <= x"0FF";       
        wait for 588 ns;

        sSel <= '0' ;
	    sA <= "011110111111";   
	    sBinicial <= "011111111001";       
        wait for 588 ns;

        sSel <= '1' ;
	    sA <= "111011011101";   
	    sBinicial <= "011111110110";       
        wait for 588 ns;

        wait;

    end process;
end architecture;
