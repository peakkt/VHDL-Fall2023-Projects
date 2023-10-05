library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_bit_adder_behavioral is
    Port ( a, b : in STD_LOGIC_VECTOR(1 downto 0);
           cin : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR(1 downto 0);
           cout : out STD_LOGIC);
end two_bit_adder_behavioral;

architecture Behavioral of two_bit_adder_behavioral is
    signal s0, c0, c1: STD_LOGIC;
begin
    s0 <= (a(0) xor b(0)) xor cin;
    c0 <= (a(0) and b(0)) or (cin and (a(0) xor b(0)));
    
    sum(0) <= s0;
    sum(1) <= (a(1) xor b(1)) xor c0;
    cout <= (a(1) and b(1)) or (c0 and (a(1) xor b(1)));
end Behavioral;
