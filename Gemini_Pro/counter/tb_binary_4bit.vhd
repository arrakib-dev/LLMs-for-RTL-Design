-- library IEEE;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- entity tb_binary_4bit is
-- end tb_binary_4bit;

-- architecture Behavioral of tb_binary_4bit is

--     -- Instantiate the DUT (Device Under Test)
--     -- signal clk : std_logic <= '0';
--     -- signal rst : std_logic <= '0';
--     signal clk : std_logic;
--     signal rst : std_logic;
--     signal o : std_logic_vector(3 downto 0);

--     -- Clock generation
--     constant clk_period : time := 10 ns;

-- begin

--     -- Process to generate clock signal
--     clk_process: process
--     begin
--         clk <= '0';
--         wait for clk_period / 2;
--         clk <= '1';
--         wait for clk_period / 2;
--     end process clk_process;

--     -- Test bench process
--     tb_process: process
--     begin
--         rst <= '1'; -- Reset the counter
--         wait for 2 * clk_period; -- Wait for 2 clock cycles for reset to settle

--         -- Test for initial value
--         wait for clk_period;
--         assert o = x"0" report "Initial value mismatch";

--         -- Test incrementing
--         wait for clk_period;
--         assert o = x"1" report "Incrementing failed";
--         wait for clk_period;
--         assert o = x"2" report "Incrementing failed";
--         wait for clk_period;
--         assert o = x"3" report "Incrementing failed";

--         -- Test wrapping around to 0
--         wait for clk_period;
--         assert o = x"0" report "Wrapping around failed";

--         -- Test reset
--         rst <= '0'; -- De-assert reset
--         wait for clk_period;
--         assert o = x"0" report "Resetting failed";

--         -- Test reset while counting
--         wait until rising_edge(clk);
--         rst <= '1';
--         wait for clk_period;
--         assert o = x"0" report "Resetting while counting failed";

--         -- End test
--         wait;
--     end process tb_process;

-- end Behavioral;


-- library IEEE;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- entity binary_4bit_tb is
-- end binary_4bit_tb;

-- architecture Behavioral of binary_4bit_tb is

--    -- Instantiate the binary_4bit component
--    component binary_4bit is
--        port ( clk: in std_logic;
--                rst: in std_logic;
--                o: out std_logic_vector(3 downto 0));
--    end component;

--    -- Signals to simulate the clock and reset signals
--    signal clk: std_logic := '0';
--    signal rst: std_logic := '1';

--    -- Signal to store the counter output
--    signal counter_output: std_logic_vector(3 downto 0);

--    uut: binary_4bit port map (clktb, rst, counter_output);

--    -- Clock generator process
-- --    process
--    begin
--       clk <= '0';
--        wait for 10 ns;
--        clk <= '1';
--        wait for 10 ns;
--    end ;

--    -- Test scenarios
   
--    begin
--        -- Reset the counter
--        rst <= '0';
--        wait for 20 ns;
--        assert counter_output = x"0" report "Counter not reset properly" severity failure;
--        rst <= '1';
--        wait for 20 ns;

--         -- Increment the counter
--        rst <= '0';
--        wait for 20 ns;
--        assert counter_output = x"1" report "Counter not incremented properly" severity failure;
--        rst <= '1';
--        wait for 20 ns;

--         -- Increment the counter multiple times
--        for i in 0 to 15 loop
--            rst <= '0';
--            wait for 20 ns;
--            counter_output <= counter_output + 1;
--            assert counter_output = std_logic_vector(to_integer(i)) report "Counter increment error" severity failure;
--            rst <= '1';
--            wait for 20 ns;
--        end loop;

--         -- Verify the counter's limit
--        rst <= '0';
--        wait for 20 ns;
--        assert counter_output = x"F" report "Counter overflow error" severity failure;
--        rst <= '1';
--        wait for 20 ns;

--         -- Verify the counter's reset behavior
--        rst <= '0';
--        wait for 20 ns;
--        assert counter_output = x"0" report "Counter reset error" severity failure;
--        rst <= '1';
--        wait for 20 ns;

--         -- Stop the simulation
--        assert false report "Simulation completed successfully" severity failure;
--        wait;
--    end;

-- end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_binary_4bit is
end tb_binary_4bit;

architecture Behavioral of tb_binary_4bit is
    signal clk, rst: std_logic;
    signal counter_expected, counter_actual: std_logic_vector(3 downto 0);

begin
    -- Instantiate the binary_4bit counter
    binary_4bit_inst: entity work.binary_4bit port map (
        clk => clk,
        rst => rst,
        o => counter_actual
    );

    -- Generate clock signal
    process
    begin
        clk <= '0';
        wait for 10 us;
        clk <= '1';
        wait for 10 us;
    end process;

    process
    begin

    -- Initialize reset signal
    rst <= '1';
    wait for 10 us;

    -- Simulate reset
    rst <= '0';
    wait for 20 us;

    -- Expected counter values
    counter_expected <= x"0";

    -- -- Test counter functionality
    for i in 0 to 15 loop
        counter_expected <= counter_expected + 1;
        wait for 20 us;
    end loop;

    -- -- Check if actual counter value matches expected
    -- if counter_actual /= counter_expected then
    --     $display("Error: Actual counter value (%h) does not match expected (%h)", counter_actual, counter_expected);
    --     $stop;
    -- end if;

    -- Assert reset again to stop the simulation
    rst <= '1';

    -- Wait for simulation to complete
    wait for 100 us;
end process;
end Behavioral;
