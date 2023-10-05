library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x2_structural is
    Port ( a, b, a1, b1 : in STD_LOGIC;
           s : in STD_LOGIC;
           z, z1 : out STD_LOGIC);
end mux2x2_structural;

architecture Structural of mux2x2_structural is
    signal temp0, temp1 : STD_LOGIC;

    component mux2_behavioral is
        Port ( a, b : in STD_LOGIC;
               s : in STD_LOGIC;
               z : out STD_LOGIC);
    end component;

    component mux2_structural is
        Port ( a, b : in STD_LOGIC;
               s : in STD_LOGIC;
               z : out STD_LOGIC);
    end component;

begin
    M0: mux2_behavioral port map (a => a, b => b, s => s, z => temp0);
    M1: mux2_structural port map (a => a1, b => b1, s => s, z => temp1);

    z <= temp0;
    z1 <= temp1;
end Structural;
