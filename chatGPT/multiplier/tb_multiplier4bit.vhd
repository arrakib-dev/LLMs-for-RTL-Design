-- Test Bench for multiplier4bit

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_multiplier4bit is
end tb_multiplier4bit;

architecture testbench of tb_multiplier4bit is
  -- Constants for simulation
  constant SIM_TIME: time := 100 ns;

  -- Signals for test bench
  signal A_tb, B_tb: STD_LOGIC_VECTOR(3 downto 0);
  signal S_tb: STD_LOGIC_VECTOR(7 downto 0);

  -- Instantiate the multiplier4bit design
  component multiplier4bit
    port (
      A: in STD_LOGIC_VECTOR(3 downto 0);
      B: in STD_LOGIC_VECTOR(3 downto 0);
      S: out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

begin
  -- Instantiate the multiplier4bit design
  UUT: multiplier4bit port map (A => A_tb, B => B_tb, S => S_tb);

  -- Stimulus process
  stimulus_proc: process
  begin
    -- Test case 1
    A_tb <= "0010";
    B_tb <= "0010";
    wait for SIM_TIME;
    
    -- Test case 2
    A_tb <= "1101";
    B_tb <= "0100";
    wait for SIM_TIME;
    
    -- Add more test cases as needed
    
    -- Stop simulation
    wait;
  end process stimulus_proc;

  -- -- Monitor process
  -- monitor_proc: process
  -- begin
  --   while true loop
  --     report "A = " & A_tb'Image & ", B = " & B_tb'Image & ", S = " & S_tb'Image;
  --     wait for SIM_TIME;
  --   end loop;
  -- end process monitor_proc;

end testbench;
