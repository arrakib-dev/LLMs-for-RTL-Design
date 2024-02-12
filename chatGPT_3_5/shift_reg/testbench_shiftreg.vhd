library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_shiftreg is
end testbench_shiftreg;

architecture tb_arch of testbench_shiftreg is
  -- Component declaration for the shift register
  component shiftreg
    port (
      clk, rst   : in  std_logic;
      load       : in  std_logic;
      d          : in  std_logic_vector(7 downto 0);
      q          : buffer std_logic
    );
  end component;
  
  -- Signals for test bench
  signal tb_clk, tb_rst, tb_load: std_logic := '0';
  signal tb_data_in               : std_logic_vector(7 downto 0) := (others => '0');
  signal tb_q                     : std_logic;
  signal stop_simulation : boolean := false;
begin

  -- Instantiate the shift register
  UUT: shiftreg port map (
    clk   => tb_clk,
    rst   => tb_rst,
    load  => tb_load,
    d     => tb_data_in,
    q     => tb_q
  );

  -- Clock process
  tb_clk_process: process
  begin
    while not stop_simulation loop
      tb_clk <= not tb_clk; -- Toggle clock
      wait for 5 ns;        -- Half clock period
    end loop;
    wait;
  end process tb_clk_process;

  -- Reset process
  tb_rst_process: process
  begin
    tb_rst <= '1';  -- Apply reset
    wait for 10 ns; -- Wait for a short time
    tb_rst <= '0';  -- De-assert reset
    wait;
  end process tb_rst_process;

  -- Stimulus process
  tb_stimulus: process
  begin
    wait for 20 ns;  -- Wait for a short time

    -- Load initial data into the shift register
    tb_load <= '1';
    tb_data_in <= "10101010";
    wait for 10 ns;
    tb_load <= '0';

    -- Apply new data without load
    tb_data_in <= "11001100";
    wait for 10 ns;

    -- Apply new data with load
    tb_load <= '1';
    tb_data_in <= "11110000";
    wait for 10 ns;
    tb_load <= '0';

    -- End simulation
    stop_simulation <= true;
    wait;
  end process tb_stimulus;

end tb_arch;