library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS_TestBench is
end MIPS_TestBench;

architecture Behavioral of MIPS_TestBench is
     --Component declaration for the MIPS processor
    component MIPS_VHDL
        port (
            clk, reset: in std_logic;
            pc_out, alu_result: out std_logic_vector(15 downto 0)
        );
    end component;

     --Signals for test bench
    signal clk_tb, reset_tb: std_logic := '0';
    signal pc_out_tb, alu_result_tb: std_logic_vector(15 downto 0);

--    -- Clock period definition
--    constant clk_period: time := 10 ns;

begin

--    -- Instantiate the MIPS processor
    UUT: MIPS_VHDL port map (
        clk => clk_tb,
        reset => reset_tb,
        pc_out => pc_out_tb,
        alu_result => alu_result_tb
    );

    -- Clock generation process
    clk_process: process
    begin
        while now < 500 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

--    -- Reset process
    reset_process: process
    begin
        reset_tb <= '1';
        wait for 20 ns;  Apply reset for 20 ns
        reset_tb <= '0';
        wait;
    end process;

--    -- Stimulus process
    stimulus: process
    begin
--        -- Wait for initial reset and clock setup
        wait for 50 ns;

        -- Add test cases here (e.g., setting inputs, observing outputs)

        wait;
    end process;
    
end Behavioral;