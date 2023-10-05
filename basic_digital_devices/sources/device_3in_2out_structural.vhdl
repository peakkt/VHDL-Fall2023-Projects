library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity device_3in_2out_structural is
    Port ( a, b, c : in STD_LOGIC;
           x, y : out STD_LOGIC);
end device_3in_2out_structural;

architecture Structural of device_3in_2out_structural is
    signal not_a, not_b, not_c, nand1, nand2, nand3, nand4, not_nand1, not_nand2, not_nand3, not_nand4, or1, or2 : STD_LOGIC;

    component or_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component nand_gate is
        Port ( in1, in2 : in STD_LOGIC;
               out1 : out STD_LOGIC);
    end component;

    component not_gate is
        Port ( a : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

begin
    U1: not_gate port map (a => a, y => not_a);
    U2: not_gate port map (a => b, y => not_b);
    U3: nand_gate port map (in1 => a, in2 => not_b, out1 => nand1);
    U4: nand_gate port map (in1 => not_a, in2 => b, out1 => nand2);
    U9: not_gate port map (a => nand1, y => not_nand1);
    U10: not_gate port map (a => nand2, y => not_nand2);
    U5: or_gate port map (a => not_nand1, b => not_nand2, y => x);

    U6: nand_gate port map (in1 => not_a, in2 => c, out1 => nand3);
    U7: nand_gate port map (in1 => b, in2 => c, out1 => nand4);
    U11: not_gate port map (a => nand3, y => not_nand3);
    U12: not_gate port map (a => nand4, y => not_nand4);
    U8: or_gate port map (a => not_nand3, b => not_nand4, y => y);
end Structural;
