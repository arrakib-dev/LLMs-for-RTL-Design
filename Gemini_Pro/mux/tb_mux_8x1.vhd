-- library ieee;
-- use ieee.std_logic_1164.all;

-- entity tb_mux_8x1 is
-- end tb_mux_8x1;

-- architecture tb of tb_mux_8x1 is

--     signal d : std_logic_vector(7 downto 0); -- Input signal vector
--     signal s : std_logic_vector(2 downto 0); -- Selection signal vector
--     signal o : std_logic; -- Output signal

-- begin

--     -- Instantiate the MUX under test
--     mux_8x1 mux_instance : mux_8x1 port map (d, s, o);

--     -- Test cases

--     -- Case 1: Select the first input (d(0))
--     process
--     begin
--         d <= "00000001"; -- Set input vector
--         s <= "000"; -- Set selection signal to select input 0

--         wait for 10 us; -- Allow the MUX to process

--         assert o = d(0) report "Expected output: '0', Actual output: 'o'" severity error;
--     end process;

--     -- Case 2: Select the second input (d(1))
--     process
--     begin
--         d <= "11111111"; -- Set input vector
--         s <= "001"; -- Set selection signal to select input 1

--         wait for 10 us; -- Allow the MUX to process

--         assert o = d(1) report "Expected output: '1', Actual output: 'o'" severity error;
--     end process;

--     -- Case 3: Select the fifth input (d(4))
--     process
--     begin
--         d <= "01010101"; -- Set input vector
--         s <= "110"; -- Set selection signal to select input 5

--         wait for 10 us; -- Allow the MUX to process

--         assert o = d(4) report "Expected output: '5', Actual output: 'o'" severity error;
--     end process;

--     -- Case 4: Select the last input (d(7))
--     process
--     begin
--         d <= "10101010"; -- Set input vector
--         s <= "111"; -- Set selection signal to select input 7

--         wait for 10 us; -- Allow the MUX to process

--         assert o = d(7) report "Expected output: '10', Actual output: 'o'" severity error;
--     end process;

-- end tb;
library ieee;
use ieee.std_logic_1164.all;

entity tb_mux_8x1 is
end tb_mux_8x1;

architecture behavioral of tb_mux_8x1 is

    component mux_8x1 is
        port (
            d : in std_logic_vector (7 downto 0);
            s : in std_logic_vector (2 downto 0);
            o : out std_logic
        );
    end component;

    signal d : std_logic_vector (7 downto 0);
    signal s : std_logic_vector (2 downto 0);
    signal o : std_logic;

begin

    -- Instantiate the MUX
    uut: mux_8x1 port map (
        d => d,
        s => s,
        o => o
    );

    -- Test cases

    process
    begin
        d <= "00000000";
        s <= "000";
        wait for 10 ns;

        d <= "11111111";
        s <= "001";
        wait for 10 ns;

        d <= "00111111";
        s <= "010";
        wait for 10 ns;

        d <= "11000001";
        s <= "011";
        wait for 10 ns;

        d <= "10011110";
        s <= "100";
        wait for 10 ns;

        d <= "01010101";
        s <= "101";
        wait for 10 ns;

        d <= "11101100";
        s <= "110";
        wait for 10 ns;

        d <= "00011011";
        s <= "111";
        wait for 10 ns;

        -- Check the output
        if (o = '0') then
            report "Test passed" severity failure;
        else
            report "Test failed" severity failure;
        end if;

        wait;
    end process;

end behavioral;
