library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity and5_gate_tb is
end and5_gate_tb;

architecture sim of and5_gate_tb is
    signal a, b, c, d, e: STD_LOGIC;
    signal y_behavioral, y_structural: STD_LOGIC;

    component and5_gate_behavioral is
        Port ( a, b, c, d, e : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;

    component and5_gate_structural is
        Port ( inputs : in STD_LOGIC_VECTOR(4 downto 0);
               y : out STD_LOGIC);
    end component;

begin
    U1: and5_gate_behavioral port map (
        a => a,
        b => b,
        c => c,
        d => d,
        e => e,
        y => y_behavioral
    );

    U2: and5_gate_structural port map (
        inputs => (e, d, c, b, a),
        y => y_structural
    );

    -- Test process
    process
        variable input_vector : std_logic_vector(4 downto 0);
    begin
        for i in 0 to 31 loop
            input_vector := std_logic_vector(to_unsigned(i, input_vector'length));
            a <= input_vector(4);
            b <= input_vector(3);
            c <= input_vector(2);
            d <= input_vector(1);
            e <= input_vector(0);
            wait for 10 ns;
            
            assert y_behavioral = y_structural
            report "Mismatch between behavioral and structural descriptions at input combination: " & STD_LOGIC'image(a) & STD_LOGIC'image(b) & STD_LOGIC'image(c) & STD_LOGIC'image(d) & STD_LOGIC'image(e)
            severity ERROR;
        end loop;
        wait;
    end process;
end sim;
