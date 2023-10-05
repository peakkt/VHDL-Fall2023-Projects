library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1x4_structural is
    Port ( d : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           y : out STD_LOGIC_VECTOR(3 downto 0));
end demux_1x4_structural;

architecture Structural of demux_1x4_structural is
    signal not_sel0, not_sel1 : STD_LOGIC;
    signal sel0_and_not_sel1, not_sel0_and_sel1, sel0_and_sel1, not_sel0_and_not_sel1: STD_LOGIC;
    
    component not_gate is
        Port ( a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
    
    component and_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

begin
    U1: not_gate port map (a => sel(0), y => not_sel0);
    U2: not_gate port map (a => sel(1), y => not_sel1);
    
    U3: and_gate port map (a => sel(0), b => not_sel1, y => sel0_and_not_sel1);
    U4: and_gate port map (a => not_sel0, b => sel(1), y => not_sel0_and_sel1);
    U5: and_gate port map (a => sel(0), b => sel(1), y => sel0_and_sel1);
    U6: and_gate port map (a => not_sel0, b => not_sel1, y => not_sel0_and_not_sel1);
    
    U7: and_gate port map (a => d, b => not_sel0_and_not_sel1, y => y(0));
    U8: and_gate port map (a => d, b => sel0_and_not_sel1, y => y(1));
    U9: and_gate port map (a => d, b => not_sel0_and_sel1, y => y(2));
    U10: and_gate port map (a => d, b => sel0_and_sel1, y => y(3));
end Structural;
