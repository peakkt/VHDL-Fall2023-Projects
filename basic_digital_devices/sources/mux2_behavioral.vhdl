library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_behavioral is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : in STD_LOGIC;
           z : out STD_LOGIC);
end mux2_behavioral;

architecture Behavioral of mux2_behavioral is
begin
    process(a, b, s)
    begin
        if s = '0' then
            z <= a;
        else
            z <= b;
        end if;
    end process;
end Behavioral;
