---Learning VHDL programming
---Author: Ianco Soares
---Date: 21/10/2022

---LIBRARY
library ieee;
use ieee.std_logic_1164.all;

---ENTITY
entity fullAdder is
    port(
        A,B, CIN: in std_logic; --a and b are the inputs and cin is the carry in
        S, COUT: out std_logic --s is the sum and cout is the carry out
    );
end entity fullAdder;
---ARCHITECTURE
architecture RTL of fullAdder is
    signal X, Y, Z: std_logic;

    --Declaration of the component halfAdder
    component halfAdder is
        port(
            a,b: in std_logic;
            s,c: out std_logic --sum and carry
        );
    end component halfAdder;
begin

    --NAMED MAPPING
    halfAdder_1:    halfAdder
                    port map(a=>A, 
                             b=>B, 
                             s=>X, 
                             c=>Y
                            );
    --POSICIONAL MAPPING
    halfAdder_2:    halfAdder
                    port map(x, 
                             CIN, 
                             S, 
                             Z
                            );
    cout <= y or z;
end architecture RTL;
