library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity one_bit_adder_tb is
end one_bit_adder_tb;

architecture sim of one_bit_adder_tb is
    signal a, b, cin: STD_LOGIC;
    signal sum_behavioral, sum_structural: STD_LOGIC;
    signal cout_behavioral, cout_structural: STD_LOGIC;

    component one_bit_adder_behavioral is
        Port ( a, b, cin : in STD_LOGIC;
               sum, cout : out STD_LOGIC);
    end component;

    component one_bit_adder_structural is
        Port ( a, b, cin : in STD_LOGIC;
               sum, cout : out STD_LOGIC);
    end component;

begin
    U1: one_bit_adder_behavioral port map (
        a => a,
        b => b,
        cin => cin,
        sum => sum_behavioral,
        cout => cout_behavioral
    );

    U2: one_bit_adder_structural port map (
        a => a,
        b => b,
        cin => cin,
        sum => sum_structural,
        cout => cout_structural
    );

    process
        variable input_vector : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 7 loop
            input_vector := std_logic_vector(to_unsigned(i, input_vector'length));
            a <= input_vector(2);
            b <= input_vector(1);
            cin <= input_vector(0);
            wait for 10 ns;
            
            assert (sum_behavioral = sum_structural) and (cout_behavioral = cout_structural)
            report "Mismatch between behavioral and structural descriptions at input combination: " & STD_LOGIC'image(a) & STD_LOGIC'image(b) & STD_LOGIC'image(cin)
            severity ERROR;
        end loop;
        wait;
    end process;
end sim;
