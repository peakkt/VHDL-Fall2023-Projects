library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_adder_structural is
    Port ( a, b, cin : in STD_LOGIC;
           sum, cout : out STD_LOGIC);
end one_bit_adder_structural;

architecture Structural of one_bit_adder_structural is
    signal xor1_out, xor2_out, and1_out, and2_out: STD_LOGIC;

    component xor_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component and_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component or_gate is
        Port ( a, b : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

begin
    -- XOR gates for sum
    U1: xor_gate port map (a => a, b => b, y => xor1_out);
    U2: xor_gate port map (a => xor1_out, b => cin, y => sum);

    -- AND gates for carry-out
    U3: and_gate port map (a => a, b => b, y => and1_out);
    U4: and_gate port map (a => xor1_out, b => cin, y => and2_out);

    -- OR gate for final carry-out
    U5: or_gate port map (a => and1_out, b => and2_out, y => cout);
end Structural;

