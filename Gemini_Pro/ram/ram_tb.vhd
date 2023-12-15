library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram_tb is
end ram_tb;

architecture Behavioral of ram_tb is

component ram is
port(
RAM_ADDR: in std_logic_vector(6 downto 0);
RAM_DATA_IN: in std_logic_vector(7 downto 0);
RAM_WR: in std_logic;
RAM_CLOCK: in std_logic;
RAM_DATA_OUT: out std_logic_vector(7 downto 0)
);
end component;

signal RAM_ADDR: std_logic_vector(6 downto 0);
signal RAM_DATA_IN: std_logic_vector(7 downto 0);
signal RAM_WR, RAM_CLOCK: std_logic;
signal RAM_DATA_OUT: std_logic_vector(7 downto 0);

begin

-- Instantiate the RAM module
ram_instance: entity work.ram port map (
RAM_ADDR => RAM_ADDR,
RAM_DATA_IN => RAM_DATA_IN,
RAM_WR => RAM_WR,
RAM_CLOCK => RAM_CLOCK,
RAM_DATA_OUT => RAM_DATA_OUT
);

-- Generate test vectors
test_vectors: process
begin
  -- Write data to RAM cells
  RAM_ADDR <= "0000000";
  RAM_DATA_IN <= x"55";
  RAM_WR <= '1';
  wait until rising_edge(RAM_CLOCK);
  RAM_WR <= '0';

  RAM_ADDR <= "0000100";
  RAM_DATA_IN <= x"66";
  RAM_WR <= '1';
  wait until rising_edge(RAM_CLOCK);
  RAM_WR <= '0';

  -- Read data from RAM cells
  RAM_ADDR <= "0000000";
  wait until rising_edge(RAM_CLOCK);
  -- Verify read data
  assert RAM_DATA_OUT = x"55" report "Expected data mismatch" severity error;

  RAM_ADDR <= "0000100";
  wait until rising_edge(RAM_CLOCK);
  -- Verify read data
  assert RAM_DATA_OUT = x"66" report "Expected data mismatch" severity error;

end process;

end Behavioral;
