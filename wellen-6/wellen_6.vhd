library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

entity wellen_6 is
end entity wellen_6;

architecture rtl of wellen_6 is
    constant WIDTH_c : natural := 4;
    signal topLevel_s : std_logic_vector(WIDTH_c - 1 downto 0) := (others => '0');
begin

    gen : for i in 0 to WIDTH_c - 1 generate
        signal blockLevel_s : std_logic := '0';
    begin
        process
    begin
        wait for 1 us;
        topLevel_s(i) <= '1';
        wait for 1 us;
        blockLevel_s <= '1';
        wait for 1 us;
        blockLevel_s <= 'Z';
        wait for 1 us;
        topLevel_s(i) <= 'U';
        wait for 1 us;
        topLevel_s(i) <= '0';
        blockLevel_s <= '0';
        finish;
    end process;
    end generate;

end architecture;