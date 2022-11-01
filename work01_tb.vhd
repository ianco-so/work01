---Work 01 TESTBENCH---
---Author: Ianco Soares
---Date: 15/10/2022

library ieee;
use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity work01_tb is
end entity work01_tb;

architecture testbench of work01_tb is
    --TESTBENCH INPUTS
    signal X_TB : signed(3 downto 0) := (others => '0');
    signal Y_TB : signed(3 downto 0) := (others => '0');
    --TESTBENCH OUTPUTS
    signal A_TB : std_logic_vector(6 downto 0);
    signal B_TB : std_logic_vector(6 downto 0);
    signal C_TB : std_logic_vector(6 downto 0);
    signal D_TB : std_logic_vector(6 downto 0);
    --CONVERT SIGNALS
    -- signal X_CONV : std_logic_vector(3 downto 0);
    -- signal Y_CONV : std_logic_vector(3 downto 0);
begin
    DUT: entity work.work01 port map (std_logic_vector(X_TB), std_logic_vector(Y_TB), A_TB, B_TB, C_TB, D_TB);

    --TESTBENCH PROCESS
    --X_TB <= num_X;
    num_X_gen : process
    begin
        -- wait until rising_edge(clk);
        X_TB <= X_TB + 1;
        wait for 10 ns;
    end process num_X_gen;

    --Y_TB <= num_Y;
    num_Y_gen : process
    begin
        -- wait until falling_edge(clk);
        Y_TB <= Y_TB - 1;
        wait for 10 ns;
    end process num_Y_gen;

end architecture testbench;