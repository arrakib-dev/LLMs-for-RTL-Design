library ieee; use ieee.std_logic_1164.all; 
entity encoder_8x3_tb is 
-- Testbench has no ports! 
end encoder_8x3_tb; 

architecture behavior of encoder_8x3_tb is 
-- Component Declaration for the Unit Under Test (UUT) 
component encoder_8x3 port( d : in std_logic_vector(7 downto 0); o : out std_logic_vector(2 downto 0) ); end component; 
--Inputs 
signal d : std_logic_vector(7 downto 0) := (others => '0'); 
--Outputs 
signal o : std_logic_vector(2 downto 0); 
-- Clock period definitions 
constant clk_period : time := 10 ns; begin 
  -- Instantiate the Unit Under Test (UUT) 
  uut: encoder_8x3 port map ( d => d, o => o ); 
  -- Stimulus process
   stim_proc: process begin 
    -- hold reset state for 100 ns. 
    wait for 100 ns; d <= "10000000"; 
    -- Test input where only the highest bit is set 
    wait for clk_period; d <= "01000000";
     -- Test input where the second highest bit is set 
     wait for clk_period; -- Add more test cases as needed -- ... 



wait; end process; end behavior; 