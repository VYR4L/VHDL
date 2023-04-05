--FADDER = pai (inglês), logo, nome do somador em português = PAPAI
library ieee;
use ieee.std_logic_1164.all;
entity papai is
    port(
	    A: in std_logic_vector(11 downto 0); 
	    B: in std_logic_vector(11 downto 0);
	    cin : in std_logic;
	    cout: out std_logic;
	    S: out std_logic_vector(11 downto 0);
        Binicial : in std_logic_vector(11 downto 0)
    );
end entity;
architecture soma of papai is
    signal carry :  std_logic_vector(11 downto 0);
    begin
     	carry(0) <= (B(0) and cin ) or (A(0) and B(0)) or (A(0) and cin ) after 2*4 ns;
	    S(0) <= (A(0) xor A(0)) xor cin after 2*4 ns;
	    
	    carry(1) <= (B(1) and carry(0) ) or (A(1) and B(1)) or (A(1) and carry(0) ) after 2*4 ns;
	    S(1) <= (A(1) xor B(1)) xor carry(0) after 2*4 ns;
	    
	    carry(2) <= (B(2) and carry(1) ) or (A(2) and B(2)) or (A(2) and carry(1) ) after 2*4 ns;
	    S(2) <= (A(2) xor B(2)) xor carry(1) after 2*4 ns;
	    
	    carry(3) <= (B(3) and carry(2) ) or (A(3) and B(3)) or (A(3) and carry(2) ) after 2*4 ns;
	    S(3) <= (A(3) xor B(3)) xor carry(2) after 2*4 ns;
	    
	    carry(4) <= (B(4) and carry(3) ) or (A(4) and B(4)) or (A(4) and carry(3) ) after 2*4 ns;
	    S(4) <= (A(4) xor B(4)) xor carry(3) after 2*4 ns;
	    
	    carry(5) <= (B(5) and carry(4) ) or (A(5) and B(5)) or (A(5) and carry(4) ) after 2*4 ns;
	    S(5) <= (A(5) xor B(5)) xor carry(4) after 2*4 ns;
	    
	    carry(6) <= (B(6) and carry(5) ) or (A(6) and B(6)) or (A(6) and carry(5) ) after 2*4 ns;
	    S(6) <= (A(6) xor B(6)) xor carry(5) after 2*4 ns;
	    
	    carry(7) <= (B(7) and carry(6) ) or (A(7) and B(7)) or (A(7) and carry(6) ) after 2*4 ns;
	    S(7) <= (A(7) xor B(7)) xor carry(6) after 2*4 ns;
	    
	    carry(8) <= (B(8) and carry(7) ) or (A(8) and B(8)) or (A(8) and carry(7) ) after 2*4 ns;
	    S(8) <= (A(8) xor B(8)) xor carry(7) after 2*4 ns;
	    
     	carry(9) <= (B(9) and carry(8) ) or (A(9) and B(9)) or (A(9) and carry(8) ) after 2*4 ns;
	    S(9) <= (A(9) xor B(9)) xor carry(8) after 2*4 ns;
	    
	    carry(10) <= (B(10) and carry(9) ) or (A(10) and B(10)) or (A(10) and carry(9) ) after 2*4 ns;
	    S(10) <= (A(10) xor B(10)) xor carry(9) after 2*4 ns;
	    
	    carry(11) <= (B(11) and carry(10) ) or (A(11) and B(11)) or (A(11) and carry(10) ) after 2*4 ns;
	    S(11) <= (A(11) xor B(11)) xor carry(10) after 2*4 ns;
	
	cout <= carry(11);
 	
end architecture;
 
