LIBRARY ieee; USE ieee.std_logic_1164.ALL; ENTITY tb_mux_8x1 IS
 -- Testbench has no ports. 
END tb_mux_8x1; 

ARCHITECTURE behavior OF tb_mux_8x1 IS 
-- Component Declaration for the Unit Under Test (UUT)
 COMPONENT mux_8x1 PORT( d : IN std_logic_vector(7 downto 0); s : IN std_logic_vector(2 downto 0); o : OUT std_logic ); END COMPONENT; 

--Inputs 
signal d : std_logic_vector(7 downto 0) := (others => '0'); signal s : std_logic_vector(2 downto 0) := (others => '0'); 
--Outputs  
signal o : std_logic;   BEGIN
-- Instantiate the Unit Under Test (UUT)
 uut: entity work.mux_8x1 PORT MAP ( d => d, s => s, o => o );
  
  
-- Stimulus process
 stim_proc: process begin
 -- hold reset state for 100 ns. 
wait for 100 ns;
 -- Insert stimulus here 
d <= "10101010"; s <= "000"; wait for 100 ns; s <= "001"; wait for 100 ns; s <= "010"; wait for 100 ns; s <= "011"; wait for 100 ns; s <= "100"; wait for 100 ns; s <= "101"; wait for 100 ns; s <= "110"; wait for 100 ns; s <= "111"; wait for 100 ns; 
-- Complete the simulation 
wait; end process; 
END; 