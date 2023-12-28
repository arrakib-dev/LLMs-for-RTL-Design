LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 

ENTITY binary_4bit_tb IS 

END binary_4bit_tb; 

ARCHITECTURE behavior OF binary_4bit_tb IS 
-- Component Declaration for the Unit Under Test (UUT) 

  COMPONENT binary_4bit PORT( 
    clk : IN std_logic; 
  rst : IN std_logic; o : 
OUT std_logic_vector(3 downto 0) ); 
END COMPONENT; 

--Inputs 
signal clk : std_logic := '0'; signal rst : std_logic := '0'; 
--Outputs 
signal o : std_logic_vector(3 downto 0); 
-- Clock period definition 
constant clk_period : time := 10 ns; 
BEGIN 
-- Instantiate the Unit Under Test (UUT) 
uut: binary_4bit PORT MAP ( clk => clk, rst => rst, o => o ); 
-- Clock process definitions 
clk_process :process begin clk <= '0'; wait for clk_period/2; clk <= '1'; wait for clk_period/2; end process; 

-- Testbench Statements 
stim_proc: process begin 
-- hold reset state for 100 ns. 
wait for 100 ns; 
rst <= '1'; 
wait for 100 ns; 
rst <= '0'; 
-- insert other testbench actions here 
wait for 400 ns; 

assert FALSE report "End of simulation" severity FAILURE; 

end process; 





END; 