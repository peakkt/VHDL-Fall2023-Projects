library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_adder_behavioral is
    Port ( a, b, cin : in STD_LOGIC;
           sum, cout : out STD_LOGIC);
end one_bit_adder_behavioral;

architecture Behavioral of one_bit_adder_behavioral is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (cin and (a xor b));
end Behavioral;
