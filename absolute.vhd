--Given an 4-bit 2's complement number input, the output is a 3-bit number that represents the absolute value of the input

--LIBRARY
library ieee;
use ieee.std_logic_1164.all;

--ENTITY
entity absolute is
port(
        I: in std_logic_vector(3 downto 0);
        O: out std_logic_vector(2 downto 0));
end entity absolute;
--ARCHITECTURE
--sctrucutral architecture
architecture structural of absolute is
begin
    O(2) <= ( (not I(3)) and I(2)) or
            (I(3) and (not I(2)) ) or
            (I(2) and (not I(1)) and (not I(0)) );

    O(1) <= ( (not I(3)) and I(1)) or
            (I(1) and (not I(0)) ) or
            (I(0) and (not I(1)) and I(3));

    O(0) <= I(0);
end architecture structural;
-- 0 1 2 3
-- 3 2 1 0