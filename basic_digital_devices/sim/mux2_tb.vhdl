library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux2_tb is
end mux2_tb;

architecture sim of mux2_tb is
    signal a, b, s : STD_LOGIC;
    signal z_behavioral, z_structural : STD_LOGIC;

    component mux2_behavioral
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               s : in STD_LOGIC;
               z : out STD_LOGIC);
    end component;

    component mux2_structural
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               s : in STD_LOGIC;
               z : out STD_LOGIC);
    end component;

begin
    DUT1: mux2_behavioral
    port map (
        a => a, 
        b => b, 
        s => s, 
        z => z_behavioral
    );

    DUT2: mux2_structural
    port map (
        a => a, 
        b => b, 
        s => s, 
        z => z_structural
    );

    process
    variable input_vector : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 7 loop
            input_vector := std_logic_vector(to_unsigned(i, input_vector'length));
            a <= input_vector(2);
            b <= input_vector(1);
            s <= input_vector(0);
            wait for 10 ns;
            assert z_behavioral = z_structural
            report "Mismatch between behavioral and structural descriptions at input combination: " & STD_LOGIC'image(a) & STD_LOGIC'image(b) & STD_LOGIC'image(s)
            severity ERROR;
        end loop;
        wait;
    end process;
end sim;
