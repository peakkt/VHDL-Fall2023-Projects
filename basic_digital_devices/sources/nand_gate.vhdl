library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
    Port ( in1, in2 : in STD_LOGIC;
           out1 : out STD_LOGIC);
end nand_gate;

architecture Behavioral of nand_gate is
    signal and_result : STD_LOGIC;
begin
    and_result <= in1 and in2;
    out1 <= not and_result;
end Behavioral;
