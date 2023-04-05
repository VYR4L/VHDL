--FADDER = pai (inglês), logo, nome do somador em português = PAPAI
--PAPAI a ser usado na subtração
--Negado + papai = cigarro
library ieee;
use ieee.std_logic_1164.all;
entity cigarro is
    port(
	    A_c: in std_logic_vector(11 downto 0); 
	    B_c: in std_logic_vector(11 downto 0);
	    cin_c : in std_logic;
	    cout_c: out std_logic;
	    S_c: out std_logic_vector(11 downto 0)
    );
end entity;
architecture soma of cigarro is
    signal carry :  std_logic_vector(11 downto 0);
    begin
     	carry(0) <= (B_c(0) and cin_c ) or (A_c(0) and B_c(0)) or (A_c(0) and cin_c ) after 2*4 ns;
	    S_c(0) <= (A_c(0) xor A_c(0)) xor cin_c after 2*4 ns;
	    
	    carry(1) <= (B_c(1) and carry(0) ) or (A_c(1) and B_c(1)) or (A_c(1) and carry(0) ) after 2*4 ns;
	    S_c(1) <= (A_c(1) xor B_c(1)) xor carry(0) after 2*4 ns;
	    
	    carry(2) <= (B_c(2) and carry(1) ) or (A_c(2) and B_c(2)) or (A_c(2) and carry(1) ) after 2*4 ns;
	    S_c(2) <= (A_c(2) xor B_c(2)) xor carry(1) after 2*4 ns;
	    
	    carry(3) <= (B_c(3) and carry(2) ) or (A_c(3) and B_c(3)) or (A_c(3) and carry(2) ) after 2*4 ns;
	    S_c(3) <= (A_c(3) xor B_c(3)) xor carry(2) after 2*4 ns;
	    
	    carry(4) <= (B_c(4) and carry(3) ) or (A_c(4) and B_c(4)) or (A_c(4) and carry(3) ) after 2*4 ns;
	    S_c(4) <= (A_c(4) xor B_c(4)) xor carry(3) after 2*4 ns;
	    
	    carry(5) <= (B_c(5) and carry(4) ) or (A_c(5) and B_c(5)) or (A_c(5) and carry(4) ) after 2*4 ns;
	    S_c(5) <= (A_c(5) xor B_C(5)) xor carry(4) after 2*4 ns;
	    
	    carry(6) <= (B_c(6) and carry(5) ) or (A_c(6) and B_c(6)) or (A_c(6) and carry(5) ) after 2*4 ns;
	    S_c(6) <= (A_c(6) xor B_c(6)) xor carry(5) after 2*4 ns;
	    
	    carry(7) <= (B_c(7) and carry(6) ) or (A_c(7) and B_c(7)) or (A_c(7) and carry(6) ) after 2*4 ns;
	    S_c(7) <= (A_c(7) xor B_c(7)) xor carry(6) after 2*4 ns;
	    
	    carry(8) <= (B_c(8) and carry(7) ) or (A_c(8) and B_c(8)) or (A_c(8) and carry(7) ) after 2*4 ns;
	    S_c(8) <= (A_c(8) xor B_c(8)) xor carry(7) after 2*4 ns;
	    
     	carry(9) <= (B_c(9) and carry(8) ) or (A_c(9) and B_c(9)) or (A_c(9) and carry(8) ) after 2*4 ns;
	    S_c(9) <= (A_c(9) xor B_c(9)) xor carry(8) after 2*4 ns;
	    
	    carry(10) <= (B_c(10) and carry(9) ) or (A_c(10) and B_c(10)) or (A_c(10) and carry(9) ) after 2*4 ns;
	    S_c(10) <= (A_c(10) xor B_c(10)) xor carry(9) after 2*4 ns;
	    
	    carry(11) <= (B_c(11) and carry(10) ) or (A_c(11) and B_c(11)) or (A_c(11) and carry(10) ) after 2*4 ns;
	    S_c(11) <= (A_c(11) xor B_c(11)) xor carry(10) after 2*4 ns;
	
	cout_c <= carry(11);
 	
end architecture;
 
