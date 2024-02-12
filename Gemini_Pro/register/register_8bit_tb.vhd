library IEEE;  --added
use IEEE.std_logic_1164.all; --added
entity register_8bit_tb is
end;

architecture behavior of register_8bit_tb is

  -- Signals
  constant CLK_PERIOD : time := 10 ns; -- Define clock period
  signal clk, rst : std_logic;
  signal d, q : std_logic_vector(7 downto 0);

  -- DUT instantiation
  component register_8bit is
    port (clk, rst : in std_logic;
          d : in std_logic_vector(7 downto 0);
          q : out std_logic_vector(7 downto 0));
  end component;

begin
  -- for UUT : register_8bit use entity work.register_8bit(proc);
  UUT :  entity work.register_8bit port map(
        clk => clk, rst => rst, d =>d, q => q
  );
  -- Clock generation
  process
  begin
    clk <= '0';
    wait for CLK_PERIOD/2;
    clk <= '1';
    wait for CLK_PERIOD/2;
  -- end loop; -- changed
  end process;

  -- Test sequence
  process
  begin
    -- Reset
    rst <= '1';
    wait for 2 * CLK_PERIOD;
    rst <= '0';

    -- Write different data values
    wait for 5 * CLK_PERIOD;
    d <= "01010101";
    wait for 2 * CLK_PERIOD;
    d <= "10101010";
    wait for 3 * CLK_PERIOD;
    d <= "00000000";
    wait for 4 * CLK_PERIOD;

    -- Check output values
    wait for 10 * CLK_PERIOD;

    -- End of test
    wait;
  end process;

end;