library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_unsigned.all;

entity accumulator_tb is
end accumulator_tb;

architecture tb of accumulator_tb is

  component accumulator_4bit is
    port(
      clk, reset : in std_logic;
      Din : in std_logic_vector(3 downto 0);
      Q : out std_logic_vector(3 downto 0)
    );
  end component accumulator_4bit;

  signal clk : std_logic := '0';
  signal reset : std_logic := '1';
  signal Din : std_logic_vector(3 downto 0);
  signal Q : std_logic_vector(3 downto 0);

begin

  accumulator: accumulator_4bit port map(clk, reset, Din, Q);

  process -- Clock generation
  begin
    clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
  end process;

  -- Reset initialization
  process
  begin
    wait for 100 ns;
    reset <= '0';
    wait for 100 ns;
    reset <= '1';
    wait for 100 ns;
    reset <= '0';
    wait;
  end process;

  -- Single-bit addition stimuli
  process
  begin
    Din <= "0001"; -- Add 1
    wait for 200 ns;
    Din <= "0010"; -- Add 2
    wait for 200 ns;
    Din <= "0100"; -- Add 4
    wait for 200 ns;
    Din <= "1000"; -- Add 8
    wait for 200 ns;
  end process;

  -- Multiple-bit addition stimuli
  -- process
  -- begin
  --   Din <= "1010"; -- Add 10
  --   wait for 200 ns;
  --   Din <= "1101"; -- Add 11
  --   wait for 200 ns;
  --   Din <= "0111"; -- Add 7
  --   wait for 200 ns;
  --   Din <= "0011"; -- Add 3
  --   wait for 200 ns;
  -- end process;

end tb;
