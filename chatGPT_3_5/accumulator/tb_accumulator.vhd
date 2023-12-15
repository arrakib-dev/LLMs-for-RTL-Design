library ieee;
use ieee.std_logic_1164.all;

entity tb_accumulator_4bit is
end tb_accumulator_4bit;

architecture tb_arch of tb_accumulator_4bit is
    signal clk_tb, reset_tb: std_logic := '0';
    signal Din_tb: std_logic_vector(3 downto 0) := "0000";
    signal Q_tb: std_logic_vector(3 downto 0);

    component accumulator_4bit
        port(
            clk, reset : in std_logic;
            Din : in std_logic_vector(3 downto 0);
            Q : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    -- Instantiate the accumulator
    uut: accumulator_4bit
        port map(
            clk => clk_tb,
            reset => reset_tb,
            Din => Din_tb,
            Q => Q_tb
        );

    -- Clock process
    process
    begin
        clk_tb <= '0';
        wait for 5 ns; -- Adjust the clock period as needed

        clk_tb <= '1';
        wait for 5 ns;

        clk_tb <= '0';
        wait for 5 ns;
    end process;

    -- Stimulus process
    process
    begin
        reset_tb <= '1';  -- Reset initially
        wait for 10 ns;

        reset_tb <= '0';  -- Deassert reset
        wait for 10 ns;

        -- Test 1: Accumulate value 3
        Din_tb <= "0011";
        wait for 10 ns;

        -- Test 2: Accumulate value 5
        Din_tb <= "0101";
        wait for 10 ns;

        -- Test 3: Reset and accumulate value 2
        reset_tb <= '1';
        Din_tb <= "0010";
        wait for 10 ns;

        reset_tb <= '0';
        wait for 10 ns;

        -- Test 4: Accumulate value 7
        Din_tb <= "0111";
        wait for 10 ns;

        -- Add more test scenarios as needed

        -- End the simulation after tests
        wait;
    end process;

end tb_arch;
