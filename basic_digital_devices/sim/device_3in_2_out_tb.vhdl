library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity device_3in_2out_tb is
end device_3in_2out_tb;

architecture sim of device_3in_2out_tb is
    signal a, b, c : STD_LOGIC;
    signal x_behavioral, y_behavioral, x_structural, y_structural : STD_LOGIC;

    component device_3in_2out_behavioral is
        Port ( a, b, c : in STD_LOGIC;
               x, y : out STD_LOGIC);
    end component;

    component device_3in_2out_structural is
        Port ( a, b, c : in STD_LOGIC;
               x, y : out STD_LOGIC);
    end component;

begin
    DUT1: device_3in_2out_behavioral
    port map (
        a => a, 
        b => b, 
        c => c,
        x => x_behavioral,
        y => y_behavioral
    );

    DUT2: device_3in_2out_structural
    port map (
        a => a, 
        b => b, 
        c => c,
        x => x_structural,
        y => y_structural
    );

    process
        variable input_vector : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 7 loop
            input_vector := std_logic_vector(to_unsigned(i, input_vector'length));
            a <= input_vector(2);
            b <= input_vector(1);
            c <= input_vector(0);
            wait for 10 ns;
            assert x_behavioral = x_structural and y_behavioral = y_structural
            report "Mismatch between behavioral and structural descriptions at input combination: " & STD_LOGIC'image(a) & STD_LOGIC'image(b) & STD_LOGIC'image(c)
            severity ERROR;
        end loop;
        wait;
    end process;
end sim;