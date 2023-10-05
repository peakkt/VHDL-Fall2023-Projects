library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_bit_adder_structural is
    Port ( a, b : in STD_LOGIC_VECTOR(1 downto 0);
           cin : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR(1 downto 0);
           cout : out STD_LOGIC);
end two_bit_adder_structural;

architecture Structural of two_bit_adder_structural is
    signal s0, c0, s1, c1: STD_LOGIC;

    component one_bit_adder_structural is
        Port ( a, b : in STD_LOGIC;
               cin : in STD_LOGIC;
               sum : out STD_LOGIC;
               cout : out STD_LOGIC);
    end component;

begin
    -- First bit sum and carry
    U1: one_bit_adder_structural port map (a => a(0), b => b(0), cin => cin, sum => s0, cout => c0);

    -- Second bit sum and carry
    U2: one_bit_adder_structural port map (a => a(1), b => b(1), cin => c0, sum => s1, cout => c1);

    sum(0) <= s0;
    sum(1) <= s1;
    cout <= c1;
end Structural;
