library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and5_gate_behavioral is
    Port ( a, b, c, d, e : in STD_LOGIC;
           y : out STD_LOGIC);
end and5_gate_behavioral;

architecture Behavioral of and5_gate_behavioral is
begin
    y <= a and b and c and d and e;
end Behavioral;
