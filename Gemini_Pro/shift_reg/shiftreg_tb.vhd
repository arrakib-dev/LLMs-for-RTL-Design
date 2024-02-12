library IEEE;
use IEEE.STD_logic_1164.ALL;

entity shiftreg_tb is
end;

architecture behavior of shiftreg_tb is

component shiftreg is
port ( clk, rst : in std_logic;
        load : in std_logic;
        d : in std_logic_vector(7 downto 0);
        q : buffer std_logic
);
end component;

signal clk, rst, load : std_logic;
signal d : std_logic_vector(7 downto 0);
signal q : std_logic;

constant CLOCK_PERIOD : time := 10 ns; -- Adjust as needed

begin

-- Instantiate the DUT (Device Under Test)
UUT : shiftreg port map (
    clk => clk,
    rst => rst,
    load => load,
    d => d,
    q => q
);

-- Clock generation process
process
begin
    clk <= '0';
    wait for CLOCK_PERIOD/2;
    clk <= '1';
    wait for CLOCK_PERIOD/2;
end process;

-- Test process
process
begin
    -- Reset and initialize
    rst <= '1';
    load <= '0';
    d <= "00000000";
    wait for 10 * CLOCK_PERIOD;

    -- Test 1: Load a value and shift it out
    rst <= '0';
    load <= '1';
    d <= "11111111";
    wait for CLOCK_PERIOD;
    load <= '0';
    wait for 8 * CLOCK_PERIOD;
    assert q = '1' ; --after 1 ns; -- Check each bit shifted out -- changed
    for i in 0 to 6 loop
        wait for CLOCK_PERIOD;
        assert q = '1' ;
        -- assert is (q = '0') after 1 ns;
    end loop;

    -- Test 2: Load different values and check output
    -- (Add more test cases as needed)

    wait; -- Wait for simulation to finish
end process;

end architecture;