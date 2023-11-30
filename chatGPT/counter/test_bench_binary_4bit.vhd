library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity test_bench_binary_4bit is
end test_bench_binary_4bit;

architecture tb_arch of test_bench_binary_4bit is
  signal clk_tb, rst_tb : std_logic := '0';
  signal o_tb : std_logic_vector(3 downto 0);

  component binary_4bit
    Port ( clk: in std_logic;
           rst: in std_logic;
           o: out std_logic_vector(3 downto 0)
         );
  end component;

begin
  -- Instantiate the binary_4bit counter
  uut: binary_4bit port map (clk_tb, rst_tb, o_tb);

  -- Clock process
  process
  begin
    clk_tb <= '0';
    wait for 5 ns; -- Adjust this time based on your clock period

    clk_tb <= '1';
    wait for 5 ns;

    clk_tb <= '0';
    wait for 5 ns;
  end process;

  -- Stimulus process
  process
  begin
    -- Initialize/reset the counter
    rst_tb <= '1';
    wait for 10 ns;

    -- Deassert reset and let the counter increment
    rst_tb <= '0';
    wait for 100 ns;

    -- Apply some more clock cycles
    wait for 50 ns;

    -- You can add more test scenarios as needed

    -- End simulation
    wait;
  end process;
end tb_arch;
