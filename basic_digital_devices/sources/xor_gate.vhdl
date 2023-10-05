library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    Port ( a, b : in STD_LOGIC;
           y : out STD_LOGIC);
end xor_gate;

architecture Structural of xor_gate is
    signal not_a, not_b, and1, and2 : STD_LOGIC;

    component and_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component or_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component not_gate is
        Port ( a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

begin
    -- Invert inputs
    U1: not_gate port map (a => a, y => not_a);
    U2: not_gate port map (a => b, y => not_b);
    
    -- AND gates
    U3: and_gate port map (a => a, b => not_b, y => and1);
    U4: and_gate port map (a => not_a, b => b, y => and2);
    
    -- OR gate for final output
    U5: or_gate port map (a => and1, b => and2, y => y);

end Structural;
