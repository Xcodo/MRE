library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

entity wellen_34 is
end entity wellen_34;

architecture rtl of wellen_34 is
    type unconstrainedBus_t is record
        address: std_logic_vector;
        data: std_logic_vector;
        dataValid: std_logic;
    end record;

    subtype constrainedBus_t is unconstrainedBus_t (
        address (7 downto 0),
        data (32 downto 0)
    );

    signal constrained_s : constrainedBus_t := (
        address => (others => 'U'),
        data => (others => 'X'),
        dataValid => '0'
    );
begin

    process
    begin
        wait for 1 us;
        constrained_s <= (
            address => (others => '0'),
            data => (others => '0'),
            dataValid => '1'
        );
        wait for 20 ns;
        constrained_s.dataValid <= '0';
        wait for 1 us;
        constrained_s <= (
            address => (
                0 => '1',
                others => '0'
            ),
            data => (
                1 => '1',
                others => '0'
            ),
            dataValid => '1'
        );
        wait for 20 ns;
        constrained_s.dataValid <= '0';
        wait for 1 us;
        constrained_s <= (
            address => (others => '0'),
            data => (others => '0'),
            dataValid => '1'
        );
        wait for 20 ns;
        constrained_s.dataValid <= '0';
        finish;
    end process;

end architecture;