library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------
entity decoder is
    port (
        count   :   in  std_logic_vector(2 downto 0);
        output  :   out std_logic_vector(6 downto 0)
    );
end entity decoder;
------------------------------------------------------------------------
architecture structural of decoder is
begin
    output(6) <=    (count(2) and count(0)) or
                    (count(1))              or               
                    ((not count(2)) and (not count(0)));

    output(5) <=    (count(1) and count(0)) or
                    (not count(2))          or
                    ((not count(1)) and (not count(0)));

    output(4) <=    count(2) or (not count(1)) or count(0);

    output(3) <=     ((not count(2)) and (not count(0))) or --ERRADO
                    (count(1) and (not count(0))) or
                    ((not count(2)) and count(1)) or
                    (count(2) and (not count(1)) and count(0));

    output(2) <=    (count(1) and (not count(0))) or
                    ((not count(2)) and (not count(0)));

    output(1) <=    ((not count(1)) and (not count(0)) )    or --ERRADO
                    (count(2) and (not count(0)))           or
                    (count(2) and (not count(1)));

    output(0) <=    (count(1) and (not count(0))) or 
                    ((not count(2)) and count(1)) or
                    (count(2) and (not count(1)));
end architecture structural;