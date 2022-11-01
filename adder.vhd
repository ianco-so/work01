---Learning VHDL programming
---Author: Ianco Soares
---Date: 21/10/2022

---LIBRARY
library ieee;
use ieee.std_logic_1164.all;
---ENTITY
entity adder is
port(
    --INPUTS
    a:      in std_logic_vector(3 downto 0) := "0000";
    b:      in  std_logic_vector(3 downto 0) := "0000";
    Cin:    in  std_logic := '0';
    --OUTPUTS
    S:      out std_logic_vector(3 downto 0);
    Cout:   out std_logic
);
end adder;
--ARCHITECTURE
architecture main of adder is
    component fullAdder is
        port(
            a,b, cin: in std_logic;
            s, cout: out std_logic);
    end component fullAdder;
    --SIGNALS
    signal C1, C2, C3: std_logic; --carry signals
begin
    --INSTANCES
    fullAdder0: fullAdder port map(A(0), B(0), Cin, S(0), C1);
    fullAdder1: fullAdder port map(A(1), B(1), C1,  S(1), C2);
    fullAdder2: fullAdder port map(A(2), B(2), C2,  S(2), C3);
    fullAdder3: fullAdder port map(A(3), B(3), C3,  S(3), Cout);
end architecture main;
--CONFIGURATION