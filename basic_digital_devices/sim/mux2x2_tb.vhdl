library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux2x2_tb is
end mux2x2_tb;

architecture sim of mux2x2_tb is
    signal a, b, a1, b1, s : STD_LOGIC;
    signal z_behavioral, z1_behavioral, z_structural, z1_structural : STD_LOGIC;

    component mux2x2_behavioral is
        Port ( a, b, a1, b1 : in STD_LOGIC;
               s : in STD_LOGIC;
               z, z1 : out STD_LOGIC);
    end component;

    component mux2x2_structural is
        Port ( a, b, a1, b1 : in STD_LOGIC;
               s : in STD_LOGIC;
               z, z1 : out STD_LOGIC);
    end component;

begin
    DUT1: mux2x2_behavioral
    port map (
        a => a, 
        b => b, 
        a1 => a1,
        b1 => b1,
        s => s, 
        z => z_behavioral,
        z1 => z1_behavioral
    );

    DUT2: mux2x2_structural
    port map (
        a => a, 
        b => b, 
        a1 => a1,
        b1 => b1,
        s => s, 
        z => z_structural,
        z1 => z1_structural
    );

    process
    variable input_vector : std_logic_vector(4 downto 0);
    begin
        for i in 0 to 31 loop
            input_vector := std_logic_vector(to_unsigned(i, input_vector'length));
            a <= input_vector(4);
            b <= input_vector(3);
            a1 <= input_vector(2);
            b1 <= input_vector(1);
            s <= input_vector(0);
            wait for 10 ns;
            assert z_behavioral = z_structural and z1_behavioral = z1_structural
            report "Mismatch between behavioral and structural descriptions at input combination: " & STD_LOGIC'image(a) & STD_LOGIC'image(b) & STD_LOGIC'image(a1) & STD_LOGIC'image(b1) & STD_LOGIC'image(s)
            severity ERROR;
        end loop;
        wait;
    end process;
end sim;
