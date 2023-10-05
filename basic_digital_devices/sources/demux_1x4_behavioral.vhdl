library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1x4_behavioral is
    Port ( d : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           y : out STD_LOGIC_VECTOR(3 downto 0));
end demux_1x4_behavioral;

architecture Behavioral of demux_1x4_behavioral is
begin
process(d, sel)
begin
    y <= (others => '0');
    case sel is
        when "00" => y(0) <= d;
        when "01" => y(1) <= d;
        when "10" => y(2) <= d;
        when "11" => y(3) <= d;
        when others => y <= (others => '0');
    end case;
end process;
end Behavioral;
