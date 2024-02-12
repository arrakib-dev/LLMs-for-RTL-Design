library IEEE;
use IEEE.std_logic_1164.all;

-- Testbench entity, it has no ports as it is a top-level entity in simulation
entity tb_register_8bit is
end tb_register_8bit;

-- Architecture of the testbench, no need for a component declaration since VHDL-2008
architecture behavior of tb_register_8bit is

  -- Signal declarations
  signal clk: std_logic := '0';
  signal rst: std_logic;
  signal d  : std_logic_vector(7 downto 0);
  signal q  : std_logic_vector(7 downto 0);

begin
  -- Instance of the unit under test (UUT)
  uut: entity work.register_8bit
    port map (
      clk => clk,
      rst => rst,
      d   => d,
      q   => q
    );

  -- Clock process (generates a clock signal with a 50% duty cycle)
  clk_process: process
  begin
    while true loop
      clk <= '0';
      wait for 10 ns; -- Adjust the clock period as necessary
      clk <= '1';
      wait for 10 ns;
    end loop;
  end process;

  -- Stimulus process (generates test vectors)
  stim_proc: process
  begin
    -- Reset the register
    rst <= '1'; d <= (others => '0');
    wait for 20 ns; -- Wait for the reset to take effect
    
    rst <= '0'; d <= "10101010"; -- Load a value with alternating bits
    wait for 20 ns;
    
    d <= "11001100"; -- Change the input to see if it updates on the next clock
    wait for 20 ns;
    
    rst <= '1'; -- Reset again to check if the register clears
    wait for 10 ns;
    rst <= '0';
    wait for 20 ns;
    
    -- Finish the simulation
    wait;
  end process;

end behavior;