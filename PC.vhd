-------------------------------------------------------------------------------
-- Title      : PC Logic
-- Project    : 
-------------------------------------------------------------------------------
-- File       : PC.vhd
-- Author     : Nixon Ortiz
-- Company    : MAELPRO
-- Created    : 
-- Last update: 
-- Platform   : 
-- Standard   : VHDL
-- Description: It references to the first byte of an instruction in the IMem
--              so the PC always increment in +4. 
--              When reset, PC points to Zero
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC_logic is
    port (
        clk : in std_logic;
        rst : in std_logic;
        pc  : out std_logic_vector(31 downto 0)
    );
end PC_logic;

architecture rtl of PC_logic is
    signal pc_next : unsigned(31 downto 0);
    signal pc_reg : unsigned(31 downto 0);
begin

    --Sequential logic on PC
    process(clk,rst)
    begin
        if(rst='1')then
            pc_reg  <=  (others=>'0');
        elsif(rising_edge(clk))then
            pc_reg <= pc_next;
        end if; 
    end process;


    pc_next <= pc_reg + "100";

    pc <= std_logic_vector(pc_reg);

end architecture;