---Learning VHDL programming
---Author: Ianco Soares
---Date: 21/10/2022

---LIBRARY
library ieee;
use ieee.std_logic_1164.all;
---ENTITY
entity halfAdder is
    port(
        a,b: in std_logic;
        s,c: out std_logic --sum and carry
    );
end halfAdder;
---ARCHITECTURE
architecture dataflow of halfAdder is
begin
    s <= a xor b; --a+b = a xor b
    c <= a and b;
end dataflow;
---CONFIGURATION