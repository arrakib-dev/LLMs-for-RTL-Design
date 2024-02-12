library IEEE;
use IEEE.std_logic_1164.all;

entity register_8bit_tb is
end register_8bit_tb;

architecture tb_arch of register_8bit_tb is
    -- Component declaration for the DUT (Design Under Test)
    component register_8bit
        port (
            clk, rst : in  std_logic;
            d        : in  std_logic_vector(7 downto 0);
            q        : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals for the test bench
    signal clk       : std_logic := '0';
    signal rst       : std_logic := '0';
    signal d         : std_logic_vector(7 downto 0) := (others => '0');
    signal q         : std_logic_vector(7 downto 0);

    -- Clock process
    constant clk_period : time := 10 ns;
begin

    -- Instantiate the DUT
    dut : register_8bit
        port map (
            clk => clk,
            rst => rst,
            d   => d,
            q   => q
        );

    -- Clock generation process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_process : process
    begin
        -- Reset sequence
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        
        -- Apply some input values
        d <= "10101010";
        wait for 50 ns;

        d <= "01010101";
        wait for 50 ns;

        -- Add more test cases here if needed

        -- End the simulation
        wait;
    end process;

end tb_arch;