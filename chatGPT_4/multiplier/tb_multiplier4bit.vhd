LIBRARY ieee; USE ieee.std_logic_1164.ALL; ENTITY tb_multiplier4bit IS 

-- Testbench has no ports! 
END tb_multiplier4bit; ARCHITECTURE behavior OF tb_multiplier4bit IS 

-- Component Declaration for the Unit Under Test (UUT) 
COMPONENT multiplier4bit PORT( A : IN std_logic_vector(3 downto 0); B : IN std_logic_vector(3 downto 0); S : OUT std_logic_vector(7 downto 0) ); END COMPONENT;
 --Inputs 
signal A : std_logic_vector(3 downto 0) := (others => '0'); signal B : std_logic_vector(3 downto 0) := (others => '0'); 
--Outputs 
signal S : std_logic_vector(7 downto 0); -- Clock Definition (if needed for synchronization) -- 

signal clk : std_logic := '0'; -- 

constant clk_period : time := 10 ns; BEGIN

-- Instantiate the Unit Under Test (UUT) 
uut: multiplier4bit PORT MAP ( A => A, B => B, S => S ); 

-- Stimulus process 
stim_proc: process begin -- Test Case 1 
A <= "0001"; B <= "0010"; -- 1 * 2 = 2 
wait for 100 ns; -- Wait for the results -- Test Case 2 
A <= "0011"; B <= "0101"; -- 3 * 5 = 15
 wait for 100 ns; -- Test Case 3 
A <= "1111"; B <= "1111"; -- 15 * 15 = 225 
wait for 100 ns; -- Add more test cases as needed -- End simulation 

wait; end process; -- Clock process (if needed) -- clk_process :process -- begin -- clk <= '0'; -- wait for clk_period/2; -- clk <= '1'; -- wait for clk_period/2; -- end process; 



END;