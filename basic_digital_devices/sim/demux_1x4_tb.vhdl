library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity demux_1x4_tb is
end demux_1x4_tb;

architecture sim of demux_1x4_tb is
    signal d : STD_LOGIC;
    signal sel : STD_LOGIC_VECTOR(1 downto 0);
    signal y_behavioral, y_structural : STD_LOGIC_VECTOR(3 downto 0);

    component demux_1x4_behavioral is
        Port ( d : in STD_LOGIC;
               sel : in STD_LOGIC_VECTOR(1 downto 0);
               y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component demux_1x4_structural is
        Port ( d : in STD_LOGIC;
               sel : in STD_LOGIC_VECTOR(1 downto 0);
               y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

begin
    DUT1: demux_1x4_behavioral
    port map (
        d => d, 
        sel => sel, 
        y => y_behavioral
    );

    DUT2: demux_1x4_structural
    port map (
        d => d, 
        sel => sel, 
        y => y_structural
    );

    process
        variable input_vector : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 7 loop
            input_vector := std_logic_vector(to_unsigned(i, input_vector'length));
            d <= input_vector(2);
            sel(1) <= input_vector(1);
            sel(0) <= input_vector(0);
            wait for 10 ns;
            assert y_behavioral = y_structural
            report "Mismatch between behavioral and structural descriptions at input combination: d=" & STD_LOGIC'image(d) & ", sel=" & STD_LOGIC'image(sel(1)) & STD_LOGIC'image(sel(0))
            severity ERROR;
        end loop;
        wait;
    end process;    
end sim;
