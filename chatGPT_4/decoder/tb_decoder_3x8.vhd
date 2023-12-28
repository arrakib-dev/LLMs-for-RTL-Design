library ieee; use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity tb_decoder_3x8 is 

-- Testbench doesn't have any ports 
end tb_decoder_3x8; 

architecture test of tb_decoder_3x8 is 
-- Component Declaration for the Unit Under Test (UUT) 
component decoder_3x8 port( a : in std_logic_vector(2 downto 0); d : out std_logic_vector(7 downto 0) ); end component; 
-- Inputs
 signal a : std_logic_vector(2 downto 0) := (others => '0'); 
-- Outputs 
signal d : std_logic_vector(7 downto 0); 
-- Clock period definition (if needed) -- 
constant clk_period : time := 10 ns; begin 
-- Instantiate the Unit Under Test (UUT) 
uut: decoder_3x8 port map ( a => a, d => d ); 
-- Stimulus process
 stim_proc: process begin 
-- Stimulus here 
for i in 0 to 7 loop 
    a <= std_logic_vector(to_unsigned(i, 3)); wait for 10 ns; 
-- Wait for some time to observe output 
end loop;
 -- Add additional test cases if necessary
 wait; -- Wait forever; this process will only execute once 

end process; 




end test; 