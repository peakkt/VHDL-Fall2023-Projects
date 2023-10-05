library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity full_adder_2bit_tb is
end full_adder_2bit_tb;

architecture sim of full_adder_2bit_tb is
    signal a, b: STD_LOGIC_VECTOR(1 downto 0);
    signal cin: STD_LOGIC;
    signal sum_behavioral, sum_structural: STD_LOGIC_VECTOR(1 downto 0);
    signal cout_behavioral, cout_structural: STD_LOGIC;

    component full_adder_2bit_behavioral is
        Port ( a, b : in STD_LOGIC_VECTOR(1 downto 0);
               cin : in STD_LOGIC;
               sum : out STD_LOGIC_VECTOR(1 downto 0);
               cout : out STD_LOGIC);
    end component;

    component full_adder_2bit_structural is
        Port ( a, b : in STD_LOGIC_VECTOR(1 downto 0);
               cin : in STD_LOGIC;
               sum : out STD_LOGIC_VECTOR(1 downto 0);
               cout : out STD_LOGIC);
    end component;

begin
    DUT1: full_adder_2bit_behavioral port map (a => a, b => b, cin => cin, sum => sum_behavioral, cout => cout_behavioral);
    DUT2: full_adder_2bit_structural port map (a => a, b => b, cin => cin, sum => sum_structural, cout => cout_structural);

    process
        variable input_vector: STD_LOGIC_VECTOR(4 downto 0);
    begin
        for i in 0 to 31 loop
            input_vector := STD_LOGIC_VECTOR(to_unsigned(i, input_vector'length));
            a <= input_vector(2 downto 1);
            b <= input_vector(4 downto 3);
            cin <= input_vector(0);
            wait for 10 ns;

            assert sum_behavioral = sum_structural and cout_behavioral = cout_structural
            report "Mismatch between behavioral and structural descriptions at input combination: " & STD_LOGIC'image(a(1)) & STD_LOGIC'image(a(0)) & STD_LOGIC'image(b(1)) & STD_LOGIC'image(b(0)) & STD_LOGIC'image(cin)
            severity ERROR;
        end loop;
        wait;
    end process;
end sim;
