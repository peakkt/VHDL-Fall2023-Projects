library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity device_3in_2out_behavioral is
    Port ( a, b, c : in STD_LOGIC;
           x, y : out STD_LOGIC);
end device_3in_2out_behavioral;

architecture Behavioral of device_3in_2out_behavioral is
begin
    x <= (not (a nand (not b))) or (not ((not a) nand b));
    y <= (not ((not a) nand c)) or (not (b nand c));
end Behavioral;
