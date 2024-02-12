library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
component accumulator_4bit is
    port(
        clk, reset : in std_logic;
        Din : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0)
    );
end accumulator_4bit;

architecture bhv of accumulator_4bit is
    signal tmp: std_logic_vector(3 downto 0);
    begin
        process (clk, reset)
        begin
            if (reset /='1') then
                tmp <= "0000";
            elsif rising_edge(clk) then

                tmp <= tmp - Din;
            end if;
        end process;
        Q <= tmp;
    end bhv;

    -- entity & component interchanged
    -- = replaced with /=
    -- + replaced with -
    -- total fault 3