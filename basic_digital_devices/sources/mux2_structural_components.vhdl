library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_structural is
    Port ( a, b, s : in STD_LOGIC;
           z : out STD_LOGIC);
end mux2_structural;

architecture Structural of mux2_structural is
    component and_gate
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component or_gate
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component not_gate
        Port ( a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    signal not_s : STD_LOGIC;
    signal a_and_not_s, b_and_s : STD_LOGIC;

begin
    U1: not_gate port map (a => s, y => not_s);
    U2: and_gate port map (a => a, b => not_s, y => a_and_not_s);
    U3: and_gate port map (a => b, b => s, y => b_and_s);
    U4: or_gate port map (a => a_and_not_s, b => b_and_s, y => z);
end Structural;
