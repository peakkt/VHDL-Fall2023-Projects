library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x2_behavioral is
    Port ( a, b, a1, b1 : in STD_LOGIC;
           s : in STD_LOGIC;
           z, z1 : out STD_LOGIC);
end mux2x2_behavioral;

architecture Behavioral of mux2x2_behavioral is
begin
    process(a, b, a1, b1, s)
    begin
        if s = '0' then
            z <= a;
            z1 <= a1;
        else
            z <= b;
            z1 <= b1;
        end if;
    end process;
end Behavioral;
