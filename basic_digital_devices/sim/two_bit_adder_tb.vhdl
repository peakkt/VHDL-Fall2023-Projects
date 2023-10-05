library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity two_bit_adder_tb is
end two_bit_adder_tb;

architecture sim of two_bit_adder_tb is
    signal a, b: std_logic_vector(1 downto 0);
    signal cin: std_logic;
    signal sum_behavioral, sum_structural: std_logic_vector(1 downto 0);
    signal cout_behavioral, cout_structural: std_logic;

    component two_bit_adder_behavioral is
        Port (a, b: in std_logic_vector(1 downto 0);
              cin: in std_logic;
              sum: out std_logic_vector(1 downto 0);
              cout: out std_logic);
    end component;

    component two_bit_adder_structural is
        Port (a, b: in std_logic_vector(1 downto 0);
              cin: in std_logic;
              sum: out std_logic_vector(1 downto 0);
              cout: out std_logic);
    end component;

    function to_string (s : std_logic_vector) return string is
        variable result : string (1 to s'length);
    begin
        for i in 1 to s'length loop
            result(i) := std_logic'image(s(s'length-i))(2);
        end loop;
        return result;
    end function;

begin
    DUT1: two_bit_adder_behavioral
        port map (
            a => a,
            b => b,
            cin => cin,
            sum => sum_behavioral,
            cout => cout_behavioral
        );

    DUT2: two_bit_adder_structural
        port map (
            a => a,
            b => b,
            cin => cin,
            sum => sum_structural,
            cout => cout_structural
        );

    process
        variable input_vector : std_logic_vector(4 downto 0);
    begin
        for i in 0 to 31 loop
            input_vector := std_logic_vector(to_unsigned(i, input_vector'length));
            a(1) <= input_vector(4);
            a(0) <= input_vector(3);
            b(1) <= input_vector(2);
            b(0) <= input_vector(1);
            cin <= input_vector(0);
            wait for 10 ns;
            
            assert (sum_behavioral = sum_structural) and (cout_behavioral = cout_structural)
            report "Mismatch at: a=" & to_string(a) & ", b=" & to_string(b) & ", cin=" & STD_LOGIC'image(cin)
            severity ERROR;
        end loop;
        wait;
    end process;
end sim;
