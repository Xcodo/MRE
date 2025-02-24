library ieee;
use ieee.std_logic_1164.all;

use std.env.stop;

entity square_wave is
    generic (
        PERIOD : time := 20 ns
    );
    port (
        wave : out std_logic
    );
end entity square_wave;

architecture rtl of square_wave is

begin

    sim : process
    begin
        wave <= '1';
        wait for PERIOD / 2;
        wave <= '0';
        wait for PERIOD / 2;
    end process;

    run : process
    begin
        wait for 1 ms;
        report "Ran successfully" severity NOTE;
        stop;
    end process;

end architecture;