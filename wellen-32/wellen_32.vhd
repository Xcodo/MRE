library ieee;
use ieee.std_logic_1164.all;

use std.env.finish;

entity wellen_32 is
end entity wellen_32;

architecture rtl of wellen_32 is
    type spi_t is record
        sclk : std_logic;
        mosi : std_logic;
        miso : std_logic;
        cs_n : std_logic;
    end record;

    subtype spiSub_t is spi_t;

    signal spiSub_s : spiSub_t := (
        sclk => '0',
        mosi => '0',
        miso => '0',
        cs_n => '0'
    );
begin

    process
    begin
        wait for 1 us;
        spiSub_s.cs_n <= '1';
        wait for 1 us;
        spiSub_s.cs_n <= '0';
        wait for 1 us;
        finish;
    end process;

end architecture;