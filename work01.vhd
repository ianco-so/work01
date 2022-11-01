---Work 01

-- the circuit must have two inputs (X, Y) with 4-bits integer numbers and four outputs (A, B, C, D) with 6-bits vectors.
-- Each output must be connected with an 7-segment display.
-- The following operations must be done:
-- if X-- > 0 then show |X| in the 7-segment display of the output A
-- if X++ < 0 then show |X| in the 7-segment display of the output B
-- if Y-- > 0 then show |Y| in the 7-segment display of the output C
-- if Y++ < 0 then show |Y| in the 7-segment display of the output D

---Author: Ianco Soares
---Date: 15/10/2022
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
--------------------------------------------------------------------------------
entity work01 is
    port (
        --INPUTS
        X : in std_logic_vector(3 downto 0);
        Y : in std_logic_vector(3 downto 0);
        --OUTPUTS
        A : out std_logic_vector(6 downto 0);
        B : out std_logic_vector(6 downto 0);
        C : out std_logic_vector(6 downto 0);
        D : out std_logic_vector(6 downto 0)
    );
end entity work01;
--------------------------------------------------------------------------------
architecture structural of work01 is
    signal absA, absB, absC, absD : std_logic_vector(2 downto 0);
    signal incX, decX, incY, decY : std_logic_vector(3 downto 0);
    signal decod_A, decod_B, decod_C, decod_D : std_logic_vector(6 downto 0);

    constant positive_1 : std_logic_vector(3 downto 0) := "0001";
    constant negative_1 : std_logic_vector(3 downto 0) := "1111";
    constant bit_0: std_logic := '0';
begin
    decoding_A      :   entity work.decoder 
                        port map (absA, decod_A);
    decoding_B      :   entity work.decoder      
                        port map (absB, decod_B);
    decoding_C      :   entity work.decoder 
                        port map (absC, decod_C);
    decoding_D      :   entity work.decoder
                        port map (absD, decod_D);
    
    increment_X     :   entity work.adder
                        port map (  X,
                                    positive_1,
                                    bit_0, 
                                    incX,
                                    open);
    decrement_X     :   entity work.adder
                        port map (  X,
                                    negative_1,
                                    bit_0, 
                                    decX,
                                    open);
    increment_Y     :   entity work.adder
                        port map (  Y,
                                    positive_1,
                                    bit_0, 
                                    incY,
                                    open);
    decrement_Y     :   entity work.adder
                        port map (  Y,
                                    negative_1,
                                    bit_0, 
                                    decY,
                                    open);

    absolute_A      :   entity work.absolute
                        port map (  decX,
                                    absA);
    absolute_B      :   entity work.absolute
                        port map (  incX,
                                    absB);
    absolute_C      :   entity work.absolute
                        port map (  decY,
                                    absC);
    absolute_D      :   entity work.absolute
                        port map (  incY,
                                    absD);

    A <= decod_A when X(3) = '0' else "0000000";
    B <= decod_B when X(3) = '1' else "0000000";
    C <= decod_C when Y(3) = '0' else "0000000";
    D <= decod_D when Y(3) = '1' else "0000000";
end architecture structural;