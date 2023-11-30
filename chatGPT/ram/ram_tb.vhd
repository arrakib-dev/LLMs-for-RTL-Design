library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ram_tb is
end ram_tb;

architecture tb_arch of ram_tb is
  -- Constants
  constant CLOCK_PERIOD : time := 10 ns;

  -- Signals
  signal RAM_ADDR_TB     : std_logic_vector(6 downto 0) := (others => '0');
  signal RAM_DATA_IN_TB  : std_logic_vector(7 downto 0) := (others => '0');
  signal RAM_WR_TB       : std_logic := '0';
  signal RAM_CLOCK_TB    : std_logic := '0';
  signal RAM_DATA_OUT_TB : std_logic_vector(7 downto 0);

  -- Instantiate the RAM module
  component ram
    port(
      RAM_ADDR      : in std_logic_vector(6 downto 0);
      RAM_DATA_IN   : in std_logic_vector(7 downto 0);
      RAM_WR        : in std_logic;
      RAM_CLOCK     : in std_logic;
      RAM_DATA_OUT  : out std_logic_vector(7 downto 0)
    );
  end component;
  begin
  -- Clock process
  process
  begin
    while now < 500 ns loop
      RAM_CLOCK_TB <= '0';
      wait for CLOCK_PERIOD / 2;
      RAM_CLOCK_TB <= '1';
      wait for CLOCK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Stimulus process
  process
  begin
    -- Initialize RAM values if needed

    -- Write some data to the RAM
    RAM_ADDR_TB    <= "0000010";  -- Example address
    RAM_DATA_IN_TB <= "10101010"; -- Example data
    RAM_WR_TB      <= '1';        -- Enable write
    wait for CLOCK_PERIOD;
    RAM_WR_TB      <= '0';        -- Disable write

    -- Read data from the RAM
    wait for CLOCK_PERIOD;
    RAM_ADDR_TB    <= "0000010";  -- Example address for reading
    wait for CLOCK_PERIOD;

    -- Add more test cases as needed

    wait;
  end process;

  -- Instantiate the RAM module
  RAM_INST : ram
    port map(
      RAM_ADDR      => RAM_ADDR_TB,
      RAM_DATA_IN   => RAM_DATA_IN_TB,
      RAM_WR        => RAM_WR_TB,
      RAM_CLOCK     => RAM_CLOCK_TB,
      RAM_DATA_OUT  => RAM_DATA_OUT_TB
    );

end tb_arch;

