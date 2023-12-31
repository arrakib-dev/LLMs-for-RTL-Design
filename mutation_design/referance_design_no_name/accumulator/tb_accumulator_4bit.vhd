LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_accumulator_4bit IS
END tb_accumulator_4bit;
 
ARCHITECTURE behavior OF tb_accumulator_4bit IS
 
 -- Component Declaration for the Unit Under Test (UUT)
 
 COMPONENT accumulator_4bit
 PORT(
 clk : IN std_logic;
 reset : IN std_logic;
 Din : IN std_logic_vector(3 downto 0);
 Q : OUT std_logic_vector(3 downto 0)
 );
 END COMPONENT;
 
 --Inputs
 signal clk : std_logic := '0';
 signal reset : std_logic := '0';
 signal Din : std_logic_vector(3 downto 0) := (others => '0');
 
 --Outputs
 signal Q : std_logic_vector(3 downto 0);
 
 -- Clock period definitions
 constant clk_period : time := 20 ns;
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
 uut: accumulator_4bit PORT MAP (
 clk => clk,
 reset => reset,
 Din => Din,
 Q => Q
 );
 
 -- Clock process definitions
 clk_process :process
 begin
 clk <= '0';
 wait for clk_period/2;
 clk <= '1';
 wait for clk_period/2;
 end process;
 
 -- Stimulus process
 stim_proc: process
 begin
 -- hold reset state for 100 ns.
 wait for 100 ns;
 
 reset <= '1';
 
 Din <= "0010";
 
 wait for 100 ns;
 
 reset <= '0';
 
 wait;
 
 end process;
 
END;