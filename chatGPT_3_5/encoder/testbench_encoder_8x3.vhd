library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

entity testbench_encoder_8x3 is
end testbench_encoder_8x3;

architecture tb_arch of testbench_encoder_8x3 is
  signal d_tb: std_logic_vector(7 downto 0) := (others => '0');  -- Input signal
  signal o_tb: std_logic_vector(2 downto 0);  -- Output signal

  -- Instantiate the encoder_8x3 entity
  component encoder_8x3
    port (
      d : in  std_logic_vector(7 downto 0);
      o : out std_logic_vector(2 downto 0)
    );
  end component;

  begin
    -- Connect the test bench signals to the encoder_8x3 entity
    uut: encoder_8x3 port map (d => d_tb, o => o_tb);

    -- Stimulus process
    stimulus_process: process
    begin
      -- Test case 1: Input with '1' in the most significant bit
      d_tb <= "10000000";  -- Binary '10000000'
      wait for 10 ns;

      -- Test case 2: Input with '1' in the middle
      d_tb <= "00100000";  -- Binary '00100000'
      wait for 10 ns;

      -- Add more test cases as needed

      wait;
    end process stimulus_process;

    -- Output checking process
    check_process: process
    begin
      wait for 20 ns;  -- Wait for some time to allow the output to stabilize

      -- Check the output for each test case
      assert o_tb = "111" report "Test case 1 failed" severity error;
      wait for 10 ns;

      assert o_tb = "110" report "Test case 2 failed" severity error;
      wait for 10 ns;

      -- Add assertions for more test cases

      wait;
    end process check_process;

  end tb_arch;
