library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and5_gate_structural is
    Port ( inputs : in STD_LOGIC_VECTOR(4 downto 0);
           y : out STD_LOGIC);
end and5_gate_structural;

architecture Structural of and5_gate_structural is
    signal inter : STD_LOGIC_VECTOR(3 downto 0);
    
    component and_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

begin
    U1: and_gate port map (a => inputs(0), b => inputs(1), y => inter(0));
    U2: and_gate port map (a => inter(0), b => inputs(2), y => inter(1));
    U3: and_gate port map (a => inter(1), b => inputs(3), y => inter(2));
    U4: and_gate port map (a => inter(2), b => inputs(4), y => y);
end Structural;
