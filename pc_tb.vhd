library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
-- use std.env.finish;

entity PC_logic_tb is
end PC_logic_tb;

architecture sim of PC_logic_tb is

    constant clk_hz : integer := 100e6;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal pc_s : std_logic_vector(31 downto 0);

begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.PC_logic(rtl)
    port map (
        clk => clk,
        rst => rst,
        pc => pc_s
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;

        rst <= '1';

        wait for clk_period * 2;

        rst <= '0';

        wait for clk_period * 100;
        assert false
            report "Replace this with your test cases"
            severity failure;
    end process;

end architecture;