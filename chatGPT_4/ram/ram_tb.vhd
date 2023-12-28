LIBRARY ieee; USE ieee.std_logic_1164.ALL; USE ieee.numeric_std.ALL; 

ENTITY ram_tb IS END ram_tb; ARCHITECTURE behavior OF ram_tb IS 

-- Component Declaration for the Unit Under Test (UUT) 

COMPONENT ram PORT(
   RAM_ADDR : IN std_logic_vector(6 downto 0);
   RAM_DATA_IN : IN std_logic_vector(7 downto 0);
   RAM_WR : IN std_logic; 
  RAM_CLOCK : IN std_logic; 
RAM_DATA_OUT : OUT std_logic_vector(7 downto 0) ); END COMPONENT; 

--Inputs
 signal RAM_ADDR : std_logic_vector(6 downto 0) := (others => '0'); 
signal RAM_DATA_IN : std_logic_vector(7 downto 0) := (others => '0'); 
signal RAM_WR : std_logic := '0'; signal RAM_CLOCK : std_logic := '0'; 

--Outputs 
signal RAM_DATA_OUT : std_logic_vector(7 downto 0); 
-- Clock period definitions 
constant clock_period : time := 10 ns; 
BEGIN -- Instantiate the Unit Under Test (UUT)
 uut: ram PORT MAP ( RAM_ADDR => RAM_ADDR, RAM_DATA_IN => RAM_DATA_IN, RAM_WR => RAM_WR, RAM_CLOCK => RAM_CLOCK, RAM_DATA_OUT => RAM_DATA_OUT ); 

-- Clock process definitions 
clocking: process begin RAM_CLOCK <= '0'; wait for clock_period/2; RAM_CLOCK <= '1'; wait for clock_period/2; end process; 
-- Stimulus process 
stim_proc: process begin -- Test Case 1: Write and Read from Memory

RAM_WR <= '1'; -- Enable writing
 RAM_ADDR <= "0000000"; -- Address 0 
 RAM_DATA_IN <= "10101010"; -- Data to write 
 wait for clock_period*2; RAM_WR <= '0'; -- Disable writing 
 
 -- Reading from the same address to check if data is written correctly 
 wait for clock_period*10; -- Add more test cases here wait; -- Will wait forever 




end process; END; 